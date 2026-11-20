# CP2 Model Card

**Status:** Model evaluation and coefficient review are complete; final team interpretation and charter update remain.

## Model setup
- Outcome (Y): returned (1) / not returned (0)
- Row unit and cohort: one order item in the CP2 delivered-item cohort, with delivery at least 60 days before the analysis date (project cutoff choice)
- X variables: Men Accessories indicator, sale_price, grouped brand (62 brands with at least 100 items, `Other`, and `Unknown`), customer_age
- Model table and model name: `thelook-ecommerce-511800.busm410_cp2.cp2_return_logistic_model`; created by job `thelook-ecommerce-511800:US.job_WjA89O0M7Ry0sDupuxB_kbS1S-yH` on 2026-11-19 22:39 HST (completed 22:41 HST); 1.14 MB processed, 10 MB billed
- Training/evaluation row counts: 21,821 / 5,486. The evaluation count comes from Query 20; training count is calculated as 27,307 total items minus 5,486 evaluation items.
- If fewer than 500 analysis rows, say BigQuery held out no evaluation rows.

## Report card

| Measure | Your number | What it means |
|---|---:|---|
| Accuracy | 72.20% | Share of evaluation rows classified correctly |
| Baseline | 72.20% (3,961/5,486) | Share correct when always predicting the majority class |
| ROC AUC | 0.5138 | 0.5 is chance-level; closer to 1.0 is stronger |

Query 20 confusion matrix: 3,961 actual non-returns and 1,525 actual returns; the model predicted non-return for all 5,486 held-out items. The majority-class baseline is 3,961/5,486 = 72.20%, equal to model accuracy. Query 20 job `thelook-ecommerce-511800:US.job_TxPxGYpm5U26b9ZMafSYePhfR5m0`, run 2026-11-19 22:52 HST; 0 bytes processed/billed.

The model does not beat the baseline (72.20% vs. 72.20%). Its ROC AUC of 0.5138 is close to 0.5, so it is not ready to predict for a business decision. At the default threshold it failed to identify any held-out returns. Coefficients may still describe adjusted associations, but do not prove causes.

## Adjusted associations

Weights below are standardized (`STANDARDIZE=TRUE`) so magnitudes are more comparable across differently scaled inputs. Brand coefficients compare each listed level with the omitted `Other` reference level. P-values are unadjusted; the intercept and reference row are omitted. The complete team CSV is archived at [return_logistic_weights_query21_results.csv](return_logistic_weights_query21_results.csv).

| X / level | Standardized coefficient | P-value | Reading |
|---|---:|---:|---|
| Brand: 2(x)ist | -0.6934 | 0.0148 | Nominally lower adjusted association than Other; exploratory. |
| Brand: Perry Ellis | +0.3737 | 0.0319 | Nominally higher adjusted association than Other; exploratory. |
| Brand: Volcom | -0.2759 | 0.0377 | Nominally lower adjusted association than Other; exploratory. |
| Brand: Dickies | +0.2311 | 0.0780 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Levi's | -0.3617 | 0.0813 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Carhartt | +0.1649 | 0.0984 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Ralph Lauren | -0.3168 | 0.1016 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Wigwam | +0.3569 | 0.1045 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: G-Star | -0.3534 | 0.1219 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: 7 For All Mankind | -0.2285 | 0.2001 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Hanes | +0.1673 | 0.2123 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Paul Fredrick | -0.2820 | 0.2134 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Unknown | -0.7722 | 0.2203 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Calvin Klein | -0.1213 | 0.2460 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Champion | -0.2085 | 0.2953 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Woolrich | +0.2365 | 0.2961 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Van Heusen | -0.2637 | 0.3056 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Hot Topic | +0.1942 | 0.3126 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Ray-Ban | +0.2434 | 0.3288 | No clear adjusted association vs. Other (p >= 0.05). |
| is_men_accessories | -0.0151 | 0.3522 | No clear adjusted association (p >= 0.05). |
| Brand: Harley-Davidson | +0.1811 | 0.3625 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Quiksilver | -0.1029 | 0.3731 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Polo Ralph Lauren | -0.2015 | 0.3759 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Oakley | +0.1605 | 0.3772 | No clear adjusted association vs. Other (p >= 0.05). |
| customer_age | -0.0128 | 0.3934 | No clear adjusted association (p >= 0.05). |
| Brand: Kenneth Cole REACTION | -0.2059 | 0.4151 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: True Religion | -0.1662 | 0.4341 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Allegra K | -0.0879 | 0.4438 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Kenneth Cole | +0.1389 | 0.4501 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Ed Hardy | +0.1596 | 0.4534 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Port Authority | -0.1511 | 0.4857 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Original Penguin | -0.1563 | 0.5111 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Joe's Jeans | +0.1487 | 0.5205 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: adidas | +0.1169 | 0.5283 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: O'Neill | +0.0899 | 0.5757 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Fox | -0.0992 | 0.5934 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: IZOD | -0.0988 | 0.6047 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Diesel | +0.0612 | 0.6309 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Speedo | -0.0864 | 0.6387 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Wrangler | +0.0587 | 0.6442 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Dockers | -0.0580 | 0.6497 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Tommy Hilfiger | -0.0507 | 0.6822 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Duofold | +0.0860 | 0.6914 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Hurley | +0.0550 | 0.6954 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Haggar | -0.0664 | 0.6976 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Jockey | -0.0768 | 0.7124 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: DC | -0.0575 | 0.7168 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Majestic International | +0.0723 | 0.7342 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Nautica | -0.0378 | 0.7363 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Columbia | -0.0451 | 0.7478 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Orvis | -0.0579 | 0.7764 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Lucky Brand | +0.0571 | 0.7788 | No clear adjusted association vs. Other (p >= 0.05). |
| sale_price | +0.0043 | 0.7908 | No clear adjusted association (p >= 0.05). |
| Brand: Geoffrey Beene | -0.0596 | 0.7930 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: SmartWool | -0.0499 | 0.8006 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Nike | -0.0513 | 0.8034 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Billabong | -0.0573 | 0.8084 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Gary Majdell Sport | -0.0610 | 0.8131 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: RVCA | -0.0384 | 0.8619 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Calvin Klein Jeans | +0.0363 | 0.8751 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: LRG | -0.0253 | 0.9157 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Fruit of the Loom | -0.0192 | 0.9183 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: HUGO BOSS | -0.0107 | 0.9426 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Tommy Bahama | +0.0134 | 0.9441 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Lee | -0.0151 | 0.9469 | No clear adjusted association vs. Other (p >= 0.05). |
| Brand: Icebreaker | -0.0034 | 0.9889 | No clear adjusted association vs. Other (p >= 0.05). |
No robustly supported link survives correction for 63 brand contrasts: the Bonferroni threshold is 0.05/63 = 0.00079 (agent calculation), and no coefficient meets it. The two strongest unadjusted brand contrasts are exploratory: 2(x)ist has a negative standardized coefficient (-0.6934, p=0.0148), so holding the other Xs steady it is associated with lower modeled return odds than the `Other` reference level; Perry Ellis has a positive standardized coefficient (+0.3737, p=0.0319), associated with higher modeled return odds than `Other`. Neither survives the multiple-comparison correction. Men Accessories (p=0.3522), customer age (p=0.3934), and sale price (p=0.7908) also show no clear adjusted association. These are observational results and do not establish causes.
## Part A findings
- **Gap splits:** Query 14 found Men Accessories at 28.12% versus other Men categories at 28.50% in this later cohort, a -0.38 percentage-point difference; the gap changed direction by year and earlier yearly counts were small. This does not directly overturn CP1 because the 60-day cutoff moved between runs.
- **One-X comparisons:** Query 15 found 844 of 1,273 brand values had fewer than 10 items, so raw brand rates are sparse and descriptive. Query 16 price-quintile rates ranged from 28.10% to 29.06% without a steady trend. Query 17 age rates fluctuated; ages 12–20 were 29.21% and ages 60–70 were 28.47%.
- **Analysis-table checks:** Query 13 reports 27,307 rows and 27,307 distinct item IDs; no invalid outcomes, unsettled deliveries, negative prices/ages, missing price/age/category, or unmatched users. There were 25 missing brand values, filled as `Unknown`.
- **Second-way check:** Brylle summed Query 14's 112 `item_count` rows to 27,307, matching Query 13.
AI assisted with CP2 planning and interpretation. Team review remains necessary before submission.
