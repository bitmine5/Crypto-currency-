-- Rename tier to vip_level and change type to integer
ALTER TABLE users 
  ADD COLUMN vip_level INTEGER NOT NULL DEFAULT 0,
  ADD COLUMN direct_referrals INTEGER NOT NULL DEFAULT 0,
  ADD COLUMN team_size INTEGER NOT NULL DEFAULT 0,
  ADD COLUMN vip2_downline INTEGER NOT NULL DEFAULT 0,
  ADD COLUMN vip3_downline INTEGER NOT NULL DEFAULT 0;

-- Update the vip_level based on the tier (Bronze = 0, etc.)
UPDATE users SET vip_level = 0;

-- Drop the tier column after migration is complete
ALTER TABLE users DROP COLUMN tier;