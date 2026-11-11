-- CP1 final comparison. See sql/README.md for group definitions and interpretation.
WITH mature_men_items AS (
  SELECT p.category, oi.id AS order_item_id, oi.returned_at, oi.sale_price
  FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
    ON oi.product_id = p.id
  WHERE oi.delivered_at IS NOT NULL
    AND DATE(oi.delivered_at) <= DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY)
    AND p.department = 'Men'
    AND p.category IS NOT NULL
),
labeled_items AS (
  SELECT IF(category = 'Men Accessories', 'Men Accessories', 'Other Men categories') AS comparison_group,
         order_item_id, returned_at, sale_price
  FROM mature_men_items
)
SELECT
  comparison_group,
  COUNT(*) AS mature_delivered_items,
  COUNTIF(returned_at IS NOT NULL) AS returned_items,
  SAFE_DIVIDE(COUNTIF(returned_at IS NOT NULL), COUNT(*)) AS return_rate,
  SUM(IF(returned_at IS NOT NULL, sale_price, 0)) AS returned_sale_price_total,
  AVG(IF(returned_at IS NOT NULL, sale_price, NULL)) AS avg_returned_item_sale_price
FROM labeled_items
GROUP BY comparison_group
ORDER BY comparison_group;
