-- Add new columns to users table
ALTER TABLE users 
ADD COLUMN IF NOT EXISTS is_admin BOOLEAN DEFAULT FALSE NOT NULL,
ADD COLUMN IF NOT EXISTS is_banned BOOLEAN DEFAULT FALSE NOT NULL;

-- Create redemption_codes table
CREATE TABLE IF NOT EXISTS redemption_codes (
  id SERIAL PRIMARY KEY,
  code TEXT NOT NULL UNIQUE,
  type TEXT NOT NULL,
  amount NUMERIC(10, 2) DEFAULT 0,
  vip_level INTEGER DEFAULT 0,
  is_group_code BOOLEAN DEFAULT FALSE NOT NULL,
  max_uses INTEGER DEFAULT 1,
  used_count INTEGER DEFAULT 0 NOT NULL,
  expires_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created_by_id INTEGER REFERENCES users(id) NOT NULL,
  is_active BOOLEAN DEFAULT TRUE NOT NULL
);

-- Create redemption_code_usages table
CREATE TABLE IF NOT EXISTS redemption_code_usages (
  id SERIAL PRIMARY KEY,
  code_id INTEGER REFERENCES redemption_codes(id) NOT NULL,
  user_id INTEGER REFERENCES users(id) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create example admin user if not exists
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM users WHERE is_admin = TRUE) THEN
    -- Update the first user to be an admin
    UPDATE users SET is_admin = TRUE WHERE id = 1;
  END IF;
END $$;