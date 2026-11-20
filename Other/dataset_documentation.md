# Dataset Documentation

## Source
- **Dataset:** `bigquery-public-data.thelook_ecommerce`
- **Query project identified by the team:** `thelook-ecommerce-511800`
- Google documents the [BigQuery public dataset program](https://docs.cloud.google.com/bigquery/public-data).
- **Schema reference:** team-provided BigQuery schema export. Brylle confirmed `users.id` and `users.age` in that export on 2026-11-19.
- The team created dataset `thelook-ecommerce-511800.busm410_cp2` in US and ran Query 12 to create `cp2_analysis_table` on 2026-11-19. Query 13 checked the resulting table.
- TheLook public data is in the US location; match the destination dataset location. See [Google Skills BigQuery dataset setup](https://www.skills.google/focuses/124841).
- CP1 job history was reviewed on 2026-11-17.

## Tables and fields used
The team confirmed these tables: `distribution_centers`, `events`, `inventory_items`, `order_items`, `orders`, `products`, and `users`.

Fields listed in the team's schema export:
- `order_items`: `id`, `order_id`, `user_id`, `product_id`, `inventory_item_id`, `status`, `created_at`, `shipped_at`, `delivered_at`, `returned_at`, `sale_price`.
- `products`: `id`, `cost`, `category`, `name`, `brand`, `retail_price`, `department`, `sku`, `distribution_center_id`.
- `users`: `id`, `age` (confirmed by Brylle from the team schema export).

## Analysis unit and relationships
One row per `order_items.id`. CP1 joins `order_items.product_id = products.id`; CP2 also joins `order_items.user_id = users.id` to add customer age. Keep the user join left-sided so missing user matches do not silently remove order items. See [table diagram](table_diagram.md), [CP1 quality query](../sql/10_mature_cohort_quality_check.sql), and [CP2 analysis table](../sql/12_build_cp2_analysis_table.sql).

## Coverage and limitations
- CP1 uses `order_items` and `products`; CP2 analysis table also uses `users`.
- The CP1 mature cohort's delivery dates ranged from 2019-01-11 to 2026-09-12, based on team-run output. Query 13 reported CP2 dates from 2019-01-30 to 2026-09-21. The cutoffs are based on separate run dates.
- A return is a non-null `returned_at`; the 60-day cutoff is a project choice, not verified policy.
- Available schema/results do not establish the currency/accounting meaning of `sale_price`; findings use sale-price units, not confirmed dollars or profit.
- CP1 quality checks apply to the queried cohort, not every row or field in the dataset.

BigQuery's `CURRENT_DATE()` uses UTC when no time zone is supplied ([GoogleSQL date function reference](https://docs.cloud.google.com/bigquery/docs/reference/standard-sql/date_functions)). The CP1 and CP2 table runs used different 60-day cutoffs; their row counts should not be compared as if they used the same cohort date.