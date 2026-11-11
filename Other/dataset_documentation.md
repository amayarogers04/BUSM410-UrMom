# Dataset Documentation

## Source
- **Dataset:** `bigquery-public-data.thelook_ecommerce`
- **Query project identified by the team:** `thelook-ecommerce-511800`
- Google describes the public dataset program and query billing in [BigQuery public datasets](https://docs.cloud.google.com/bigquery/public-data). Its docs also demonstrate use of theLook Ecommerce `order_items` and `products` tables in [Analyze data with Gemini assistance](https://docs.cloud.google.com/bigquery/docs/gemini-analyze-data).
- **Schema reference:** team-provided BigQuery schema export. Raw schema and result CSVs remain outside this repository.
- **Documentation checked:** 2026-11-10.

## Tables and fields used
The team confirmed these tables: `distribution_centers`, `events`, `inventory_items`, `order_items`, `orders`, `products`, and `users`.

Fields used for CP1, as listed in the team's schema export:
- `order_items`: `id`, `order_id`, `user_id`, `product_id`, `inventory_item_id`, `status`, `created_at`, `shipped_at`, `delivered_at`, `returned_at`, `sale_price`.
- `products`: `id`, `cost`, `category`, `name`, `brand`, `retail_price`, `department`, `sku`, `distribution_center_id`.

Consult the current BigQuery schema before using fields from other tables.

## Analysis unit and relationship
One row per `order_items.id), with product attributes from `products`; join on `order_items.product_id = products.id`. The team's quality output for the mature cohort had 54,922 rows and distinct item IDs, with zero missing/unmatched product IDs. See [table diagram](table_diagram.md) and [query 02](../sql/02_return_data_quality.sql).

## Coverage and limitations
- CP1 uses only `order_items` and `products` from the seven-table dataset.
- Delivery dates in the checked mature cohort ranged from 2019-01-11 to 2026-09-12, based on the team's query output.
- A return is a non-null `returned_at`; the 60-day rule is our choice, not a verified policy.
- Available schema/results do not establish the currency or accounting meaning of `sale_price`; the findings use sale-price units, not confirmed dollars or profit.
- Quality checks apply to the queried mature cohort, not every row or field in the dataset.
