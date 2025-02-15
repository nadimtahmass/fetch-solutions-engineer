-- This table stores user information.
CREATE TABLE Users (
    user_id UUID PRIMARY KEY,
    state VARCHAR(2),
    created_date TIMESTAMP,
    last_login TIMESTAMP,
    role VARCHAR(50) DEFAULT 'CONSUMER',
    active BOOLEAN
);
