-- Project 18: Supabase/PostgreSQL setup
-- Run in the Supabase SQL Editor before importing/running the workflow.

CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS support_conversations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id TEXT,
    customer_name TEXT,
    customer_email TEXT,
    status TEXT NOT NULL DEFAULT 'AI_ACTIVE'
        CHECK (status IN ('AI_ACTIVE', 'HUMAN_ACTIVE', 'CLOSED')),
    initial_message_id TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE UNIQUE INDEX IF NOT EXISTS ux_support_conversations_initial_message_id
ON support_conversations(initial_message_id)
WHERE initial_message_id IS NOT NULL;

CREATE TABLE IF NOT EXISTS support_notification_failures (
    id BIGSERIAL PRIMARY KEY,
    conversation_id UUID NOT NULL,
    channel TEXT NOT NULL,
    error_message TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_notification_conversation
        FOREIGN KEY (conversation_id)
        REFERENCES support_conversations(id)
        ON DELETE CASCADE,
    CONSTRAINT chk_notification_channel
        CHECK (channel IN ('EMAIL', 'TELEGRAM'))
);

CREATE TABLE IF NOT EXISTS support_message_idempotency (
    message_id TEXT PRIMARY KEY,
    status TEXT NOT NULL DEFAULT 'PROCESSING'
        CHECK (status IN ('PROCESSING', 'COMPLETED')),
    response JSONB,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS documents (
    id BIGSERIAL PRIMARY KEY,
    content TEXT,
    metadata JSONB,
    embedding VECTOR(1536)
);

CREATE OR REPLACE FUNCTION match_documents (
    query_embedding VECTOR(1536),
    match_count INT DEFAULT NULL,
    filter JSONB DEFAULT '{}'
)
RETURNS TABLE (
    id BIGINT,
    content TEXT,
    metadata JSONB,
    similarity FLOAT
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        documents.id,
        documents.content,
        documents.metadata,
        1 - (documents.embedding <=> query_embedding) AS similarity
    FROM documents
    WHERE documents.metadata @> filter
    ORDER BY documents.embedding <=> query_embedding
    LIMIT match_count;
END;
$$;

CREATE OR REPLACE FUNCTION claim_support_message(p_message_id TEXT)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    v_inserted_message_id TEXT;
BEGIN
    INSERT INTO support_message_idempotency (message_id, status)
    VALUES (p_message_id, 'PROCESSING')
    ON CONFLICT (message_id) DO NOTHING
    RETURNING message_id INTO v_inserted_message_id;

    IF v_inserted_message_id IS NOT NULL THEN
        RETURN 'CLAIMED';
    ELSE
        RETURN 'ALREADY_EXISTS';
    END IF;
END;
$$;

CREATE OR REPLACE FUNCTION reclaim_stale_support_message(p_message_id TEXT)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    v_reclaimed_id TEXT;
BEGIN
    UPDATE support_message_idempotency
    SET updated_at = NOW()
    WHERE message_id = p_message_id
      AND status = 'PROCESSING'
      AND updated_at < NOW() - INTERVAL '5 minutes'
    RETURNING message_id INTO v_reclaimed_id;

    IF v_reclaimed_id IS NOT NULL THEN
        RETURN 'RECLAIMED';
    ELSE
        RETURN 'NOT_RECLAIMED';
    END IF;
END;
$$;
