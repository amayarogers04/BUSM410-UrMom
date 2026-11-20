-- Executed by Brylle in BigQuery; exact statement archived from the job details.
-- Question: what is the majority-class accuracy baseline on the evaluation split?
-- Output: confusion-matrix counts by actual and predicted returned value (0/1).
-- Assumption: with no input table, BigQuery uses the model's held-out evaluation split.
-- This reads the saved model's evaluation data and does not scan source tables.
-- Run: 2026-11-19 22:52:07 HST (UTC-10); job: thelook-ecommerce-511800:US.job_TxPxGYpm5U26b9ZMafSYePhfR5m0
-- Usage: 0 bytes processed; 0 bytes billed.
-- Result: actual 0 = 3,961, actual 1 = 1,525; all 5,486 were predicted 0.
SELECT *
FROM ML.CONFUSION_MATRIX(
  MODEL `thelook-ecommerce-511800.busm410_cp2.cp2_return_logistic_model`
);
