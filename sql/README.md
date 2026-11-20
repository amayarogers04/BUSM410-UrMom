# SQL Query Archive

CP1 statements were recovered from BigQuery job history on 2026-11-17. Each executed SQL file records its job ID and run time (Hawaii time); those queries were not rerun during recovery.

## CP1 archived queries
1. [01_schema_table_counts.sql](01_schema_table_counts.sql): table names, fields, and row counts.
2. [02_orders_by_month_status.sql](02_orders_by_month_status.sql): order status by month.
3. [03_repeat_customers_by_year.sql](03_repeat_customers_by_year.sql): same-year repeat customers.
4. [04_event_type_profile.sql](04_event_type_profile.sql): events and sessions by event type.
5. [05_product_to_purchase_overall.sql](05_product_to_purchase_overall.sql): product-view sessions followed by purchase.
6. [06_product_to_purchase_by_traffic_source.sql](06_product_to_purchase_by_traffic_source.sql): conversion by traffic source.
7. [07_product_to_purchase_by_year.sql](07_product_to_purchase_by_year.sql): conversion by year.
8. [08_product_to_purchase_by_browser.sql](08_product_to_purchase_by_browser.sql): conversion by browser.
9. [09_category_return_screen.sql](09_category_return_screen.sql): category return screen.
10. [10_mature_cohort_quality_check.sql](10_mature_cohort_quality_check.sql): cohort and join quality.
11. [11_men_accessories_benchmark.sql](11_men_accessories_benchmark.sql): final CP1 benchmark.

The monthly usage check (job `job_s6kXWySWtI3c34Kbu0rmkpR09DtR`) is omitted because it was an allowance check, not project analysis.

## CP2
12. [12_build_cp2_analysis_table.sql](12_build_cp2_analysis_table.sql): creates the analysis table; executed 2026-11-19 21:47 HST (UTC-10), job `thelook-ecommerce-511800:US.job_UiG4Fp7V8JOFT_labk7BqzyLxIgT`; 8.75 MB processed, 30 MB billed.
13. [13_cp2_analysis_table_checks.sql](13_cp2_analysis_table_checks.sql): table validation; executed 2026-11-19 21:58:46 HST (UTC-10), job `thelook-ecommerce-511800:US.job_piJglxGpz3DmAorFMub5YtJzK78W`; 2.41 MB processed, 10 MB billed.
14. [14_category_return_rates_by_year.sql](14_category_return_rates_by_year.sql): category and year splits; executed 2026-11-19 22:09:19 HST (UTC-10), job `thelook-ecommerce-511800:US.job_OatrjCbvgX7Kc55aKAyR1ukK7Omt`; 758.63 KB processed, 10 MB billed.
15. [15_return_rate_by_brand.sql](15_return_rate_by_brand.sql): brand return rates; executed 2026-11-19 22:18:04 HST (UTC-10), job `thelook-ecommerce-511800:US.job_zG_Na-JNzsbxbdUCfJlUsw05spuU`; 525.15 KB processed, 10 MB billed.
16. [16_return_rate_by_price_quintile.sql](16_return_rate_by_price_quintile.sql): sale-price comparison; executed 2026-11-19 22:26:46 HST (UTC-10), job `thelook-ecommerce-511800:US.job_bJNwWk14ahJRApQQ1LMaIuDF6E68`; 426.67 KB processed, 10 MB billed.
17. [17_return_rate_by_age.sql](17_return_rate_by_age.sql): age comparison; executed 2026-11-19 22:32:51 HST (UTC-10), job `thelook-ecommerce-511800:US.job_4bocIvc_5ywr1TXnf2Me6HuOzjy0`; 426.67 KB processed, 10 MB billed.
18. [18_train_return_logistic_model.sql](18_train_return_logistic_model.sql): trained the logistic regression with approved brand grouping; job `thelook-ecommerce-511800:US.job_WjA89O0M7Ry0sDupuxB_kbS1S-yH`, 2026-11-19 22:39 HST, 1.14 MB processed, 10 MB billed.
19. [19_evaluate_return_logistic_model.sql](19_evaluate_return_logistic_model.sql): evaluation metrics; job `thelook-ecommerce-511800:US.job_eBQ2oHXbNWGlcF1IhYwznJiiouDb`, 2026-11-19 22:49 HST; 0 bytes processed/billed.
20. [20_return_model_confusion_matrix.sql](20_return_model_confusion_matrix.sql): evaluation split confusion matrix; job `thelook-ecommerce-511800:US.job_TxPxGYpm5U26b9ZMafSYePhfR5m0`, 2026-11-19 22:52 HST; 0 bytes processed/billed.
21. [21_return_logistic_model_weights.sql](21_return_logistic_model_weights.sql): standardized weights and p-values; job `thelook-ecommerce-511800:US.job_eos7zWaJSdW_22YJnHHEEkhNvG9-`, 2026-11-19 22:55 HST; 7.04 KB processed, 10 MB billed. Full result: [CSV](../model/return_logistic_weights_query21_results.csv).

## CP2 query workflow
Continue numbering at 22. Save one step per numbered file with a purpose comment. Before a team run, label it DRAFT and state the question, tables/fields, cohort, assumptions, and byte estimate when available. After the team runs it, preserve the exact SQL, BigQuery job ID, and run time. Never invent results or job metadata. The agent does not run BigQuery queries.

## CP1 method
- Join `order_items.product_id` to `products.id`.
- Include non-null deliveries on or before `DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY)`; this cutoff is an analysis choice.
- A non-null `returned_at` marks a return.
- The peer group is all other items in Men; pooled counts make it item-weighted.
- The cutoff changes over time, so reruns may differ.