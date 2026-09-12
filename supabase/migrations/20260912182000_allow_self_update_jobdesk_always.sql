-- Drop the restrictive policy
DROP POLICY IF EXISTS "jobdesks self update pending" ON public.jobdesks;

-- Create a new policy that allows users to update their jobdesks unconditionally (since approval flow is removed)
CREATE POLICY "jobdesks self update pending" ON public.jobdesks FOR UPDATE TO authenticated
  USING (profile_id = auth.uid())
  WITH CHECK (profile_id = auth.uid());
