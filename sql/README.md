# SQL Query Notes

These are three numbered query drafts for the CP1 return analysis. The counts in findings came from queries the team ran; their exact original SQL text was not saved here. Review these drafts and check estimated bytes before rerunning. They read only required fields and avoid `SELECT *`.

1. [01_category_return_rates.sql](01_category_return_rates.sql): category screen for mature delivered items.
2. [02_return_data_quality.sql](02_return_data_quality.sql): identity, join, price, and date checks.
3. [03_men_accessories_peer_benchmark.sql](03_men_accessories_peer_benchmark.sql): final comparison with all other Men categories.

## Method
- Join `order_items.product_id` to `products.id`.
- Include non-null deliveries on or before `DATE_SUB(CURRENT_DATE(), INTERVAL 60 DAY)`. The 60-day window is an analysis choice, not a verified return policy.
- Count an item as returned when `returned_at` is not null.
- Define peers as all other items where `products.department = 'Men'`; pool counts so the benchmark is item-weighted.
- The team's quality result found distinct item IDs, matched products, non-missing/non-negative prices, and no invalid return-date ordering in the checked cohort.
- The cutoff rolls forward when rerun, so results can change.

## Cost and review
The queries select a small set of columns and aggregate in BigQuery. Before running, check estimated bytes and remaining free allowance. The agent does not run queries on the team's behalf.

Earlier exploratory results for orders, repeat customers, and event-log comparisons are summarized in [the audit log](../Other/audit_log.md). Their exact SQL text was not preserved here; these files are the current query drafts for the final return analysis.
