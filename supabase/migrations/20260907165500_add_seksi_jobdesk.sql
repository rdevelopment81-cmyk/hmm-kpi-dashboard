-- Menambahkan 'anggota' ke tipe enum proker_role_type
ALTER TYPE proker_role_type ADD VALUE IF NOT EXISTS 'anggota';

-- Menambahkan 'ditugaskan' ke tipe enum jobdesk_status
ALTER TYPE jobdesk_status ADD VALUE IF NOT EXISTS 'ditugaskan';

-- Menambahkan kolom seksi_name ke tabel jobdesks
ALTER TABLE jobdesks
ADD COLUMN IF NOT EXISTS seksi_name TEXT;
