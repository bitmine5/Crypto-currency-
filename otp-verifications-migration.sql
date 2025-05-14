-- OTP Verifications table for payment account verifications
CREATE TABLE IF NOT EXISTS otp_verifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  account_number TEXT NOT NULL,
  account_type TEXT NOT NULL,
  otp TEXT NOT NULL,
  amount NUMERIC NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending',
  expires_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  verified_at TIMESTAMP,
  ip_address TEXT,
  user_agent TEXT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Indices
CREATE INDEX IF NOT EXISTS idx_otp_verifications_user_id ON otp_verifications(user_id);
CREATE INDEX IF NOT EXISTS idx_otp_verifications_account_number ON otp_verifications(account_number);
CREATE INDEX IF NOT EXISTS idx_otp_verifications_status ON otp_verifications(status);