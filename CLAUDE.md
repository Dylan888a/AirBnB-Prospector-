# Standing rules — this is a public website

This repo deploys a public page via GitHub Pages. Two portfolio-wide rules apply to every edit here:

## 🟨 Public Claim-to-Proof Gate

Any meaningful public claim — licensing, reviews, service regions, tax figures, verification, ratings, office locations, privacy promises, performance/coverage numbers — needs: **source → owner → enforcement/test → live proof → review date**. If a claim can't be proven end-to-end, narrow the wording instead of letting it sound confident. A number pulled from one demo/sample dataset run must say so (dataset + date) — it must not read as a live or ongoing guarantee.

## 🟢 Repository-Wide Business Fact Contract

Facts that could drift (region/suburb counts, pricing, coverage) live in one canonical source. Don't hardcode a second copy of a fact that already exists elsewhere (code, JSON-LD, lead magnets, guides) — reference it instead, so stale numbers can't be reintroduced later.

## Applied so far

- 2026-09-08: hero stat-strip in `index.html` (708 buildings / 284 targets / $218k gap) annotated with dataset + date and a link to the pilot-survey section, since it's one static demo run, not a live count. Rest of the page already framed its numbers honestly ("Proof of concept — five suburbs surveyed", "runs against any Sydney suburb — it isn't limited to the five above"). No licensing/ratings/office/privacy claims found.
