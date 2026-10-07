---
name: session-report
description: Convierte una sesión de código en un informe HTML explicativo y autocontenido, con snippets reales y diagramas Mermaid; el idioma del informe sigue el de la sesión.
argument-hint: "[sessionID | export.json] (por defecto: la sesión actual)"
disable-model-invocation: true
---

# Session Report

Produce a **grounded** explanatory report of a code session: every snippet and diagram traces to a real source — a resolved `file:line` in the code, or the session transcript. The report is written in the **session's language**, so a reader who never saw the session finishes it understanding what was done and why.

Load [REFERENCE.md](REFERENCE.md) before step 3 for the section schema, the diagram-type table, the report/UI language rules, and the build flags.

## Steps

1. **Resolve the source** — Default: the current session. If the argument is a session ID or an exported JSON path, read it with `node scripts/read-session.mjs <id|file>`. Record the session's working directory and its dominant language (the language of the human turns). *Done when source read and `dir` + `lang` recorded.*

2. **Collect material** — In the session's directory, list every file the session touched (`git status` / `git diff`, or the transcript's tool calls) and read them. *Done when every touched file is either quoted with its `file:line` or listed as out of scope.*

3. **Outline** — Per REFERENCE.md, keep only the sections the session has material for, and assign each diagram its type from the table. *Done when the outline covers all and only the sections with material.*

4. **Write `report.md`** — In the session's language, per the schema. Tag every fence with its language and source: ` ```<lang> file=<path>:<line> `; diagrams go in ` ```mermaid ` fences. *Done when every snippet carries its source and every fence has a language.*

5. **Build** — `node scripts/build-report.mjs --in report.md --out session-report.html --title "<title>" --lang <lang>`. *Done when the HTML exists and opens with its diagrams rendered and its TOC populated.*

6. **Deliver** — Report the output path and offer to open it.

## Rules

- **Grounded.** Trace every snippet and claim to its source; mark what you cannot verify `???`.
- Report language = session language; the HTML UI (TOC, Copy, theme) localizes itself from `--lang`.
- Write only under the output directory. The reported code stays untouched.
- Keep a diagram under ~15 nodes; nest or split past that. ASCII node ids, quoted labels.
- Redact secrets (keys, tokens, credentials) from snippets and transcript quotes.
- A section with no material is dropped, not padded.

## Output

Default directory: the OS temp dir, e.g. `$TMPDIR/session-report-<slug>-<date>/`, holding `report.md` and `session-report.html`.
