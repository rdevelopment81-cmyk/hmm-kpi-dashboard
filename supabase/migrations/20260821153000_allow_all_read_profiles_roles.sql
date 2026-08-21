-- Allow all authenticated users to read profiles so they can see the organization structure
CREATE POLICY "profiles read all authed" ON public.profiles FOR SELECT TO authenticated USING (true);

-- Allow all authenticated users to read user_roles so they can see who is kadiv/bph
CREATE POLICY "user_roles read all authed" ON public.user_roles FOR SELECT TO authenticated USING (true);
