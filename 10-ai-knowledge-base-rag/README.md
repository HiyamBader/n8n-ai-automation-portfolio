# AI Knowledge Base Assistant (RAG)

## Overview

An AI-powered Retrieval-Augmented Generation (RAG) system built with n8n.

The workflow automatically indexes PDF documents from Google Drive into a Supabase vector database and allows users to ask questions through Telegram. The AI retrieves relevant information from the knowledge base before generating accurate answers using Google Gemini.

---

## Features

- Automatic PDF indexing from Google Drive
- Extracts and splits document text
- Generates vector embeddings using Google Gemini
- Stores embeddings in Supabase Vector Database
- Semantic search with Retrieval-Augmented Generation (RAG)
- AI Agent answers questions using uploaded documents only
- Telegram chatbot interface
- Automated knowledge base workflow
- Modular and scalable workflow design

---

## Tech Stack

- n8n
- Google Drive
- Google Gemini
- Supabase (Vector Database)
- Telegram Bot
- Retrieval-Augmented Generation (RAG)
- Vector Embeddings

---

## Workflow

### Indexing Pipeline

Google Drive Trigger

↓

Download PDF

↓

Extract Document Text

↓

Split Text into Chunks

↓

Generate Gemini Embeddings

↓

Store in Supabase Vector Database

---

### Question Answering Pipeline

Telegram

↓

AI Agent

↓

Retrieve Relevant Chunks from Supabase

↓

Generate Answer with Google Gemini

↓

Reply to User via Telegram

---

## Skills Demonstrated

- AI Workflow Automation
- Retrieval-Augmented Generation (RAG)
- Vector Search
- Semantic Search
- Vector Embeddings
- Document Processing
- Google Drive Integration
- Supabase Integration
- Telegram Bot Integration
- AI Agent Design
- Knowledge Base Automation

---

## Future Improvements

- Support multiple document formats (DOCX, TXT, Markdown)
- Automatic update and re-indexing when documents change
- Automatic deletion of removed documents
- Source citations in AI responses
- Multi-language support
- Conversation memory
- Admin dashboard

---

## Project Goal

Build an automated AI knowledge base that continuously indexes documents and provides accurate, context-aware answers using Retrieval-Augmented Generation (RAG).

---

## Author

Built with n8n, Google Gemini, Supabase, and Telegram Bot.