---
name: obsidian-incubate-idea
description: >
  Expand collected/grouped ideas from an Obsidian vault by researching online
  (existence, history, experts, future potential), answering the 5W+H journalist
  questions, and developing the Notas section with wikilinks from the user
  profile. Handles all idea types: general, book (book creation ideas), app,
  prompt, and song (including music effects, techniques and plugins). Use when
  user says "incubar ideas", "incubate ideas", "expandir ideas", or wants to
  deepen collected/grouped ideas from AI Space/Collected Ideas/.
---

# Obsidian — Incubate Ideas

Pipeline: Select → Research → Context → Expand → Update

## Quick start

1. Select: find ideas in `collected`/`grouped` with empty Notas. If user passes a name (`"incubá 'LLM como Trinidad'"`), fuzzy match by filename or title — only that one
2. Confirm: show matched ideas and ask user before proceeding. If batch, launch one subagent per idea. If single, process inline
3. Research online with WebFetch: existence, history, experts, future potential
4. Load context: `USER.md` (interests, influences, goals), `CONTEXT.md` (conventions)
5. Expand: write `## Investigación`, `## Las 5W+H`, and `## Notas` per idea_type strategy (see [REFERENCE.md](REFERENCE.md))
6. Update: set `idea_state: incubating`, save

## Configuration

| Param | Default | Description |
|-------|---------|-------------|
| `vault_root` | `.` | Vault root directory |
| `profile_file` | `AI Space/Profile/USER.md` | User profile |
| `context_file` | `AI Space/Profile/CONTEXT.md` | Vault conventions |
| `ideas_dir` | `AI Space/Collected Ideas/ideas/` | Idea notes source |
| `target_state` | `incubating` | State after expansion |
| `mode` | `batch` | `batch` or `single` — auto-detect from user message |

## Select

### Batch mode
User says `"incubá las ideas"` / `"incubate all book ideas"` → grep all matching ideas in `ideas_dir/`.

### Individual mode
User passes a name (`"incubá 'LLM como Trinidad'"`) → fuzzy match:
1. Exact filename match first
2. Substring match against filenames in `ideas_dir/`
3. Substring match against `# Title` inside files
4. If multiple matches, show options and ask user to pick one

### Confirm
Always show the list of matched ideas (title + type + current state) and ask: `"¿Incubar estas N ideas?"` before starting. User can filter further or approve.

For batch mode (2+ ideas), after confirmation, launch one Task subagent per idea. Each subagent runs Research → Expand → Update for exactly one idea. Each subagent gets: the idea file path, REFERENCE.md content, and profile files. Each subagent returns a summary of changes made. Inline processing only for single ideas.

## Research workflow

**Before expanding any idea**, research online with WebFetch. Run 3-4 queries:

1. **Existencia**: `"{idea keywords}"` — does this concept, book, app, prompt, or technique already exist?
2. **Historia**: `"history of {idea keywords}"` — origins, evolution, key milestones
3. **Expertos**: `"{idea keywords} expert researcher pioneer"` — historical and current figures
4. **Futuro**: `"{idea keywords} future trends innovation"` — trajectory, gaps, opportunities

Results go into `## Investigación`. If nothing found: `"Sin registro previo encontrado."`

## Note structure

Expand in place. New sections between Conexiones and Notas:

```
## Idea original
{untouched}
## Conexiones con el perfil
{untouched}
## Investigación                  ← NEW
### Existencia previa
### Contexto histórico
### Expertos
[[Name]] — {contribution}
### Potencial de desarrollo
## Las 5W+H                      ← NEW
### ¿Qué?
### ¿Por qué?
### ¿Quién?
### ¿Cuándo?
### ¿Dónde?
### ¿Cómo?
## Notas                         ← filled
{2-3 paragraphs, references investigación and 5W+H, wikilinks}
```

## 5W+H

Answer each with 1-2 lines informed by research and profile:

| Pregunta | Qué responde |
|----------|-------------|
| **¿Qué?** | En qué consiste la idea, qué es exactamente |
| **¿Por qué?** | Motivo, necesidad, justificación |
| **¿Quién?** | Audiencia, implicados, expertos clave |
| **¿Cuándo?** | Timing: ahora, más adelante, ventana de oportunidad |
| **¿Dónde?** | Contexto, plataforma, ámbito donde existe/aplica |
| **¿Cómo?** | Ejecución, pasos, método para llevarlo a cabo |

## Expansion by type

See [REFERENCE.md](REFERENCE.md) for full strategies per type:

| idea_type | Focus |
|-----------|-------|
| `general` | Conceptual exploration, Zettelkasten connections, open questions |
| `book` | Angle/POV, structure 3-5 chapters, "why now", no competition |
| `app` | Problem solved, core features, stack, validation questions |
| `prompt` | Usable prompt in code block, context, variants, expected output |
| `song` | Lyrics/effect/technique/plugin: mood, method, references, spec |

## Update

For each expanded idea:
1. Update frontmatter: `idea_state: {target_state}` (default `incubating`)
2. Update `profile_rel` if new connections found during research
3. Save. Never modify `## Idea original` or `## Conexiones con el perfil`

## States

`collected` → `grouped` (obsidian-collect-ideas) → `incubating` (this skill) → `developed` (manual/future) → `archived`

## Rules

- **Always confirm** — show matched ideas and ask user before any research or expansion
- **Context isolation** — batch mode (2+ ideas): launch one Task subagent per idea to prevent cross-contamination. Single idea: process inline
- **Spanish first** — if idea is in Spanish, expand in Spanish. English idea → English expansion
- **Voice**: match USER.md traits (polímata, sintetizador, honesto, autocrítico)
- **Wikilinks**: only to entities with dedicated notes in vault
- **Skip already expanded** — if Notas has non-placeholder content, skip
- **Placeholder detection**: empty or `_Espacio para desarrollo futuro._`
- **WebFetch first**: always research before writing 5W+H and Notas
- **All writes inside `ideas_dir/`** (within AI Space/)
