# n8n AI Automation Portfolio

A collection of practical n8n workflows demonstrating AI automation, conversational assistants, document processing, lead management, customer support, and business integrations.

## Projects

- [01 - Telegram AI Chat](01-telegram-ai-chat)
- [02 - Telegram AI Commands](02-telegram-ai-commands)
- [03 - Telegram AI PDF Assistant](03-telegram-ai-pdf-assistant)
- [04 - Telegram AI Document Assistant](04-telegram-ai-document-assistant)
- [05 - Telegram AI Lead Capture](05-telegram-ai-lead-capture)
- [06 - Gmail AI Email Assistant](06-gmail-ai-email-assistant)
- [07 - AI Social Media Post Generator](07-ai-social-media-post-generator)
- [08 - AI Customer Support Email Assistant](08-ai-customer-support-email-assistant)
- [09 - AI Gmail Lead Qualification & CRM](09-ai-gmail-lead-qualification-crm)
- [10 - AI Knowledge Base Assistant (RAG)](10-ai-knowledge-base-rag)
- [11 - AI Content Marketing Agent](11-ai-content-marketing-agent)
- [12 - AI Customer Support Email Assistant](12-ai-customer-support-email-assistant)
- [13 - AI WhatsApp Customer Support Agent](13-ai-whatsapp-customer-support-agent)
- [14 - AI WhatsApp Appointment Booking Agent](14-ai-appointment-booking-agent)
- [15 -WhatsApp AI Appointment Booking Agent – Meta Cloud API](whatsapp-ai-appointment-booking-meta-cloud-api)
- [16 - AI Gmail Lead Qualification & HubSpot CRM](16-ai-gmail-lead-qualification-crm)
- [17 - WooCommerce Orders & Inventory Automation](17-woocommerce-orders-inventory-automation)
- [18 - AI Customer Support Agent - RAG & Human Handoff](18-ai-customer-support-rag-human-handoff)

## Featured Projects

### 18 - AI Customer Support Agent - RAG & Human Handoff

A production-oriented AI customer support system combining RAG-based answers, conversation-state management, explicit human-handoff detection, atomic message idempotency, and resilient failure recovery.

The workflow uses a Supabase/PostgreSQL knowledge base with vector search, structured AI output, Gmail notifications with Telegram fallback, stale-processing recovery, retry strategies, and controlled error responses.

[View the project](18-ai-customer-support-rag-human-handoff)



### 17 - WooCommerce Orders & Inventory Automation

A production-style WooCommerce automation that receives order events through webhooks, prevents duplicate processing, handles multi-product orders, retrieves live inventory data, classifies stock status, logs inventory activity, sends low-stock and out-of-stock alerts, and records successfully processed orders.

The workflow includes retry strategies, idempotency protection, centralized error handling, and failure recovery testing.

[View the project](17-woocommerce-orders-inventory-automation)

### 16 - AI Gmail Lead Qualification & HubSpot CRM

An AI-powered lead qualification and CRM automation that extracts structured lead data from incoming emails, applies deterministic lead scoring, classifies leads, synchronizes contacts with HubSpot CRM, prevents duplicate processing, logs qualified leads to Google Sheets, and sends alerts for high-value opportunities.

The workflow includes API authentication, retries, idempotency protection, HubSpot contact create/update logic, and error handling.

[View the project](16-ai-gmail-lead-qualification-crm)

### 14 - AI WhatsApp Appointment Booking Agent

An end-to-end conversational booking workflow that extracts appointment details with AI, requests missing information, requires customer confirmation, validates dates and business hours, checks Google Calendar availability, prevents double booking, creates calendar events, and sends contextual WhatsApp responses.

[View the project](14-ai-appointment-booking-agent)



## Automation & Reliability Features

Across the portfolio, the workflows demonstrate:

- Webhooks and REST API integrations
- AI agents and structured AI output
- Idempotency and duplicate prevention
- Retry and error-handling strategies
- CRM integrations
- Multi-step business workflows
- WooCommerce order and inventory processing
- Google Workspace integrations
- Data logging and operational monitoring
- API authentication and validation
- Human-in-the-loop workflow patterns
- RAG with vector search and knowledge-base retrieval
- Atomic message idempotency and stale-processing recovery
- Notification fallback and failure logging

## Technologies

- n8n
- OpenAI
- Google Gemini
- HubSpot CRM
- WooCommerce
- WhatsApp Cloud API
- Telegram
- Gmail
- Google Sheets
- Google Calendar
- Webhooks and REST APIs
- LangChain components
- Structured AI output
- Supabase / PostgreSQL
- pgvector
- Docker

## About

This portfolio focuses on practical business automation systems built with n8n.

The projects cover AI-powered customer support with RAG and human handoff, appointment booking, CRM and lead automation, WooCommerce order processing, inventory monitoring, document processing, content automation, and knowledge-base assistants.

The workflows are designed to go beyond simple demos by incorporating validation, duplicate prevention, retries, error handling, logging, security, and recovery strategies.