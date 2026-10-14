/*
# Create patients table for CapaciCare

1. New Tables
- `patients`
  - `id` (uuid, primary key, auto-generated)
  - `first_name` (text, not null) — patient's first name
  - `last_name` (text, not null) — patient's last name
  - `date_of_birth` (date, not null) — patient's date of birth
  - `gender` (text, not null) — 'male', 'female', or 'other'
  - `phone` (text) — contact phone number
  - `email` (text) — contact email
  - `diagnosis` (text) — primary diagnosis or condition
  - `care_status` (text, not null, default 'active') — 'active', 'monitoring', 'discharged'
  - `notes` (text) — additional clinical notes
  - `created_at` (timestamptz, default now()) — record creation timestamp
  - `updated_at` (timestamptz, default now()) — last update timestamp

2. Indexes
- Index on `created_at` for sorting recent records
- Index on `care_status` for filtering by status

3. Security
- Enable RLS on `patients`.
- Allow anon + authenticated full CRUD since this is a single-tenant hackathon demo with no sign-in screen.
- Data is intentionally shared/public for the demo.

4. Notes
- This is a single-tenant app with no authentication. All policies use `TO anon, authenticated` so the anon-key frontend client can read and write.
- No user_id column or auth.uid() checks are needed.
*/

CREATE TABLE IF NOT EXISTS patients (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name text NOT NULL,
  last_name text NOT NULL,
  date_of_birth date NOT NULL,
  gender text NOT NULL CHECK (gender IN ('male', 'female', 'other')),
  phone text,
  email text,
  diagnosis text,
  care_status text NOT NULL DEFAULT 'active' CHECK (care_status IN ('active', 'monitoring', 'discharged')),
  notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_patients_created_at ON patients (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_patients_care_status ON patients (care_status);

ALTER TABLE patients ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "anon_select_patients" ON patients;
CREATE POLICY "anon_select_patients"
  ON patients FOR SELECT
  TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "anon_insert_patients" ON patients;
CREATE POLICY "anon_insert_patients"
  ON patients FOR INSERT
  TO anon, authenticated WITH CHECK (true);

DROP POLICY IF EXISTS "anon_update_patients" ON patients;
CREATE POLICY "anon_update_patients"
  ON patients FOR UPDATE
  TO anon, authenticated USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "anon_delete_patients" ON patients;
CREATE POLICY "anon_delete_patients"
  ON patients FOR DELETE
  TO anon, authenticated USING (true);
