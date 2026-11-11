# BUSM 410 - Big Data and Advanced Analytics

**Team:** Ur Mom | **Canvas team:** 11
**Partners:** Amaya Rogers, Rachel Garside, Brylle Tejada
**Dataset:** `bigquery-public-data.thelook_ecommerce`
**Google Cloud project ID:** `thelook-ecommerce-511800`

## CP1 problem framing

We ask whether mature delivered items in **Men Accessories** are returned more often than items in the other Men categories. Team-run BigQuery results show 564 returns among 1,784 mature Men Accessories items (31.61%), compared with 7,285 among 25,739 items in other Men categories (28.30%), a **3.31 percentage-point gap**.

At the peer rate, the focus group would have about 505 returns, or about 59 fewer than observed. Using the focus group's average returned-item sale price gives an estimated 2,539.20 **sale_price units** associated with the excess. This is gross sale-price value, not confirmed currency, profit, or recoverable money. The 60-day maturity cutoff is our analysis choice, not a verified return policy.

**Row grain:** one `order_items` row joined to its product in `products`.

## Repository guide

| Path | Purpose |
|---|---|
| [charter.md](charter.md) | CP1 question, decision, and scope |
| [findings.md](findings.md) | Gap, benchmark, value, limitations, and chart |
| [sql/README.md](sql/README.md) | Query method and preparation |
| [sql/](sql/) | Numbered CP1 queries |
| [Other/dataset_documentation.md](Other/dataset_documentation.md) | Dataset source and fields |
| [Other/table_diagram.md](Other/table_diagram.md) | Analysis-table relationship |
| [Other/audit_protocol.md](Other/audit_protocol.md) | How we review AI-assisted work |
| [Other/audit_log.md](Other/audit_log.md) | Checks made during the project |
| [.agents/skills/project-audit/SKILL.md](.agents/skills/project-audit/SKILL.md) | Audit skill |
| [visuals/gap_chart.svg](visuals/gap_chart.svg) | CP1 comparison chart |
| [visuals/google-IAM.png](visuals/google-IAM.png) | BigQuery setup evidence |

The reported counts and calculations are in [findings.md](findings.md); the current query drafts are in [sql/](sql/).
