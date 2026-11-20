-- Executed by Brylle in BigQuery; exact statement archived from the job details.
-- Question: how well does the trained logistic model classify held-out items?
-- Fields: evaluation metrics for the model's BigQuery-managed evaluation split.
-- Assumption: use the evaluation split created during training; do not supply new data.
-- This evaluates the saved model and does not rescan the public source tables.
-- Run: 2026-11-19 22:49:01 HST (UTC-10); job: thelook-ecommerce-511800:US.job_eBQ2oHXbNWGlcF1IhYwznJiiouDb
-- Usage: 0 bytes processed; 0 bytes billed.
SELECT *
FROM ML.EVALUATE(
  MODEL `thelook-ecommerce-511800.busm410_cp2.cp2_return_logistic_model`
);
