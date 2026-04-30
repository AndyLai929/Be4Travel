# Be4Travel API

FastAPI backend for the Be4Travel perk suggestion service.

## Development

```bash
cd apps/api
uv venv && source .venv/bin/activate
uv pip install -e ".[dev]"
uvicorn app.main:app --reload
```

## Testing

```bash
pytest
ruff check .
mypy app/
```
