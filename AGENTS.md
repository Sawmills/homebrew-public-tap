READ ${CODE_ROOT:-$HOME/Code}/agent-scripts/AGENTS.md BEFORE ANYTHING (skip if missing). If missing, also try: $HOME/repos/agent-scripts/AGENTS.md

# AGENTS.md

## Project

This repository is the public Homebrew tap for Sawmills tools.

## Map

- `Formula/sm.rb` defines the `sm` formula.
- `Formula/claudectl.rb` defines the `claudectl` formula.
- `Formula/codexctl.rb` defines the `codexctl` formula.
- `Formula/sawmills-csvcheck.rb` defines the `sawmills-csvcheck` formula.
- `README.md` documents tap, install, upgrade, and CSV validation use.
- `CODEOWNERS` defines code ownership.

## Commands

Tap the repository:

```bash
brew tap sawmills/tap
```

Install `sm`:

```bash
brew install sawmills/tap/sm
```

Upgrade `sm`:

```bash
brew update
brew upgrade sawmills/tap/sm
```

Install and run the CSV validation tool:

```bash
brew install sawmills/tap/sawmills-csvcheck
sawmills-csvcheck -file ./service_teams.csv -lookup-key <CSV_HEADER_NAME>
```

Validate the public `sm` install:

```bash
brew tap sawmills/tap
brew install sawmills/tap/sm
sm --version
```

## Rules

- Replace `<CSV_HEADER_NAME>` with the exact lookup column name from the CSV header.
- Treat CSV header matching as exact and case-sensitive.
- Allow duplicate lookup keys. The processor keeps the first matching row.
- Expect Formula CI on every pull request and every push to `main`.
- Keep the weekly public install smoke compatible with the documented `sm` install and `sm --version` commands.
