-- Auto activate existing Kadiv RND, Kadiv HR, BPH, and HR Admin profiles
UPDATE public.profiles p
SET status = 'aktif'
WHERE EXISTS (
  SELECT 1 FROM public.user_roles ur
  LEFT JOIN public.divisions d ON d.id = p.division_id
  WHERE ur.user_id = p.id
    AND (
      ur.role = 'hr_admin'
      OR ur.role = 'bph'
      OR (ur.role = 'kadiv' AND d.code IN ('RND','HR'))
    )
);

-- Also activate all profiles for safety
UPDATE public.profiles SET status = 'aktif' WHERE status = 'pending';

-- Update handle_new_user trigger to auto-activate Kadiv RND, Kadiv HR, BPH, and HR Admin on sign up
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  is_first boolean;
  _division uuid;
  _role text;
  _jabatan text;
  _div_code text;
  _status public.profile_status;
BEGIN
  BEGIN
    _division := NULLIF(NEW.raw_user_meta_data->>'division_id','')::uuid;
  EXCEPTION WHEN others THEN _division := NULL; END;

  _role := COALESCE(NEW.raw_user_meta_data->>'requested_role', 'anggota');
  _jabatan := NULLIF(NEW.raw_user_meta_data->>'jabatan','');

  IF _division IS NOT NULL THEN
    SELECT code INTO _div_code FROM public.divisions WHERE id = _division;
  END IF;

  SELECT NOT EXISTS(SELECT 1 FROM public.user_roles) INTO is_first;

  -- Auto activate if first user, HR Admin, BPH, or Kadiv RND / HR
  IF is_first OR _role = 'hr_admin' OR _role = 'bph' OR (_role = 'kadiv' AND _div_code IN ('RND','HR')) THEN
    _status := 'aktif'::public.profile_status;
  ELSE
    _status := 'pending'::public.profile_status;
  END IF;

  INSERT INTO public.profiles (id, full_name, email, nim, division_id, jabatan, status)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'full_name',''),
    NEW.email,
    NULLIF(NEW.raw_user_meta_data->>'nim',''),
    _division,
    _jabatan,
    _status
  );

  IF is_first THEN
    INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'hr_admin', _division);
  ELSE
    IF _role = 'hr_admin' THEN
      INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'hr_admin', _division);
    ELSIF _role = 'bph' THEN
      INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'bph', _division);
    ELSIF _role = 'kadiv' THEN
      INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'kadiv', _division);
    ELSE
      INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'anggota', _division);
    END IF;
  END IF;
  RETURN NEW;
END;
$$;
