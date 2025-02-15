-- Brand with the most transactions among users created in the past 6 months
SELECT b.name, COUNT(r.receipt_id) AS transaction_count
FROM Receipts r
JOIN Users u ON r.user_id = u.user_id
JOIN Receipt_Items ri ON r.receipt_id = ri.receipt_id
JOIN Brands b ON ri.brand_id = b.brand_id
WHERE u.created_date >= NOW() - INTERVAL '6 months'
GROUP BY b.name
ORDER BY transaction_count DESC
LIMIT 1;