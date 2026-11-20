-- EXECUTED: 2026-11-19 22:18:04 HST (UTC-10).
-- BigQuery job: thelook-ecommerce-511800:US.job_zG_Na-JNzsbxbdUCfJlUsw05spuU
-- Bytes processed: 525.15 KB; bytes billed: 10 MB. Destination: temporary table.
-- Team CSV: 1,273 brand values across 27,307 items and 7,776 returns.
-- Agent aggregation: 844 brand values have fewer than 10 items; 128 have one item;
-- 62 have at least 100 items. Rates are one-X descriptive comparisons.
SELECT
  brand,
  COUNT(*) AS item_count,
  SUM(returned) AS returned_items,
  ROUND(100 * AVG(returned), 2) AS return_rate_percent
FROM `thelook-ecommerce-511800.busm410_cp2.cp2_analysis_table`
GROUP BY brand
ORDER BY item_count DESC, brand;