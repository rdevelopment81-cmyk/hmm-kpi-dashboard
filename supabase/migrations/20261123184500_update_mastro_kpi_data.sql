-- ====================================================================
-- MIGRATION: UPDATE MASTRO KPI DATA (JOBDESK & ABSENSI)
-- Otomatis dihasilkan dari pembaruan kpi.xlsx untuk Program Kerja MASTRO
-- ====================================================================

-- 1. PASTIKAN PROKER MASTRO TERDAFTAR
INSERT INTO public.prokers (id, name, description, status, division_id)
VALUES ('55555555-5555-4555-a555-555555555555', 'MASTRO', 'Program kerja Management Art & Sport (MASTRO) 2026', 'selesai', NULL)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, status = EXCLUDED.status;

-- 2. PROKER ASSIGNMENTS MASTRO
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'db3644b7-2630-4d7d-90d3-662277139282', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'c8f40504-1863-4924-b791-67a8cacc3525', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '1ed38f3c-a978-4873-9702-fe675765db24', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'a36780d2-be23-4fb5-be80-d7f725f4aa59', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '92191fe9-0cf4-40b1-ba53-f4a7b8a34730', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'ea037f43-4245-4a44-989d-d4f518254844', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'b4633118-1194-47c8-a407-99ca93404b0a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '3d912aac-7e47-4821-8663-4a1d34618c13', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'e7b6c539-6408-4f76-bbaf-b88d701f7291', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '04b5ee3c-705c-4367-8451-791330bde89e', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'a578f256-6dac-425c-ab00-6bea7debd703', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'ae077199-1cbb-44cb-ad81-8f0e8ff2d447', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'f441324b-eec6-4011-969c-492efc8254e5', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '9c31561a-42c5-48a1-8fd2-112872639498', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('55555555-5555-4555-a555-555555555555', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

-- 3. RAPAT PROKER MASTRO
INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('55555555-5555-4555-b555-000000000001', '55555555-5555-4555-a555-555555555555', 'Rapat 1 MASTRO', '2026-08-26', 'rapat_1', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date;
INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('55555555-5555-4555-b555-000000000002', '55555555-5555-4555-a555-555555555555', 'Rapat 2 MASTRO', '2026-09-16', 'rapat_1', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date;
INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('55555555-5555-4555-b555-000000000003', '55555555-5555-4555-a555-555555555555', 'Rapat 3 MASTRO', '2026-10-02', 'rapat_1', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date;

-- 4. SINKRONISASI ABSENSI RAPAT MASTRO
DELETE FROM public.attendance WHERE meeting_id IN ('55555555-5555-4555-b555-000000000001', '55555555-5555-4555-b555-000000000002', '55555555-5555-4555-b555-000000000003');

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'db3644b7-2630-4d7d-90d3-662277139282', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '1ed38f3c-a978-4873-9702-fe675765db24', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '1ed38f3c-a978-4873-9702-fe675765db24', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '3d912aac-7e47-4821-8663-4a1d34618c13', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '3d912aac-7e47-4821-8663-4a1d34618c13', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';
-- Total absensi hadir diinput: 96

-- 5. SINKRONISASI JOBDESK MASTRO
DELETE FROM public.jobdesks WHERE proker_id = '55555555-5555-4555-a555-555555555555';

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c8f40504-1863-4924-b791-67a8cacc3525', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5a066f24-4089-4022-8dea-7a6fb3f32174', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1ed38f3c-a978-4873-9702-fe675765db24', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 75.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('b6c3926a-7d76-40e3-8c00-53672076dcc0', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1382f21f-b6fa-406c-af42-c05a5a78e184', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 75.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a36780d2-be23-4fb5-be80-d7f725f4aa59', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('92191fe9-0cf4-40b1-ba53-f4a7b8a34730', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 25.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 75.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('64aa81ea-f3a1-4805-bd33-6dd524644972', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('73a2ac21-bac4-4818-bc89-87e31e6d6d6c', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 75.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3a5ddc60-0700-4225-b13c-275b4b9d1cb7', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('d2037e3f-61a1-4ed2-99a4-5dd73539f084', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 25.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('2e3f0f89-8753-40ea-ae5c-e74421b3dcba', '1a49a606-a890-4e97-b85c-ae630f455602', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 85.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('ea037f43-4245-4a44-989d-d4f518254844', '1a49a606-a890-4e97-b85c-ae630f455602', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 35.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a5221008-5abc-4d6a-9f6b-21edea65e0ed', '1a49a606-a890-4e97-b85c-ae630f455602', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('8a89e2b5-154c-407f-8109-c9b6b155cda1', '1a49a606-a890-4e97-b85c-ae630f455602', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 25.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('d772d3c7-c28b-47a0-a575-896e742ec717', '1a49a606-a890-4e97-b85c-ae630f455602', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 5.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('0cc11ce7-a0cb-49ff-82e4-f06daa71854a', '1a49a606-a890-4e97-b85c-ae630f455602', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('b4633118-1194-47c8-a407-99ca93404b0a', 'f058be35-6d97-4bcd-abe9-78737149728c', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'f058be35-6d97-4bcd-abe9-78737149728c', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 20.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('aa998746-e8cf-4a02-88dd-4899254b27a4', 'f058be35-6d97-4bcd-abe9-78737149728c', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'f058be35-6d97-4bcd-abe9-78737149728c', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 50.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'f058be35-6d97-4bcd-abe9-78737149728c', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('4375c1cd-ff62-4884-b83b-7fd667fbf228', 'f058be35-6d97-4bcd-abe9-78737149728c', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 85.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3d912aac-7e47-4821-8663-4a1d34618c13', 'f058be35-6d97-4bcd-abe9-78737149728c', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('e7b6c539-6408-4f76-bbaf-b88d701f7291', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 5.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('04b5ee3c-705c-4367-8451-791330bde89e', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 40.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c86db4ac-11ff-4268-b9b3-500a57339036', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 40.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 40.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('e4a62663-1e0a-4571-b8f2-d1e078e48334', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a578f256-6dac-425c-ab00-6bea7debd703', '83685023-05f8-423f-b3c9-f85077369f3d', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c407c005-2642-4139-ba5d-6b24d4e39449', '83685023-05f8-423f-b3c9-f85077369f3d', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('ae077199-1cbb-44cb-ad81-8f0e8ff2d447', '83685023-05f8-423f-b3c9-f85077369f3d', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 75.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('f441324b-eec6-4011-969c-492efc8254e5', '83685023-05f8-423f-b3c9-f85077369f3d', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', '83685023-05f8-423f-b3c9-f85077369f3d', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('bc7df05d-d8d9-46cc-9a01-c51cede78340', '83685023-05f8-423f-b3c9-f85077369f3d', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('9c31561a-42c5-48a1-8fd2-112872639498', '83685023-05f8-423f-b3c9-f85077369f3d', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');
INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('4a05e5d3-3e78-495b-96a9-06becb0231cd', '83685023-05f8-423f-b3c9-f85077369f3d', '55555555-5555-4555-a555-555555555555', 'Jobdesk Panitia MASTRO', 'Tugas Kepanitiaan MASTRO (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');
-- Total jobdesk MASTRO diinput: 43
