# SQL Query Archive

Statements below were recovered from BigQuery job history on 2026-11-17. Each SQL file records the BigQuery job ID and run time (Hawaii time). They were not rerun during recovery.

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

## CP1 method
- Join `order_items.product_id` to `products.id`.
- Include non-null deliveries on or before `DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY)`; this cutoff is an analysis choice.
- A non-null `returned_at` marks a return.
- Peer group is all other items in Men; pooled counts make it item-weighted.
- The cutoff changes over time, so reruns may differ.

## CP2 query workflow
Draft and review one short query at a time. Before running, record its question, fields, assumptions, and estimated bytes when available. After a team member runs it, preserve the submitted SQL, job ID, and run time. Keep drafts separate from this executed-query archive. The agent does not run queries.
