/*
  # Add app store and YouTube URL fields to news_posts

  Adds optional fields to the news_posts table:
  - appstore_url: Link to Apple App Store
  - playstore_url: Link to Google Play Store
  - youtube_url: Link to YouTube video
  - image_url: URL or path for the news image

  Also adds ar_youtube_url to site_settings for the AR technology section.
*/

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'news_posts' AND column_name = 'appstore_url') THEN
    ALTER TABLE news_posts ADD COLUMN appstore_url text DEFAULT '';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'news_posts' AND column_name = 'playstore_url') THEN
    ALTER TABLE news_posts ADD COLUMN playstore_url text DEFAULT '';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'news_posts' AND column_name = 'youtube_url') THEN
    ALTER TABLE news_posts ADD COLUMN youtube_url text DEFAULT '';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'news_posts' AND column_name = 'image_url') THEN
    ALTER TABLE news_posts ADD COLUMN image_url text DEFAULT '';
  END IF;
END $$;

INSERT INTO site_settings (key, value, updated_at)
VALUES ('ar_youtube_url', '', NOW())
ON CONFLICT (key) DO NOTHING;
