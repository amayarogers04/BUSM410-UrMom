# CP1 Gap Charter

## Question
Among delivered items at least 60 days old, is the return rate for Men Accessories higher than the rate for all other Men categories?

## Decision
Should a manager prioritize a follow-up review of Men Accessories products and their return reasons? The comparison can identify a segment for investigation; it cannot establish why returns occur or prove an intervention will reduce them.

## Scope
- **Dataset:** `bigquery-public-data.thelook_ecommerce`.
- **Row grain:** one `order_items` row joined to `products`.
- **Outcome (Y):** returned when `returned_at` is not null.
- **Cohort:** non-null `delivered_at` at least 60 days before query date, with a matching product.
- **Focus:** executed query selected `products.category = 'Accessories'` and `products.department = 'Men'`; its label was “Men Accessories.”
- **Benchmark:** all other products where `products.department = 'Men'`, same cohort, item-weighted.
- **Value:** expected excess count multiplied by focus-group average returned-item `sale_price`; gross sale-price estimate, not profit or confirmed recoverable value.
- **Out of scope:** causal claims, policy changes, or generalizing to all ecommerce.

## Success criteria
- Report both rates and the percentage-point gap on a shared cohort.
- Validate the join and basic date/price quality.
- Translate the gap to an item-count estimate and label value assumptions.
- Recommend a follow-up question without claiming causation.


## CP2 handoff
Instructor feedback suggests logistic regression with returned/not returned as Y and price, brand, and age as candidate Xs. This is preliminary; official instructions are pending. See [model/plan.md](model/plan.md).
