CREATE OR REPLACE VIEW vw_kpi_dashboard AS
SELECT
    (SELECT COUNT(*) FROM memberships) AS total_members,
    (SELECT COUNT(*) FROM memberships WHERE status_id = 2) AS active_members,
    (SELECT COUNT(*) FROM memberships WHERE status_id = 5) AS collections_members,
    (SELECT COUNT(*) FROM memberships WHERE status_id = 3) AS frozen_members,
    (SELECT ROUND(
        SUM(CASE WHEN status_id = 5 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2)
    FROM memberships) AS collections_percent,
    (SELECT SUM(payment_amnt) FROM memberships) AS total_revenue
FROM dual;
