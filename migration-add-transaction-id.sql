-- Add transaction_id column to deposits table
ALTER TABLE deposits ADD COLUMN IF NOT EXISTS transaction_id TEXT;