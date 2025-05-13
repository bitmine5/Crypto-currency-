-- Add new columns to user_machines table for auto-rent functionality
ALTER TABLE user_machines ADD COLUMN IF NOT EXISTS is_auto_rent BOOLEAN DEFAULT FALSE;
ALTER TABLE user_machines ADD COLUMN IF NOT EXISTS hold_until TIMESTAMP;
ALTER TABLE user_machines ADD COLUMN IF NOT EXISTS last_earning_collected_at TIMESTAMP;
ALTER TABLE user_machines ADD COLUMN IF NOT EXISTS earnings_available BOOLEAN DEFAULT FALSE;

-- Update the insert schema omit fields to reflect these additions