---
name: obsidian-collect-ideas
description: Scan an Obsidian vault for scattered ideas (tagged with configurable idea tags or filename patterns), develop them with wikilinks from a user profile, save them as templated notes, group them by themes, and rank by profile relevance. Use when user says "recolectar ideas", "collect ideas", "agrupar ideas", "group ideas", "ordenar ideas", "organizar por temas", or mentions #ideaforbook, #ideaforapp, #ideaforprompt.
---

# Obsidian — Collect & Group Ideas

Pipeline: Scan → Develop → Save → Read → Cluster → Rank → Save themed → Index

## Configuration

| Param | Default | Description |
|-------|---------|-------------|
| `mode` | `ask` | `full`, `collect`, `group`, or `ask` (infer from message, or preguntar) |
| `vault_root` | `.` | Vault root directory |
| `profile_file` | (required) | Path to `USER.md` (from `personal-profiler`). Flat `§`-delimited entries |
| `output_dir` | (required) | Destination folder inside vault |
| `idea_tags` | `#idea`, `#ideafor*` | Tags that mark raw ideas |
| `filename_patterns` | `*Ideas*`, `Ideas for*` | Filename patterns for idea notes |

If `mode: ask` and the user's message doesn't imply a phase, ask: "¿Recolectar ideas nuevas, agrupar las existentes, o ambas?"

## Phase 1 — Collect

### Scan
Grep `idea_tags` across `.md` files + glob `filename_patterns`. Exclude `.obsidian/`, templates, `.base`, `output_dir`. Record: raw text, source, tag, line.

### Develop
Per idea: **type** (strip `#ideafor` → `book`/`app`/`prompt`/`song`, bare `#idea` → `general`), **title** (concise, vault's language), **profile match** (parse `USER.md` entries by category — lexical overlap → 2–4 `[[wikilinks]]` to entities, record category), **deduplicate** (skip duplicates, keep oldest source).

### Save (individual note)

```
---
idea_type: {type}
source: "[[{source_file}]]"
profile_rel: ["[[USER.md]] ({category})"]
tags: [idea-desarrollada, {original_tag}]
created: {YYYY-MM-DD}
---
# {Title}
## Idea original
{raw text, verbatim}
## Conexiones con el perfil
- [[Entity]] — {reason}
## Notas
_Espacio para desarrollo futuro._
```

### Index
`{output_dir}/Índice de Ideas.md` — `[[wikilinks]]` grouped by `idea_type`.

## Phase 2 — Group

### Read
Load individual notes from `output_dir`. Skip índices and themed notes. Parse frontmatter + body.

### Cluster
Each `USER.md` category → theme bucket. Assign ideas to the theme matching their `profile_rel` category. Strongest lexical match wins ties. No match → `General`.

### Rank
Score within each theme: category match **+1**, entity match **+2**, interest keyword **+1**, goal mention **+3**. Tiers: top third → Alta, middle → Media, bottom → Baja.

### Save (themed note)

```
---
theme: {name}
profile_rel: "[[USER.md]] ({category})"
idea_count: {N}
created: {YYYY-MM-DD}
---
# {Theme} — Ideas
## Prioridad alta
- [[Idea A]] — {one-line summary}
## Prioridad media
- [[Idea C]] — {summary}
## Prioridad baja
- [[Idea D]] — {summary}
```

### Index
`{output_dir}/Índice de Temas.md` — `[[wikilinks]]` to themed notes, by idea count descending.

## Rules

- Preserve original language
- Profile matching: lexical overlap with `USER.md` flat entries
- Rankings: relative within theme, score 0 still appears in Baja
- Themed notes overwrite on re-run (idempotent)
- All output inside `output_dir`
