-- Allow Dewan Kegiatan to manage jobdesks for their proker
CREATE POLICY "jobdesks proker dewan manage" ON public.jobdesks
  FOR ALL TO authenticated
  USING (
    proker_id IS NOT NULL AND 
    EXISTS (
      SELECT 1 FROM public.proker_assignments 
      WHERE proker_id = jobdesks.proker_id 
        AND profile_id = auth.uid() 
        AND role_type IN ('ketua_pelaksana', 'sekretaris', 'bendahara')
    )
  )
  WITH CHECK (
    proker_id IS NOT NULL AND 
    EXISTS (
      SELECT 1 FROM public.proker_assignments 
      WHERE proker_id = jobdesks.proker_id 
        AND profile_id = auth.uid() 
        AND role_type IN ('ketua_pelaksana', 'sekretaris', 'bendahara')
    )
  );

-- Allow Koordinator to manage jobdesks for their seksi in their proker
CREATE POLICY "jobdesks proker koord manage" ON public.jobdesks
  FOR ALL TO authenticated
  USING (
    proker_id IS NOT NULL AND 
    seksi_name IS NOT NULL AND
    EXISTS (
      SELECT 1 FROM public.proker_assignments 
      WHERE proker_id = jobdesks.proker_id 
        AND profile_id = auth.uid() 
        AND role_type = 'koordinator'
        AND seksi_name = jobdesks.seksi_name
    )
  )
  WITH CHECK (
    proker_id IS NOT NULL AND 
    seksi_name IS NOT NULL AND
    EXISTS (
      SELECT 1 FROM public.proker_assignments 
      WHERE proker_id = jobdesks.proker_id 
        AND profile_id = auth.uid() 
        AND role_type = 'koordinator'
        AND seksi_name = jobdesks.seksi_name
    )
  );
