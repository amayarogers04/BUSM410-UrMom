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
CP2 used returned/not returned as Y, with price, customer age, the Men Accessories indicator, and grouped brand as Xs. The refreshed cohort showed a -0.38 percentage-point Accessories difference, while the classifier matched the 72.20% majority-class baseline and predicted no returns. No predictor showed a robust adjusted association after accounting for the many brand comparisons. See [findings.md](findings.md), [model/plan.md](model/plan.md), and [model/model_card.md](model/model_card.md).


## CP2 reflection
In the later CP2 cohort, the Accessories rate was 28.12% versus 28.50% for other Men categories, and the logistic model did not beat the majority-class baseline; this suggests the CP1 gap needs more investigation rather than a product decision. The 60-day cohort cutoff changed, so the two gaps are not a like-for-like comparison.
