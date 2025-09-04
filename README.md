# Waran Bahmni HIS

This project is a GitHub-only agent-managed repository for the Waran Bahmni Hospital Information System (HIS). The roadmap below describes all steps (1‑95) across multiple phases to build and integrate Bahmni (OpenMRS + OpenELIS + Odoo ERP) with AI and automation.

## Roadmap

### Phase 0 — Repo Setup & Design (Steps 1‑5)
- Replace README.md with full roadmap (all 95 steps).
- Add `.gitignore` (standard: Python + Node + Docker + IDE).
- Add short Apache 2.0 license notice inside README.
- Add GitHub Actions CI workflow (`.github/workflows/ci.yml`) to validate & build Docker.
- Create `staging` and `production` branches.
- Apply branch protection rules:
  - `main` → PR + CI + 1 approval.
  - `production` → PR + CI + 1 approval + restricted pushes.
  - `staging` → direct pushes allowed + CI runs.
- Add `docs/ARCHITECTURE.md` and `docs/SECURITY.md`.

### Phase 0.1 — Infrastructure Planning (Steps 6‑10)
- Add `docs/INFRASTRUCTURE.md` (cloud-neutral sizing, scaling, compliance).

### Phase 1 — Base Setup (Steps 11‑20)
- Add `docs/BASE_SETUP.md` (swap, firewall, SSH, users, fail2ban, storage) **as documentation only**.

### Phase 2 — ChatGPT Agent Mode Integration (Steps 21‑25)
- Add `.github/workflows/agent.yml` workflow:
  - Runs on `staging`.
  - Uses `OPENAI_API_KEY`.
  - Auto-merges PRs into `main` if CI passes.
- Add `docs/AGENT_MODE.md` explaining usage.

### Phase 3 — Bahmni HIS Core Modules (Steps 26‑37)
- Add `docker-compose.yml` with services: OpenMRS, OpenELIS, Odoo ERP.
- Add `.env.example`.
- Add initial dictionaries (ICD-10, LOINC, drug lists).
- Add role-based access examples.
- Add healthchecks.

### Phase 3.1 — Database Management (Steps 38‑42)
- Add MySQL (OpenMRS) + PostgreSQL (Odoo) services.
- Add `/scripts/db-backup.sh`.
- Add `docs/databases.md`.

### Phase 4 — Clinical Workflows & Forms (Steps 43‑52)
- Add `/forms/*.json` templates (registration, encounters, labs, billing, prescriptions).
- Add `docs/workflows.md`.

### Phase 5 — AI Integration (Steps 53‑63)
- Add `ai/middleware.md`.
- Add AI workflows (diagnosis, labs, prescriptions).
- Add AI summarization + caching examples.
- Add audit logging section.

### Phase 6 — n8n Agent Automation (Steps 64‑74)
- Add n8n service to `docker-compose.yml`.
- Add `/n8n/workflows/*.json` (appointment reminders, PR automation, auto-redeploy).
- Add `docs/n8n.md`.

### Phase 7 — WhatsApp Integration (Steps 75‑84)
- Add `/whatsapp/templates/*.json`.
- Add `docs/whatsapp.md`.

### Phase 8 — GitHub + Agent Coding (Steps 85‑90)
- Expand CI/CD workflows for staging & production.
- Add automated tests placeholder.
- Enforce branch protection.
- Enable n8n PR automation.
- Allow ChatGPT Agent to open PRs.

### Phase 9 — Reporting & Analytics (Steps 91‑93)
- Add `/analytics/*.json` dashboards.
- Add `docs/analytics.md`.

### Phase 10 — Governance, Training & Monitoring (Steps 94‑95)
- Add `docs/GOVERNANCE.md`.
- Add `docs/TRAINING.md`.

## License
This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.
