-- Executed by Brylle in BigQuery; exact statement archived from the job details.
-- Question: which pre-outcome features are associated with a return?
-- Y: returned (0/1). Xs: Men Accessories flag, sale_price, grouped brand, customer_age.
-- Brand rule approved by Brylle: keep values with >=100 items, map other non-missing brands to Other, keep Unknown.
-- Use BigQuery's default data split; do not set DATA_SPLIT_METHOD.
-- L1_REG=0 is included so ML.ADVANCED_WEIGHTS can return p-values later.
-- Run: 2026-11-19 22:39:02 HST (UTC-10); job completed 22:41:42 HST.
-- Job: thelook-ecommerce-511800:US.job_WjA89O0M7Ry0sDupuxB_kbS1S-yH
-- Usage: 1.14 MB processed; 10 MB billed. Destination model: busm410_cp2.cp2_return_logistic_model.
CREATE OR REPLACE MODEL `thelook-ecommerce-511800.busm410_cp2.cp2_return_logistic_model`
OPTIONS (
  MODEL_TYPE = 'LOGISTIC_REG',
  INPUT_LABEL_COLS = ['returned'],
  CALCULATE_P_VALUES = TRUE,
  CATEGORY_ENCODING_METHOD = 'DUMMY_ENCODING',
  MAX_ITERATIONS = 50,
  EARLY_STOP = FALSE,
  L1_REG = 0
) AS
WITH brand_counts AS (
  SELECT
    brand,
    COUNT(*) AS brand_item_count
  FROM `thelook-ecommerce-511800.busm410_cp2.cp2_analysis_table`
  GROUP BY brand
)
SELECT
  t.returned,
  t.is_men_accessories,
  t.sale_price,
  CASE
    WHEN t.brand = 'Unknown' THEN 'Unknown'
    WHEN bc.brand_item_count >= 100 THEN t.brand
    ELSE 'Other'
  END AS brand_model,
  t.customer_age
FROM `thelook-ecommerce-511800.busm410_cp2.cp2_analysis_table` AS t
JOIN brand_counts AS bc
  ON t.brand = bc.brand;