# AI Audit Protocol

## Our review process
1. Check new table and column names against the team's BigQuery schema export; ask the team to confirm undocumented fields.
2. Draft one short query at a time. State its question, fields, assumptions, and estimated bytes when available.
3. The team reviews the SQL and bytes estimate, then runs it. The agent does not run queries or spend the team's BigQuery allowance.
4. Link data claims to the query or result the team supplied. Label agent arithmetic and interpretation as calculations or conclusions.
5. Validate important results with a focused check where practical. Record meaningful human checks in `Other/audit_log.md`; do not describe the agent's own review as a human check.
6. If the analysis changes, explain the old and new interpretation and preserve the old log entry.
7. The team reviews final files before pushing. The agent does not commit or push.

## Checks for this gap
- Confirm the denominator has only delivered items passing the 60-day maturity rule.
- Confirm focus and peer groups are disjoint and use the same cohort and return definition.
- Confirm the peer rate is weighted by item counts.
- Check product matching, duplicate item IDs, missing/negative prices, and return dates relative to delivery.
- Label the sale-price calculation as an estimate and state its assumptions.
