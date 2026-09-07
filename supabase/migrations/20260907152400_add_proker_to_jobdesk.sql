-- Add proker_id to jobdesks
ALTER TABLE jobdesks
ADD COLUMN proker_id UUID REFERENCES prokers(id) ON DELETE SET NULL;
