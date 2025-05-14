-- Add the isPrimaryAdmin column to users table
ALTER TABLE users ADD COLUMN is_primary_admin BOOLEAN DEFAULT FALSE NOT NULL;
ALTER TABLE users ADD COLUMN created_by INTEGER REFERENCES users(id);

-- Create the admin_permissions table
CREATE TABLE IF NOT EXISTS admin_permissions (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE REFERENCES users(id),
    can_manage_users BOOLEAN DEFAULT FALSE NOT NULL,
    can_ban_users BOOLEAN DEFAULT FALSE NOT NULL,
    can_reset_passwords BOOLEAN DEFAULT FALSE NOT NULL,
    can_impersonate_users BOOLEAN DEFAULT FALSE NOT NULL,
    can_manage_withdrawals BOOLEAN DEFAULT FALSE NOT NULL,
    can_manage_deposits BOOLEAN DEFAULT FALSE NOT NULL,
    can_manage_machines BOOLEAN DEFAULT FALSE NOT NULL,
    can_manage_payment_options BOOLEAN DEFAULT FALSE NOT NULL,
    can_manage_banners BOOLEAN DEFAULT FALSE NOT NULL,
    can_manage_redemption_codes BOOLEAN DEFAULT FALSE NOT NULL,
    can_manage_admins BOOLEAN DEFAULT FALSE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER REFERENCES users(id)
);

-- Set user ID 1 (initial admin) as a primary admin
UPDATE users SET is_primary_admin = TRUE WHERE id = 1;