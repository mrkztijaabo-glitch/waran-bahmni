# n8n Integration

This project integrates the n8n workflow automation platform. A new `n8n` service was added to the `docker-compose.yml` in the `staging` branch. The service exposes port 5678 and stores data in the `n8n_data` volume.

## Accessing n8n

After starting the Docker Compose stack on your staging environment, the n8n UI is available at [http://localhost:5678](http://localhost:5678) (or the corresponding host/port in your deployment). The first time you access n8n you will be prompted to create an admin account.

## Built-in workflows

The `n8n/workflows` directory contains example workflows to get you started:

- **appointment_reminder.json** – A scheduled workflow that queries upcoming appointments (via a custom Function node) and sends reminder messages (e.g., via Twilio). You can adapt the Function node to integrate with your scheduling data source.

- **pr_automation.json** – Listens for pull request events from GitHub using the GitHub Trigger node. You can extend it to automatically label, comment on or merge pull requests according to your development workflow.

- **auto_redeploy.json** – Triggers on pushes to the repository and can be configured to run deployment scripts or trigger CI/CD pipelines to automatically redeploy the HIS stack.

To import these workflows into n8n, open the n8n UI, click the *Import* button in the top right, and paste the JSON content of the desired workflow.

## Creating custom workflows

n8n provides a visual builder that allows you to connect triggers (HTTP endpoints, schedules, GitHub events) with actions (database queries, HTTP requests, email/SMS notifications, etc.). For more information on building workflows and available nodes, see the official [n8n documentation](https://docs.n8n.io/).

## Persistence

Workflow data and credentials are stored in the `n8n_data` volume declared in `docker-compose.yml`. Make sure to back up this volume regularly or configure external storage if you wish to retain workflow state across deployments.
