-- Executed by Brylle in BigQuery; exact statement verified in the job details.
-- Question: which model features have the strongest adjusted associations with returns?
-- Output: standardized coefficient, standard error, and p-value for each feature/category.
-- Standardization makes coefficient magnitudes more comparable across differently scaled inputs.
-- No source table is scanned; the model was trained with CALCULATE_P_VALUES=TRUE,
-- CATEGORY_ENCODING_METHOD='DUMMY_ENCODING', and L1_REG=0 as required for this function.
-- Run: 2026-11-19 22:55:53 HST (UTC-10); job: thelook-ecommerce-511800:US.job_eos7zWaJSdW_22YJnHHEEkhNvG9-
-- Usage: 7.04 KB processed; 10 MB billed.
SELECT
  processed_input,
  category,
  weight,
  standard_error,
  p_value
FROM ML.ADVANCED_WEIGHTS(
  MODEL `thelook-ecommerce-511800.busm410_cp2.cp2_return_logistic_model`,
  STRUCT(TRUE AS standardize)
)
