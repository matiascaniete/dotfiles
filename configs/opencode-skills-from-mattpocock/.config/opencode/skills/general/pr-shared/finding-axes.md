# Ejes de un finding (fieles a CodeRabbit)

Un **finding** es un hallazgo sobre el diff. No se rankea con una sola escala: lleva **cuatro ejes independientes**. Un `Nitpick` puede ser de seguridad, y un `critical` puede no valer la pena arreglarlo en este PR. Léelos juntos, nunca los colapses en un único ranking.

## 1. Type — qué clase de comentario es

| Type | Significado |
|---|---|
| `Nitpick` | Pulido opcional. |
| `Potential issue` | Posible defecto que requiere atención. |
| `Refactor suggestion` | Mejora estructural sugerida. |

## 2. Severity — cuán grave es

Cuatro niveles ordenados, de mayor a menor: `critical`, `major`, `minor`, `trivial`.

Fuera del ranking:
- `info` — es guía, no un problema.
- `none` — el finding no tiene severidad asignada.

## 3. Category — qué área toca

Seis áreas (lente, no filtro):
- **functional correctness**
- **security and privacy**
- **data integrity and integration**
- **performance and scalability**
- **stability and availability**
- **maintainability and code quality**

## 4. Effort — qué cuesta arreglarlo

Empareja el trabajo del fix con el beneficio que devuelve:

| Esfuerzo / recompensa | Significado |
|---|---|
| Low effort and high reward | Quick win. |
| High effort and high reward | Heavy lift con beneficio sustancial. |
| Low effort and low reward | Fix de poco valor. |
| High effort and low reward | Mal trade-off. |

## Volumen: perfiles

Controla cuántos comentarios se emiten (equivale al `profile` de CodeRabbit):

| Perfil | Comportamiento |
|---|---|
| `quiet` | Solo lo más importante inline (critical/major de alto impacto); el resto agrupado. |
| `chill` | Pocos comentarios de alta señal: bugs, seguridad, fixes esenciales. **Default.** |
| `assertive` | Feedback comprensivo: estilo, buenas prácticas y mejoras menores. |

## Orden de lectura: priority bands

El overview rankea los items por banda `p1` (más alta) a `p4` (más baja), con señal de severidad `critical`/`major`/`minor`/`trivial`. Ambas son ordinales; se usan para decidir el orden de lectura, no como promesa de qué es cada item.

## Merge readiness

Valoración propia del cambio, en una banda, con una confianza y los concerns que la motivaron.

| Banda | Significado |
|---|---|
| `Ready` | Listo para mergear. |
| `Caution` | El score pide cautela. |
| `Risky` | Riesgo material. |
| `Blocked` | Quedan blockers. |

La **confianza** (`high`/`medium`/`low`) califica la afirmación, no el cambio: un `Ready` de confianza baja es ausencia de evidencia. No confundir merge readiness (¿debería mergearse?) con mergeability (¿el proveedor acepta el merge ahora?).
