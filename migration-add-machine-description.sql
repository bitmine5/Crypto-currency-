-- Add description and isActive columns to mining_machines table
ALTER TABLE mining_machines ADD COLUMN IF NOT EXISTS description TEXT DEFAULT '';
ALTER TABLE mining_machines ADD COLUMN IF NOT EXISTS is_active BOOLEAN DEFAULT TRUE NOT NULL;