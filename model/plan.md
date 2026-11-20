# CP2 Model Plan (Preliminary)

Instructor feedback recommends considering logistic regression with returned/not-returned as the outcome and price, brand, age, and similar fields as candidate predictors. CP2 instructions are not published; this plan is provisional.

## Proposed outcome
- **Y:** `returned_at IS NOT NULL`, represented as returned = 1 and not returned = 0.
- **Observation:** one `order_items` row joined to `products`.
- **Initial cohort candidate:** delivered items at least 60 days before query date, matching CP1. Revisit when official requirements and prediction question are available.

## Candidate predictors to confirm
- **Price:** `order_items.sale_price` is in the team schema export; confirm it fits the decision and is known at prediction time.
- **Brand:** `products.brand` is in the export; inspect missingness and category counts.
- **Age:** not defined yet. Clarify whether it means product, customer, or item age, then verify its field and availability.
- Select other Xs only after requirements and the management question are clear.

## Before fitting
1. Confirm official CP2 requirements and prediction timing.
2. Check feature availability and missingness.
3. Avoid leakage: do not use return dates or information unavailable at prediction time as Xs.
4. Agree on train/holdout design and BigQuery ML syntax before running.
5. Evaluate classification metrics; do not describe observational associations as causes.

No CP2 feature queries or models have been run. This is a plan, not results.
