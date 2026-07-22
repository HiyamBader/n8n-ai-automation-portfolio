# AI Customer Support Email Assistant

An AI-powered customer support automation built with n8n that classifies incoming Gmail emails, generates professional draft replies using OpenAI, and logs every interaction into Supabase.

---

## Features

- 📧 Automatically monitors incoming Gmail messages
- 🤖 Classifies customer emails using AI
- 🏷 Categorizes emails into:
  - Sales
  - Support
  - Complaint
  - Refund
  - Partnership
  - Spam
  - Other
- 🚨 Detects email priority
- 👨‍💼 Identifies emails that require human attention
- ✍️ Generates professional reply drafts
- 📨 Creates Gmail drafts automatically
- 🗄 Logs every email interaction into Supabase
- 📊 Uses Structured JSON Outputs for reliable AI responses

---

## Workflow

```
Gmail Trigger
      │
      ▼
AI Email Classifier
      │
      ▼
Category Router
      │
      ├──────────────► Spam
      │                  │
      │                  ▼
      │            Supabase Log
      │
      ├──────────────► Other
      │                  │
      │                  ▼
      │            Supabase Log
      │
      ▼
AI Reply Writer
      │
      ▼
Create Gmail Draft
      │
      ▼
Supabase Log
```

---

## Technologies

- n8n
- OpenAI GPT-5 Mini
- Gmail API
- Supabase

---

## AI Components

### AI Email Classifier

Extracts:

- Category
- Priority
- Summary
- Requires Human

using Structured JSON Output.

### AI Reply Writer

Generates:

- Professional email subject
- Professional email reply

using Structured JSON Output.

---

## Database

All processed emails are stored in Supabase including:

- Sender Email
- Subject
- Category
- Priority
- Summary
- Requires Human
- Draft Subject
- Draft Reply
- Status

---

## Example Use Case

1. Customer sends an email.
2. AI classifies the request.
3. AI determines priority.
4. AI generates a professional response.
5. A Gmail draft is created.
6. Email details are logged in Supabase.

---

## Future Improvements

- Multi-language support
- CRM integration
- Slack notifications
- Auto-send low-risk replies
- Customer sentiment analysis
- Analytics dashboard

---

## License

MIT