# Reporting & Analytics

This document describes the reporting and analytics capabilities for the Waran Bahmni HIS deployment.

## Dashboards

The analytics module includes a set of dashboards defined under the `/analytics` folder. These JSON definitions can be imported into a business intelligence or dashboarding tool. For example, `overview.json` shows high‑level metrics such as total patients, pending labs, and today's appointments.

## Customising dashboards

To create new dashboards, copy an existing JSON file in the `analytics` folder and modify the `widgets` array to include your own metrics. Each widget should specify its type, data source, description and any relevant filters.

## Usage

Dashboards can be displayed within the Bahmni UI or an external analytics platform. To integrate with Bahmni, configure the dashboard service in `docker‑compose.yml` and mount the `analytics` folder into the container. For external tools, use the API endpoints of the respective databases to pull data into your charts.

## Security & privacy

Ensure that analytics dashboards adhere to privacy guidelines. Do not expose patient identifiers or sensitive data publicly. Access to dashboards should be restricted to authorised staff.
