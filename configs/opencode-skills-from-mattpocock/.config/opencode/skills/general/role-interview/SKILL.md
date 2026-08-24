---
name: role-interview
description: Conduct an exhaustive interview about the user's role, position, or project to produce a comprehensive context document suitable for LLM consumption. Use when the user wants to document their job, reflect on their position, prepare context for another agent, or mentions "role interview", "document my position", "position context".
---

# Role Interview

Interview the user exhaustively about their position, role, or project. The goal is to produce a structured context document that captures their full professional landscape — useful for feeding into another LLM as context.

## Process

1. **Scope the interview**: Ask the user which project, role, or position they want to document. Clarify the purpose — but default to producing a rich context document for LLM use. Ask where to save the output file.

2. **Interview by domain**: Go through each domain in [REFERENCE.md](REFERENCE.md). Ask one question at a time. Probe vague answers — demand specifics, examples, names, and metrics. Do not move on until the answer is concrete.

3. **Prioritize depth**: Not all domains are equally relevant. If a domain is exhausted, skip remaining questions. If the user's answers reveal a critical area not covered by the question bank, explore it.

4. **Produce the document**: After completing all relevant domains, write the output to the agreed location using the format below.

## Output format

Save as `{project-or-role-name}-context.md`:

```markdown
# Role Context: [Title] at [Organization/Project]

## Identity
- Title, tenure, team, reporting structure

## Responsibilities
- Primary duties, areas of accountability, decision authority, out-of-scope

## Current Work
- Active projects, recent deliverables, roadmap

## Technical & Domain Expertise
- Stack, skills, tools, domain knowledge

## Stakeholders & Relationships
- Key people, teams, dependencies

## Challenges & Growth
- Blockers, skill gaps, career goals, feedback themes

## Processes & Culture
- How work gets done, ceremonies, unwritten rules, evaluation

## Impact & Metrics
- Success criteria, achievements, KPIs
```

## Rules

- Ask one question at a time. Wait for the answer before continuing.
- If an answer is vague, follow up with "give me a concrete example" or "name specific people/numbers/dates".
- Skip domains that the user says are not relevant.
- The final document must be self-contained — anyone reading it (human or LLM) should have a complete picture.
