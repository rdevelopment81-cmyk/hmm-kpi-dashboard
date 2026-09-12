INSERT INTO storage.buckets (id, name, public) 
VALUES ('jobdesk-files', 'jobdesk-files', false)
ON CONFLICT (id) DO NOTHING;
