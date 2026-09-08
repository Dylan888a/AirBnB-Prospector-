#!/usr/bin/env bash
# Pre-commit check for the "Public Claim-to-Proof Gate" in CLAUDE.md.
#
# Scans ADDED lines in staged public-facing files for words/phrases that
# read as unproven credential or performance claims (licensing, ratings,
# awards, guarantees, "#1"-type superlatives, etc.). It does not try to
# judge every claim automatically — that needs a human/source check — it
# just stops the obvious ones from slipping in unreviewed.
#
# Escape hatches:
#   - Put `claim-ok:` somewhere on the same line (e.g. an HTML comment
#     `<!-- claim-ok: dated + linked to proof -->`) to mark it reviewed.
#   - `git commit --no-verify` bypasses this hook entirely for edge cases.

set -euo pipefail

# Files this check applies to. Public-facing surfaces only — internal
# app logic/data files are out of scope for this gate. Extend as new
# public files are added (other landing pages, lead magnets, etc.).
PUBLIC_FILE_PATTERN='(^|/)(index\.html|README\.md|.*\.landing\.html)$'

# Words/phrases that commonly appear in unproven public claims. Multi-word
# phrases first (lower false-positive rate); a few single words that are
# unambiguous credential/guarantee claims follow.
OVERCLAIM_PATTERN='licen[cs]ed|licen[cs]e number|certified|accredited|award[- ]winning|number one|no\.? ?1\b|#1\b|best in (the|sydney|nsw|australia)|largest in (the|sydney|nsw|australia)|leading (provider|agency|platform)|trusted by|five[- ]star|5[- ]star|top[- ]rated|years of experience|100% (guarantee|secure|private|verified)|money[- ]back guarantee|fully insured|registered (agent|business)|verified by|independently verified|as seen (in|on)'

STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep -E "$PUBLIC_FILE_PATTERN" || true)

if [ -z "$STAGED_FILES" ]; then
  exit 0
fi

FOUND=0

for f in $STAGED_FILES; do
  # Only look at newly added lines, not pre-existing/context lines, and
  # skip CLAUDE.md's own documentation of these words.
  if [ "$(basename "$f")" = "CLAUDE.md" ]; then
    continue
  fi

  MATCHES=$(git diff --cached -U0 -- "$f" \
    | grep -E '^\+' \
    | grep -Ev '^\+\+\+' \
    | grep -Eiv 'claim-ok:' \
    | grep -Ei "$OVERCLAIM_PATTERN" || true)

  if [ -n "$MATCHES" ]; then
    FOUND=1
    echo ""
    echo "⚠️  Possible unproven public claim in $f:"
    echo "$MATCHES" | sed 's/^/    /'
  fi
done

if [ "$FOUND" -eq 1 ]; then
  echo ""
  echo "Public Claim-to-Proof Gate (see CLAUDE.md): every claim like the above needs"
  echo "source → owner → enforcement/test → live proof → review date, or the wording"
  echo "should be narrowed instead."
  echo ""
  echo "If this line has already been checked, add 'claim-ok:' + a short note on the"
  echo "same line (e.g. an HTML comment) and re-commit. To bypass entirely, use"
  echo "'git commit --no-verify'."
  echo ""
  exit 1
fi

exit 0
