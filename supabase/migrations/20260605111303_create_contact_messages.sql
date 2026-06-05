CREATE TABLE contact_messages (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  email text NOT NULL,
  subject text NOT NULL,
  message text NOT NULL,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE contact_messages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "insert_contact_messages" ON contact_messages FOR INSERT
  TO anon WITH CHECK (true);

CREATE POLICY "select_contact_messages" ON contact_messages FOR SELECT
  TO authenticated USING (auth.uid() IS NOT NULL);

CREATE POLICY "delete_contact_messages" ON contact_messages FOR DELETE
  TO authenticated USING (auth.uid() IS NOT NULL);
