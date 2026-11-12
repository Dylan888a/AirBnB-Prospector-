# Airbnb Prospector — historical pilot

This repository preserves a static September 2026 research presentation. It does not import listings, fetch current market data, estimate a new address or send leads.

The maintained CSV prospecting engine is [Harborside Prospector](https://github.com/Dylan888a/harborside-prospector). That repository is private and requires GitHub access. Its [consolidation record](https://github.com/Dylan888a/harborside-prospector/blob/main/docs/AIRBNB_PROSPECTOR_CONSOLIDATION.md) explains the transfer of useful presentation material and the decision to maintain a single engine.

## Preview

No build is required. Serve this directory with `python3 -m http.server 4173`, then open `http://localhost:4173`. The ledger scrolls horizontally on narrow screens. The color theme follows the device preference; reduced-motion preferences are respected.

## Retirement handoff

See [issue #4](https://github.com/Dylan888a/AirBnB-Prospector-/issues/4). Keep historical survey figures date-qualified and use the maintained engine for current work.

- Check the page on a phone or a narrow viewport: header, hero, workflow steps, chart and ledger scrolling.
- Confirm whether any external documentation or bookmarks still rely on the existing Pages URL.
- Decide whether to retain the historical notice or disable GitHub Pages; record that decision and the existing URL.
- Archive the repository after the reference and deployment decisions. Preserve its history.

Updating this page does not itself archive the repository or change GitHub Pages settings.
