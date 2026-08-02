---
name: personal-profiler
description: Scan any Obsidian vault to generate and maintain a personal profile of the vault owner — identity, interests, values, professional context, goals, and current state. Use when user asks about themselves ("who am I", "my profile", "qué sé de mí"), wants to create or update their profile, or when an agent needs user context for personalization.
---

# Personal Profiler

Inspired by Hermes Agent's memory model: two compact, bounded, flat files curated by the agent — not one monolithic document.

## Quick start

1. Determine vault root from context (AGENTS.md, working directory, or user)
2. Check write rules: if AGENTS.md restricts writes, output to `AI Space/Profile/`; otherwise vault root
3. If no existing profile → Full scan. If exists → Incremental scan

## Output: two files

| File | Char limit | Purpose |
|------|-----------|---------|
| `USER.md` | 1,375 chars (~500 tokens) | Who the user is — identity, interests, influences, goals, traits |
| `CONTEXT.md` | 2,200 chars (~800 tokens) | Vault environment — structure, conventions, write restrictions, tools |

Both in `{output_dir}/`. Entries are flat text separated by `§`. Agent curates: when full, consolidate or drop before adding. See [PROFILE_STRUCTURE.md](PROFILE_STRUCTURE.md) for templates and entry format.

## Scan sources

| Source | Extract |
|---|---|
| `AGENTS.md`, `README.md`, profile notes | Identity, conventions, write rules |
| `Journal/` or `Daily/` (last 60 days) | Links, tasks, concerns, mood, patterns |
| Root `.md` notes, `Atlas/` | Interests, knowledge domains |
| `Projects/` | Professional context, skills, active work |
| `People/` | Influences, relationships |
| `Books/`, `Clippings/` | Interests, consumed content, authors |
| `TaskNotes/` | Active tasks, priorities |
| `Templates/` | Note types → interests, mental models |

Skip: `.obsidian/`, `Attachments/`, `Excalidraw/`, binary files.

## Workflows

### Full scan

1. Scan all sources. Sample enough from each to identify themes
2. Synthesize into `USER.md` and `CONTEXT.md` per [PROFILE_STRUCTURE.md](PROFILE_STRUCTURE.md)
3. **Curate**: strict char limits. Merge overlapping entries, drop low-priority before anything else. Never exceed limits
4. Write to `{output_dir}/USER.md` and `{output_dir}/CONTEXT.md`
5. Add `last_scan:` and `last_incremental:` dates to both frontmatters

### Incremental scan

1. Read existing files → get `last_incremental` date
2. Scan Journal + `.md` files modified since that date (`find -newer`)
3. Extract new themes. Update entries. Consolidate if near char limit
4. Update `last_incremental` in frontmatter

### Refresh

Full scan. Overwrite both files. Mark `last_scan: YYYY-MM-DD (refresh)`.

## Curation rules

| Rule | Detail |
|------|--------|
| Bounded | Never exceed char limits. If overflow, consolidate or drop |
| Merge over delete | Combine related entries before removing |
| Flat | `§`-delimited, not markdown sections |
| Compact | No filler words. Facts only |
| Prioritize | Identity > active projects > goals > past interests |
| Wikilinks | Only for named entities with dedicated notes |

## Guidelines

- **Language**: match vault's primary language (from AGENTS.md)
- **Links**: vault's link style (`[[wikilinks]]` or markdown) per AGENTS.md
- **Honest**: only what the vault actually contains. Skip sections with no data
- **Frontmatter**: `last_scan:` and `last_incremental:` in YAML on both files
