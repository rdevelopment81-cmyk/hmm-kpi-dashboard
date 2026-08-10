
-- ============ ENUMS ============
CREATE TYPE public.app_role AS ENUM ('bph','hr_admin','kadiv','anggota');
CREATE TYPE public.attendance_status AS ENUM ('hadir','telat');
CREATE TYPE public.jobdesk_status AS ENUM ('diajukan','disetujui','ditolak');

-- ============ DIVISIONS ============
CREATE TABLE public.divisions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL UNIQUE,
  code text NOT NULL UNIQUE,
  created_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT ON public.divisions TO anon, authenticated;
GRANT ALL ON public.divisions TO service_role;
ALTER TABLE public.divisions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "divisions read all" ON public.divisions FOR SELECT USING (true);

INSERT INTO public.divisions (name, code) VALUES
  ('Human Resources','HR'),
  ('Research & Development','RND'),
  ('Academic','ACADEMIC'),
  ('Public Relations','PR'),
  ('Media & Publication','MEDPUB'),
  ('Entrepreneurship','ENTRE'),
  ('Community Development','COMDEV'),
  ('Sport & Art','SPORT');

-- ============ PROFILES ============
CREATE TABLE public.profiles (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  full_name text NOT NULL DEFAULT '',
  nim text,
  division_id uuid REFERENCES public.divisions(id),
  jabatan text,
  id_kartu text UNIQUE,
  avatar_url text,
  email text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE ON public.profiles TO authenticated;
GRANT ALL ON public.profiles TO service_role;
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- ============ USER ROLES ============
CREATE TABLE public.user_roles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  role public.app_role NOT NULL,
  division_id uuid REFERENCES public.divisions(id),
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (user_id, role)
);
GRANT SELECT ON public.user_roles TO authenticated;
GRANT ALL ON public.user_roles TO service_role;
ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;

-- ============ SECURITY DEFINER FUNCTIONS ============
CREATE OR REPLACE FUNCTION public.has_role(_user_id uuid, _role public.app_role)
RETURNS boolean LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public
AS $$
  SELECT EXISTS (SELECT 1 FROM public.user_roles WHERE user_id = _user_id AND role = _role);
$$;

CREATE OR REPLACE FUNCTION public.get_user_division(_user_id uuid)
RETURNS uuid LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public
AS $$
  SELECT division_id FROM public.profiles WHERE id = _user_id;
$$;

CREATE OR REPLACE FUNCTION public.get_kadiv_division(_user_id uuid)
RETURNS uuid LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public
AS $$
  SELECT division_id FROM public.user_roles WHERE user_id = _user_id AND role = 'kadiv' LIMIT 1;
$$;

-- ============ PROFILES POLICIES ============
CREATE POLICY "profiles self read" ON public.profiles FOR SELECT TO authenticated
  USING (id = auth.uid());
CREATE POLICY "profiles bph/hr read all" ON public.profiles FOR SELECT TO authenticated
  USING (public.has_role(auth.uid(),'bph') OR public.has_role(auth.uid(),'hr_admin'));
CREATE POLICY "profiles kadiv read div" ON public.profiles FOR SELECT TO authenticated
  USING (public.has_role(auth.uid(),'kadiv') AND division_id = public.get_kadiv_division(auth.uid()));
CREATE POLICY "profiles self update" ON public.profiles FOR UPDATE TO authenticated
  USING (id = auth.uid()) WITH CHECK (id = auth.uid());
CREATE POLICY "profiles hr manage" ON public.profiles FOR ALL TO authenticated
  USING (public.has_role(auth.uid(),'hr_admin')) WITH CHECK (public.has_role(auth.uid(),'hr_admin'));

-- ============ USER_ROLES POLICIES ============
CREATE POLICY "user_roles self read" ON public.user_roles FOR SELECT TO authenticated
  USING (user_id = auth.uid());
CREATE POLICY "user_roles hr/bph read" ON public.user_roles FOR SELECT TO authenticated
  USING (public.has_role(auth.uid(),'hr_admin') OR public.has_role(auth.uid(),'bph'));
CREATE POLICY "user_roles hr manage" ON public.user_roles FOR ALL TO authenticated
  USING (public.has_role(auth.uid(),'hr_admin')) WITH CHECK (public.has_role(auth.uid(),'hr_admin'));

-- ============ MEETINGS ============
CREATE TABLE public.meetings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  meeting_date date NOT NULL,
  start_time time NOT NULL DEFAULT '00:00',
  grace_minutes int NOT NULL DEFAULT 15,
  division_id uuid REFERENCES public.divisions(id),
  created_by uuid REFERENCES auth.users(id),
  created_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.meetings TO authenticated;
GRANT ALL ON public.meetings TO service_role;
ALTER TABLE public.meetings ENABLE ROW LEVEL SECURITY;
CREATE POLICY "meetings read all authed" ON public.meetings FOR SELECT TO authenticated USING (true);
CREATE POLICY "meetings hr manage" ON public.meetings FOR ALL TO authenticated
  USING (public.has_role(auth.uid(),'hr_admin')) WITH CHECK (public.has_role(auth.uid(),'hr_admin'));
CREATE POLICY "meetings kadiv manage own div" ON public.meetings FOR ALL TO authenticated
  USING (public.has_role(auth.uid(),'kadiv') AND division_id = public.get_kadiv_division(auth.uid()))
  WITH CHECK (public.has_role(auth.uid(),'kadiv') AND division_id = public.get_kadiv_division(auth.uid()));

-- ============ ATTENDANCE ============
CREATE TABLE public.attendance (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  meeting_id uuid NOT NULL REFERENCES public.meetings(id) ON DELETE CASCADE,
  profile_id uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  tap_time timestamptz NOT NULL DEFAULT now(),
  status public.attendance_status NOT NULL DEFAULT 'hadir',
  UNIQUE(meeting_id, profile_id)
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.attendance TO authenticated;
GRANT ALL ON public.attendance TO service_role;
ALTER TABLE public.attendance ENABLE ROW LEVEL SECURITY;
CREATE POLICY "attendance self read" ON public.attendance FOR SELECT TO authenticated
  USING (profile_id = auth.uid());
CREATE POLICY "attendance bph/hr read" ON public.attendance FOR SELECT TO authenticated
  USING (public.has_role(auth.uid(),'bph') OR public.has_role(auth.uid(),'hr_admin'));
CREATE POLICY "attendance kadiv read div" ON public.attendance FOR SELECT TO authenticated
  USING (public.has_role(auth.uid(),'kadiv')
    AND EXISTS(SELECT 1 FROM public.profiles p WHERE p.id = attendance.profile_id AND p.division_id = public.get_kadiv_division(auth.uid())));
CREATE POLICY "attendance hr manage" ON public.attendance FOR ALL TO authenticated
  USING (public.has_role(auth.uid(),'hr_admin')) WITH CHECK (public.has_role(auth.uid(),'hr_admin'));

-- ============ JOBDESKS ============
CREATE TABLE public.jobdesks (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  division_id uuid REFERENCES public.divisions(id),
  title text NOT NULL,
  description text,
  file_url text,
  file_name text,
  deadline date,
  status public.jobdesk_status NOT NULL DEFAULT 'diajukan',
  reviewed_by uuid REFERENCES auth.users(id),
  reviewed_at timestamptz,
  review_note text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.jobdesks TO authenticated;
GRANT ALL ON public.jobdesks TO service_role;
ALTER TABLE public.jobdesks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "jobdesks self read" ON public.jobdesks FOR SELECT TO authenticated
  USING (profile_id = auth.uid());
CREATE POLICY "jobdesks self insert" ON public.jobdesks FOR INSERT TO authenticated
  WITH CHECK (profile_id = auth.uid());
CREATE POLICY "jobdesks self update pending" ON public.jobdesks FOR UPDATE TO authenticated
  USING (profile_id = auth.uid() AND status = 'diajukan')
  WITH CHECK (profile_id = auth.uid());
CREATE POLICY "jobdesks bph/hr read" ON public.jobdesks FOR SELECT TO authenticated
  USING (public.has_role(auth.uid(),'bph') OR public.has_role(auth.uid(),'hr_admin'));
CREATE POLICY "jobdesks kadiv read div" ON public.jobdesks FOR SELECT TO authenticated
  USING (public.has_role(auth.uid(),'kadiv') AND division_id = public.get_kadiv_division(auth.uid()));
CREATE POLICY "jobdesks kadiv review" ON public.jobdesks FOR UPDATE TO authenticated
  USING (public.has_role(auth.uid(),'kadiv') AND division_id = public.get_kadiv_division(auth.uid()))
  WITH CHECK (public.has_role(auth.uid(),'kadiv') AND division_id = public.get_kadiv_division(auth.uid()));
CREATE POLICY "jobdesks hr manage" ON public.jobdesks FOR ALL TO authenticated
  USING (public.has_role(auth.uid(),'hr_admin')) WITH CHECK (public.has_role(auth.uid(),'hr_admin'));

-- ============ KPI SETTINGS ============
CREATE TABLE public.kpi_settings (
  id int PRIMARY KEY DEFAULT 1 CHECK (id=1),
  attendance_weight numeric NOT NULL DEFAULT 0.5 CHECK (attendance_weight >= 0 AND attendance_weight <= 1),
  jobdesk_weight numeric NOT NULL DEFAULT 0.5 CHECK (jobdesk_weight >= 0 AND jobdesk_weight <= 1),
  updated_by uuid REFERENCES auth.users(id),
  updated_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT ON public.kpi_settings TO authenticated;
GRANT ALL ON public.kpi_settings TO service_role;
ALTER TABLE public.kpi_settings ENABLE ROW LEVEL SECURITY;
CREATE POLICY "kpi_settings read all" ON public.kpi_settings FOR SELECT TO authenticated USING (true);
CREATE POLICY "kpi_settings hr manage" ON public.kpi_settings FOR ALL TO authenticated
  USING (public.has_role(auth.uid(),'hr_admin')) WITH CHECK (public.has_role(auth.uid(),'hr_admin'));

INSERT INTO public.kpi_settings (id) VALUES (1);

-- ============ TRIGGERS ============
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE
  is_first boolean;
BEGIN
  INSERT INTO public.profiles (id, full_name, email)
  VALUES (NEW.id, COALESCE(NEW.raw_user_meta_data->>'full_name',''), NEW.email);

  SELECT NOT EXISTS(SELECT 1 FROM public.user_roles) INTO is_first;
  IF is_first THEN
    INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'hr_admin');
  ELSE
    INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'anggota');
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS trigger LANGUAGE plpgsql AS $$
BEGIN NEW.updated_at = now(); RETURN NEW; END; $$;

CREATE TRIGGER profiles_updated_at BEFORE UPDATE ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();
CREATE TRIGGER jobdesks_updated_at BEFORE UPDATE ON public.jobdesks
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

-- ============ RECORD ATTENDANCE (RFID TAP) ============
CREATE OR REPLACE FUNCTION public.record_attendance(_meeting_id uuid, _id_kartu text)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE
  _profile public.profiles%ROWTYPE;
  _meeting public.meetings%ROWTYPE;
  _status public.attendance_status;
  _existing public.attendance%ROWTYPE;
BEGIN
  IF NOT (public.has_role(auth.uid(),'hr_admin') OR public.has_role(auth.uid(),'kadiv')) THEN
    RETURN jsonb_build_object('ok',false,'error','Tidak berwenang');
  END IF;

  SELECT * INTO _profile FROM public.profiles WHERE id_kartu = _id_kartu;
  IF NOT FOUND THEN
    RETURN jsonb_build_object('ok',false,'error','Kartu tidak terdaftar');
  END IF;

  SELECT * INTO _meeting FROM public.meetings WHERE id = _meeting_id;
  IF NOT FOUND THEN
    RETURN jsonb_build_object('ok',false,'error','Rapat tidak ditemukan');
  END IF;

  SELECT * INTO _existing FROM public.attendance WHERE meeting_id = _meeting_id AND profile_id = _profile.id;
  IF FOUND THEN
    RETURN jsonb_build_object('ok',false,'already',true,'error','Sudah absen',
      'profile', jsonb_build_object('id',_profile.id,'full_name',_profile.full_name,'avatar_url',_profile.avatar_url));
  END IF;

  IF (now() AT TIME ZONE 'Asia/Jakarta')::time > (_meeting.start_time + make_interval(mins => _meeting.grace_minutes)) THEN
    _status := 'telat';
  ELSE
    _status := 'hadir';
  END IF;

  INSERT INTO public.attendance (meeting_id, profile_id, status) VALUES (_meeting_id, _profile.id, _status);

  RETURN jsonb_build_object('ok',true,'status',_status,
    'profile', jsonb_build_object('id',_profile.id,'full_name',_profile.full_name,'avatar_url',_profile.avatar_url,'nim',_profile.nim));
END;
$$;
GRANT EXECUTE ON FUNCTION public.record_attendance(uuid,text) TO authenticated;

-- ============ REGISTER CARD (tap-to-register) ============
CREATE OR REPLACE FUNCTION public.register_card(_profile_id uuid, _id_kartu text)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE _existing_owner uuid;
BEGIN
  IF NOT public.has_role(auth.uid(),'hr_admin') THEN
    RETURN jsonb_build_object('ok',false,'error','Hanya HR Admin');
  END IF;
  SELECT id INTO _existing_owner FROM public.profiles WHERE id_kartu = _id_kartu AND id <> _profile_id;
  IF FOUND THEN
    RETURN jsonb_build_object('ok',false,'error','Kartu sudah dipakai anggota lain');
  END IF;
  UPDATE public.profiles SET id_kartu = _id_kartu WHERE id = _profile_id;
  RETURN jsonb_build_object('ok',true);
END;
$$;
GRANT EXECUTE ON FUNCTION public.register_card(uuid,text) TO authenticated;

-- ============ KPI CALCULATION ============
CREATE OR REPLACE FUNCTION public.calculate_kpi(_profile_id uuid)
RETURNS jsonb LANGUAGE plpgsql STABLE SECURITY DEFINER SET search_path = public
AS $$
DECLARE
  _div uuid;
  _total_meetings int;
  _attended int;
  _total_jobs int;
  _approved int;
  _att_pct numeric := 0;
  _job_pct numeric := 0;
  _w_att numeric;
  _w_job numeric;
BEGIN
  SELECT division_id INTO _div FROM public.profiles WHERE id = _profile_id;
  SELECT attendance_weight, jobdesk_weight INTO _w_att, _w_job FROM public.kpi_settings WHERE id=1;

  SELECT count(*) INTO _total_meetings FROM public.meetings
    WHERE division_id IS NULL OR division_id = _div;
  SELECT count(*) INTO _attended FROM public.attendance
    WHERE profile_id = _profile_id;
  IF _total_meetings > 0 THEN _att_pct := (_attended::numeric / _total_meetings) * 100; END IF;

  SELECT count(*) INTO _total_jobs FROM public.jobdesks WHERE profile_id = _profile_id;
  SELECT count(*) INTO _approved FROM public.jobdesks WHERE profile_id = _profile_id AND status='disetujui';
  IF _total_jobs > 0 THEN _job_pct := (_approved::numeric / _total_jobs) * 100; END IF;

  RETURN jsonb_build_object(
    'attendance_pct', round(_att_pct,2),
    'jobdesk_pct', round(_job_pct,2),
    'total_meetings', _total_meetings,
    'attended', _attended,
    'total_jobs', _total_jobs,
    'approved_jobs', _approved,
    'kpi_score', round(_att_pct * _w_att + _job_pct * _w_job, 2)
  );
END;
$$;
GRANT EXECUTE ON FUNCTION public.calculate_kpi(uuid) TO authenticated;
