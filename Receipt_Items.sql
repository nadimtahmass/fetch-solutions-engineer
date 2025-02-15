-- A receipt can have multiple purchased items, so we need a separate table.
CREATE TABLE Receipt_Items (
    item_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    receipt_id UUID REFERENCES Receipts(receipt_id),
    barcode VARCHAR(255),
    brand_id UUID REFERENCES Brands(brand_id),
    price DECIMAL(10,2),
    quantity INT
);
