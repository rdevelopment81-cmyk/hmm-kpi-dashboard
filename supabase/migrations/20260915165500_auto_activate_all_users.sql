-- Auto-activate all existing pending users
UPDATE public.profiles SET status = 'aktif' WHERE status = 'pending';

-- Update handle_new_user to make everyone 'aktif' by default
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

  INSERT INTO public.profiles (id, full_name, email, nim, division_id, jabatan, status)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'full_name',''),
    NEW.email,
    NULLIF(NEW.raw_user_meta_data->>'nim',''),
    _division,
    COALESCE(_jabatan, CASE WHEN _role = 'kadiv' THEN 'Kepala Divisi' ELSE 'Anggota' END),
    'aktif'::public.profile_status
  );

  IF is_first THEN
    INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'hr_admin', _division);
    IF _role = 'kadiv' OR _role = 'anggota' THEN
      INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'kadiv', _division);
    END IF;
  ELSE
    IF _role = 'hr_admin' THEN
      INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'hr_admin', _division);
    ELSIF _role = 'bph' THEN
      INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'bph', _division);
    ELSIF _role = 'kadiv' THEN
      INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'kadiv', _division);
      IF _div_code = 'RND' OR _div_code = 'HR' THEN
        INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'hr_admin', _division);
      END IF;
    ELSE
      INSERT INTO public.user_roles (user_id, role, division_id) VALUES (NEW.id, 'anggota', _division);
    END IF;
  END IF;
  RETURN NEW;
END;
$$;
