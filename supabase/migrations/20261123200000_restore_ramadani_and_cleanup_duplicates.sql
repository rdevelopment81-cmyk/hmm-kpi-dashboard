-- ====================================================================
-- RESTORE RAMADANI PUTRI LESTARI DATA & CLEANUP DUPLICATE ACCOUNTS
-- Memulihkan data penugasan, absensi, dan jobdesk untuk Ramadani Putri Lestari
-- serta menghapus akun duplikat kosong Tashifa Alina Khesia
-- ====================================================================

-- 1. PROKER ASSIGNMENTS UNTUK RAMADANI PUTRI LESTARI (ID: f4db54bd-fdbd-46c7-a418-353e8a4f62c4)
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

-- 2. ABSENSI RAPAT RAMADANI PUTRI LESTARI
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

-- 3. JOBDESKS RAMADANI PUTRI LESTARI
DELETE FROM public.jobdesks WHERE profile_id = 'f4db54bd-fdbd-46c7-a418-353e8a4f62c4';

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('f4db54bd-fdbd-46c7-a418-353e8a4f62c4', '7c323d98-bdb2-4aae-b121-a776045fcc6f', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Academic (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('f4db54bd-fdbd-46c7-a418-353e8a4f62c4', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('f4db54bd-fdbd-46c7-a418-353e8a4f62c4', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('f4db54bd-fdbd-46c7-a418-353e8a4f62c4', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('f4db54bd-fdbd-46c7-a418-353e8a4f62c4', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('f4db54bd-fdbd-46c7-a418-353e8a4f62c4', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');

-- 4. PEMBERSIHAN AKUN DUPLIKAT KOSONG TASHIFA ALINA KHESIA
-- Hapus akun kedua yang kosong (ID: 6d1fe29f-6399-4b95-b01b-64e993ee23ad)
DELETE FROM public.user_roles WHERE user_id = '6d1fe29f-6399-4b95-b01b-64e993ee23ad';
DELETE FROM public.profiles WHERE id = '6d1fe29f-6399-4b95-b01b-64e993ee23ad';

-- Perbaiki email akun utama Tashifa Alina Khesia (ID: 1ed38f3c-a978-4873-9702-fe675765db24) dari .con ke .com
UPDATE public.profiles
SET email = 'tashifaalina97@gmail.com'
WHERE id = '1ed38f3c-a978-4873-9702-fe675765db24';
