# BUSM 410 - Big Data and Advanced Analytics

**Team:** Ur Mom | **Canvas team:** 11
**Partners:** Amaya Rogers, Rachel Garside, Brylle Tejada
**Dataset:** `bigquery-public-data.thelook_ecommerce`
**Google Cloud project ID:** `thelook-ecommerce-511800`

## CP1 problem framing

We ask whether mature delivered items in **Men Accessories** are returned more often than items in the other Men categories. Team-run BigQuery results show 564 returns among 1,784 mature Men Accessories items (31.61%), compared with 7,285 among 25,739 items in other Men categories (28.30%), a **3.31 percentage-point gap**. The executed query selected category Accessories within department Men and labeled that group “Men Accessories.”

At the peer rate, the focus group would have about 505 returns, or about 59 fewer than observed. The estimated 2,539.20 is in **sale_price units**, not confirmed currency, profit, or recoverable money. The instructor noted this estimate was small (about 2.5k) but accepted the gap as a CP2 starting point. The 60-day cutoff is our analysis choice, not a verified return policy.

**Row grain:** one `order_items` row joined to `products`.

## CP2: Drivers and Model

CP2 work is documented in [findings.md](findings.md), [model/plan.md](model/plan.md), and [model/model_card.md](model/model_card.md). The 27,307-row analysis table was checked; category/time splits and price, age, and brand comparisons are recorded. The logistic classifier matched the 72.20% majority-class baseline and predicted no returns; adjusted coefficients show no robust driver after accounting for multiple brand tests. The model is not ready for prediction.

## Repository guide

| Path | Purpose |
|---|---|
| [charter.md](charter.md) | CP1 question, decision, expected ending, and CP2 reflection |
| [findings.md](findings.md) | CP1 gap, benchmark, value, limitations, and chart |
| [model/plan.md](model/plan.md) | CP2 requirements and work sequence |
| [model/model_card.md](model/model_card.md) | CP2 report card and driver interpretation |
| [sql/README.md](sql/README.md) | Query workflow and executed-query archive |
| [sql/](sql/) | Numbered SQL with job IDs and run times; drafts labeled |
| [Other/dataset_documentation.md](Other/dataset_documentation.md) | Dataset source and fields |
| [Other/table_diagram.md](Other/table_diagram.md) | CP1 and CP2 table relationships |
| [Other/audit_protocol.md](Other/audit_protocol.md) | How we review AI-assisted work |
| [Other/audit_log.md](Other/audit_log.md) | Human checks made during the project |
| [.agents/skills/project-audit/SKILL.md](.agents/skills/project-audit/SKILL.md) | Audit skill |
| [visuals/gap_chart.svg](visuals/gap_chart.svg) | CP1 comparison chart |

Counts and rates are from team-run BigQuery results; CP1 statements are archived with job IDs and run times.
