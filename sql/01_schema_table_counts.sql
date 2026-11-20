-- BigQuery job ID: job_ps1ShkZ68IrOOMFLOE2n-eeggxNV
-- Run time: 2026-11-10 14:14:54 HST
SELECT 
  t.table_id AS table_name, 
  c.columns AS field_names, 
  t.row_count
FROM 
  `bigquery-public-data.thelook_ecommerce.__TABLES__` t
JOIN 
  (
    SELECT 
      table_name, 
      STRING_AGG(column_name, ', ' ORDER BY ordinal_position) AS columns
    FROM `bigquery-public-data`.thelook_ecommerce.INFORMATION_SCHEMA.COLUMNS
    GROUP BY table_name
  ) c
  ON t.table_id = c.table_name
ORDER BY table_name;