---
name: test-coverage-gap
description: Given a diff (uncommitted, a branch, or pasted), find the lines and branches it touches that no test covers and list the tests that would cover them before you commit.
disable-model-invocation: true
---

# Test Coverage Gap

Cierra el **gap**: las líneas y branches que tu diff toca y ningún test cubre. Reporta el gap antes del commit, o escribe los tests que lo cierran.

El *leading word* es **gap**: el conjunto de líneas/branches del diff con cobertura cero.

## Pasos

Cada paso termina en un criterio: no lo des por hecho hasta cumplirlo.

1. **Fijar el diff** — Determina el rango. Por defecto: cambios sin commitear contra `HEAD`. Si el usuario da una rama, tag o merge-base, úsalo; si pega un diff, úsalo tal cual. *Criterio: el rango de archivos+líneas del diff queda fijado y confirmado.*

2. **Detectar el stack** — Recorre la columna de detección de `references/coverage-cmds.md` en orden y aplica la primera que coincida. Si nada coincide, pregunta al usuario por el stack o por un comando de coverage explícito. *Criterio: un stack elegido y su comando de coverage conocido.*

3. **Medir el gap** — Ejecuta el comando de coverage de la referencia, acotado a los archivos del diff cuando la herramienta lo permite. El gap = líneas/branches del diff sin cubrir. Si falta la herramienta de coverage, nombra la dependencia/flag necesaria y pregunta si instalarla: nunca instales por tu cuenta ni inventes un reporte. *Criterio: cada línea y branch del diff clasificada como cubierta o sin cubrir.*

4. **Listar los tests faltantes** — Para cada ítem del gap, nombra el test que lo cubriría: dónde vive, qué entrada usa, qué assert comprueba. *Criterio: todo ítem del gap tiene un test sugerido.*

5. **Reportar antes del commit** — Presenta el gap priorizado y deja la decisión al usuario: escribir los tests o commitear sabiendo el gap. *Criterio: reporte entregado, decisión del usuario.*

## Reglas

- **Branches cuentan**: cuando la herramienta reporta coverage de branches, un branch sin cubrir es un ítem del gap. Si la herramienta no la soporta, dilo y cae a solo líneas.
- **No inventes cobertura**: una línea del diff que no puedas verificar como cubierta queda en el gap.
- **Modificada vs nueva**: una línea modificada cuenta solo si su estado final está cubierto.
- **Comandos por stack**: vive en [references/coverage-cmds.md](references/coverage-cmds.md); cárgalo al medir el gap.