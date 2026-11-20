# AI Audit Protocol

## Our review process
1. Check table and column names against the team's BigQuery schema export; ask about undocumented fields.
2. Draft one short query at a time. State the question, fields, assumptions, and estimated bytes when available.
3. The team reviews the SQL and bytes estimate, then runs it. The agent does not run queries or spend the team's BigQuery allowance.
4. Save exact team-run SQL in a numbered file under `sql/`, with a purpose comment, BigQuery job ID, and run time. Clearly distinguish drafts from executed queries.
5. Link data claims to team-supplied queries/results. Label agent arithmetic and interpretation as calculations or conclusions.
6. Log meaningful human checks in `Other/audit_log.md`; do not describe agent-only review as a human check.
7. If the analysis changes, explain the old/new interpretation and preserve earlier log entries.
8. The team reviews final files before pushing. The agent does not commit or push.

## CP2 checks to record
After the team runs each check, log results for: (1) row count vs distinct item IDs; (2) missingness in all model columns; (3) binary Y and settled cohort; (4) plausible values and dates; (5) join coverage and category counts. Also log a second-way check of a key number. Record the method and result, and note AI help without implying the agent's own check was performed by a human.

## CP1 checks
- Confirm the denominator uses delivered items passing the 60-day maturity rule.
- Confirm focus/peer groups are disjoint and share the cohort and return definition.
- Confirm the peer rate is item-weighted.
- Check product matching, duplicate IDs, missing/negative prices, and return dates.
- Label sale-price calculations as estimates and state assumptions.
