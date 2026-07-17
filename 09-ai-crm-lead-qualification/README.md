# 09 - AI CRM Lead Qualification

## Goal

Build an AI-powered lead qualification workflow that receives new leads, validates their information, evaluates their sales potential, assigns a lead score, and routes them based on priority.

## Features

- Receive leads through a webhook
- Normalize lead information
- Validate required fields
- Analyze lead quality with AI
- Generate a lead score
- Classify leads as Hot, Warm, or Cold
- Save leads to Google Sheets
- Notify the sales team about high-priority leads

## Lead Fields

- Name
- Email
- Phone
- Company
- Service
- Budget
- Timeline
- Message

## Workflow

Webhook  
↓  
Normalize Lead  
↓  
Validate Required Fields  
↓  
AI Lead Qualification  
↓  
Parse Structured Output  
↓  
Route Lead Status  

├── Hot → Notify Sales  
├── Warm → Save for Follow-up  
└── Cold → Save to CRM  

↓  
Google Sheets

## Skills

- Webhook
- Data Normalization
- Input Validation
- Message a Model
- Prompt Engineering
- Structured Output
- AI Lead Scoring
- Switch Routing
- Google Sheets
- Telegram or Email Notifications

## Status

🟡 Planning

## Version

v1.0