-- EXECUTED: 2026-11-19 21:58:46 HST (UTC-10).
-- BigQuery job: thelook-ecommerce-511800:US.job_piJglxGpz3DmAorFMub5YtJzK78W
-- Bytes processed: 2.41 MB; bytes billed: 10 MB. Destination: temporary table.
-- Team-provided CSV result: 27,307 rows and distinct item IDs; 0 duplicate rows,
-- invalid/null Y, unsettled deliveries, negative prices/ages, missing prices/ages/categories,
-- or unmatched users. 25 brands were missing and are represented as Unknown in the table.
-- Observed ranges: sale_price 1.50–999.00; customer age 12–70; deliveries 2019-01-30–2026-09-21.
SELECT
  COUNT(*) AS row_count,
  COUNT(DISTINCT order_item_id) AS distinct_order_item_ids,
  COUNT(*) - COUNT(DISTINCT order_item_id) AS duplicate_item_rows,
  COUNTIF(returned IS NULL OR returned NOT IN (0, 1)) AS invalid_or_null_y_rows,
  COUNTIF(
    delivered_date IS NULL
    OR delivered_date > DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY))
    AS null_or_unsettled_delivery_rows,
  COUNTIF(sale_price < 0 OR customer_age < 0) AS negative_price_or_age_rows,
  COUNTIF(sale_price_was_missing = 1) AS missing_sale_price_rows,
  COUNTIF(brand_was_missing = 1) AS missing_brand_rows,
  COUNTIF(customer_age_was_missing = 1) AS missing_customer_age_rows,
  COUNTIF(category_was_missing = 1) AS missing_category_rows,
  COUNTIF(user_matched = 0) AS unmatched_user_rows,
  ARRAY(
    SELECT AS STRUCT product_category, COUNT(*) AS item_count
    FROM `thelook-ecommerce-511800.busm410_cp2.cp2_analysis_table`
    GROUP BY product_category
    ORDER BY item_count DESC
  ) AS category_counts,
  MIN(sale_price) AS minimum_sale_price,
  MAX(sale_price) AS maximum_sale_price,
  MIN(customer_age) AS minimum_customer_age,
  MAX(customer_age) AS maximum_customer_age,
  MIN(delivered_date) AS first_delivery_date,
  MAX(delivered_date) AS last_delivery_date
FROM `thelook-ecommerce-511800.busm410_cp2.cp2_analysis_table`;