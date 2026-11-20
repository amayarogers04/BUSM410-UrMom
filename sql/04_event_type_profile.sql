-- BigQuery job ID: job_giCyIpGepapLYUX0eNKqKkYUKLo4
-- Run time: 2026-11-10 21:28:16 HST
SELECT event_type, COUNT(*) AS event_rows, COUNT(DISTINCT session_id) AS sessions FROM `bigquery-public-data.thelook_ecommerce.events` WHERE session_id IS NOT NULL GROUP BY event_type ORDER BY event_rows DESC;