-- Compare ranking of top 5 brands between recent and previous months
WITH ranked_brands AS (
    SELECT 
        b.name, 
        COUNT(r.receipt_id) AS receipt_count,
        DATE_TRUNC('month', r.date_scanned) AS month,
        RANK() OVER (PARTITION BY DATE_TRUNC('month', r.date_scanned) ORDER BY COUNT(r.receipt_id) DESC) AS rank
    FROM Receipts r
    JOIN Receipt_Items ri ON r.receipt_id = ri.receipt_id
    JOIN Brands b ON ri.brand_id = b.brand_id
    GROUP BY b.name, month
)
SELECT rb1.name, 
       rb1.receipt_count AS recent_month_count, 
       rb1.rank AS recent_rank, 
       rb2.receipt_count AS previous_month_count, 
       rb2.rank AS previous_rank
FROM ranked_brands rb1
LEFT JOIN ranked_brands rb2 
ON rb1.name = rb2.name AND rb1.month = (rb2.month + INTERVAL '1 month')
WHERE rb1.rank <= 5 OR rb2.rank <= 5;
