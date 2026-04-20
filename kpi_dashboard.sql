SELECT
    COUNT(*) AS total_members,
    SUM(CASE WHEN status_id = 2 THEN 1 ELSE 0 END) AS active_members,
    SUM(CASE WHEN status_id = 5 THEN 1 ELSE 0 END) AS collections_members,
    SUM(payment_amnt) AS total_revenue,
    ROUND(
        SUM(CASE WHEN status_id = 5 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2) AS collections_percent
FROM memberships;