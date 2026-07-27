
-- Path convention: <profile_id>/<filename>
CREATE POLICY "jobdesk own insert" ON storage.objects FOR INSERT TO authenticated
  WITH CHECK (bucket_id='jobdesk-files' AND (storage.foldername(name))[1] = auth.uid()::text);
CREATE POLICY "jobdesk own read" ON storage.objects FOR SELECT TO authenticated
  USING (bucket_id='jobdesk-files' AND (storage.foldername(name))[1] = auth.uid()::text);
CREATE POLICY "jobdesk own update" ON storage.objects FOR UPDATE TO authenticated
  USING (bucket_id='jobdesk-files' AND (storage.foldername(name))[1] = auth.uid()::text);
CREATE POLICY "jobdesk own delete" ON storage.objects FOR DELETE TO authenticated
  USING (bucket_id='jobdesk-files' AND (storage.foldername(name))[1] = auth.uid()::text);
CREATE POLICY "jobdesk staff read" ON storage.objects FOR SELECT TO authenticated
  USING (bucket_id='jobdesk-files' AND (
    public.has_role(auth.uid(),'hr_admin')
    OR public.has_role(auth.uid(),'bph')
    OR public.has_role(auth.uid(),'kadiv')
  ));
