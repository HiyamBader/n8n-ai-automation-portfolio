# Setup Guide

## Requirements

- n8n
- OpenAI API Key
- Gmail Account
- Supabase Project

---

## 1. Import Workflow

Import the provided `workflow.json` into n8n.

---

## 2. Configure Gmail

Create a Gmail OAuth2 credential.

Connect it to:

- Gmail Trigger
- Create Gmail Draft

---

## 3. Configure OpenAI

Create an OpenAI credential.

Connect it to:

- AI Email Classifier
- AI Reply Writer

Model used:

```
gpt-5-mini
```

---

## 4. Configure Supabase

Create a Supabase credential.

Connect it to:

- Create Row

---

## 5. Create Database Table

Execute the following SQL:

```sql
create table public.email_support_logs (
    id uuid primary key default gen_random_uuid(),
    created_at timestamptz default now(),

    sender_email text not null,
    subject text,

    category text,
    priority text,
    summary text,

    requires_human boolean default false,

    draft_subject text,
    draft_reply text,

    status text
);
```

---

## 6. Activate Workflow

Enable the workflow.

The Gmail Trigger will automatically monitor incoming emails.

---

## Workflow Behavior

### Categories

- Sales
- Support
- Complaint
- Refund
- Partnership
- Spam
- Other

---

### Reply Generation

For business-related emails:

- AI generates a professional draft.
- Draft is saved to Gmail.
- Email is logged in Supabase.

For Spam and Other:

- No draft is created.
- Email is only logged in Supabase.

---

## Expected Result

After activation:

- Incoming emails are classified.
- Priority is detected.
- Draft replies are generated when appropriate.
- All activity is stored in Supabase.