-- ====================================================================
-- IMPORT KPI REKAPAN DARI kpi.xlsx KE DATABASE
-- Termasuk Proker, Rapat Proker, Absensi, dan Jobdesk
-- ====================================================================

-- 1. KPI SETTINGS
INSERT INTO public.kpi_settings (id, attendance_weight, jobdesk_weight)
VALUES (1, 0.5, 0.5)
ON CONFLICT (id) DO UPDATE SET attendance_weight = 0.5, jobdesk_weight = 0.5;

-- 2. PROKERS
INSERT INTO public.prokers (id, name, description, status, division_id)
VALUES ('11111111-1111-4111-a111-111111111111', 'HMM Launch & Expose', 'Program kerja HMM Launch & Expose 2026', 'selesai', NULL)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, status = EXCLUDED.status;

INSERT INTO public.prokers (id, name, description, status, division_id)
VALUES ('22222222-2222-4222-a222-222222222222', 'MFT', 'Program kerja Management Futsal Tournament (MFT) 2026', 'selesai', NULL)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, status = EXCLUDED.status;

INSERT INTO public.prokers (id, name, description, status, division_id)
VALUES ('33333333-3333-4333-a333-333333333333', 'MSW', 'Program kerja Management Sport Week (MSW) 2026', 'selesai', NULL)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, status = EXCLUDED.status;

INSERT INTO public.prokers (id, name, description, status, division_id)
VALUES ('44444444-4444-4444-a444-444444444444', 'MRD', 'Program kerja Management Research and Development (MRD) 2026', 'selesai', NULL)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, status = EXCLUDED.status;

INSERT INTO public.prokers (id, name, description, status, division_id)
VALUES ('55555555-5555-4555-a555-555555555555', 'MASTRO', 'Program kerja Management Art & Sport (MASTRO) 2026', 'selesai', NULL)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, status = EXCLUDED.status;

INSERT INTO public.prokers (id, name, description, status, division_id)
VALUES ('66666666-6666-4666-a666-666666666666', 'P3DK', 'Program kerja Pelatihan dan Pengembangan (P3DK) 2026', 'rapat_3', NULL)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, status = EXCLUDED.status;

-- 3. PROKER ASSIGNMENTS (Kepengurusan Proker)
INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'db3644b7-2630-4d7d-90d3-662277139282', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'c8f40504-1863-4924-b791-67a8cacc3525', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '1ed38f3c-a978-4873-9702-fe675765db24', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'a36780d2-be23-4fb5-be80-d7f725f4aa59', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '92191fe9-0cf4-40b1-ba53-f4a7b8a34730', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'ea037f43-4245-4a44-989d-d4f518254844', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'b4633118-1194-47c8-a407-99ca93404b0a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '3d912aac-7e47-4821-8663-4a1d34618c13', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'e7b6c539-6408-4f76-bbaf-b88d701f7291', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '04b5ee3c-705c-4367-8451-791330bde89e', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'a578f256-6dac-425c-ab00-6bea7debd703', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'ae077199-1cbb-44cb-ad81-8f0e8ff2d447', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'f441324b-eec6-4011-969c-492efc8254e5', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '9c31561a-42c5-48a1-8fd2-112872639498', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('11111111-1111-4111-a111-111111111111', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'db3644b7-2630-4d7d-90d3-662277139282', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'c8f40504-1863-4924-b791-67a8cacc3525', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '1ed38f3c-a978-4873-9702-fe675765db24', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'a36780d2-be23-4fb5-be80-d7f725f4aa59', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '92191fe9-0cf4-40b1-ba53-f4a7b8a34730', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'ea037f43-4245-4a44-989d-d4f518254844', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'b4633118-1194-47c8-a407-99ca93404b0a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '3d912aac-7e47-4821-8663-4a1d34618c13', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'e7b6c539-6408-4f76-bbaf-b88d701f7291', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '04b5ee3c-705c-4367-8451-791330bde89e', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'a578f256-6dac-425c-ab00-6bea7debd703', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'ae077199-1cbb-44cb-ad81-8f0e8ff2d447', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'f441324b-eec6-4011-969c-492efc8254e5', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '9c31561a-42c5-48a1-8fd2-112872639498', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('22222222-2222-4222-a222-222222222222', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'db3644b7-2630-4d7d-90d3-662277139282', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'c8f40504-1863-4924-b791-67a8cacc3525', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '1ed38f3c-a978-4873-9702-fe675765db24', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'a36780d2-be23-4fb5-be80-d7f725f4aa59', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '92191fe9-0cf4-40b1-ba53-f4a7b8a34730', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'ea037f43-4245-4a44-989d-d4f518254844', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'b4633118-1194-47c8-a407-99ca93404b0a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '3d912aac-7e47-4821-8663-4a1d34618c13', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'e7b6c539-6408-4f76-bbaf-b88d701f7291', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '04b5ee3c-705c-4367-8451-791330bde89e', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'a578f256-6dac-425c-ab00-6bea7debd703', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'ae077199-1cbb-44cb-ad81-8f0e8ff2d447', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'f441324b-eec6-4011-969c-492efc8254e5', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '9c31561a-42c5-48a1-8fd2-112872639498', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('33333333-3333-4333-a333-333333333333', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'db3644b7-2630-4d7d-90d3-662277139282', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'c8f40504-1863-4924-b791-67a8cacc3525', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '1ed38f3c-a978-4873-9702-fe675765db24', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'a36780d2-be23-4fb5-be80-d7f725f4aa59', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '92191fe9-0cf4-40b1-ba53-f4a7b8a34730', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'ea037f43-4245-4a44-989d-d4f518254844', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'b4633118-1194-47c8-a407-99ca93404b0a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '3d912aac-7e47-4821-8663-4a1d34618c13', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'e7b6c539-6408-4f76-bbaf-b88d701f7291', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '04b5ee3c-705c-4367-8451-791330bde89e', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'a578f256-6dac-425c-ab00-6bea7debd703', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'ae077199-1cbb-44cb-ad81-8f0e8ff2d447', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'f441324b-eec6-4011-969c-492efc8254e5', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '9c31561a-42c5-48a1-8fd2-112872639498', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('44444444-4444-4444-a444-444444444444', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

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

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'db3644b7-2630-4d7d-90d3-662277139282', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'c8f40504-1863-4924-b791-67a8cacc3525', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '1ed38f3c-a978-4873-9702-fe675765db24', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'a36780d2-be23-4fb5-be80-d7f725f4aa59', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '92191fe9-0cf4-40b1-ba53-f4a7b8a34730', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'ea037f43-4245-4a44-989d-d4f518254844', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'b4633118-1194-47c8-a407-99ca93404b0a', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '3d912aac-7e47-4821-8663-4a1d34618c13', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'e7b6c539-6408-4f76-bbaf-b88d701f7291', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '04b5ee3c-705c-4367-8451-791330bde89e', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'a578f256-6dac-425c-ab00-6bea7debd703', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'ae077199-1cbb-44cb-ad81-8f0e8ff2d447', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'f441324b-eec6-4011-969c-492efc8254e5', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '9c31561a-42c5-48a1-8fd2-112872639498', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

INSERT INTO public.proker_assignments (proker_id, profile_id, role_type, seksi_name)
VALUES ('66666666-6666-4666-a666-666666666666', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'anggota', 'Kepanitiaan')
ON CONFLICT (proker_id, profile_id, role_type, seksi_name) DO NOTHING;

-- 4. MEETINGS (Rapat Proker)
INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('11111111-1111-4111-b111-000000000001', '11111111-1111-4111-a111-111111111111', 'Rapat 1 HMM L&E', '2026-02-13', 'rapat_1', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('11111111-1111-4111-b111-000000000002', '11111111-1111-4111-a111-111111111111', 'Rapat 2 HMM L&E', '2026-02-21', 'rapat_2', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('22222222-2222-4222-b222-000000000001', '22222222-2222-4222-a222-222222222222', 'Rapat 1 MFT', '2026-04-09', 'rapat_1', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('22222222-2222-4222-b222-000000000002', '22222222-2222-4222-a222-222222222222', 'Rapat 2 MFT', '2026-05-05', 'rapat_2', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('22222222-2222-4222-b222-000000000003', '22222222-2222-4222-a222-222222222222', 'Rapat 3 MFT', '2026-05-12', 'rapat_3', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('33333333-3333-4333-b333-000000000001', '33333333-3333-4333-a333-333333333333', 'Rapat 1 MSW', '2026-05-29', 'rapat_1', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('33333333-3333-4333-b333-000000000002', '33333333-3333-4333-a333-333333333333', 'Rapat 2 MSW', '2026-08-14', 'rapat_2', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('33333333-3333-4333-b333-000000000003', '33333333-3333-4333-a333-333333333333', 'Rapat 3 MSW', '2026-08-28', 'rapat_3', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('44444444-4444-4444-b444-000000000001', '44444444-4444-4444-a444-444444444444', 'Rapat 1 MRD', '2026-08-19', 'rapat_1', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('44444444-4444-4444-b444-000000000002', '44444444-4444-4444-a444-444444444444', 'Rapat 2 MRD', '2026-09-03', 'rapat_2', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('44444444-4444-4444-b444-000000000003', '44444444-4444-4444-a444-444444444444', 'Rapat 3 MRD', '2026-09-23', 'rapat_3', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('55555555-5555-4555-b555-000000000001', '55555555-5555-4555-a555-555555555555', 'Rapat 1 MASTRO', '2026-08-26', 'rapat_1', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('55555555-5555-4555-b555-000000000002', '55555555-5555-4555-a555-555555555555', 'Rapat 2 MASTRO', '2026-09-16', 'rapat_2', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('55555555-5555-4555-b555-000000000003', '55555555-5555-4555-a555-555555555555', 'Rapat 3 MASTRO', '2026-10-02', 'rapat_3', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('66666666-6666-4666-b666-000000000001', '66666666-6666-4666-a666-666666666666', 'Rapat 1 P3DK', '2026-10-12', 'rapat_1', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

INSERT INTO public.meetings (id, proker_id, title, meeting_date, meeting_type, start_time, grace_minutes, division_id)
VALUES ('66666666-6666-4666-b666-000000000002', '66666666-6666-4666-a666-666666666666', 'Rapat 2 P3DK', '2026-10-30', 'rapat_2', '13:00', 15, NULL)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, meeting_date = EXCLUDED.meeting_date, meeting_type = EXCLUDED.meeting_type;

-- 5. ATTENDANCE (Absensi Rapat)
INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'ae077199-1cbb-44cb-ad81-8f0e8ff2d447', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000001', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-02-13 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'db3644b7-2630-4d7d-90d3-662277139282', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '1ed38f3c-a978-4873-9702-fe675765db24', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'a36780d2-be23-4fb5-be80-d7f725f4aa59', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'ea037f43-4245-4a44-989d-d4f518254844', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '3d912aac-7e47-4821-8663-4a1d34618c13', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'ae077199-1cbb-44cb-ad81-8f0e8ff2d447', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('11111111-1111-4111-b111-000000000002', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-02-21 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'db3644b7-2630-4d7d-90d3-662277139282', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '1ed38f3c-a978-4873-9702-fe675765db24', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'a36780d2-be23-4fb5-be80-d7f725f4aa59', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '3d912aac-7e47-4821-8663-4a1d34618c13', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000001', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-04-09 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'db3644b7-2630-4d7d-90d3-662277139282', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'a36780d2-be23-4fb5-be80-d7f725f4aa59', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '92191fe9-0cf4-40b1-ba53-f4a7b8a34730', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '3d912aac-7e47-4821-8663-4a1d34618c13', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000002', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'hadir', '2026-05-05 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'db3644b7-2630-4d7d-90d3-662277139282', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'a36780d2-be23-4fb5-be80-d7f725f4aa59', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '3d912aac-7e47-4821-8663-4a1d34618c13', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'ae077199-1cbb-44cb-ad81-8f0e8ff2d447', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('22222222-2222-4222-b222-000000000003', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-05-12 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'db3644b7-2630-4d7d-90d3-662277139282', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '1ed38f3c-a978-4873-9702-fe675765db24', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '3d912aac-7e47-4821-8663-4a1d34618c13', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000001', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-05-29 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', '1ed38f3c-a978-4873-9702-fe675765db24', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', 'ae077199-1cbb-44cb-ad81-8f0e8ff2d447', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000002', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-08-14 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'ae077199-1cbb-44cb-ad81-8f0e8ff2d447', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('33333333-3333-4333-b333-000000000003', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-08-28 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', 'db3644b7-2630-4d7d-90d3-662277139282', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000001', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-08-19 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'db3644b7-2630-4d7d-90d3-662277139282', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'a36780d2-be23-4fb5-be80-d7f725f4aa59', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '3d912aac-7e47-4821-8663-4a1d34618c13', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000002', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-09-03 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'db3644b7-2630-4d7d-90d3-662277139282', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '1ed38f3c-a978-4873-9702-fe675765db24', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('44444444-4444-4444-b444-000000000003', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-09-23 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'db3644b7-2630-4d7d-90d3-662277139282', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '3d912aac-7e47-4821-8663-4a1d34618c13', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'c407c005-2642-4139-ba5d-6b24d4e39449', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000001', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'hadir', '2026-08-26 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '5a066f24-4089-4022-8dea-7a6fb3f32174', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '1ed38f3c-a978-4873-9702-fe675765db24', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'd2037e3f-61a1-4ed2-99a4-5dd73539f084', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'd772d3c7-c28b-47a0-a575-896e742ec717', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '0cc11ce7-a0cb-49ff-82e4-f06daa71854a', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'aa998746-e8cf-4a02-88dd-4899254b27a4', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '3d912aac-7e47-4821-8663-4a1d34618c13', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'e4a62663-1e0a-4571-b8f2-d1e078e48334', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000002', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'hadir', '2026-09-16 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '0a5f0248-db8b-467c-9d14-850675d6e9e2', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'c8f40504-1863-4924-b791-67a8cacc3525', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '1ed38f3c-a978-4873-9702-fe675765db24', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'b6c3926a-7d76-40e3-8c00-53672076dcc0', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '1382f21f-b6fa-406c-af42-c05a5a78e184', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '64aa81ea-f3a1-4805-bd33-6dd524644972', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '73a2ac21-bac4-4818-bc89-87e31e6d6d6c', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '3a5ddc60-0700-4225-b13c-275b4b9d1cb7', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '2e3f0f89-8753-40ea-ae5c-e74421b3dcba', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'a5221008-5abc-4d6a-9f6b-21edea65e0ed', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '8a89e2b5-154c-407f-8109-c9b6b155cda1', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'b4633118-1194-47c8-a407-99ca93404b0a', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '4375c1cd-ff62-4884-b83b-7fd667fbf228', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '04b5ee3c-705c-4367-8451-791330bde89e', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'c86db4ac-11ff-4268-b9b3-500a57339036', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'a578f256-6dac-425c-ab00-6bea7debd703', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'f441324b-eec6-4011-969c-492efc8254e5', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', 'bc7df05d-d8d9-46cc-9a01-c51cede78340', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '9c31561a-42c5-48a1-8fd2-112872639498', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

INSERT INTO public.attendance (meeting_id, profile_id, status, tap_time)
VALUES ('55555555-5555-4555-b555-000000000003', '4a05e5d3-3e78-495b-96a9-06becb0231cd', 'hadir', '2026-10-02 13:00:00+07')
ON CONFLICT (meeting_id, profile_id) DO UPDATE SET status = 'hadir';

-- 6. JOBDESKS (Jobdesk Anggota & Proker)
INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('f79431e9-3727-4c4f-93c6-6d633aed7a8f', 'f74fc7e9-b110-4c0f-aa45-17a5accfd5ac', 'Jobdesk BPH & Pengawasan Organisasi', 'Jobdesk Pengurus Harian HMM (Selesai 100%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('3784f6c1-a8f0-4b54-9310-42f292dbf8ea', 'f74fc7e9-b110-4c0f-aa45-17a5accfd5ac', 'Jobdesk BPH & Pengawasan Organisasi', 'Jobdesk Pengurus Harian HMM (Selesai 100%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('b19635ee-bef2-43ea-b2b9-1a20bd72d276', 'f74fc7e9-b110-4c0f-aa45-17a5accfd5ac', 'Jobdesk BPH & Pengawasan Organisasi', 'Jobdesk Pengurus Harian HMM (Selesai 100%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('0a5f0248-db8b-467c-9d14-850675d6e9e2', 'f74fc7e9-b110-4c0f-aa45-17a5accfd5ac', 'Jobdesk BPH & Pengawasan Organisasi', 'Jobdesk Pengurus Harian HMM (Selesai 100%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('db3644b7-2630-4d7d-90d3-662277139282', 'f74fc7e9-b110-4c0f-aa45-17a5accfd5ac', 'Jobdesk BPH & Pengawasan Organisasi', 'Jobdesk Pengurus Harian HMM (Selesai 100%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('aa4b3ee6-6a6f-43fd-acb6-06ee0b88444d', 'f74fc7e9-b110-4c0f-aa45-17a5accfd5ac', 'Jobdesk BPH & Pengawasan Organisasi', 'Jobdesk Pengurus Harian HMM (Selesai 100%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('c8f40504-1863-4924-b791-67a8cacc3525', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c8f40504-1863-4924-b791-67a8cacc3525', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c8f40504-1863-4924-b791-67a8cacc3525', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c8f40504-1863-4924-b791-67a8cacc3525', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c8f40504-1863-4924-b791-67a8cacc3525', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('5a066f24-4089-4022-8dea-7a6fb3f32174', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5a066f24-4089-4022-8dea-7a6fb3f32174', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5a066f24-4089-4022-8dea-7a6fb3f32174', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5a066f24-4089-4022-8dea-7a6fb3f32174', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5a066f24-4089-4022-8dea-7a6fb3f32174', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('1ed38f3c-a978-4873-9702-fe675765db24', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 60.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1ed38f3c-a978-4873-9702-fe675765db24', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1ed38f3c-a978-4873-9702-fe675765db24', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1ed38f3c-a978-4873-9702-fe675765db24', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1ed38f3c-a978-4873-9702-fe675765db24', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 40.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('b6c3926a-7d76-40e3-8c00-53672076dcc0', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 95.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('b6c3926a-7d76-40e3-8c00-53672076dcc0', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('b6c3926a-7d76-40e3-8c00-53672076dcc0', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('b6c3926a-7d76-40e3-8c00-53672076dcc0', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('b6c3926a-7d76-40e3-8c00-53672076dcc0', 'c92d1e57-84c7-4fbd-b3d4-35fb5523b71c', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('1382f21f-b6fa-406c-af42-c05a5a78e184', '76089c71-316d-436c-9bfe-4a7a01e22ed7', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1382f21f-b6fa-406c-af42-c05a5a78e184', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1382f21f-b6fa-406c-af42-c05a5a78e184', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1382f21f-b6fa-406c-af42-c05a5a78e184', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1382f21f-b6fa-406c-af42-c05a5a78e184', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 70.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('a36780d2-be23-4fb5-be80-d7f725f4aa59', '76089c71-316d-436c-9bfe-4a7a01e22ed7', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 0.0%)', 'ditugaskan', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a36780d2-be23-4fb5-be80-d7f725f4aa59', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a36780d2-be23-4fb5-be80-d7f725f4aa59', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 50.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a36780d2-be23-4fb5-be80-d7f725f4aa59', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a36780d2-be23-4fb5-be80-d7f725f4aa59', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('92191fe9-0cf4-40b1-ba53-f4a7b8a34730', '76089c71-316d-436c-9bfe-4a7a01e22ed7', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 0.0%)', 'ditugaskan', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('92191fe9-0cf4-40b1-ba53-f4a7b8a34730', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('92191fe9-0cf4-40b1-ba53-f4a7b8a34730', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 60.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('92191fe9-0cf4-40b1-ba53-f4a7b8a34730', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('92191fe9-0cf4-40b1-ba53-f4a7b8a34730', '76089c71-316d-436c-9bfe-4a7a01e22ed7', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 20.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', '7c323d98-bdb2-4aae-b121-a776045fcc6f', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5043ae3a-bd4a-49e5-9c1c-cfe7b8cbb001', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('64aa81ea-f3a1-4805-bd33-6dd524644972', '7c323d98-bdb2-4aae-b121-a776045fcc6f', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('64aa81ea-f3a1-4805-bd33-6dd524644972', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('64aa81ea-f3a1-4805-bd33-6dd524644972', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('64aa81ea-f3a1-4805-bd33-6dd524644972', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('64aa81ea-f3a1-4805-bd33-6dd524644972', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('73a2ac21-bac4-4818-bc89-87e31e6d6d6c', '7c323d98-bdb2-4aae-b121-a776045fcc6f', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('73a2ac21-bac4-4818-bc89-87e31e6d6d6c', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('73a2ac21-bac4-4818-bc89-87e31e6d6d6c', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('73a2ac21-bac4-4818-bc89-87e31e6d6d6c', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('73a2ac21-bac4-4818-bc89-87e31e6d6d6c', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('3a5ddc60-0700-4225-b13c-275b4b9d1cb7', '7c323d98-bdb2-4aae-b121-a776045fcc6f', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3a5ddc60-0700-4225-b13c-275b4b9d1cb7', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3a5ddc60-0700-4225-b13c-275b4b9d1cb7', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3a5ddc60-0700-4225-b13c-275b4b9d1cb7', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3a5ddc60-0700-4225-b13c-275b4b9d1cb7', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('d2037e3f-61a1-4ed2-99a4-5dd73539f084', '7c323d98-bdb2-4aae-b121-a776045fcc6f', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('d2037e3f-61a1-4ed2-99a4-5dd73539f084', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('d2037e3f-61a1-4ed2-99a4-5dd73539f084', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('d2037e3f-61a1-4ed2-99a4-5dd73539f084', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('d2037e3f-61a1-4ed2-99a4-5dd73539f084', '7c323d98-bdb2-4aae-b121-a776045fcc6f', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('2e3f0f89-8753-40ea-ae5c-e74421b3dcba', '1a49a606-a890-4e97-b85c-ae630f455602', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 93.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('2e3f0f89-8753-40ea-ae5c-e74421b3dcba', '1a49a606-a890-4e97-b85c-ae630f455602', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('2e3f0f89-8753-40ea-ae5c-e74421b3dcba', '1a49a606-a890-4e97-b85c-ae630f455602', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('2e3f0f89-8753-40ea-ae5c-e74421b3dcba', '1a49a606-a890-4e97-b85c-ae630f455602', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('2e3f0f89-8753-40ea-ae5c-e74421b3dcba', '1a49a606-a890-4e97-b85c-ae630f455602', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('ea037f43-4245-4a44-989d-d4f518254844', '1a49a606-a890-4e97-b85c-ae630f455602', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 70.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('ea037f43-4245-4a44-989d-d4f518254844', '1a49a606-a890-4e97-b85c-ae630f455602', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('ea037f43-4245-4a44-989d-d4f518254844', '1a49a606-a890-4e97-b85c-ae630f455602', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('ea037f43-4245-4a44-989d-d4f518254844', '1a49a606-a890-4e97-b85c-ae630f455602', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('ea037f43-4245-4a44-989d-d4f518254844', '1a49a606-a890-4e97-b85c-ae630f455602', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('a5221008-5abc-4d6a-9f6b-21edea65e0ed', '1a49a606-a890-4e97-b85c-ae630f455602', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a5221008-5abc-4d6a-9f6b-21edea65e0ed', '1a49a606-a890-4e97-b85c-ae630f455602', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a5221008-5abc-4d6a-9f6b-21edea65e0ed', '1a49a606-a890-4e97-b85c-ae630f455602', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a5221008-5abc-4d6a-9f6b-21edea65e0ed', '1a49a606-a890-4e97-b85c-ae630f455602', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a5221008-5abc-4d6a-9f6b-21edea65e0ed', '1a49a606-a890-4e97-b85c-ae630f455602', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('8a89e2b5-154c-407f-8109-c9b6b155cda1', '1a49a606-a890-4e97-b85c-ae630f455602', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('8a89e2b5-154c-407f-8109-c9b6b155cda1', '1a49a606-a890-4e97-b85c-ae630f455602', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('8a89e2b5-154c-407f-8109-c9b6b155cda1', '1a49a606-a890-4e97-b85c-ae630f455602', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('8a89e2b5-154c-407f-8109-c9b6b155cda1', '1a49a606-a890-4e97-b85c-ae630f455602', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('8a89e2b5-154c-407f-8109-c9b6b155cda1', '1a49a606-a890-4e97-b85c-ae630f455602', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('d772d3c7-c28b-47a0-a575-896e742ec717', '1a49a606-a890-4e97-b85c-ae630f455602', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 80.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('d772d3c7-c28b-47a0-a575-896e742ec717', '1a49a606-a890-4e97-b85c-ae630f455602', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('d772d3c7-c28b-47a0-a575-896e742ec717', '1a49a606-a890-4e97-b85c-ae630f455602', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 75.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('d772d3c7-c28b-47a0-a575-896e742ec717', '1a49a606-a890-4e97-b85c-ae630f455602', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 75.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('d772d3c7-c28b-47a0-a575-896e742ec717', '1a49a606-a890-4e97-b85c-ae630f455602', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 40.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('0cc11ce7-a0cb-49ff-82e4-f06daa71854a', '1a49a606-a890-4e97-b85c-ae630f455602', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 85.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('0cc11ce7-a0cb-49ff-82e4-f06daa71854a', '1a49a606-a890-4e97-b85c-ae630f455602', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('0cc11ce7-a0cb-49ff-82e4-f06daa71854a', '1a49a606-a890-4e97-b85c-ae630f455602', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('0cc11ce7-a0cb-49ff-82e4-f06daa71854a', '1a49a606-a890-4e97-b85c-ae630f455602', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('0cc11ce7-a0cb-49ff-82e4-f06daa71854a', '1a49a606-a890-4e97-b85c-ae630f455602', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('b4633118-1194-47c8-a407-99ca93404b0a', 'f058be35-6d97-4bcd-abe9-78737149728c', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('b4633118-1194-47c8-a407-99ca93404b0a', 'f058be35-6d97-4bcd-abe9-78737149728c', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('b4633118-1194-47c8-a407-99ca93404b0a', 'f058be35-6d97-4bcd-abe9-78737149728c', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('b4633118-1194-47c8-a407-99ca93404b0a', 'f058be35-6d97-4bcd-abe9-78737149728c', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('b4633118-1194-47c8-a407-99ca93404b0a', 'f058be35-6d97-4bcd-abe9-78737149728c', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'f058be35-6d97-4bcd-abe9-78737149728c', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 75.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'f058be35-6d97-4bcd-abe9-78737149728c', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 70.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'f058be35-6d97-4bcd-abe9-78737149728c', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'f058be35-6d97-4bcd-abe9-78737149728c', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('0f14cf15-49bb-4e07-b384-7e319e0c02fb', 'f058be35-6d97-4bcd-abe9-78737149728c', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 50.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('aa998746-e8cf-4a02-88dd-4899254b27a4', 'f058be35-6d97-4bcd-abe9-78737149728c', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('aa998746-e8cf-4a02-88dd-4899254b27a4', 'f058be35-6d97-4bcd-abe9-78737149728c', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('aa998746-e8cf-4a02-88dd-4899254b27a4', 'f058be35-6d97-4bcd-abe9-78737149728c', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('aa998746-e8cf-4a02-88dd-4899254b27a4', 'f058be35-6d97-4bcd-abe9-78737149728c', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('aa998746-e8cf-4a02-88dd-4899254b27a4', 'f058be35-6d97-4bcd-abe9-78737149728c', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'f058be35-6d97-4bcd-abe9-78737149728c', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'f058be35-6d97-4bcd-abe9-78737149728c', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'f058be35-6d97-4bcd-abe9-78737149728c', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'f058be35-6d97-4bcd-abe9-78737149728c', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 50.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3eb5a277-8255-405b-aaed-0b1b3ccf6022', 'f058be35-6d97-4bcd-abe9-78737149728c', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'f058be35-6d97-4bcd-abe9-78737149728c', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'f058be35-6d97-4bcd-abe9-78737149728c', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'f058be35-6d97-4bcd-abe9-78737149728c', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'f058be35-6d97-4bcd-abe9-78737149728c', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('30cac614-26c9-4ebc-9d0f-e2d641ede8a8', 'f058be35-6d97-4bcd-abe9-78737149728c', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('4375c1cd-ff62-4884-b83b-7fd667fbf228', 'f058be35-6d97-4bcd-abe9-78737149728c', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 95.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('4375c1cd-ff62-4884-b83b-7fd667fbf228', 'f058be35-6d97-4bcd-abe9-78737149728c', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('4375c1cd-ff62-4884-b83b-7fd667fbf228', 'f058be35-6d97-4bcd-abe9-78737149728c', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('4375c1cd-ff62-4884-b83b-7fd667fbf228', 'f058be35-6d97-4bcd-abe9-78737149728c', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('4375c1cd-ff62-4884-b83b-7fd667fbf228', 'f058be35-6d97-4bcd-abe9-78737149728c', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('3d912aac-7e47-4821-8663-4a1d34618c13', 'f058be35-6d97-4bcd-abe9-78737149728c', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3d912aac-7e47-4821-8663-4a1d34618c13', 'f058be35-6d97-4bcd-abe9-78737149728c', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3d912aac-7e47-4821-8663-4a1d34618c13', 'f058be35-6d97-4bcd-abe9-78737149728c', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3d912aac-7e47-4821-8663-4a1d34618c13', 'f058be35-6d97-4bcd-abe9-78737149728c', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3d912aac-7e47-4821-8663-4a1d34618c13', 'f058be35-6d97-4bcd-abe9-78737149728c', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'fce1d1e0-ad84-4246-9627-6dc444265dee', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('8e496b12-108b-4d4b-ac9e-80ff89545cfd', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'fce1d1e0-ad84-4246-9627-6dc444265dee', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 0.0%)', 'ditugaskan', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c6cde29d-d279-4a61-a8c6-5f4dc079cc21', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 60.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 50.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('1d16a631-e05b-4b0a-bd74-3207e4e294c8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('e7b6c539-6408-4f76-bbaf-b88d701f7291', 'fce1d1e0-ad84-4246-9627-6dc444265dee', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 80.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('e7b6c539-6408-4f76-bbaf-b88d701f7291', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('e7b6c539-6408-4f76-bbaf-b88d701f7291', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('e7b6c539-6408-4f76-bbaf-b88d701f7291', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('e7b6c539-6408-4f76-bbaf-b88d701f7291', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 15.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 20.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 50.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 50.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('6b4f103a-1275-4d06-9363-b35ff54dd5b8', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'fce1d1e0-ad84-4246-9627-6dc444265dee', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 80.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 75.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('7818adc0-5bf8-4d68-8143-cd6315e64cf6', 'fce1d1e0-ad84-4246-9627-6dc444265dee', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('04b5ee3c-705c-4367-8451-791330bde89e', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('04b5ee3c-705c-4367-8451-791330bde89e', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('04b5ee3c-705c-4367-8451-791330bde89e', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 75.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('04b5ee3c-705c-4367-8451-791330bde89e', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('04b5ee3c-705c-4367-8451-791330bde89e', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('c86db4ac-11ff-4268-b9b3-500a57339036', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c86db4ac-11ff-4268-b9b3-500a57339036', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c86db4ac-11ff-4268-b9b3-500a57339036', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c86db4ac-11ff-4268-b9b3-500a57339036', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c86db4ac-11ff-4268-b9b3-500a57339036', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 80.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 75.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('5fa38d1f-3afb-47c9-b4fb-18c29f4e181b', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('e4a62663-1e0a-4571-b8f2-d1e078e48334', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('e4a62663-1e0a-4571-b8f2-d1e078e48334', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('e4a62663-1e0a-4571-b8f2-d1e078e48334', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('e4a62663-1e0a-4571-b8f2-d1e078e48334', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('e4a62663-1e0a-4571-b8f2-d1e078e48334', 'a1eb2ca6-6df1-4d8c-b3d3-09dab6ae18e4', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('a578f256-6dac-425c-ab00-6bea7debd703', '83685023-05f8-423f-b3c9-f85077369f3d', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a578f256-6dac-425c-ab00-6bea7debd703', '83685023-05f8-423f-b3c9-f85077369f3d', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a578f256-6dac-425c-ab00-6bea7debd703', '83685023-05f8-423f-b3c9-f85077369f3d', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a578f256-6dac-425c-ab00-6bea7debd703', '83685023-05f8-423f-b3c9-f85077369f3d', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('a578f256-6dac-425c-ab00-6bea7debd703', '83685023-05f8-423f-b3c9-f85077369f3d', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 30.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('c407c005-2642-4139-ba5d-6b24d4e39449', '83685023-05f8-423f-b3c9-f85077369f3d', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c407c005-2642-4139-ba5d-6b24d4e39449', '83685023-05f8-423f-b3c9-f85077369f3d', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c407c005-2642-4139-ba5d-6b24d4e39449', '83685023-05f8-423f-b3c9-f85077369f3d', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c407c005-2642-4139-ba5d-6b24d4e39449', '83685023-05f8-423f-b3c9-f85077369f3d', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 75.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('c407c005-2642-4139-ba5d-6b24d4e39449', '83685023-05f8-423f-b3c9-f85077369f3d', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('ae077199-1cbb-44cb-ad81-8f0e8ff2d447', '83685023-05f8-423f-b3c9-f85077369f3d', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 80.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('ae077199-1cbb-44cb-ad81-8f0e8ff2d447', '83685023-05f8-423f-b3c9-f85077369f3d', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('ae077199-1cbb-44cb-ad81-8f0e8ff2d447', '83685023-05f8-423f-b3c9-f85077369f3d', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('ae077199-1cbb-44cb-ad81-8f0e8ff2d447', '83685023-05f8-423f-b3c9-f85077369f3d', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 60.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('ae077199-1cbb-44cb-ad81-8f0e8ff2d447', '83685023-05f8-423f-b3c9-f85077369f3d', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 70.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('f441324b-eec6-4011-969c-492efc8254e5', '83685023-05f8-423f-b3c9-f85077369f3d', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('f441324b-eec6-4011-969c-492efc8254e5', '83685023-05f8-423f-b3c9-f85077369f3d', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('f441324b-eec6-4011-969c-492efc8254e5', '83685023-05f8-423f-b3c9-f85077369f3d', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('f441324b-eec6-4011-969c-492efc8254e5', '83685023-05f8-423f-b3c9-f85077369f3d', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('f441324b-eec6-4011-969c-492efc8254e5', '83685023-05f8-423f-b3c9-f85077369f3d', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', '83685023-05f8-423f-b3c9-f85077369f3d', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', '83685023-05f8-423f-b3c9-f85077369f3d', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', '83685023-05f8-423f-b3c9-f85077369f3d', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', '83685023-05f8-423f-b3c9-f85077369f3d', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('3cc8d2dc-5e25-445a-8927-2ef4bbacc3d0', '83685023-05f8-423f-b3c9-f85077369f3d', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 80.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('bc7df05d-d8d9-46cc-9a01-c51cede78340', '83685023-05f8-423f-b3c9-f85077369f3d', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 90.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('bc7df05d-d8d9-46cc-9a01-c51cede78340', '83685023-05f8-423f-b3c9-f85077369f3d', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 90.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('bc7df05d-d8d9-46cc-9a01-c51cede78340', '83685023-05f8-423f-b3c9-f85077369f3d', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('bc7df05d-d8d9-46cc-9a01-c51cede78340', '83685023-05f8-423f-b3c9-f85077369f3d', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('bc7df05d-d8d9-46cc-9a01-c51cede78340', '83685023-05f8-423f-b3c9-f85077369f3d', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('9c31561a-42c5-48a1-8fd2-112872639498', '83685023-05f8-423f-b3c9-f85077369f3d', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 95.0%)', 'disetujui', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('9c31561a-42c5-48a1-8fd2-112872639498', '83685023-05f8-423f-b3c9-f85077369f3d', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('9c31561a-42c5-48a1-8fd2-112872639498', '83685023-05f8-423f-b3c9-f85077369f3d', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('9c31561a-42c5-48a1-8fd2-112872639498', '83685023-05f8-423f-b3c9-f85077369f3d', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('9c31561a-42c5-48a1-8fd2-112872639498', '83685023-05f8-423f-b3c9-f85077369f3d', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 100.0%)', 'disetujui', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, title, description, status, timing)
VALUES ('4a05e5d3-3e78-495b-96a9-06becb0231cd', '83685023-05f8-423f-b3c9-f85077369f3d', 'Jobdesk Program Kerja Divisi', 'Jobdesk Divisi Internal (Nilai: 0.0%)', 'ditugaskan', 'Selama Periode');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('4a05e5d3-3e78-495b-96a9-06becb0231cd', '83685023-05f8-423f-b3c9-f85077369f3d', '11111111-1111-4111-a111-111111111111', 'Jobdesk Panitia HMM Launch & Expose', 'Tugas Kepanitiaan HMM Launch & Expose (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('4a05e5d3-3e78-495b-96a9-06becb0231cd', '83685023-05f8-423f-b3c9-f85077369f3d', '22222222-2222-4222-a222-222222222222', 'Jobdesk Panitia MFT', 'Tugas Kepanitiaan MFT (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('4a05e5d3-3e78-495b-96a9-06becb0231cd', '83685023-05f8-423f-b3c9-f85077369f3d', '33333333-3333-4333-a333-333333333333', 'Jobdesk Panitia MSW', 'Tugas Kepanitiaan MSW (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');

INSERT INTO public.jobdesks (profile_id, division_id, proker_id, title, description, status, timing)
VALUES ('4a05e5d3-3e78-495b-96a9-06becb0231cd', '83685023-05f8-423f-b3c9-f85077369f3d', '44444444-4444-4444-a444-444444444444', 'Jobdesk Panitia MRD', 'Tugas Kepanitiaan MRD (Nilai: 0.0%)', 'ditugaskan', 'Sebelum Acara');


-- 7. UPDATE CALCULATE_KPI FUNCTION (Robust KPI Calculation)
CREATE OR REPLACE FUNCTION public.calculate_kpi(_profile_id uuid)
RETURNS jsonb LANGUAGE plpgsql STABLE SECURITY DEFINER SET search_path = public
AS $$
DECLARE
  _div uuid;
  _total_meetings int := 0;
  _attended int := 0;
  _total_jobs int := 0;
  _approved int := 0;
  _att_pct numeric := 0;
  _job_pct numeric := 0;
  _w_att numeric := 0.5;
  _w_job numeric := 0.5;
BEGIN
  SELECT division_id INTO _div FROM public.profiles WHERE id = _profile_id;
  
  -- Ambil bobot KPI dengan default 0.5 jika kosong
  SELECT COALESCE(attendance_weight, 0.5), COALESCE(jobdesk_weight, 0.5) 
    INTO _w_att, _w_job 
    FROM public.kpi_settings WHERE id = 1;
    
  IF _w_att IS NULL THEN _w_att := 0.5; END IF;
  IF _w_job IS NULL THEN _w_job := 0.5; END IF;

  -- 1. Hitung total rapat yang HARUS dihadiri
  SELECT count(*) INTO _total_meetings FROM public.meetings m
    WHERE m.division_id IS NULL 
       OR m.division_id = _div
       OR m.proker_id IN (
            SELECT proker_id FROM public.proker_assignments WHERE profile_id = _profile_id
       );

  -- 2. Hitung jumlah kehadiran aktual
  SELECT count(*) INTO _attended FROM public.attendance
    WHERE profile_id = _profile_id;
    
  -- Persentase kehadiran (Dibatasi maksimal 100%)
  IF _total_meetings > 0 THEN 
    _att_pct := LEAST((_attended::numeric / _total_meetings) * 100.0, 100.0); 
  END IF;

  -- 3. Hitung jobdesk
  SELECT count(*) INTO _total_jobs FROM public.jobdesks WHERE profile_id = _profile_id;
  SELECT count(*) INTO _approved FROM public.jobdesks WHERE profile_id = _profile_id AND status = 'disetujui';
  
  -- Persentase jobdesk (Dibatasi maksimal 100%)
  IF _total_jobs > 0 THEN 
    _job_pct := LEAST((_approved::numeric / _total_jobs) * 100.0, 100.0); 
  END IF;

  RETURN jsonb_build_object(
    'attendance_pct', round(_att_pct, 2),
    'jobdesk_pct', round(_job_pct, 2),
    'total_meetings', _total_meetings,
    'attended', _attended,
    'total_jobs', _total_jobs,
    'approved_jobs', _approved,
    'kpi_score', round((_att_pct * _w_att) + (_job_pct * _w_job), 2)
  );
END;
$$;
GRANT EXECUTE ON FUNCTION public.calculate_kpi(uuid) TO authenticated;
GRANT EXECUTE ON FUNCTION public.calculate_kpi(uuid) TO anon;
