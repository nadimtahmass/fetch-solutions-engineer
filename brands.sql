-- Stores brand information.
CREATE TABLE Brands (
    brand_id UUID PRIMARY KEY,
    barcode VARCHAR(255),
    brand_code VARCHAR(255),
    category VARCHAR(255),
    category_code VARCHAR(255),
    cpg VARCHAR(255),
    top_brand BOOLEAN,
    name VARCHAR(255)
);
