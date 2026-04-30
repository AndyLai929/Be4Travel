# Be4Travel

A perk suggestion app for your travel plan. About Miles, Stopover for Transfer Passengers at Company's expense (STPC), Tourism Voucher, Transfer Voucher etc.

## Project Structure

```
Be4Travel/
├── apps/
│   ├── api/            # Python FastAPI backend
│   └── mobile/         # Flutter mobile/web frontend
├── packages/           # Shared packages (future)
├── docs/               # Documentation & decisions
├── .cursor/
│   ├── rules/          # Cursor AI rules (governance, per-module)
│   ├── skills/         # Harness skills (plan, build, eval, ship)
│   └── agents/         # Harness agents (architect, engineer, QA, etc.)
├── .agents/            # Harness config & task state
└── AGENTS.md           # AI agent instructions
```

## Quick Start

### Backend (FastAPI)

```bash
cd apps/api
uv venv && source .venv/bin/activate
uv pip install -e ".[dev]"
uvicorn app.main:app --reload          # http://localhost:8000
pytest -v                               # run tests
ruff check app/ tests/                  # lint
```

### Frontend (Flutter)

```bash
cd apps/mobile
flutter pub get
flutter run -d web-server --web-port=3000  # http://localhost:3000
flutter test                                # run tests
flutter analyze                             # lint
```

## Harness Engineering

This project uses [`harness-orchestrator`](https://pypi.org/project/harness-orchestrator/) for structured AI-assisted development:

| Skill | When to use |
|---|---|
| `/harness-brainstorm` | Divergent exploration → vision → plan → ship |
| `/harness-plan` | Defined requirement → plan with 5-role review → ship |
| `/harness-build` | Implement according to plan |
| `/harness-eval` | 5-role parallel code review |
| `/harness-ship` | Full pipeline: test → review → fix → commit → PR |
| `/harness-investigate` | Systematic bug investigation |
| `/harness-learn` | Knowledge management |
| `/harness-retro` | Engineering retrospective |

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | Flutter 3.41, Dart 3.11, Material 3 |
| Backend | Python 3.12, FastAPI, Pydantic v2 |
| Linting | Ruff (Python), flutter_lints (Dart) |
| Testing | pytest (Python), flutter_test (Dart) |
| AI Workflow | harness-orchestrator (cursor-native mode) |
