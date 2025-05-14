-- Create payment options table
CREATE TABLE IF NOT EXISTS payment_options (
  id SERIAL PRIMARY KEY,
  type TEXT NOT NULL,
  name TEXT NOT NULL,
  account_number TEXT NOT NULL,
  description TEXT NOT NULL,
  instructions TEXT NOT NULL,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Insert default payment options
INSERT INTO payment_options (type, name, account_number, description, instructions, is_active)
VALUES 
('paybill', 'M-PESA Paybill', '123456', 'Pay via M-PESA Paybill', 'Enter business number 123456, Account: Your Phone Number', TRUE),
('bank', 'KCB Bank', '1234567890', 'Pay via KCB Bank', 'Transfer to KCB Account 1234567890, Account Name: Mining Company', TRUE);