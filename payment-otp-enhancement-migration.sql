-- Add new columns to otp_verifications table
ALTER TABLE otp_verifications 
ADD COLUMN transaction_type TEXT DEFAULT 'verification',
ADD COLUMN notes TEXT,
ADD COLUMN payment_reference TEXT,
ADD COLUMN request_id TEXT,
ADD COLUMN response_data TEXT;