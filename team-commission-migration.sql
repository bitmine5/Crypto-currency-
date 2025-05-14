-- Add new columns to users table for team levels
ALTER TABLE users ADD COLUMN IF NOT EXISTS level_b_members INTEGER NOT NULL DEFAULT 0;
ALTER TABLE users ADD COLUMN IF NOT EXISTS level_c_members INTEGER NOT NULL DEFAULT 0;
ALTER TABLE users ADD COLUMN IF NOT EXISTS level_d_members INTEGER NOT NULL DEFAULT 0;

-- Drop old columns that are no longer needed
ALTER TABLE users DROP COLUMN IF EXISTS vip2_downline;
ALTER TABLE users DROP COLUMN IF EXISTS vip3_downline;

-- Create commission rates table
CREATE TABLE IF NOT EXISTS commission_rates (
  id SERIAL PRIMARY KEY,
  level_b NUMERIC NOT NULL DEFAULT 0.10,
  level_c NUMERIC NOT NULL DEFAULT 0.05,
  level_d NUMERIC NOT NULL DEFAULT 0.02,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert default commission rates
INSERT INTO commission_rates (level_b, level_c, level_d, is_active)
VALUES (0.10, 0.05, 0.02, TRUE)
ON CONFLICT DO NOTHING;

-- Create team commissions table
CREATE TABLE IF NOT EXISTS team_commissions (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  from_user_id INTEGER NOT NULL REFERENCES users(id),
  machine_id INTEGER NOT NULL REFERENCES mining_machines(id),
  amount NUMERIC NOT NULL,
  level TEXT NOT NULL,
  rate NUMERIC NOT NULL,
  base_amount NUMERIC NOT NULL,
  date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);