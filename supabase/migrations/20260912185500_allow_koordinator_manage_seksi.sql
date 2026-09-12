-- Allow koordinator seksi to manage (insert/delete) their own seksi's anggota
CREATE POLICY "proker_assignments koordinator manage anggota" ON public.proker_assignments 
  FOR ALL TO authenticated 
  USING (
    role_type = 'anggota' AND
    EXISTS (
      SELECT 1 FROM public.proker_assignments AS pa
      WHERE pa.proker_id = proker_assignments.proker_id
        AND pa.seksi_name = proker_assignments.seksi_name
        AND pa.profile_id = auth.uid()
        AND pa.role_type = 'koordinator'
    )
  )
  WITH CHECK (
    role_type = 'anggota' AND
    EXISTS (
      SELECT 1 FROM public.proker_assignments AS pa
      WHERE pa.proker_id = proker_assignments.proker_id
        AND pa.seksi_name = proker_assignments.seksi_name
        AND pa.profile_id = auth.uid()
        AND pa.role_type = 'koordinator'
    )
  );
