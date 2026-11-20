-- EXECUTED: 2026-11-19 22:32:51 HST (UTC-10).
-- BigQuery job: thelook-ecommerce-511800:US.job_4bocIvc_5ywr1TXnf2Me6HuOzjy0
-- Bytes processed: 426.67 KB; bytes billed: 10 MB. Destination: temporary table.
-- Team CSV: 59 age groups; 27,307 items and 7,776 returns.
-- Agent aggregation: ages 12–20 returned at 29.21%; ages 60–70 at 28.47%.
-- Individual-age rates varied without a steady increase or decrease.
SELECT
  customer_age,
  COUNT(*) AS item_count,
  SUM(returned) AS returned_items,
  ROUND(100 * AVG(returned), 2) AS return_rate_percent
FROM `thelook-ecommerce-511800.busm410_cp2.cp2_analysis_table`
GROUP BY customer_age
ORDER BY customer_age;