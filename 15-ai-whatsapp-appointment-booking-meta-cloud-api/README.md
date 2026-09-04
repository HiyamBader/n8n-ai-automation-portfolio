# WhatsApp AI Appointment Booking Agent — Meta Cloud API

![Workflow overview](overview.png)

An end-to-end appointment booking workflow built in n8n using the official Meta WhatsApp Cloud API, Gemini structured extraction, Google Calendar, and n8n Data Tables.

The agent understands Arabic and English booking requests, validates the requested date and clinic schedule, checks live availability, holds an available slot while waiting for explicit confirmation, and rechecks the calendar immediately before creating the appointment.

## Highlights

- Official WhatsApp Cloud API trigger and replies
- AI extraction of service, date, time, customer name, intent, and confirmation
- Structured Output Parser for predictable JSON
- Relative-date understanding such as “tomorrow” and “next Sunday”
- Clarification of ambiguous times such as “9” without AM/PM
- Missing-field detection with a dynamic reply
- Past-date rejection
- Configurable weekly business hours
- Clinic holiday validation
- Initial Google Calendar availability check
- Explicit confirmation required before booking
- Pending booking state with a 15-minute expiry
- Availability recheck at confirmation time
- Double-booking protection
- Duplicate webhook/message protection using the WhatsApp message ID
- Calendar failure handling without falsely confirming a booking
- Clear success, unavailable, expired, invalid, and error responses

## Workflow

1. Receive a WhatsApp message.
2. Normalize the sender, message text, message ID, and phone-number ID.
3. Ignore webhook retries that contain an already processed message ID.
4. Extract structured booking information with Gemini.
5. Route explicit confirmations separately from new booking requests.
6. Validate required information, date, holidays, and working hours.
7. Check Google Calendar availability.
8. Store an available request as `pending` for 15 minutes.
9. On confirmation, retrieve the sender's pending request and verify that it has not expired.
10. Recheck availability to prevent race-condition double bookings.
11. Create the calendar event, mark the request as `confirmed`, and send the final WhatsApp confirmation.

## Required integrations

- n8n
- Meta WhatsApp Cloud API
- Google Gemini API
- Google Calendar OAuth2
- n8n Data Tables

## Data Tables

Create these tables before configuring the imported workflow.

### `pending_bookings`

| Column | Type | Purpose |
| --- | --- | --- |
| `senderPhone` | String | WhatsApp customer identifier |
| `service` | String | Requested service |
| `date` | String | Appointment date in `YYYY-MM-DD` |
| `time` | String | Appointment time in `HH:mm` |
| `customerName` | String | Customer-provided name |
| `status` | String | `pending`, `confirmed`, `expired`, or `unavailable` |
| `expiresAt` | DateTime | Confirmation deadline |
| `calendarEventId` | String | Created Google Calendar event ID |

### `processed_messages`

| Column | Type | Purpose |
| --- | --- | --- |
| `messageId` | String | WhatsApp message ID used for idempotency |
| `senderPhone` | String | Message sender |
| `processedAt` | DateTime | Processing timestamp |

### `business_hours`

| Column | Type | Purpose |
| --- | --- | --- |
| `weekDay` | Number | ISO weekday: Monday `1` through Sunday `7` |
| `dayName` | String | Human-readable day name |
| `isOpen` | Boolean | Whether the clinic works that day |
| `openTime` | DateTime | Opening time; the workflow reads its `HH:mm` value |
| `closeTime` | DateTime | Closing time; the workflow reads its `HH:mm` value |

### `clinic_holidays`

| Column | Type | Purpose |
| --- | --- | --- |
| `date` | String | Closed date in `YYYY-MM-DD` format |
| `reason` | String | Optional holiday or closure description |

## Setup

1. Import `workflow.json` into n8n.
2. Create and select the four Data Tables listed above.
3. Replace every `YOUR_*_TABLE_ID` placeholder with the corresponding table.
4. Connect the WhatsApp Trigger credential for your Meta app.
5. Connect the WhatsApp sending credential and replace `YOUR_WHATSAPP_PHONE_NUMBER_ID`.
6. Connect Gemini and choose an available Gemini chat model.
7. Connect Google Calendar and replace `YOUR_GOOGLE_CALENDAR_ID`.
8. Set the public production webhook URL for n8n.
9. Activate the workflow and test the scenarios below.

## Tested scenarios

- Complete new booking request
- Missing service, date, time, or customer name
- Ambiguous 12-hour time without AM/PM
- Past appointment date
- Closed weekday
- Clinic holiday
- Initially unavailable slot
- Confirmation before expiry
- Confirmation after expiry
- New request replacing an earlier pending request from the same sender
- Slot becoming occupied between availability check and confirmation
- Repeated confirmation after a successful booking
- Duplicate WhatsApp webhook delivery
- Calendar API failure

## Security notes

This portfolio template does not contain credentials, access tokens, personal email addresses, WhatsApp phone-number IDs, Data Table IDs, webhook IDs, or instance metadata. Configure all placeholders inside your own n8n instance.

## Portfolio positioning

This project demonstrates production-oriented workflow design rather than a basic chatbot: state management, idempotency, expiry, live availability validation, race-condition protection, structured AI output, and failure-safe confirmation behavior.
