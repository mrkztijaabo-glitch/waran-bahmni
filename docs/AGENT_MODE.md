# ChatGPT Agent Mode Integration

This document explains how to integrate OpenAI's ChatGPT Agent Mode with the Waran Bahmni HIS repository. The agent mode enables automated collaboration via GitHub by allowing ChatGPT to propose changes, open pull requests, and merge them when CI passes.

## Enabling Agent Mode

1. Sign in to your OpenAI or ChatGPT account.
2. Navigate to **Settings → Beta features** and enable **Agent Mode (Assistants API)**. This gives you access to create and manage agents.
3. Create a new agent (e.g., `Waran Bahmni Agent`) and authorize the agent to access your GitHub repository (`mrkztijaabo-glitch/waran-bahmni`) with read and write permissions.
4. Add a new secret named `OPENAI_API_KEY` in your GitHub repository's **Settings → Secrets and variables → Actions**. Set its value to your OpenAI API key. The agent workflow uses this secret to authenticate.

## Agent Workflow (`agent.yml`)

The workflow defined in `.github/workflows/agent.yml` runs when changes are pushed to the `staging` branch. It performs the following tasks:

- Checks out the repository.
- Runs the ChatGPT Agent integration using the `OPENAI_API_KEY` secret.
- Optionally enables auto‑merge for pull requests into `main` when CI checks succeed.

This workflow ensures that contributions made by the agent (or collaborators) on `staging` can automatically be merged into `main` if all tests pass.

## Usage Guidelines

- The agent should operate on the `staging` branch to keep `main` stable. Review and test changes on `staging` before merging.
- Keep the `OPENAI_API_KEY` secret secure. Do not commit API keys or credentials to the repository.
- Monitor pull requests created by the agent and review them for correctness and security before approving.
- Adjust the workflow and agent configuration as necessary for your development process (e.g., adding additional checks or restrictions).
