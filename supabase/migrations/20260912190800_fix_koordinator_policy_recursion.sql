-- Create a security definer function to avoid infinite recursion
CREATE OR REPLACE FUNCTION public.is_koordinator(_proker_id uuid, _seksi_name text, _user_id uuid)
RETURNS boolean LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.proker_assignments
    WHERE proker_id = _proker_id
      AND seksi_name = _seksi_name
      AND profile_id = _user_id
      AND role_type = 'koordinator'
  );
$$;

-- Drop the old recursive policy
DROP POLICY IF EXISTS "proker_assignments koordinator manage anggota" ON public.proker_assignments;

-- Create the new non-recursive policy using the function
CREATE POLICY "proker_assignments koordinator manage anggota" ON public.proker_assignments 
  FOR ALL TO authenticated 
  USING (
    role_type = 'anggota' AND
    public.is_koordinator(proker_id, seksi_name, auth.uid())
  )
  WITH CHECK (
    role_type = 'anggota' AND
    public.is_koordinator(proker_id, seksi_name, auth.uid())
  );
