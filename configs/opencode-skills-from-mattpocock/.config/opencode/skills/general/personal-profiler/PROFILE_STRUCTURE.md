# Profile Structure (Hermes-inspired)

Two bounded, flat files. The agent curates within strict character limits. Entries are plain text separated by `§`.

---

## USER.md (1,375 chars)

**Purpose:** Who the user is — the agent's understanding of the person it's talking to.

### Entry priority (highest to lowest)

| Priority | Category | What to extract |
|----------|----------|----------------|
| 1 | Identity | Name, role, location, languages. One sentence. |
| 2 | Active projects | What they're building/working on right now. Max 3. |
| 3 | Current goals | Stated aspirations and deadlines. |
| 4 | Core interests | Top 3-5 recurring themes ranked by vault frequency. |
| 5 | Key influences | Named people/entities with dedicated notes. Comma-separated. |
| 6 | Work style | Habits, routines, tools they use daily. |
| 7 | Values & beliefs | Explicit principles. Short statements only. |
| 8 | Current state | Recent focus, mood, concerns. One sentence. |
| 9 | Personality traits | 3-5 inferred traits. Adjective + evidence keyword. |

### Format

```
Identity: {one sentence}
Projects: {project} ({role}), {project} ({role})
Goals: {goal}, {goal}
Interests: {domain}: {keywords}; {domain}: {keywords}
Influences: [[Name]] ({domain}), [[Name]] ({domain})
Work: {routine summary}
Values: {principle}; {principle}
State: {current focus / concern}
Traits: {trait} ({evidence}), {trait} ({evidence})
```

### Sources

| Source | Primary extract |
|--------|----------------|
| `Journal/` | Identity, goals, state, routine |
| `People/` | Influences |
| `Projects/` | Active projects, skills |
| Root notes, `Atlas/` | Interests, values |
| `Books/`, `Clippings/` | Interests, influences |

---

## CONTEXT.md (2,200 chars)

**Purpose:** What the agent needs to know about the vault environment — structure, conventions, restrictions.

### Entry priority (highest to lowest)

| Priority | Category | What to extract |
|----------|----------|----------------|
| 1 | Write restrictions | What files/dirs are off-limits (from AGENTS.md). Critical. |
| 2 | Vault structure | Key folders and what each contains. One line per folder. |
| 3 | Naming conventions | How notes, tags, links work. From AGENTS.md. |
| 4 | Language | Primary language. From AGENTS.md or content scan. |
| 5 | Templates | Available templates and when to use each. |
| 6 | Tools & plugins | Active Obsidian plugins, external tools referenced. |
| 7 | Observed conventions | Patterns not explicitly stated but consistent (e.g. "Clippings use YouTube title as filename"). |

### Format

```
Restrictions: Only write in {allowed_dirs}. Never touch {forbidden_dirs}.
Structure: {folder}: {purpose}; {folder}: {purpose}
Conventions: Links via [[wikilinks]]. Tags via #tag. Primary language: {lang}.
Templates: {name}: {use case}; {name}: {use case}
Tools: {tool}, {tool}
Patterns: {observed convention}; {observed convention}
```

### Sources

| Source | Primary extract |
|--------|----------------|
| `AGENTS.md` | Restrictions, conventions, language |
| Top-level directory listing | Vault structure |
| `Templates/` | Available templates |
| `.obsidian/` | Plugins (just list names, don't read config) |
| `Journal/` | Observed patterns, tools used |
| `AI Space/Templates/` | AI-specific templates |

---

## Curation rules

1. **Each file is bounded** — never exceed the char limit. If output would overflow, consolidate or drop lowest-priority entries first.
2. **Merge over delete** — before dropping, try combining related entries into one shorter version.
3. **Flat entries** — entries separated by `§`, not markdown headings or lists.
4. **No filler** — cut "seems to", "appears to", "it is worth noting that". Facts only.
5. **Wikilinks only for named entities** — `[[Jim Rohn]]`, not `[[some concept]]` unless the concept has a dedicated note.
6. **Frontmatter** — both files get `last_scan:` and `last_incremental:` date fields in YAML frontmatter.
