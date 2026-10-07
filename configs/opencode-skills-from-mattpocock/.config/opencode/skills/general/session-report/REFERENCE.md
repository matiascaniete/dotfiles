# REFERENCE — Session Report

Disclosed reference for [SKILL.md](SKILL.md): the section schema, diagram selection, language rules, and the two scripts.

## Section schema

Order the report by these headings. Keep only the sections the session has material for.

| # | Section | Qualifies when |
|---|---|---|
| 1 | **TL;DR** | Always. 2–4 sentences: what the session set out to do and where it landed. |
| 2 | **Context / Problem** | Always. The trigger and constraints, from the session's first human turns. |
| 3 | **Approach / Solution** | The session produced or changed code. The narrative of what was done. |
| 4 | **Key concepts** | The session uses terms a reader needs defined (domain or technical). |
| 5 | **Code snippets** | The session touched code. Real snippets with `path:line`; before/after when a change is shown. |
| 6 | **Diagram** | The change has structural shape (see table below). |
| 7 | **Decisions & tradeoffs** | Alternatives were weighed in the transcript. |
| 8 | **Gotchas** | Surprises, pitfalls, or debugging that shaped the outcome. |
| 9 | **Verification** | Commands/tests were run. Quote them and their result. |
| 10 | **Next steps / open questions** | The session left something unresolved. |
| 11 | **Appendix** | Always. Files touched, then session metadata: id, directory, date, model. |

## Diagram selection

One diagram is usually enough; add a second only when a different concern needs it.

| The material is… | Type |
|---|---|
| Interaction between components/services | `sequenceDiagram` |
| Data or control flow, a pipeline | `flowchart LR` (or `TB`) |
| Types, interfaces, inheritance | `classDiagram` |
| A lifecycle or state machine | `stateDiagram-v2` |
| Modules, layers, dependencies | `flowchart` with `subgraph` |
| Entities and their relations | `erDiagram` |

Label arrows with the real verb (`calls`, `imports`, `emits`). Keep node ids ASCII; quote labels that hold spaces, accents, or punctuation.

## Language rules

- Report language = the session's dominant language, taken from the human turns. Pass its ISO 639-1 code to `--lang`.
- The HTML UI localizes from `--lang` for `en, es, ca, fr, pt, de, it`; anything else falls back to English.
- Write the prose and Mermaid labels in the session language. Keep code, file paths, and commands verbatim.

## Scripts

Both run with `node`; no install, no network.

### `scripts/read-session.mjs`

```bash
node scripts/read-session.mjs <sessionID | export.json> [--reasoning] [--full-output]
```

A `ses_…` argument is exported with `opencode export`; any other path is read as an already-exported JSON. `--reasoning` includes the model's reasoning parts; `--full-output` disables tool-output truncation. The transcript prints to stdout, in order.

### `scripts/build-report.mjs`

```bash
node scripts/build-report.mjs --in report.md --out session-report.html --title "<title>" --lang es
```

- `--title` defaults to the first H1 in the Markdown; `--lang` defaults to `en`.
- A fence info string of ` ```ts file=src/auth/token.ts:42 ` becomes a caption above the block.
- Output is a single self-contained HTML (~3.7 MB): marked + highlight.js + mermaid are inlined, so it opens offline. Diagrams render in-browser with a light/dark toggle; the TOC and Copy buttons are generated at load.
