-- Fix foreign key constraints referencing auth.users to allow user deletion

-- For meetings.created_by
ALTER TABLE public.meetings DROP CONSTRAINT IF EXISTS meetings_created_by_fkey;
ALTER TABLE public.meetings ADD CONSTRAINT meetings_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id) ON DELETE SET NULL;

-- For jobdesks.reviewed_by
ALTER TABLE public.jobdesks DROP CONSTRAINT IF EXISTS jobdesks_reviewed_by_fkey;
ALTER TABLE public.jobdesks ADD CONSTRAINT jobdesks_reviewed_by_fkey FOREIGN KEY (reviewed_by) REFERENCES auth.users(id) ON DELETE SET NULL;

-- For kpi_settings.updated_by
ALTER TABLE public.kpi_settings DROP CONSTRAINT IF EXISTS kpi_settings_updated_by_fkey;
ALTER TABLE public.kpi_settings ADD CONSTRAINT kpi_settings_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES auth.users(id) ON DELETE SET NULL;

-- For prokers.created_by
ALTER TABLE public.prokers DROP CONSTRAINT IF EXISTS prokers_created_by_fkey;
ALTER TABLE public.prokers ADD CONSTRAINT prokers_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id) ON DELETE SET NULL;
