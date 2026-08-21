CREATE OR REPLACE FUNCTION public.record_attendance(_meeting_id uuid, _id_kartu text)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
DECLARE
  _profile public.profiles%ROWTYPE;
  _meeting public.meetings%ROWTYPE;
  _status public.attendance_status;
  _existing public.attendance%ROWTYPE;
  _meeting_ts timestamp;
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

  -- Combine meeting_date and start_time into a full timestamp
  _meeting_ts := _meeting.meeting_date + _meeting.start_time;

  -- Compare full timestamp instead of just time
  IF (now() AT TIME ZONE 'Asia/Jakarta') > (_meeting_ts + make_interval(mins => _meeting.grace_minutes)) THEN
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
