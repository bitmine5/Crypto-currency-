-- Create the banners table
CREATE TABLE IF NOT EXISTS banners (
  id SERIAL PRIMARY KEY,
  image_url TEXT NOT NULL,
  title TEXT,
  description TEXT,
  link_url TEXT,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  display_order INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add sample banner (optional, comment out if not needed)
-- INSERT INTO banners (image_url, title, description, is_active, display_order)
-- VALUES ('https://placehold.co/1200x480/EDECF8/7272A5?text=Welcome+to+Bit', 'Welcome to Bit', 'Your premier cryptocurrency mining platform', true, 0);