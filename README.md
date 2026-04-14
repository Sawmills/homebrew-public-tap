# Sawmills Public Homebrew Tap

Public Homebrew formulae for Sawmills tools.

## Tap

```bash
brew tap sawmills/tap
```

## Install

```bash
brew install sawmills/tap/sm
```

## Upgrade

```bash
brew update
brew upgrade sawmills/tap/sm
```

## CSV validation tool

```bash
brew install sawmills/tap/sawmills-csvcheck
sawmills-csvcheck -file ./service_teams.csv -lookup-key <CSV_HEADER_NAME>
```

Notes:
- replace `<CSV_HEADER_NAME>` with the exact lookup column name from your CSV header
- header matching is exact and case-sensitive
- duplicate lookup keys are allowed, but the processor keeps the first matching row

## CI

- `Formula CI` runs on every pull request and push to `main`.
- `Weekly Public Install Smoke` runs weekly and validates public install:
  - `brew tap sawmills/tap`
  - `brew install sawmills/tap/sm`
  - `sm --version`
- Smoke failures open or update a GitHub issue for triage.
