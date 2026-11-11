# AGENTS.md

Read this before helping on our project.

## Project facts
- Team: Ur Mom. Partners: Amaya Rogers, Rachel Garside, Brylle Tejada. Canvas team: 11.
- Dataset: `bigquery-public-data.thelook_ecommerce`.
- Team's Google Cloud project ID: `thelook-ecommerce-511800`.
- Confirmed tables: `distribution_centers`, `events`, `inventory_items`, `order_items`, `orders`, `products`, `users`.
- CP1 focus: Men Accessories return rate vs all other Men categories among delivered items at least 60 days old.
- Reported rates: Men Accessories 564/1,784 (31.61%); other Men categories 7,285/25,739 (28.30%); gap 3.31 percentage points. These are based on team-run BigQuery results; the gap/value math is the agent's calculation.
- Analysis fields from the team's schema export: `order_items.id`, `product_id`, `delivered_at`, `returned_at`, `sale_price`; `products.id`, `category`, `department`.
- Join: `order_items.product_id = products.id`. The team-run quality result found no duplicate item IDs or unmatched products in the mature delivered cohort.
- Preparation: non-null delivery at least 60 days before query date; returned when `returned_at` is non-null. The 60-day rule is a project choice, not a confirmed store policy.
- Do not describe `sale_price` units as currency, profit, or recoverable value unless verified from source documentation.

## Working instructions
- Keep answers short and plain.
- Draft one step at a time, as a short query for us to approve. Never draft one long query that does everything.
- Do not save or change files until we say so.
- Back every claim about our data with a source, and say when something is your own conclusion or calculation.
- Ask us to confirm a table or column exists before using it if it is not in the schema export.
- Use our project audit skill (.agents/skills/project-audit/SKILL.md) to keep Other/audit_log.md up to date.
- Assume we are new to Git and GitHub. When we work together on our computer, teach us how Git works as we go.
- Never run commits or pushes yourself. Give us the commands, and we will run them.
- We each work on our own branch, named after the person. At the start of each session, remind us to pull main and merge main into our branch before changing files.
- At the end of each session, remind us to push our branch and open a pull request. Our partner reviews it before merge.
- If our work conflicts with our partner's, explain the conflict plainly and help us decide what to keep.
- Remind us to merge finished work into main before each due date. The instructor grades main.
