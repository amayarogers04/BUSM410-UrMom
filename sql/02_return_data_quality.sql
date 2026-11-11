-- CP1 cohort and join checks. See sql/README.md before changing the cutoff.
WITH mature_delivered AS (
  SELECT oi.id AS order_item_id, oi.product_id, oi.sale_price,
         oi.delivered_at, oi.returned_at, p.id AS matched_product_id
  FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
    ON oi.product_id = p.id
  WHERE oi.delivered_at IS NOT NULL
    AND DATE(oi.delivered_at) <= DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY)
)
SELECT
  COUNT(*) AS mature_rows,
  COUNT(DISTINCT order_item_id) AS distinct_order_item_ids,
  COUNTIF(order_item_id IS NULL) AS missing_order_item_ids,
  COUNTIF(product_id IS NULL) AS missing_product_ids,
  COUNTIF(product_id IS NOT NULL AND matched_product_id IS NULL) AS unmatched_product_ids,
  COUNTIF(sale_price IS NULL) AS missing_sale_prices,
  COUNTIF(sale_price < 0) AS negative_sale_prices,
  COUNTIF(returned_at < delivered_at) AS returns_before_delivery,
  COUNTIF(DATE(returned_at) > CURRENT_DATE()) AS future_return_dates,
  MIN(DATE(delivered_at)) AS earliest_delivery_date,
  MAX(DATE(delivered_at)) AS latest_delivery_date
FROM mature_delivered;
