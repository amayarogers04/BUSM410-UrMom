-- EXECUTED: 2026-11-19 22:26:46 HST (UTC-10).
-- BigQuery job: thelook-ecommerce-511800:US.job_bJNwWk14ahJRApQQ1LMaIuDF6E68
-- Bytes processed: 426.67 KB; bytes billed: 10 MB. Destination: temporary table.
-- Team CSV: five quintiles, 27,307 items and 7,776 returns.
-- Observed return rates: Q1 28.49%, Q2 28.10%, Q3 28.44%, Q4 29.06%, Q5 28.29%.
-- Agent calculation: 0.96 percentage-point range, with no monotonic pattern.
-- Question: how does average return rate vary across sale-price ranges?
-- X: sale_price only; Y: returned (0/1). Quintiles group items by ranked sale_price.
-- Output includes observed min/max sale_price units; do not assume currency.
-- Tied prices at a quintile boundary may fall into adjacent groups.
-- Cohort is the fixed mature-delivered Men table. This binning is descriptive only.
-- Check the BigQuery estimate before running; this reads only the team's CP2 table.
WITH price_quintiles AS (
  SELECT
    NTILE(5) OVER (ORDER BY sale_price) AS price_quintile,
    sale_price,
    returned
  FROM `thelook-ecommerce-511800.busm410_cp2.cp2_analysis_table`
)
SELECT
  price_quintile,
  MIN(sale_price) AS minimum_sale_price_unit,
  MAX(sale_price) AS maximum_sale_price_unit,
  COUNT(*) AS item_count,
  SUM(returned) AS returned_items,
  ROUND(100 * AVG(returned), 2) AS return_rate_percent
FROM price_quintiles
GROUP BY price_quintile
ORDER BY price_quintile;