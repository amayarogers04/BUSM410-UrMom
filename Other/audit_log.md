# Audit Log

## How I worked with the agent

I used the agent as a junior analyst while keeping control of the work: I ran the BigQuery queries myself and shared job IDs and result files so the saved SQL and summaries could be tied to actual runs. I checked the team schema export for `users.age`, `users.id`, and `order_items.user_id` (entry 13), and independently summed Query 14's 112 `item_count` rows to confirm the total matched Query 13 (entry 16). I shared the instructor's correction about saving exact SQL (entries 10–11) and reviewed the rare-brand counts before approving the model's `Other` grouping (entry 18).

This is a good review pattern because I run the work, ask for evidence, and make the decisions. A successful query and shared output confirm execution; by themselves, they do not independently validate the SQL logic or the agent's interpretation. Entries 13 and 16 are my recorded independent checks. Entry 18 records my modeling decision, not data validation. I have not independently checked every query or interpretation.

## Summary

| Category | Count |
|---|---:|
| Caught an error | 2 |
| Verified a claim | 2 |
| Separated fact from opinion | 0 |
| Changed the analysis | 2 |
| Improved the agent's instructions | 1 |

## Caught an error

| Entry number | Date | What the agent said or did | How the human checked it | Result |
|---:|---|---|---|---|
| 10 | 2026-11-17 | Agent had saved reconstructed CP1 SQL drafts instead of the original analysis statements. | I shared instructor feedback that the files did not match the queries run; agent recovered statements from BigQuery history. Team review of replacements is pending. | The archive now records the recovered statements, job IDs, and run times; no query was rerun. |
| 21 | 2026-11-19 | Agent review found that several entries under “Verified a claim” documented query runs and shared outputs without showing an independent check. | I asked the agent to describe how I work with and check it, while making clear which checks I actually performed. | Moved run-only records to the execution-evidence section, distinguished them from independent checks, and did not claim that every query or interpretation was independently validated. |

## Query runs shared for analysis (execution evidence, not independent checks)

These preserved records show that I ran the queries and shared results. They are not counted as independent checks of the agent's work.

| Entry number | Date | What the agent said or did | How I checked it | Result |
|---:|---|---|---|---|
| 1 | 2026-11-10 | Agent proposed measuring same-year repeat customers by year. | I ran the query in BigQuery and shared the result CSV. | The reported rate rose from 5.13% in 2019 to 13.73% in 2025; this measure does not support a declining-retention gap. |
| 2 | 2026-11-10 | Agent proposed profiling event counts and distinct sessions by event type. | I ran the query in BigQuery and shared the result CSV. | Six event types were returned. The output profiles events and sessions; it does not by itself measure session conversion. |
| 3 | 2026-11-10 | Agent proposed measuring product-view sessions followed by a purchase. | I ran the query in BigQuery and shared the result CSV. | 181,049 of 681,049 product sessions had a later purchase in the same session (26.58%); this is a baseline, not yet a benchmarked gap. |
| 4 | 2026-11-10 | Agent proposed comparing product-to-purchase rates by traffic source. | I ran the query in BigQuery and shared the result CSV. | Rates ranged from 26.51% (YouTube) to 26.88% (Organic), a 0.37 percentage-point spread; the output does not show a large source gap. |
| 5 | 2026-11-10 | Agent proposed comparing product-to-purchase rates by year. | I ran the query in BigQuery and shared the result CSV. | The rate rose from 2.16% in 2019 to 38.59% in 2025; this trend does not support a declining-conversion gap. |
| 6 | 2026-11-10 | Agent proposed comparing product-to-purchase rates by browser. | I ran the query in BigQuery and shared the result CSV. | Rates ranged from 26.50% (Firefox) to 26.68% (Safari), a 0.18 percentage-point spread; the output does not show a meaningful browser gap. |
| 7 | 2026-11-10 | Agent proposed comparing returns by product category among delivered items at least 60 days old. | I ran the query in BigQuery and shared the result CSV. | The query returned 35 category groups. Men's Accessories had 564 returns among 1,784 mature delivered items (31.61%); a peer-weighted rate excluding that category is 28.58%, calculated by the agent from the CSV. |
| 8 | 2026-11-10 | Agent proposed a data-quality check for the mature-delivery return analysis and product join. | I ran the query in BigQuery and shared the result CSV. | Among 54,922 joined rows there were 54,922 distinct item IDs, no missing or unmatched product IDs, no missing or negative prices, no return-before-delivery dates, and no future return dates. Delivery dates ranged from 2019-01-11 to 2026-09-12. |
| 9 | 2026-11-10 | Agent proposed comparing Men Accessories with all other Men categories using the full mature-delivery cohort. | I ran the query in BigQuery and shared the result CSV. | Men Accessories returned 564 of 1,784 items (31.61%); other Men categories returned 7,285 of 25,739 (28.30%), a 3.31-point gap. This resolves the rough cross-department, thresholded comparison in entry 7. |
| 14 | 2026-11-19 | Agent drafted Query 13 to check the CP2 analysis table. | I ran it in BigQuery and shared the result CSV and job details. | 27,307 rows matched 27,307 distinct item IDs; no invalid outcomes/cohort dates, negative price or age, missing price/age/category, or unmatched users. 25 brands were missing and flagged; category counts were returned. This resolves the pending CP2 run status in entry 13. |
| 15 | 2026-11-19 | Agent drafted Query 14 to split returns by product category and delivery year. | I ran it in BigQuery and shared the result CSV and job details. | The CSV contains 112 year/category groups. Agent aggregation found 27,307 items, 7,776 returns (28.48%); Accessories 28.12% versus other Men 28.50%, with annual gaps changing direction. This is a different cutoff cohort from CP1. |
| 17 | 2026-11-19 | Agent drafted Query 15 to compare return rates by brand. | I ran it in BigQuery and shared the result CSV and job details. | The output covered 1,273 brand values and 27,307 items. Agent aggregation found 844 values with fewer than 10 items and 128 singletons, so sparse brand rates need caution. |
| 19 | 2026-11-19 | Agent drafted Query 16 to compare return rates across sale-price quintiles. | I ran it in BigQuery and shared the result CSV and job details. | The five rates ranged from 28.10% to 29.06% (0.96 percentage points) with no monotonic pattern; interpretation is unadjusted and descriptive. |
| 20 | 2026-11-19 | Agent drafted Query 17 to compare return rates by customer age. | I ran it in BigQuery and shared the result CSV and job details. | The result covers ages 12–70 and 27,307 items. Agent aggregation found 29.21% among ages 12–20 and 28.47% among ages 60–70; individual rates fluctuate. |

## Verified a claim

| Entry number | Date | What the agent said or did | How the human checked it | Result |
|---:|---|---|---|---|
| 13 | 2026-11-19 | Agent proposed joining CP2 order items to users for customer age. | I checked the team schema export and confirmed users.age, users.id, and order_items.user_id. | The age field and join-key names are confirmed by the team; the destination dataset is still pending and no CP2 query has run. |
| 16 | 2026-11-19 | Agent calculated the Query 14 item-count total from the CSV as 27,307. | I summed `item_count` across the 112 CSV rows and confirmed 27,307, matching Query 13. | The independent spreadsheet sum confirms the grouped total matches the analysis-table row count; no extra BigQuery query was needed. |

## Separated fact from opinion

| Entry number | Date | What the agent said or did | How the human checked it | Result |
|---:|---|---|---|---|

## Changed the analysis

| Entry number | Date | What the agent said or did | How the human checked it | Result |
|---:|---|---|---|---|
| 12 | 2026-11-17 | Agent revised the CP2 direction after CP1 feedback. | I shared instructor feedback: the about-2.5k value is small but acceptable to proceed; logistic regression with returned yes/no as Y and price, brand, age as candidate Xs was recommended. | CP1 remains the starting gap; a preliminary CP2 plan is recorded, with official instructions and the age definition pending. |
| 18 | 2026-11-19 | Agent recommended grouping rare brand values for the logistic model. | I approved keeping brands with at least 100 items, combining other non-missing values into `Other`, preserving `Unknown`, and applying the grouping only in the model query. | The raw analysis table remains unchanged; the model feature will have about 64 brand levels. |

## Improved the agent's instructions

| Entry number | Date | What the agent said or did | How the human checked it | Result |
|---:|---|---|---|---|
| 11 | 2026-11-17 | Agent instructions did not require preserving exact executed SQL. | I relayed the instructor correction that the SQL files were drafts and exact queries should be saved. | AGENTS.md and audit_protocol.md now require the submitted SQL, job ID, and run time for team-run queries. |
