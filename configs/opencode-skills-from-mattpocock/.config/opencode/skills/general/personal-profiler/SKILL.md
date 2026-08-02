---
name: personal-profiler
description: Scan any Obsidian vault to generate and maintain a personal profile of the vault owner — identity, interests, values, professional context, goals, and current state. Use when user asks about themselves ("who am I", "my profile", "qué sé de mí"), wants to create or update their profile, or when an agent needs user context for personalization.
---

# Personal Profiler

## Quick start

1. Determine vault root from context (AGENTS.md, working directory, or user)
2. Check write rules: if `AGENTS.md` restricts writes, output to `AI Space/Personal Profile.md`; otherwise vault root
3. If no existing profile → run **Full scan**. If profile exists → run **Incremental scan** (or ask user)

## Vault detection

Infer the vault path from:
- The `AGENTS.md` file in the working directory
- Explicit user direction ("my vault is at /path/to/vault")
- The current workspace context

Always scan `AGENTS.md` first — it may define write restrictions and naming conventions.

## Scan sources

| Source | Extract |
|---|---|
| `AGENTS.md`, `README.md`, any `about` / `profile` note | Explicit identity data, conventions |
| `Journal/` or `Daily/` | Links, ideas, tasks, concerns, mood, content consumed, recurring patterns |
| Root-level `.md` notes | Active interest topics, knowledge domains |
| `Projects/` | Professional context, skills, business, current work |
| `People/` | Influences, relationships, people of interest |
| `Books/` | Reading habits, research topics |
| `Clippings/` | Consumed content, authors, themes |
| `Atlas/` or `Concepts/` | Deep interests, structured knowledge |
| `TaskNotes/` | Active tasks, organization method, priorities |
| `Years/` | Historical interests, personal timeline |
| `Templates/` | Note types created → interests, mental models |

Skip: `.obsidian/`, `Attachments/`, `Excalidraw/`, binary files.

## Workflows

### Full scan

1. Scan all sources listed above
2. For `Journal/`: read entries from the last 60 days. If fewer, read all. Identify recurring links, topics, emotional language, and explicit self-statements
3. For each other source: sample enough notes to identify themes. Use Glob to list files, then Read a representative sample
4. Synthesize findings into sections (see [PROFILE_STRUCTURE.md](PROFILE_STRUCTURE.md))
5. Write output to `Personal Profile.md` in the allowed output directory
6. Add `Last full scan: YYYY-MM-DD` and `Last update: YYYY-MM-DD` to the profile frontmatter

### Incremental scan

1. Read the existing profile to identify `Last update` date
2. Scan Journal entries since that date
3. Glob for `.md` files modified since that date (use Bash: `find` with `-newer` or check Journal dates)
4. Read new/modified content, extract new themes
5. Update relevant sections of the profile. Append new insights, avoid duplication
6. Update `Last update` in frontmatter

### Refresh

1. Same as Full scan
2. Overwrite the existing profile completely
3. Mark as `Last full scan: YYYY-MM-DD (refresh)` in frontmatter

## Guidelines

- **Language**: match the vault's primary language (check `AGENTS.md` or README)
- **Links**: use the vault's link style (`[[wikilinks]]` or markdown links) per `AGENTS.md`
- **Be honest**: only include what the vault actually contains. If a section has no data, note "No data found" rather than inventing
- **Avoid duplication**: during incremental scans, check existing content before appending
- **Frontmatter**: include `last_scan:` and `last_incremental:` dates

## Profile sections

See [PROFILE_STRUCTURE.md](PROFILE_STRUCTURE.md) for the full 9-section template with per-source extraction guidance.
