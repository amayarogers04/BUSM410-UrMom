-- EXECUTED: 2026-11-19 21:47 HST (UTC-10).
-- BigQuery job: thelook-ecommerce-511800:US.job_UiG4Fp7V8JOFT_labk7BqzyLxIgT
-- Bytes processed: 8.75 MB; bytes billed: 30 MB.
-- Destination: thelook-ecommerce-511800.busm410_cp2.cp2_analysis_table.
-- Builds one row per mature delivered Men order item for CP2 logistic regression.
-- Y: returned (0/1). Candidate Xs: Men Accessories flag, sale price, brand, and customer age.
-- Missing numeric values are filled with 0 and flagged; blank brands become Unknown.
-- Cohort: delivered at least 60 days ago, matching CP1. No return timestamp is exposed as an X.
-- The query details page showed this destination table after the successful run.
-- The team ran this query; the agent did not run or rerun it.
CREATE OR REPLACE TABLE `thelook-ecommerce-511800.busm410_cp2.cp2_analysis_table` AS
SELECT
  oi.id AS order_item_id,
  oi.product_id,
  oi.user_id,
  DATE(oi.delivered_at) AS delivered_date,
  DATE_TRUNC(DATE(oi.delivered_at), MONTH) AS delivery_month,
  COALESCE(p.category, 'Unknown') AS product_category,
  CASE
    WHEN p.category = 'Accessories' THEN 1
    ELSE 0
  END AS is_men_accessories,
  CASE
    WHEN p.category IS NULL THEN 1
    ELSE 0
  END AS category_was_missing,
  CASE
    WHEN oi.returned_at IS NOT NULL THEN 1
    ELSE 0
  END AS returned,
  COALESCE(oi.sale_price, 0) AS sale_price,
  CASE
    WHEN oi.sale_price IS NULL THEN 1
    ELSE 0
  END AS sale_price_was_missing,
  COALESCE(NULLIF(TRIM(p.brand), ''), 'Unknown') AS brand,
  CASE
    WHEN p.brand IS NULL OR TRIM(p.brand) = '' THEN 1
    ELSE 0
  END AS brand_was_missing,
  COALESCE(u.age, 0) AS customer_age,
  CASE
    WHEN u.age IS NULL THEN 1
    ELSE 0
  END AS customer_age_was_missing,
  CASE
    WHEN u.id IS NOT NULL THEN 1
    ELSE 0
  END AS user_matched
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
LEFT JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
WHERE p.department = 'Men'
  AND oi.delivered_at IS NOT NULL
  AND DATE(oi.delivered_at) <= DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY);
