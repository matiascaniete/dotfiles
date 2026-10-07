# Plantilla del resumen / walkthrough

Secciones fieles a CodeRabbit. Incluye cada sección solo si el diff tiene material para ella; no la rellenes con relleno.

## Title

Una línea, estilo conventional commit (`feat:`, `fix:`, `refactor:`, `docs:`, `chore:`…). Derivado de commits + diff, no inventado.

## High-level summary

2–4 frases o bullets: **qué** cambió y **por qué**. El porqué sale de issues enlazados o mensajes de commit; si no consta, no lo inventes.

## Changed files

Tabla:

| Archivo | Cambio | Resumen |
|---|---|---|
| `ruta/archivo.ext` | +n / -m | Qué se hizo. |

## Sequence diagram (u otro diagrama)

Solo si aplica (ver [diagrams.md](diagrams.md)). Bloque ```` ```mermaid ````. Default `sequenceDiagram`.

## Estimated review effort

Estimación corta y justificada (p. ej. `Baja` / `Media` / `Alta` según tamaño, complejidad y riesgo del diff).

## Suggested labels / reviewers

Labels sugeridas según las áreas tocadas; reviewers según `CODEOWNERS` o el historial de los archivos, si está disponible. Si no, márcalo como `n/a`.

## Walkthrough

Sección colapsable:

```html
<details>
<summary>Walkthrough</summary>

- `ruta/archivo.ext`
  - Cambio A: qué y por qué.
  - Cambio B: qué y por qué.

</details>
```

## Testing

Qué se probó, qué falta y cómo verificarlo.

## Riesgos / rollout

Riesgos del cambio, flags, pasos de migración o rollback.

## Breaking changes

Cambios que rompen compatibilidad; `Ninguno` si no hay.

## Issues enlazados

De los mensajes de commit (`#123`, `Closes #45`…). `Ninguno` si no hay.
