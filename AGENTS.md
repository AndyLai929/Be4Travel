# AGENTS.md

## Cursor Cloud specific instructions

**Be4Travel** — Flutter (FE) + Python FastAPI (BE) monorepo.

### Services

| Service | Path | Run command | Port |
|---------|------|-------------|------|
| API (FastAPI) | `apps/api/` | `cd apps/api && source .venv/bin/activate && uvicorn app.main:app --reload` | 8000 |
| Mobile (Flutter Web) | `apps/mobile/` | `cd apps/mobile && flutter run -d web-server --web-port=3000` | 3000 |

### Lint / Test / Build

See `README.md` for the full command reference. Key commands:

- **API lint**: `cd apps/api && source .venv/bin/activate && ruff check app/ tests/`
- **API test**: `cd apps/api && source .venv/bin/activate && pytest -v`
- **Mobile lint**: `cd apps/mobile && flutter analyze`
- **Mobile test**: `cd apps/mobile && flutter test`

### Non-obvious caveats

- Flutter SDK is installed at `/opt/flutter`. Ensure `PATH` includes `/opt/flutter/bin`.
- Python venv lives at `apps/api/.venv/` — always activate it before running API commands.
- The Flutter app depends on the API running at `localhost:8000`; start the API first when testing end-to-end.
- `flutter run -d web-server` is headless (no Chrome needed); for interactive testing use `flutter run -d chrome`.
- Harness skills are in `.cursor/skills/harness/` — use `/harness-plan` for defined tasks, `/harness-ship` for full pipeline.

### Harness workflow

The project uses `harness-orchestrator` (cursor-native mode). Config is at `.agents/config.toml`, vision at `.agents/vision.md`, task state under `.agents/tasks/`. See `README.md` for the full skill reference.
