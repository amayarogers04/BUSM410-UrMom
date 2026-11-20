-- BigQuery job ID: job_0_FlOrwhFMpcLuATX76w1P_hKMqW
-- Run time: 2026-11-10 14:26:06 HST
SELECT DATE_TRUNC(DATE(created_at), MONTH) AS order_month, status, COUNT(*) AS order_count, COUNT(DISTINCT user_id) AS distinct_customers FROM `bigquery-public-data.thelook_ecommerce.orders` GROUP BY order_month, status ORDER BY order_month, status;