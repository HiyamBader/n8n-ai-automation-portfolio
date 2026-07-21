# JSON Schemas

This document contains the structured output schemas used by the AI agents in the workflow.

---

# 1. AI Content Strategist

## Output Schema

```json
{
  "keyword": "string",
  "reason": "string",
  "selected_title": "string",
  "alternative_titles": [
    "string"
  ]
}
```

### Description

| Field | Type | Description |
|-------|------|-------------|
| keyword | string | Selected SEO keyword |
| reason | string | Short explanation for the keyword selection |
| selected_title | string | Primary SEO article title |
| alternative_titles | array | Alternative article titles |

---

# 2. AI Article Writer

## Output Schema

```json
{
  "title": "string",
  "meta_description": "string",
  "article": "string",
  "cta": "string"
}
```

### Description

| Field | Type | Description |
|-------|------|-------------|
| title | string | Final article title |
| meta_description | string | SEO meta description |
| article | string | Complete SEO article |
| cta | string | Call-to-Action |

---

# 3. AI Social Media Writer

## Output Schema

```json
{
  "facebook_post": "string",
  "instagram_caption": "string",
  "hashtags": [
    "string"
  ]
}
```

### Description

| Field | Type | Description |
|-------|------|-------------|
| facebook_post | string | Facebook post |
| instagram_caption | string | Instagram caption |
| hashtags | array | Instagram hashtags |

---

# 4. AI Image Prompt Writer

## Output Schema

```json
{
  "image_prompt": "string"
}
```

### Description

| Field | Type | Description |
|-------|------|-------------|
| image_prompt | string | English prompt used for AI image generation |

---

# Workflow Summary


Content Strategist
        ↓
Article Writer
        ├────────→ Social Media Writer
        └────────→ Image Prompt Writer
