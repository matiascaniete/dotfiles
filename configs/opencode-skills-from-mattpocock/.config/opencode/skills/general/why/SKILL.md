---
name: why
description: >
  Build a navigable why-tree in the Obsidian vault: take a question or a fact,
  research it against up-to-date sources (verify a fact by contrasting it with
  the data), write the answer as an Obsidian note, then generate follow-up
  why-questions and expand each into its own note, linking the tree with
  [[wikilinks]] and a root index. Use when the user asks "why...", "¿por qué...",
  "¿a qué se debe...", or states a fact to verify ("es cierto que...", "is it
  true that...") and wants the answer expanded into a researched tree of whys.
---

# Why — Árbol de porqués

Pipeline: Tipo → Research → Nota → Follow-ups → Aprobar → Recursión → Índice

## Configuración

| Param | Default | Descripción |
|-------|---------|-------------|
| `vault_root` | `/home/matias/Documentos/Obsidian OhMenAI` | Raíz del vault |
| `output_dir` | `AI Space/Why` | Raíz de los árboles dentro del vault |
| `max_depth` | `3` | Profundidad máxima (raíz = 1) |
| `max_children` | `2` | Follow-ups ofrecidos por nodo |
| `mode` | `ask` | `ask` (aprobás los follow-ups por nivel) o `full` (expande hasta los límites) |

## Tipo de entrada

- **Pregunta** (`why...`, `¿por qué...`) → investigar y sintetizar la respuesta mejor sustentada.
- **Hecho** (`es cierto que...`, `is it true...`) → contrastar la afirmación contra los datos: evidencia a favor Y en contra antes de concluir.
- Ambiguo → preguntar al usuario cuál de los dos es.

## El proceso de un nodo

Un solo proceso, documentado una vez, aplicado a la raíz y a cada follow-up. La recursión es esto: cada nodo vuelve a correr estos pasos.

### 1. Research

- `websearch` con conciencia del año actual (2026) + `webfetch` de fuentes primarias; preferir la fuente que posee el dato, no un resumen ajeno.
- Si es **hecho**: buscar explícitamente lo que lo contradice antes de asignar `confidence`.
- **Criterio de completitud**: ≥2 fuentes actuales e independientes; cada afirmación significativa con fuente y fecha; `confidence` asignado con justificación.

### 2. Escribir la nota

Una nota por nodo: `{NN}-{slug}.md` en la carpeta del árbol (NN = orden de creación). Template:

```
---
node_type: why
question: "{pregunta}"
depth: {d}
confidence: {verified|plausible|contested|unknown}
parent: "[[{padre}]]"
children:
  - "[[{hijo}]]"
sources:
  - "{url} — {fecha}"
created: {YYYY-MM-DD}
---
# {Pregunta}
## Respuesta
{respuesta investigada, cita las fuentes inline}
## Evidencia
- {afirmación} — {fuente, fecha}
## Contraste
{si fue hecho: datos que la confirman/contradicen, matices, por qué ese confidence}
## Follow-ups
- [ ] [[{slug}]] — {sub-porqué}
```

### 3. Generar follow-ups

- Sacarlos de las afirmaciones estructurales de la respuesta: el mecanismo detrás de cada claim, los matices, la historia, el "¿y por qué eso?".
- 2–4 candidatos; rankear por cuánto profundizan la raíz; quedarse con `max_children`.
- Si la pregunta ya tiene nota en `AI Space/Why/` (otro árbol), linkear a la existente y marcarla `(reusada)` — no re-investigar.

### 4. Aprobar

- `mode: ask`: mostrar los follow-ups de todos los nodos del nivel y preguntar cuáles expandir. Los rechazados se tachan en la sección Follow-ups del padre.
- `mode: full`: expandir todos hasta los límites.
- Nodo en `max_depth` → hoja: no ofrecer follow-ups.

### 5. Recursión

- Cada follow-up aprobado → un subagente (`Task`) que aplica estos mismos pasos 1–3 a ese nodo, con la carpeta del árbol y la nota padre en el prompt.
- El orquestador mantiene la cola por nivel: controla profundidad, costo y el orden de creación (NN). Escribe los `children` de cada padre cuando el subagente termina.

## Índice

Regenerar `_Index.md` al final del árbol (nunca a mano):

```
# Árbol: {pregunta raíz}
Raíz: [[001-{slug}]]
Generado: {YYYY-MM-DD} · Nodos: {n} · Profundidad: {d} · Fuentes: {n}
## Árbol
1. [[001-{slug}]] — {pregunta} [{confidence}]
   1. [[002-{slug}]] — {pregunta} [{confidence}]
      {…}
## Pendientes
- [[{slug}]] — {pregunta} (no expandido)
```

**Criterio de completitud**: todo nodo no-hoja lista sus `children`; todo nodo es alcanzable desde el índice; sin placeholders.

## Reglas

- Español primero (idioma del vault); inglés si la pregunta viene en inglés.
- Un hecho siempre se contrasta antes de asignar `confidence`.
- Citar solo fuentes reales obtenidas; si no hay dato → decirlo, no inventarlo.
- Reuso entre árboles: link a la nota existente en vez de duplicar contenido.
- Todos los writes dentro de `{output_dir}`; nunca tocar `.base`, `Templates/` ni otras carpetas del vault.