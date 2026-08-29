# Security baseline

Active controls in this stage:

- weekly Dependabot updates for GitHub Actions;
- Gitleaks on pull requests, main-branch pushes, manual runs and a weekly full-history scan;
- read-only workflow permissions and fixed action commit references.

Airbnb Prospector is currently a static prototype. This first controlled stage adds weekly GitHub Actions updates and automatic full-history secret scanning. CodeQL, dependency review and browser quality gates will be added when the project has a JavaScript/TypeScript build and deployment test target.
