-- Add series column to mining_machines table
ALTER TABLE mining_machines ADD COLUMN IF NOT EXISTS series TEXT NOT NULL DEFAULT 'B';