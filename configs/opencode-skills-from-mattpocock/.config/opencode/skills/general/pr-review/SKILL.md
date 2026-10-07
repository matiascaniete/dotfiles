---
name: pr-review
description: Revisión línea por línea estilo CodeRabbit de un diff, en local. Etiqueta cada hallazgo en cuatro ejes independientes (Type, Severity, Category, Effort), ordena por priority band y valora merge-readiness. Use when the user asks to "review a PR", "review the diff", "code review", "revisar un PR", "revisar el diff", "revisión línea por línea", or wants CodeRabbit-like findings. Local only — nunca publica en el PR.
---

# PR Review

Revisión línea por línea de un diff, con la taxonomía de CodeRabbit. Local: **nunca** publica comentarios ni toca el PR.

Los vocabularios de los ejes viven en [../pr-shared/finding-axes.md](../pr-shared/finding-axes.md); el checklist por categoría en [../pr-shared/checklist.md](../pr-shared/checklist.md). Cárgalos al revisar.

## Pasos

Cada paso termina en un criterio: no lo des por hecho hasta cumplirlo.

1. **Fijar el diff** — Por defecto, cambios sin commitear contra `HEAD`. Si el usuario da rama, tag, merge-base o rango, úsalo; si pega un diff, úsalo tal cual. *Criterio: rango de archivos+líneas confirmado y no vacío.*

2. **Recolectar contexto** — Detecta stack/lenguaje, lee las convenciones del repo (`CONTRIBUTING.md`, `AGENTS.md`, coding standards, configs de lint) y los tests relacionados con los archivos tocados. *Criterio: convenciones y stack conocidos.*

3. **Revisar por hunk** — Por cada cambio, aplica el `checklist.md` y registra hallazgos. Cada hallazgo lleva:
   - `archivo:línea`
   - **Type**: `Nitpick` | `Potential issue` | `Refactor suggestion`
   - **Severity**: `critical` | `major` | `minor` | `trivial` (o `info`/`none`)
   - **Category**: una de las seis
   - **Effort**: quick win / heavy lift / low-value fix / poor tradeoff
   - *Qué está mal* y *por qué*
   - **Fix concreto** (código sugerido cuando aplique)
   *Criterio: cada hallazgo tiene los cuatro ejes, ubicación y fix.*

4. **Aplicar el perfil de volumen** — `quiet`, `chill` (default) o `assertive`. El perfil decide cuántos comentarios y cuántos `Nitpick` sobreviven. *Criterio: el set final respeta el perfil elegido.*

5. **Resumen** — Overview del cambio; tabla de hallazgos por severidad; blockers primero; valoración de **merge-readiness** (`Ready`/`Caution`/`Risky`/`Blocked`) con su confianza (`high`/`medium`/`low`). *Criterio: resumen entregado con bandas.*

6. **Salida local** — Markdown en la sesión, agrupado por archivo y ordenado por priority band (`p1`→`p4`). No publicar. *Criterio: reporte entregado, decisión del usuario.*

## Reglas

- **Solo el diff**: comenta líneas introducidas o modificadas en el rango fijado.
- **No repitas tooling**: salta lo que linters, typechecker o CI ya detectan.
- **No inventes**: un hallazgo sin evidencia en el diff queda fuera.
- **Ejes separados**: no colapses Type/Severity/Category/Effort en un único ranking.
- **La convención del repo manda** sobre el criterio general del checklist.
- **Bajo `chill`**, los `Nitpick` son la excepción, no la norma.
