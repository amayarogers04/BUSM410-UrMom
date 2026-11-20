-- BigQuery job ID: job__44-3qNgfhADvASOQ5RYbb50v5AE
-- Run time: 2026-11-10 21:55:48 HST
WITH mature_items AS (
  SELECT id, product_id, sale_price, delivered_at, returned_at
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  WHERE delivered_at IS NOT NULL
    AND DATE(delivered_at) <= DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY)
)
SELECT
  COUNT(*) AS joined_rows,
  COUNT(DISTINCT m.id) AS distinct_item_ids,
  COUNTIF(m.id IS NOT NULL) - COUNT(DISTINCT m.id) AS duplicate_id_excess_rows,
  COUNTIF(m.id IS NULL) AS missing_item_ids,
  COUNTIF(m.product_id IS NULL) AS missing_product_ids,
  COUNTIF(m.product_id IS NOT NULL AND p.id IS NULL) AS unmatched_product_ids,
  COUNTIF(m.sale_price IS NULL) AS missing_sale_prices,
  COUNTIF(m.sale_price < 0) AS negative_sale_prices,
  COUNTIF(m.returned_at IS NOT NULL AND DATE(m.returned_at) < DATE(m.delivered_at)) AS returns_before_delivery,
  COUNTIF(DATE(m.returned_at) > CURRENT_DATE()) AS future_return_dates,
  MIN(DATE(m.delivered_at)) AS earliest_delivery,
  MAX(DATE(m.delivered_at)) AS latest_delivery
FROM mature_items AS m
LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON m.product_id = p.id;