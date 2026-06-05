CREATE TABLE page_sections (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  page text NOT NULL,
  section_key text NOT NULL,
  section_type text NOT NULL DEFAULT 'text',
  content text DEFAULT '',
  image_url text DEFAULT '',
  sort_order int DEFAULT 0,
  is_visible boolean DEFAULT true,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(page, section_key)
);

ALTER TABLE page_sections ENABLE ROW LEVEL SECURITY;

CREATE POLICY "select_page_sections" ON page_sections FOR SELECT
  TO authenticated USING (true);

CREATE POLICY "select_page_sections_anon" ON page_sections FOR SELECT
  TO anon USING (true);

CREATE POLICY "insert_page_sections" ON page_sections FOR INSERT
  TO authenticated WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "update_page_sections" ON page_sections FOR UPDATE
  TO authenticated USING (auth.uid() IS NOT NULL) WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "delete_page_sections" ON page_sections FOR DELETE
  TO authenticated USING (auth.uid() IS NOT NULL);

-- Seed initial sections
INSERT INTO page_sections (page, section_key, section_type, content, sort_order) VALUES
  ('index', 'intro_h1', 'text', 'Welcome to RightSpot Ltd', 0),
  ('index', 'intro_h2', 'text', 'Software and Wireless Solutions', 1),
  ('index', 'intro_f1', 'text', 'Custom software development for PC, mobile, and cloud platforms', 2),
  ('index', 'intro_f2', 'text', 'Expertise in wireless and embedded systems', 3),
  ('index', 'intro_f3', 'text', 'Web and Cloud solutions tailored to your needs', 4),
  ('index', 'intro_f4', 'text', 'Smart phone and tablet application development', 5),
  ('index', 'intro_f5', 'text', 'Published products with user ratings and app store presence', 6),
  ('index', 'intro_f6', 'text', 'Dedicated team based in Salo, Finland', 7),
  ('index', 'svc1_h', 'text', 'Software Development', 8),
  ('index', 'svc1_p', 'text', 'We specialize in creating custom software solutions tailored to your specific business needs and requirements.', 9),
  ('index', 'svc2_h', 'text', 'Mobile Applications', 10),
  ('index', 'svc2_p', 'text', 'Expert development of smart phone and tablet applications for iOS, Android, and other mobile platforms.', 11),
  ('software-development', 'intro_h2', 'text', 'Professional Software Solutions from Concept to Market', 0),
  ('software-development', 'intro_p1', 'text', 'We develop and implement professional software solutions and when needed, we will search and implement required hardware for you. Typical customer projects are anywhere between 1 to 12 months of development time.', 1),
  ('software-development', 'intro_p2', 'text', 'We have capabilities for concepting and fast prototyping. This often helps customers test the product or service idea before going for full scale development.', 2),
  ('software-development', 'intro_p3', 'text', 'We have delivered solutions that have been running already for years and still going strong. Maintenance is key factor in fast changing IT world to keep the solutions up-to-date. Careful selection on development platforms will keep your products alive and supported as long as required.', 3);
