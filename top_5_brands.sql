-- Top 5 brands by receipts scanned in the most recent month
WITH recent_month AS (
    SELECT MAX(DATE_TRUNC('month', date_scanned)) AS latest_month FROM Receipts
)
SELECT b.name, COUNT(r.receipt_id) AS receipt_count
FROM Receipts r
JOIN Receipt_Items ri ON r.receipt_id = ri.receipt_id
JOIN Brands b ON ri.brand_id = b.brand_id
WHERE DATE_TRUNC('month', r.date_scanned) = (SELECT latest_month FROM recent_month)
GROUP BY b.name
ORDER BY receipt_count DESC
LIMIT 5;
