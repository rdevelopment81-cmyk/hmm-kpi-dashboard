-- Grant full admin access (equal to hr_admin) to Kadiv Research & Development (RND)
CREATE OR REPLACE FUNCTION public.has_role(_user_id uuid, _role public.app_role)
RETURNS boolean LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.user_roles ur
    LEFT JOIN public.profiles p ON p.id = _user_id
    LEFT JOIN public.divisions d ON d.id = COALESCE(ur.division_id, p.division_id)
    WHERE ur.user_id = _user_id AND (
      ur.role = _role
      OR (_role = 'hr_admin' AND ur.role = 'kadiv' AND d.code = 'RND')
    )
  );
$$;
