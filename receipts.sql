-- Stores details about scanned receipts.
CREATE TABLE Receipts (
    receipt_id UUID PRIMARY KEY,
    user_id UUID REFERENCES Users(user_id),
    purchase_date TIMESTAMP,
    date_scanned TIMESTAMP,
    finished_date TIMESTAMP,
    modify_date TIMESTAMP,
    points_awarded_date TIMESTAMP,
    rewards_receipt_status VARCHAR(50),
    total_spent DECIMAL(10,2),
    purchased_item_count INT,
    points_earned INT,
    bonus_points_earned INT,
    bonus_points_reason TEXT
);
