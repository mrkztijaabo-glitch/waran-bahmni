# Clinical Workflows

This document outlines the clinical workflows supported by the Waran Bahmni HIS. These workflows correspond to the JSON form templates in the `forms/` directory.

## Patient Registration
Patient registration is the first step in the clinical process. Staff collect the patient's personal details (name, date of birth, gender, address and phone number) and assign a unique patient identifier. The registration form in the `forms/registration.json` file captures these fields.

## Encounters
An encounter represents an interaction between a patient and a clinician. During an encounter, vital signs and observations are recorded, and the encounter type (outpatient, inpatient, emergency) is selected. Encounters are linked to a patient via the patient ID. The structure for encounters is defined in `forms/encounter.json`.

## Lab Orders and Results
Clinicians can order laboratory tests during an encounter. A lab order includes the patient ID, test type and sample collection details. Laboratory staff process the test, update the status and enter the results. The lab form structure is defined in `forms/labs.json`.

## Billing
Billing captures the financial aspects of care. After services are provided, a bill is generated listing individual items and their amounts. The total amount due and the payment status (e.g. Unpaid or Paid) are tracked. See `forms/billing.json` for the billing form template.

## Prescriptions
A prescription records the medications prescribed to a patient. Each entry includes the drug name, dosage, frequency, duration and any additional notes. Prescriptions are recorded using the structure in `forms/prescriptions.json`.

## Workflow Orchestration
The above workflows are designed to work together. A patient is first registered, then may have one or more encounters. Encounters can generate lab orders, prescriptions and billing records. Data captured in forms is stored in the system and used across modules to ensure continuity of care.
