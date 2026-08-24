---
name: architecture-viewer
description: Generate UML-like architecture diagrams of module structure and dependencies, either by scanning a codebase or by rendering a described structure. Use when the user asks to visualize architecture, module structure, dependencies, layers, components, or wants a diagram (Mermaid/PlantUML) of their code or a design.
---

# Architecture Viewer

## Quick start

Two workflows, same output format (Mermaid by default):

1. **Scan** — the user asks about *existing* code: analyze it with grep/glob, build a diagram from what you find.
2. **Render** — the user *describes* a structure (modules, layers, deps): render it as a diagram directly.

### Workflow A: Scan → diagram

1. If the language isn't obvious from the project, **ask** the user before analyzing.
2. Identify modules: top-level dirs, packages, components, or entry points.
3. Trace relationships: imports, requires, function/service calls between modules.
4. Group into layers/contexts (e.g. `domain`, `application`, `infrastructure`).
5. Output one diagram per architectural level (start with module/component level).
6. Render a preview with mermaid-cli (see **Visualización** below).
7. Offer the live view with zoom/folding (see **Vista en vivo** below).

### Workflow B: Render → diagram

1. Ask only if ambiguous: output format, nesting depth, which nodes to highlight.
2. Map the described structure to nodes and relationship arrows.
3. Keep the user's naming verbatim — never rename their modules.

## Diagram type selection

| Level asked | Type | Format |
|---|---|---|
| Module/package structure | `flowchart` (Mermaid) / `component` (PlantUML) | Default |
| Dependencies between services | `flowchart LR` with labeled arrows | Default |
| Classes and inheritance | `classDiagram` (Mermaid) / `class` (PlantUML) | Default |
| Layers or bounded contexts | `flowchart` with nested `subgraph` | Default |
| Full UML (interfaces, composition) | `classDiagram` / PlantUML `class` | PlantUML |

Default to **Mermaid embedded in a markdown file**. Offer **PlantUML** when the user wants pure UML (inheritance, composition, interfaces). Ask if in doubt.

## Visualización

Render every Mermaid diagram to an image so the user can view it without a markdown renderer. Requires network on first run (downloads Chromium once via npx).

- Single diagram: extract the block to `diagrama.mmd`, then render (SVG/PNG/PDF chosen by extension):
  ```bash
  npx -p @mermaid-js/mermaid-cli mmdc -i diagrama.mmd -o diagrama.svg
  ```
- Whole markdown file (multi-diagram): `mmdc` extracts each block into `arch-1.svg`, `arch-2.svg`… and embeds them in the output:
  ```bash
  npx -p @mermaid-js/mermaid-cli mmdc -i arch.template.md -o arch.md
  ```
- Theme: `-t dark` (dark background), `-b transparent` (transparent PNG).
- If the render fails (offline, sandbox error), keep the `.md` and tell the user to view it on GitHub/Obsidian/mermaid.live.

## Vista en vivo

When the user wants an interactive, hot-reload view of the diagram (zoom + subgraph folding), write the Mermaid source to a `.mmd` file (alongside the `.md`) and serve it:

```bash
bash ~/.config/opencode/skills/from-mattpocock/engineering/architecture-viewer/scripts/serve-viewer.sh path/to/diagrama.mmd
```

- The script copies `viewer.html` + bundled assets (`mermaid.min.js`, `panzoom.min.js`, `daisyui.css`, `tailwind-browser.js`) next to the diagram and starts `live-server` (hot-reload).
- Editing the `.mmd` auto-refreshes the browser.
- UI (DaisyUI): zoom `+`/`−`, `Reset`/`0` (fit-to-view: frames and centers the whole diagram), Expand all / Collapse all, and a light/dark theme toggle (persisted, Mermaid re-renders to match). The initial view is auto-fitted to the viewport.
- Zoom: mouse wheel / `+`/`-`/`0`. Fold: click a subgraph **label** to collapse/expand — the source is re-generated with the subgraph replaced by a stub node (`Label (n)`), so the layout **reflows and compresses**. **Zoom-to-fit**: click the subgraph **body** to zoom and center it. Drag to pan.
- Works offline (deps are bundled in the skill).
- Fold/zoom target `flowchart` subgraphs (the default output). Not reliable for other diagram types.

## Rules

- Max ~15 nodes per level; if more, nest or split into multiple diagrams.
- Nest related nodes with `subgraph` (Mermaid) or `package`/`namespace`/`rectangle {}` (PlantUML).
- Label relationship arrows with the dependency verb (`imports`, `calls`, `depends_on`).
- Never invent nodes — if a dependency is unknown, mark it `???` rather than guessing.
- Write diagrams to a markdown file by default; print inline only for small snippets.
- When the user wants a live/interactive view, also write the diagram source to a `.mmd` file and serve it with `serve-viewer.sh`.
- Render the Mermaid preview to SVG/PNG when network is available.

## Advanced features

- Syntax catalog and snippets: see [REFERENCE.md](REFERENCE.md)
- Worked before/after examples: see [EXAMPLES.md](EXAMPLES.md)