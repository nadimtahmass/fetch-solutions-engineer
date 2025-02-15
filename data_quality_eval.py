import pandas as pd
import numpy as np

# Load JSON files using JSON lines format
receipts_df = pd.read_json("receipts.json", lines=True)
users_df = pd.read_json("users.json", lines=True)
brands_df = pd.read_json("brands.json", lines=True)

### 1. Check for Missing Values ###
print("Missing Values:")
print(receipts_df.isnull().sum())  # Check missing values in Receipts
print(users_df.isnull().sum())  # Check missing values in Users
print(brands_df.isnull().sum())  # Check missing values in Brands
print("\n")

### 2. Check for Duplicate Records ###
print("Duplicate Records:")
print(f"Receipts: {receipts_df.duplicated(subset=['_id']).sum()} duplicates")
print(f"Users: {users_df.duplicated(subset=['_id']).sum()} duplicates")
print(f"Brands: {brands_df.duplicated(subset=['_id']).sum()} duplicates")
print("\n")

### 3. Check for Invalid Data ###
print("Invalid Data Entries:")

# Check for negative or zero values in total_spent
invalid_spend = receipts_df[receipts_df['totalSpent'] < 0]
print(f"Receipts with negative total spend: {len(invalid_spend)}")

# Check if userId exists in Users table
missing_user_ids = receipts_df[~receipts_df['userId'].isin(users_df['_id'])]
print(f"Receipts with missing user references: {len(missing_user_ids)}")

# Check for any receipts with no purchased items but positive spend
zero_item_spend = receipts_df[(receipts_df['purchasedItemCount'] == 0) & (receipts_df['totalSpent'] > 0)]
print(f"Receipts with 0 items but positive spend: {len(zero_item_spend)}")
print("\n")

### 4. Outlier Detection for Total Spend ###
Q1 = receipts_df['totalSpent'].quantile(0.25)
Q3 = receipts_df['totalSpent'].quantile(0.75)
IQR = Q3 - Q1
lower_bound = Q1 - (1.5 * IQR)
upper_bound = Q3 + (1.5 * IQR)

outliers = receipts_df[(receipts_df['totalSpent'] < lower_bound) | (receipts_df['totalSpent'] > upper_bound)]
print(f"Number of outlier receipts based on total spend: {len(outliers)}")
print(outliers[['totalSpent', 'purchaseDate']])  # Display the outliers
