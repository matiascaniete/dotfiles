# Profile Structure

The profile has 9 sections. For each section, extract only what the vault actually contains. If a source yields nothing for a section, skip it rather than inventing.

## Section overview

| # | Section | Core question |
|---|---|---|
| 1 | Identity | Who is this person? |
| 2 | Interests & Passions | What do they care about? |
| 3 | Professional Life | What do they do / build? |
| 4 | Habits & Routines | How do they spend their days? |
| 5 | Influences | Who and what shaped them? |
| 6 | Values & Beliefs | What principles guide them? |
| 7 | Goals & Projects | What are they working toward? |
| 8 | Current State | What's on their mind right now? |
| 9 | Personality Traits | How do they think and express themselves? |

---

## 1. Identity

**What**: Name, location, age range, languages, background summary.

**Sources**:

| Source | Look for |
|---|---|
| `AGENTS.md` | Language conventions, any personal metadata |
| `README.md` | Self-description, vault purpose |
| `Journal/` | Self-references ("yo", "my", "me"), location mentions, biographical facts |
| Any `about`, `profile`, `bio` note | Explicit identity statements |

**Output**: 2-4 sentence summary. Only include what the vault confirms.

---

## 2. Interests & Passions

**What**: Topics that appear repeatedly — hobbies, fields of study, content consumed.

**Sources**:

| Source | Look for |
|---|---|
| **Root notes** | Note titles = declared interests. Content = depth of engagement |
| `Journal/` | Links shared (YouTube, Spotify, articles), recurring themes in daily entries |
| `Atlas/` or `Concepts/` | Topics they've structured and developed |
| `Books/` | Subjects they read about |
| `Clippings/` | Content they chose to save — reveals genuine interest |
| `Templates/` | Note types they regularly create (e.g. book notes, quote collections) |

**Output**: Bulleted list grouped by domain (e.g. "Health: keto, carnivore, fasting"). Rank by frequency — most-referenced topics first.

---

## 3. Professional Life

**What**: Job, skills, business, projects, professional identity.

**Sources**:

| Source | Look for |
|---|---|
| `Projects/` | Active projects, role, tools used, clients/customers |
| `Journal/` | Work-related entries, technical tasks, business mentions |
| `TaskNotes/` | Work tasks, professional priorities |
| `AGENTS.md` | May describe professional context |
| `README.md` | Project descriptions, skill lists |

**Output**: Current role, key skills, active projects. Include tools and platforms where evident.

---

## 4. Habits & Routines

**What**: Daily patterns, recurring activities, time of day patterns.

**Sources**:

| Source | Look for |
|---|---|
| `Journal/` | Posting cadence, time-of-day patterns, recurring activities (exercise, reading, work sessions) |
| `Templates/` | Structure of daily notes — reveals routine elements |
| `TaskNotes/` | Recurring task types, organization style |

**Output**: Observed patterns (e.g. "writes daily, usually evenings"). Time ranges where detectable. Note if Journal is sporadic vs consistent.

---

## 5. Influences

**What**: People, books, creators, philosophies that appear repeatedly.

**Sources**:

| Source | Look for |
|---|---|
| `People/` | Names and frequency — which figures have dedicated notes |
| `Books/` | Titles, authors |
| `Clippings/` | Authors, speakers, creators whose content is saved |
| `Journal/` | Names mentioned, links shared, videos watched |
| `Atlas/` | Concepts attributed to specific thinkers |

**Output**: Grouped by type (authors, philosophers, creators, etc.). List names with brief context of why they matter (from note content).

---

## 6. Values & Beliefs

**What**: Principles, philosophies, worldviews evident from content choices and language.

**Sources**:

| Source | Look for |
|---|---|
| Root notes on philosophy, lifestyle, religion | Explicit belief statements |
| `Atlas/` or `Concepts/` | Structured thinking on abstract topics |
| `Clippings/` | Content they agree with enough to save — reveals alignment |
| `Journal/` | Opinionated statements, reactions, "I believe", "I think" |
| `Books/` | Books on philosophy, self-help, spirituality |

**Output**: Short statements in their own words where possible ("Values: self-improvement, discipline, creativity"). Distinguish explicit statements from inferred patterns.

---

## 7. Goals & Projects

**What**: Current projects, ideas being developed, stated aspirations.

**Sources**:

| Source | Look for |
|---|---|
| `Projects/` | Active project descriptions, milestones |
| `TaskNotes/` | Pending tasks, priorities |
| `Journal/` | `#ideaforbook`, `#ideaforapp`, `#ideaforprompt`, `#task` tags, stated goals |
| Root notes on business, career, life planning | Long-term aspirations |

**Output**: Active projects (with brief description), stated goals, and ideas tagged for future development. Separate "active" from "ideation".

---

## 8. Current State

**What**: Recent focus, concerns, mood, what they're working on right now.

**Sources**:

| Source | Look for |
|---|---|
| `Journal/` (last 30 days) | Emotional language, urgent tasks, recurring worries, excitement, technical problems |
| `TaskNotes/` | Active tasks — what's being worked on today/this week |
| Recent note modifications | What topics are they actively engaging with |

**Output**: 3-5 bullets covering: current focus area, any expressed concerns or blockers, overall tone of recent entries. Date-bound ("As of [last journal date]...").

---

## 9. Personality Traits

**What**: Inferred traits from writing style, content choices, and organizational patterns.

**Sources**:

| Source | Look for |
|---|---|
| `Journal/` | Writing tone (casual/formal, emotional/reserved), humor, self-reflection depth |
| `Templates/` | Organizational style — structured vs freeform |
| `TaskNotes/` | Detail orientation, follow-through patterns |
| All sources | Content breadth (polymath) vs depth (specialist), curiosity signals |

**Output**: 3-5 inferred traits with evidence (e.g. "Curious — vault spans 10+ domains"). Mark as "inferred" to distinguish from explicit identity data.

---

## Source-to-section mapping (quick reference)

| Source | Primary sections |
|---|---|
| `AGENTS.md`, `README.md` | 1, 3 |
| `Journal/` | 1, 2, 4, 6, 7, 8, 9 |
| Root notes | 2, 6 |
| `Projects/` | 3, 7 |
| `People/` | 5 |
| `Books/` | 2, 5, 6 |
| `Clippings/` | 2, 5, 6 |
| `Atlas/` / `Concepts/` | 2, 5, 6 |
| `TaskNotes/` | 3, 4, 7, 8 |
| `Years/` | 2, 5 |
| `Templates/` | 2, 4, 9 |
