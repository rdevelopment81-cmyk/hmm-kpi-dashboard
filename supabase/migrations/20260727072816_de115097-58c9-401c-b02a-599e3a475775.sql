
DO $$ BEGIN
  CREATE TYPE public.profile_status AS ENUM ('pending','aktif');
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS status public.profile_status NOT NULL DEFAULT 'pending';

-- existing users tetap aktif
UPDATE public.profiles SET status='aktif' WHERE status='pending' AND created_at < now();

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  is_first boolean;
  _division uuid;
BEGIN
  BEGIN
    _division := NULLIF(NEW.raw_user_meta_data->>'division_id','')::uuid;
  EXCEPTION WHEN others THEN _division := NULL; END;

  SELECT NOT EXISTS(SELECT 1 FROM public.user_roles) INTO is_first;

  INSERT INTO public.profiles (id, full_name, email, nim, division_id, status)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'full_name',''),
    NEW.email,
    NULLIF(NEW.raw_user_meta_data->>'nim',''),
    _division,
    CASE WHEN is_first THEN 'aktif'::public.profile_status ELSE 'pending'::public.profile_status END
  );

  IF is_first THEN
    INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'hr_admin');
  ELSE
    INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'anggota');
  END IF;
  RETURN NEW;
END;
$$;
