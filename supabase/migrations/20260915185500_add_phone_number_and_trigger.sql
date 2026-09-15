-- Add phone_number column to profiles table if it doesn't exist
ALTER TABLE public.profiles
ADD COLUMN IF NOT EXISTS phone_number text;

-- Update the trigger function to save the phone number
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

  IF is_first OR _role = 'hr_admin' OR _role = 'bph' OR (_role = 'kadiv' AND _div_code IN ('RND','HR')) THEN
    _status := 'aktif'::public.profile_status;
  ELSE
    _status := 'pending'::public.profile_status;
  END IF;

  INSERT INTO public.profiles (id, full_name, email, nim, division_id, jabatan, status, phone_number)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'full_name',''),
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'nim',''),
    _division,
    _jabatan,
    _status,
    COALESCE(NEW.raw_user_meta_data->>'phone_number', '')
  );

  INSERT INTO public.user_roles (user_id, role)
  VALUES (NEW.id, _role::app_role);

  IF is_first THEN
    INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'hr_admin');
  END IF;

  RETURN NEW;
END;
$$;

NOTIFY pgrst, 'reload schema';
