# WhatsApp Integration

This document explains how to integrate WhatsApp messaging into the Waran Bahmni HIS platform.

## Overview

WhatsApp can be used to send automated notifications to patients and staff, such as appointment reminders and lab results. This integration uses the WhatsApp Business API (via providers such as Twilio) to deliver messages from the HIS platform.

## Templates

This repository stores WhatsApp message templates as JSON files under `whatsapp/templates/`. Each template defines the message body and variable placeholders. Current templates include:

- **appointment_reminder.json** – a reminder message that includes the patient’s name, doctor’s name, appointment date and time.
- **lab_results.json** – a notification informing a patient that their lab results are ready.

You can create additional templates as needed by following the same structure and committing them to the `whatsapp/templates` directory.

## Configuration

1. Register a WhatsApp Business API provider (for example, Twilio) and obtain the required credentials (Account SID, Auth Token, and WhatsApp-enabled phone number).
2. Store these credentials securely as environment variables or in a secret manager. For example, in your `.env` file:

```
WHATSAPP_ACCOUNT_SID=your_account_sid
WHATSAPP_AUTH_TOKEN=your_auth_token
WHATSAPP_FROM_NUMBER=whatsapp:+1234567890
```

3. Implement a service or workflow that generates messages from templates, fills in the placeholders with runtime values (like the patient’s name and appointment time), and calls the provider’s API.

## Sending a Message

To send a WhatsApp message with Twilio’s API you can make a POST request specifying the recipient, your WhatsApp business number, and the message body. For example:

```bash
curl -X POST https://api.twilio.com/2010-04-01/Accounts/$WHATSAPP_ACCOUNT_SID/Messages.json \
  --data-urlencode "To=whatsapp:+252612345678" \
  --data-urlencode "From=$WHATSAPP_FROM_NUMBER" \
  --data-urlencode "Body=Hello {{patient_name}}, your appointment with Dr. {{doctor_name}} is scheduled on {{date}} at {{time}}." \
  -u $WHATSAPP_ACCOUNT_SID:$WHATSAPP_AUTH_TOKEN
```

You can automate sending messages through n8n by adding an HTTP Request node that calls this endpoint and uses the template variables.

## Security and Consent

Always obtain patient consent before sending WhatsApp messages, and avoid including sensitive health information. Ensure your implementation complies with local data protection and privacy regulations (such as HIPAA or GDPR). Secure your API credentials and rotate them periodically.
