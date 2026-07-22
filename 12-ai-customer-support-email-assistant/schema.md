# Schema

This document describes the structured JSON outputs used by the AI agents in the workflow.

---

# AI Email Classifier Output

The AI Email Classifier returns the following JSON structure.


{
  "category": "Support",
  "priority": "High",
  "summary": "Customer cannot access their account after resetting the password.",
  "requires_human": false
}


## Fields

| Field | Type | Description |
|------|------|-------------|
| category | string | Email category detected by AI. |
| priority | string | Estimated priority level. |
| summary | string | Short summary of the customer's request. |
| requires_human | boolean | Indicates whether the email should be handled by a human agent. |

---

## Allowed Categories

- Sales
- Support
- Complaint
- Refund
- Partnership
- Spam
- Other

---

## Allowed Priorities

- Low
- Medium
- High
- Urgent

---

# AI Reply Writer Output

The AI Reply Writer returns the following JSON structure.


{
  "subject": "Re: Account Access Issue",
  "reply": "Hello,\n\nThank you for contacting us. We understand that you're experiencing difficulties accessing your account. Our team is reviewing your request and will assist you as soon as possible.\n\nBest regards,\nCustomer Support"
}


## Fields

| Field | Type | Description |
|------|------|-------------|
| subject | string | Suggested email subject. |
| reply | string | AI-generated draft email. |

---

# Workflow Data Flow


Incoming Email
        │
        ▼
AI Email Classifier
        │
        ├── category
        ├── priority
        ├── summary
        └── requires_human
                │
                ▼
        Category Router
                │
                ▼
        AI Reply Writer
                │
                ├── subject
                └── reply
                │
                ▼
        Gmail Draft + Supabase Log
