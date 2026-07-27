# Sistem KPI HMM FEB-UNPAK

Aplikasi web internal untuk mengelola KPI anggota Himpunan Mahasiswa Manajemen berbasis kehadiran rapat (via kartu RFID) dan jobdesk.

## Stack

- Frontend: TanStack Start + React + Tailwind + shadcn (sudah tersedia)
- Backend: **Lovable Cloud** (database Postgres, Auth email/password, Storage, RLS) — perlu diaktifkan
- Chart: recharts

## Roles & Akses

4 role via tabel `user_roles` + enum `app_role`:


| Role       | Akses                                                                                    |
| ---------- | ---------------------------------------------------------------------------------------- |
| `bph`      | Read-only + export semua divisi                                                          |
| `hr_admin` | Full: kelola absensi, verifikasi jobdesk, atur bobot KPI semua divisi, manajemen anggota |
| `kadiv`    | Kelola anggota divisinya sendiri (approve jobdesk, rekap kehadiran)                      |
| `anggota`  | Lihat KPI sendiri + upload jobdesk                                                       |


RLS enforce via security definer function `has_role()` dan `get_user_division()` untuk cegah rekursi.

## Skema Database

**divisions** (seed 8 divisi): `id`, `name`, `code`

**profiles**: `id (auth.users.id)`, `full_name`, `npm`, `division_id`, `jabatan`, `id_kartu` (unique, nullable), `avatar_url`

**user_roles**: `user_id`, `role`, `division_id` (nullable, untuk kadiv)

**meetings**: `id`, `title`, `meeting_date`, `start_time`, `end_time` (opsional untuk telat), `division_id` (nullable = rapat umum), `created_by`

**attendance**: `id`, `meeting_id`, `profile_id`, `tap_time`, `status` (hadir/telat), unique (meeting, profile)

**jobdesks**: `id`, `profile_id`, `division_id`, `title`, `description`, `file_url`, `file_name`, `deadline`, `status` (diajukan/disetujui/ditolak), `reviewed_by`, `reviewed_at`, `review_note`

**kpi_settings**: singleton row — `attendance_weight` (default 0.5), `jobdesk_weight` (default 0.5), `updated_by`

**kpi_scores**: view/materialized computed per periode dari attendance% + jobdesk approved%

Storage bucket: `jobdesk-files` (private, RLS by profile ownership + kadiv/hr akses divisi).

## Halaman

1. `/auth` — login (email/password) + signup pertama kali
2. `/` — landing, redirect ke `/dashboard` jika login
3. `/_authenticated/dashboard` — dashboard KPI (tampilan berbeda per role)
4. `/_authenticated/absensi` — halaman tap RFID (auto-focus input, dropdown pilih meeting, notifikasi 2 detik dengan nama+foto). HR admin only.
5. `/_authenticated/meetings` — CRUD rapat (HR admin + Kadiv untuk divisinya)
6. `/_authenticated/jobdesk` — anggota upload; kadiv/HR approve/tolak
7. `/_authenticated/anggota` — manajemen anggota + registrasi kartu RFID (mode tap-untuk-daftar). HR admin + BPH (BPH read-only).
8. `/_authenticated/pengaturan-kpi` — atur bobot KPI. HR admin only.
9. `/_authenticated/rekap` — rekap + export CSV per divisi. HR admin + BPH.

## Perhitungan KPI

```
attendance_pct = hadir / total_meetings_relevan
jobdesk_pct    = approved / total_jobdesks
kpi_score      = attendance_pct * w_attendance + jobdesk_pct * w_jobdesk
```

Dihitung on-the-fly via SQL function `calculate_kpi(profile_id, from_date, to_date)`.

## Fitur RFID (halaman /absensi)

- Dropdown meeting aktif hari ini
- `<input autoFocus>` besar, `onKeyDown Enter` → RPC `record_attendance(meeting_id, id_kartu)` → return profile info → toast dengan foto 2 detik → clear + refocus
- RPC handle: kartu tidak terdaftar → error message; duplikat tap → info "sudah absen"
- Status hadir/telat otomatis berdasarkan `meeting.start_time` + grace period 15 menit

## Registrasi Kartu (mode tap-untuk-daftar)

Di halaman anggota: pilih user → klik "Daftarkan kartu" → modal dengan input auto-focus → tap kartu → simpan ke `profiles.id_kartu`.

## Design System

- Warna primer maroon/gold (identitas HMM FEB) — didefinisikan sebagai oklch tokens di `src/styles.css`
- Font: Plus Jakarta Sans (heading) + Inter (body)
- Layout: sidebar kiri dengan navigasi berdasarkan role, header dengan profile

## Detail teknis

- Server functions (`createServerFn` + `requireSupabaseAuth`) untuk: calculate_kpi, export CSV, register card, approve jobdesk
- Absensi via `supabase.rpc()` langsung dari client (RLS + security definer function di server)
- Upload jobdesk via `supabase.storage` dari browser
- Auto-create profile via trigger `on_auth_user_created`; role default `anggota` — HR admin promote via UI
- Seed: 8 divisi + kpi_settings default. User pertama harus di-promote manual jadi hr_admin via SQL (akan saya sediakan instruksi).

## Yang akan dibangun berurutan

1. Enable Lovable Cloud
2. Migration: enum, tabel, RLS, trigger, functions, seed divisi
3. Storage bucket + policies
4. Design system + layout + auth pages
5. Halaman fungsional (dashboard, absensi, jobdesk, anggota, meetings, pengaturan, rekap)
6. Verifikasi build + smoke test

Setelah plan disetujui, saya mulai eksekusi. User pertama yang signup akan saya beri instruksi cara promote ke `hr_admin` (butuh SQL manual sekali di awal).