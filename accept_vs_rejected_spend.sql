-- Average spend for ‘Accepted’ vs ‘Rejected’ receipts
SELECT rewardsReceiptStatus, AVG(total_spent) AS avg_spend
FROM Receipts
WHERE rewardsReceiptStatus IN ('Accepted', 'Rejected')
GROUP BY rewardsReceiptStatus;