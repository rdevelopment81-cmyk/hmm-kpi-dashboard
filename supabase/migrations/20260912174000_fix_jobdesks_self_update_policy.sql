-- Drop the restrictive policy
DROP POLICY IF EXISTS "jobdesks self update pending" ON public.jobdesks;

-- Create a new policy that allows users to update their jobdesks if it is not yet approved
CREATE POLICY "jobdesks self update pending" ON public.jobdesks FOR UPDATE TO authenticated
  USING (profile_id = auth.uid() AND status != 'disetujui')
  WITH CHECK (profile_id = auth.uid());
