-- ============ ENUMS ============
DO $$ BEGIN
  CREATE TYPE public.proker_status AS ENUM ('perencanaan', 'rapat_1', 'rapat_2', 'rapat_3', 'pelaksanaan', 'selesai');
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
  CREATE TYPE public.proker_role_type AS ENUM ('ketua_pelaksana', 'sekretaris', 'bendahara', 'koordinator');
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

-- ============ PROKERS TABLE ============
CREATE TABLE IF NOT EXISTS public.prokers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  division_id uuid REFERENCES public.divisions(id),
  status public.proker_status NOT NULL DEFAULT 'perencanaan',
  description text,
  created_by uuid REFERENCES auth.users(id),
  created_at timestamptz NOT NULL DEFAULT now()
);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.prokers TO authenticated;
GRANT ALL ON public.prokers TO service_role;

ALTER TABLE public.prokers ENABLE ROW LEVEL SECURITY;

-- ============ PROKER ASSIGNMENTS TABLE ============
CREATE TABLE IF NOT EXISTS public.proker_assignments (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  proker_id uuid NOT NULL REFERENCES public.prokers(id) ON DELETE CASCADE,
  profile_id uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  role_type public.proker_role_type NOT NULL,
  seksi_name text,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (proker_id, profile_id, role_type, seksi_name)
);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.proker_assignments TO authenticated;
GRANT ALL ON public.proker_assignments TO service_role;

ALTER TABLE public.proker_assignments ENABLE ROW LEVEL SECURITY;

-- ============ ALTER MEETINGS TABLE ============
ALTER TABLE public.meetings 
  ADD COLUMN IF NOT EXISTS proker_id uuid REFERENCES public.prokers(id),
  ADD COLUMN IF NOT EXISTS meeting_type text NOT NULL DEFAULT 'umum';

-- ============ SECURITY DEFINER FUNCTIONS ============
CREATE OR REPLACE FUNCTION public.is_ketuplak(_proker_id uuid, _user_id uuid)
RETURNS boolean LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.proker_assignments
    WHERE proker_id = _proker_id
      AND profile_id = _user_id
      AND role_type = 'ketua_pelaksana'
  );
$$;

-- ============ PROKERS RLS POLICIES ============
CREATE POLICY "prokers read all" ON public.prokers 
  FOR SELECT TO authenticated 
  USING (true);

CREATE POLICY "prokers hr manage" ON public.prokers 
  FOR ALL TO authenticated 
  USING (public.has_role(auth.uid(),'hr_admin')) 
  WITH CHECK (public.has_role(auth.uid(),'hr_admin'));

CREATE POLICY "prokers kadiv manage own div" ON public.prokers 
  FOR ALL TO authenticated 
  USING (public.has_role(auth.uid(),'kadiv') AND division_id = public.get_kadiv_division(auth.uid())) 
  WITH CHECK (public.has_role(auth.uid(),'kadiv') AND division_id = public.get_kadiv_division(auth.uid()));

CREATE POLICY "prokers ketuplak update" ON public.prokers 
  FOR UPDATE TO authenticated 
  USING (public.is_ketuplak(id, auth.uid())) 
  WITH CHECK (public.is_ketuplak(id, auth.uid()));

-- ============ PROKER ASSIGNMENTS RLS POLICIES ============
CREATE POLICY "proker_assignments read all" ON public.proker_assignments 
  FOR SELECT TO authenticated 
  USING (true);

CREATE POLICY "proker_assignments hr manage" ON public.proker_assignments 
  FOR ALL TO authenticated 
  USING (public.has_role(auth.uid(),'hr_admin')) 
  WITH CHECK (public.has_role(auth.uid(),'hr_admin'));

CREATE POLICY "proker_assignments kadiv manage own div" ON public.proker_assignments 
  FOR ALL TO authenticated 
  USING (public.has_role(auth.uid(),'kadiv') AND EXISTS (SELECT 1 FROM public.prokers p WHERE p.id = proker_assignments.proker_id AND p.division_id = public.get_kadiv_division(auth.uid()))) 
  WITH CHECK (public.has_role(auth.uid(),'kadiv') AND EXISTS (SELECT 1 FROM public.prokers p WHERE p.id = proker_assignments.proker_id AND p.division_id = public.get_kadiv_division(auth.uid())));

CREATE POLICY "proker_assignments ketuplak manage" ON public.proker_assignments 
  FOR ALL TO authenticated 
  USING (public.is_ketuplak(proker_id, auth.uid())) 
  WITH CHECK (public.is_ketuplak(proker_id, auth.uid()));
