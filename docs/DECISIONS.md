# Architecture Decisions

Record architectural decisions with: **Title**, **Background**, **Decision**, **Trade-offs**.

---

## 001 — Monorepo with Flutter + FastAPI

**Background:** Be4Travel needs a mobile frontend and a REST API backend.

**Decision:** Single GitHub repo with `apps/mobile/` (Flutter) and `apps/api/` (Python FastAPI), following industry-standard monorepo layout.

**Trade-offs:**
- (+) Atomic commits across FE/BE, shared CI/CD, unified code review
- (+) API contract changes are visible in same PR
- (-) Repo grows larger over time; may need build caching
- (-) Different toolchains (Dart/Python) require separate dependency management

## 002 — Harness Engineering with harness-orchestrator

**Background:** AI-assisted development benefits from structured workflows with quality gates, progress tracking, and adversarial review.

**Decision:** Use `harness-orchestrator` (cursor-native mode) for plan → build → eval → ship workflow with 5-role parallel code review.

**Trade-offs:**
- (+) Structured development with audit trails
- (+) Multi-role review catches different categories of issues
- (-) Additional ceremony for simple changes
- (-) Requires familiarity with harness skills
