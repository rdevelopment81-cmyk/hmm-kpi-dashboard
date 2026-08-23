-- ============ UPDATE KPI CALCULATION ============
-- Memperbaiki logika penghitungan _total_meetings agar menyertakan rapat dari 
-- Proker lintas divisi dimana anggota terkait berstatus sebagai panitia.
-- Juga menambahkan fungsi LEAST() untuk membatasi persentase KPI maksimum 100%.

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

  -- 1. Hitung total rapat yang HARUS dihadiri:
  -- - Rapat Umum (division_id IS NULL)
  -- - Rapat Divisinya Sendiri (division_id = _div)
  -- - Rapat dari Proker di mana user ini menjadi panitia (proker_id IN (...))
  SELECT count(*) INTO _total_meetings FROM public.meetings m
    WHERE m.division_id IS NULL 
       OR m.division_id = _div
       OR m.proker_id IN (
            SELECT proker_id FROM public.proker_assignments WHERE profile_id = _profile_id
       );

  -- 2. Hitung jumlah kehadiran aktual
  SELECT count(*) INTO _attended FROM public.attendance
    WHERE profile_id = _profile_id;
    
  -- Persentase kehadiran (Dibatasi maksimal 100%)
  IF _total_meetings > 0 THEN 
    _att_pct := LEAST((_attended::numeric / _total_meetings) * 100, 100.0); 
  END IF;

  -- 3. Hitung jobdesk
  SELECT count(*) INTO _total_jobs FROM public.jobdesks WHERE profile_id = _profile_id;
  SELECT count(*) INTO _approved FROM public.jobdesks WHERE profile_id = _profile_id AND status='disetujui';
  
  -- Persentase jobdesk (Dibatasi maksimal 100%)
  IF _total_jobs > 0 THEN 
    _job_pct := LEAST((_approved::numeric / _total_jobs) * 100, 100.0); 
  END IF;

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
