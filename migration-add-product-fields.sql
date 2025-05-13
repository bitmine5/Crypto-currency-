-- Add work_on_weekends, total_revenue, and revenue_percentage columns to mining_machines table
ALTER TABLE mining_machines ADD COLUMN work_on_weekends BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE mining_machines ADD COLUMN total_revenue NUMERIC NOT NULL DEFAULT '0';
ALTER TABLE mining_machines ADD COLUMN revenue_percentage INTEGER NOT NULL DEFAULT 0;