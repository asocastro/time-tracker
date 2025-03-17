/*
  # Time Tracking App Schema

  1. New Tables
    - projects
      - id (uuid, primary key)
      - name (text)
      - created_at (timestamp)
    
    - time_entries
      - id (uuid, primary key)
      - user_id (uuid, references auth.users)
      - project_id (uuid, references projects)
      - description (text)
      - hours (numeric)
      - date (timestamp)
      - created_at (timestamp)

  2. Security
    - Enable RLS on all tables
    - Add policies for authenticated users
*/

-- Create projects table
CREATE TABLE IF NOT EXISTS projects (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Create time entries table
CREATE TABLE IF NOT EXISTS time_entries (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users NOT NULL,
  project_id uuid REFERENCES projects NOT NULL,
  description text NOT NULL,
  hours numeric NOT NULL CHECK (hours > 0),
  date timestamptz DEFAULT now(),
  created_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE time_entries ENABLE ROW LEVEL SECURITY;

-- Projects policies
CREATE POLICY "Everyone can read projects"
  ON projects
  FOR SELECT
  TO authenticated
  USING (true);

-- Time entries policies
CREATE POLICY "Users can create their own time entries"
  ON time_entries
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can read their own time entries"
  ON time_entries
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

-- Insert default projects
INSERT INTO projects (name) VALUES
  ('Development'),
  ('Design'),
  ('Marketing'),
  ('Research'),
  ('Management')
ON CONFLICT DO NOTHING;