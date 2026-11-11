-- CP1 category screen. See sql/README.md for the maturity rule and review process.
SELECT
  p.department,
  p.category,
  COUNT(*) AS mature_delivered_items,
  COUNTIF(oi.returned_at IS NOT NULL) AS returned_items,
  SAFE_DIVIDE(COUNTIF(oi.returned_at IS NOT NULL), COUNT(*)) AS return_rate,
  SUM(IF(oi.returned_at IS NOT NULL, oi.sale_price, 0)) AS returned_sale_price_total,
  AVG(IF(oi.returned_at IS NOT NULL, oi.sale_price, NULL)) AS avg_returned_item_sale_price
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
WHERE oi.delivered_at IS NOT NULL
  AND DATE(oi.delivered_at) <= DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY)
GROUP BY p.department, p.category
HAVING COUNT(*) >= 100
ORDER BY return_rate DESC, mature_delivered_items DESC;
