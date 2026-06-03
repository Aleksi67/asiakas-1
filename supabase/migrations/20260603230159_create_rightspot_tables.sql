/*
  # RightSpot Admin Panel - Initial Schema

  1. New Tables
    - `news_posts` - News articles manageable from admin
      - id, title, content, published_at, is_published, created_at, updated_at
    - `software_products` - Software product listings
      - id, name, description, platform, image_url, store_url, is_active, sort_order, created_at, updated_at
    - `site_settings` - Key/value store for site-wide settings
      - id, key (unique), value, updated_at
    - `page_views` - Visitor analytics
      - id, page, referrer, user_agent, ip_hash, visited_at

  2. Security
    - RLS enabled on all tables
    - Public read access for news_posts (published only), software_products (active only)
    - Authenticated users (admin) can manage all records
    - page_views: anyone can INSERT, only authenticated can SELECT

  3. Initial seed data for site_settings
*/

-- news_posts table
CREATE TABLE IF NOT EXISTS news_posts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL DEFAULT '',
  content text NOT NULL DEFAULT '',
  published_at timestamptz DEFAULT now(),
  is_published boolean DEFAULT true,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE news_posts ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public can read published news"
  ON news_posts FOR SELECT
  TO anon, authenticated
  USING (is_published = true);

CREATE POLICY "Authenticated can insert news"
  ON news_posts FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated can update news"
  ON news_posts FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated can delete news"
  ON news_posts FOR DELETE
  TO authenticated
  USING (true);

-- software_products table
CREATE TABLE IF NOT EXISTS software_products (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL DEFAULT '',
  description text NOT NULL DEFAULT '',
  platform text NOT NULL DEFAULT '',
  image_url text DEFAULT '',
  store_url text DEFAULT '',
  is_active boolean DEFAULT true,
  sort_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE software_products ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public can read active products"
  ON software_products FOR SELECT
  TO anon, authenticated
  USING (is_active = true);

CREATE POLICY "Authenticated can insert products"
  ON software_products FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated can update products"
  ON software_products FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated can delete products"
  ON software_products FOR DELETE
  TO authenticated
  USING (true);

-- site_settings table
CREATE TABLE IF NOT EXISTS site_settings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  key text UNIQUE NOT NULL,
  value text NOT NULL DEFAULT '',
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public can read site settings"
  ON site_settings FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Authenticated can update site settings"
  ON site_settings FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated can insert site settings"
  ON site_settings FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- page_views table
CREATE TABLE IF NOT EXISTS page_views (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  page text NOT NULL DEFAULT '/',
  referrer text DEFAULT '',
  user_agent text DEFAULT '',
  ip_hash text DEFAULT '',
  visited_at timestamptz DEFAULT now()
);

ALTER TABLE page_views ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can insert page views"
  ON page_views FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated can read page views"
  ON page_views FOR SELECT
  TO authenticated
  USING (true);

-- Seed default site settings
INSERT INTO site_settings (key, value) VALUES
  ('phone', '+358 (0)40 5544853'),
  ('email', 'rightspot(at)rightspot.fi'),
  ('address', 'Satamakatu 28, 24100 SALO, Finland'),
  ('facebook_url', 'https://www.facebook.com/RightSpotLtd'),
  ('stats_products', '8'),
  ('stats_ratings', '3826'),
  ('stats_avg_rating', '4.2'),
  ('stats_downloads', '470709')
ON CONFLICT (key) DO NOTHING;

-- Seed a sample news post
INSERT INTO news_posts (title, content, published_at, is_published) VALUES
  ('Lapua Ballistics v1.2.15 Released', 'New version v1.2.15 of Lapua Ballistics has been released on April 23rd, 2025. This update includes performance improvements and bug fixes. Download now from your app store.', '2025-04-23T00:00:00Z', true)
ON CONFLICT DO NOTHING;

-- Seed existing software products
INSERT INTO software_products (name, description, platform, is_active, sort_order) VALUES
  ('Lapua Ballistics', 'Professional ballistics calculation app used by shooters worldwide. Features advanced trajectory calculations and environmental factor adjustments.', 'iOS, Android', true, 1),
  ('PC Software Solutions', 'Custom PC software development for enterprise clients. Tailored solutions for business process automation and data management.', 'Windows', true, 2),
  ('Smart Phone Applications', 'Mobile application development for iOS and Android platforms. From concept to App Store publication.', 'iOS, Android', true, 3),
  ('Cloud Software', 'Web and cloud-based software solutions. Scalable, secure, and accessible from anywhere.', 'Web / Cloud', true, 4),
  ('Embedded Software', 'Firmware and embedded systems development for IoT devices and hardware products.', 'Embedded / IoT', true, 5)
ON CONFLICT DO NOTHING;
