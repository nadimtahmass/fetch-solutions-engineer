-- Brand with most spend among users created in the past 6 months
SELECT b.name, SUM(r.total_spent) AS total_spend
FROM Receipts r
JOIN Users u ON r.user_id = u.user_id
JOIN Receipt_Items ri ON r.receipt_id = ri.receipt_id
JOIN Brands b ON ri.brand_id = b.brand_id
WHERE u.created_date >= NOW() - INTERVAL '6 months'
GROUP BY b.name
ORDER BY total_spend DESC
LIMIT 1;