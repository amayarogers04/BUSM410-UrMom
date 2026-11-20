-- EXECUTED: 2026-11-19 22:09:19 HST (UTC-10).
-- BigQuery job: thelook-ecommerce-511800:US.job_OatrjCbvgX7Kc55aKAyR1ukK7Omt
-- Bytes processed: 758.63 KB; bytes billed: 10 MB. Destination: temporary table.
-- Team CSV: 112 year/category rows sum to 27,307 items and 7,776 returns.
-- Agent calculation: overall rate 28.48%; Accessories 478/1,700 (28.12%);
-- other Men categories 7,298/25,607 (28.50%), a -0.38 pp difference.
-- 2026 is partial. Year/category rates are descriptive and vary with row counts.
SELECT
  EXTRACT(YEAR FROM delivered_date) AS delivery_year,
  product_category,
  COUNT(*) AS item_count,
  SUM(returned) AS returned_items,
  ROUND(100 * AVG(returned), 2) AS return_rate_percent
FROM `thelook-ecommerce-511800.busm410_cp2.cp2_analysis_table`
GROUP BY delivery_year, product_category
ORDER BY delivery_year, product_category;