# CP2 Plan: Drivers and Model

## Question and unit
Continue the CP1 question by examining factors associated with returns among items in the Men department, including the Men Accessories gap. The row unit remains one `order_items` row.

## Outcome and cohort
- **Y:** `returned_at IS NOT NULL`, encoded 1 for returned and 0 for not returned.
- Use delivered items at least 60 days before the query date so the return outcome has time to settle. This cutoff is a project choice, not a verified store policy.
- Use only information available before the outcome as Xs. Do not use `returned_at` or other post-outcome information as predictors.
- Keep the CP1 Men scope and include the Accessories-versus-other-Men group.

## Candidate predictors
- `order_items.sale_price` (item price).
- `products.brand`.
- CP1 focus/category group (Accessories vs other Men categories).
- Customer age from `users.age`, confirmed by Brylle. The `users.id` and `order_items.user_id` join fields are also confirmed.
- Add other Xs only when the field, meaning, and pre-outcome availability are confirmed. Explain any CP1 X that is omitted.

## Dataset and first table
- The team created dataset `thelook-ecommerce-511800.busm410_cp2` in US.
- Query 12 created `cp2_analysis_table`; job `thelook-ecommerce-511800:US.job_UiG4Fp7V8JOFT_labk7BqzyLxIgT`, run 2026-11-19 21:47 HST. Team-reported usage: 8.75 MB processed, 30 MB billed.

## Part A: look before modeling
1. Build one analysis table with a single `CREATE OR REPLACE TABLE` statement, one row per item, binary Y, and approved Xs.
2. Log five checks with team-run results: (a) row count vs distinct item IDs; (b) missing values in each model column; (c) valid 0/1 Y and settled cohort; (d) plausible values/dates; (e) join coverage and category counts.
3. Split the gap at least two ways, including useful time and category views; add one sentence for each result.
4. Compare at least three Xs with average Y by value; add one sentence per comparison.
5. Independently verify one key count or rate a second way and log the human check.

## Part B: model and interpretation
- Fit BigQuery ML logistic regression with binary Y and approved Xs.
- Use assignment options: `calculate_p_values = TRUE`, `category_encoding_method = 'DUMMY_ENCODING'`, `max_iterations = 50`, and `early_stop = FALSE`.
- Let BigQuery use its default data split. If there are fewer than 500 rows, disclose that no evaluation rows were held out.
- Record `ML.EVALUATE` metrics, calculate the majority-class baseline, and complete [model_card.md](model_card.md).
- Retrieve `ML.ADVANCED_WEIGHTS`; report each X's coefficient, p-value, and reading. Skip intercept/reference rows and explain the two strongest supported links.
- Interpret coefficients as adjusted associations, not proof of causes.

## Query sequence and status
CP1 archives queries 01–11. Queries 12–21 have been run; Query 18 created the logistic model and Query 19 returned evaluation metrics. Query 20 confirmed the evaluation confusion matrix and exact baseline. Query 21 returned standardized weights and p-values; the complete CSV and interpretation are recorded in the model card. Table checks, two gap splits, three candidate-X comparisons, and the second-way count check are complete. Evaluation metrics and the majority-class baseline are recorded; the coefficient interpretation and CP2 charter reflection are drafted; partner review and final submission remain. Save each team-run statement with a purpose comment, BigQuery job ID, and run time. Clearly label drafts; do not invent results or job details.

## Final review
The CP2 reflection is in [../charter.md](../charter.md). The team should review it against the results and revise if needed before submission.

## Query 13 validation results
- Team-provided output: 27,307 rows and 27,307 distinct order-item IDs; 0 duplicate rows.
- 0 invalid/null Y values, rows outside the maturity cutoff, negative prices/ages, missing prices/ages/categories, or unmatched users.
- 25 missing brands were flagged and filled as `Unknown` in the analysis table.
- Observed ranges: sale_price 1.50–999.00; customer age 12–70; delivery dates 2019-01-30 to 2026-09-21. These are observed ranges, not source-documented business limits.
- The table has 14 Men product categories; Accessories has 1,700 items. Full counts are in the Query 13 result.
- The CP1 total (27,523 items) and CP2 table total (27,307) use moving 60-day cutoffs from different run dates. Compare them only after fixing a common cutoff.
## Query 14 category/year results
- Agent aggregation of Brylle's CSV: 27,307 items and 7,776 returns overall (28.48%).
- Men Accessories: 478/1,700 (28.12%); all other Men categories: 7,298/25,607 (28.50%), a -0.38 percentage-point difference. The CP1 positive gap did not repeat in this CP2 cohort; the cutoffs differ by run date, so this is not a like-for-like comparison.
- Across years, the Accessories gap varied: +13.77 points in 2020 (22/55 vs 198/755), -5.02 in 2022 (33/142 vs 602/2,130), and +1.53 in partial 2026 (151/509 vs 2,102/7,470). Small earlier counts make annual rates noisy; these are descriptive, not causal.
## Query 15 brand comparison
- Agent aggregation of Brylle's CSV: 1,273 brand values, 27,307 items, and 7,776 returns (28.48% overall).
- 844 brand values have fewer than 10 items, including 128 single-item values; only 62 have at least 100 items. Rates for rare brands are too sparse for confident ranking.
- Team-approved model preparation: preserve original `brand` and `brand_was_missing` in `cp2_analysis_table`. In the model query, keep the 62 brand values with at least 100 items; map other non-missing values to `Other`; preserve `Unknown` separately. This creates 64 brand levels (about 63 dummy variables). The 100-item cutoff is a documented project choice, not a business rule.
## Query 16 sale-price comparison
- Team CSV rates by rank quintile: Q1 28.49%, Q2 28.10%, Q3 28.44%, Q4 29.06%, Q5 28.29% (27,307 items total).
- The maximum spread is 0.96 percentage points and the pattern is not monotonic. This univariate view shows no clear return-rate gradient by sale-price rank; it does not establish an adjusted model effect.
## Query 17 customer-age comparison
- Team CSV covers ages 12–70 and sums to 27,307 items and 7,776 returns.
- Agent aggregation: ages 12–20 returned at 29.21% (1,213/4,153); ages 60–70 at 28.47% (1,476/5,185). Individual-age rates varied without a steady pattern, so this is descriptive rather than evidence of a linear age effect.