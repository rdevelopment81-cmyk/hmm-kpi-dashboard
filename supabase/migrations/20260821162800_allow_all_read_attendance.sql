-- Allow all authenticated users to read attendance data so they can see the total attendance in meetings
CREATE POLICY "attendance read all authed" ON public.attendance FOR SELECT TO authenticated USING (true);
