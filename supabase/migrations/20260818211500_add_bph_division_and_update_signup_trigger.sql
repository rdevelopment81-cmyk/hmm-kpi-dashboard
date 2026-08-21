-- Ensure BPH division exists
INSERT INTO public.divisions (name, code)
VALUES ('Badan Pengurus Harian', 'BPH')
ON CONFLICT (name) DO NOTHING;

-- Update handle_new_user to accept requested_role & jabatan from user metadata
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
BEGIN
  BEGIN
    _division := NULLIF(NEW.raw_user_meta_data->>'division_id','')::uuid;
  EXCEPTION WHEN others THEN _division := NULL; END;

  _role := COALESCE(NEW.raw_user_meta_data->>'requested_role', 'anggota');
  _jabatan := NULLIF(NEW.raw_user_meta_data->>'jabatan','');

  SELECT NOT EXISTS(SELECT 1 FROM public.user_roles) INTO is_first;

  INSERT INTO public.profiles (id, full_name, email, nim, division_id, jabatan, status)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'full_name',''),
    NEW.email,
    NULLIF(NEW.raw_user_meta_data->>'nim',''),
    _division,
    _jabatan,
    CASE WHEN is_first THEN 'aktif'::public.profile_status ELSE 'pending'::public.profile_status END
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
