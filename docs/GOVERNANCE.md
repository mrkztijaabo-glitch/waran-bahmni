# Governance Guidelines

This document defines the governance principles for the Waran Bahmni HIS project.

## Decision-Making

- Technical decisions should be made by the core development team in consultation with clinical stakeholders.
- Major architectural changes require approval from the project lead and at least one reviewer via pull request.
- Any changes affecting patient data workflow must undergo a peer review and testing cycle before deployment.

## Roles and Responsibilities

- **Project Lead**: Oversees the project scope and ensures alignment with hospital objectives.
- **Developers**: Implement features, fix bugs, and write tests according to the roadmap.
- **DevOps Engineers**: Maintain infrastructure, CI/CD pipelines, and ensure deployments are secure and reliable.
- **Clinicians**: Provide requirements, validate clinical workflows, and assist with acceptance testing.

## Contributor Guidelines

- All contributions should be made via pull requests against the `staging` branch.
- Each pull request should include a clear description, reference to the relevant roadmap step, and be reviewed by at least one team member.
- Coding standards (e.g., formatting, naming conventions) must be followed; automated linters and tests should pass before merging.

## Change Management

- Version control is handled through Git branches; `main` represents stable releases, while `staging` is for integration.
- Releases to `production` are managed via pull requests from `main` with appropriate tags and version numbers.
