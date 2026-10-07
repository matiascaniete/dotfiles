---
name: pr-summary
description: Genera un resumen/walkthrough de PR estilo CodeRabbit a partir de un diff, en local. Produce título, high-level summary, tabla de archivos cambiados, sequence diagram (u otro Mermaid si ayuda a comprender), esfuerzo de review estimado, labels/reviewers sugeridos y walkthrough colapsable. Use when the user asks to "summarize a PR", "PR description", "describe this PR", "resumen del PR", "descripción del PR", "qué cambió". Local only — nunca publica en el PR.
---

# PR Summary

Resumen de PR listo para pegar, con las secciones de CodeRabbit. Local: **nunca** publica ni edita el PR.

La plantilla de secciones vive en [../pr-shared/walkthrough.md](../pr-shared/walkthrough.md) y las reglas de diagramas en [../pr-shared/diagrams.md](../pr-shared/diagrams.md). Cárgalas al generar.

## Pasos

Cada paso termina en un criterio.

1. **Fijar el diff** — Por defecto, merge-base con la rama por defecto contra `HEAD` (`git merge-base HEAD origin/HEAD` o `main`/`master`); si no aplica, cambios sin commitear. Si el usuario da un rango, úsalo. *Criterio: rango confirmado y no vacío.*

2. **Leer el material** — Diff completo, lista de commits (`git log`) y archivos tocados; refs a issues en los mensajes de commit. *Criterio: diff + commits + archivos leídos.*

3. **Generar secciones** — Según [../pr-shared/walkthrough.md](../pr-shared/walkthrough.md): Title, High-level summary, Changed files, Diagram, Estimated review effort, Suggested labels/reviewers, Walkthrough colapsable, Testing, Riesgos/rollout, Breaking changes, Issues enlazados. Incluye solo las que tengan material. *Criterio: todas las secciones aplicables generadas.*

4. **Diagrama (solo si aporta)** — Evalúa si el cambio tiene forma estructural (interacción, módulos, estados, clases, datos). Si aplica, genera Mermaid (default `sequenceDiagram`); si no, omite la sección. Reglas en [../pr-shared/diagrams.md](../pr-shared/diagrams.md). *Criterio: diagrama presente solo cuando reduce el esfuerzo de comprensión.*

5. **Plantilla del repo** — Si existe `.github/PULL_REQUEST_TEMPLATE.md`, rellénala en vez de la plantilla por defecto. *Criterio: plantilla correcta usada.*

6. **Salida local** — Markdown en la sesión, listo para pegar. Si el usuario pide imagen y hay red, renderiza el diagrama con `mmdc` (ver `diagrams.md`). No publicar. *Criterio: resumen entregado.*

## Reglas

- **Solo diff + commits**: no inventes motivación que no conste en commits, issues o el propio diff.
- **Nombres verbatim**: usa los nombres reales de módulos/archivos; no los renombres.
- **El diagrama acompaña**, no sustituye al walkthrough textual.
- **Sin relleno**: si no hay breaking changes, di "Ninguno"; no fabriques contenido.
- **Local only**: nunca publiques el resultado.
