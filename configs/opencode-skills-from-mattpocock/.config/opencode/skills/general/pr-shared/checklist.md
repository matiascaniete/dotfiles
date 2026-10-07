# Checklist por categoría

Recorre cada categoría contra los hunks del diff. Solo cuenta lo que el diff introduce o cambia. Salta lo que ya cubren linters/typechecker/CI.

## functional correctness
- Condiciones de borde: vacío, cero, uno, negativo, máximo.
- Off-by-one en índices, rangos y bucles.
- Ramas no cubiertas: `else` ausentes, `default` de switch, retornos olvidados.
- Comparaciones: `==` vs `===`, igualdad de floats, orden de operandos.
- Cambios de signatura que rompen llamadas no actualizadas.
- Estado mutado donde el llamador no lo espera.

## security and privacy
- Entrada no confiada sin validar/sanitizar (inyección SQL/command/XSS).
- Secretos, tokens o credenciales hardcodeados o logueados.
- AuthN/AuthZ: checks omitidos, fail-open, IDOR.
- Deserialización insegura, path traversal, SSRF.
- Criptografía casera, RNG no criptográfico, hashing débil.
- PII expuesta en logs, errores o respuestas.

## data integrity and integration
- Migraciones no idempotentes o sin rollback.
- Transacciones: escrituras parciales, falta de atomicidad.
- Contratos de API cambiados sin versionar (breaking changes).
- Serialización/deserialización inconsistente entre capas.
- Normalización de datos, encoding, timezones.
- Manejo de nulos en fronteras con la DB/servicios externos.

## performance and scalability
- Complejidad cuadrática/cúbica oculta en bucles anidados.
- N+1 queries, falta de índices, `SELECT *`.
- Alocaciones o I/O repetidas dentro de bucles.
- Falta de paginación o límites en colecciones sin cota.
- Trabajo bloqueante en rutas async.
- Caches sin invalidación o con clave incorrecta.

## stability and availability
- Reintentos sin backoff ni cota → thundering herd.
- Timeouts ausentes en I/O de red.
- Manejo de errores que traga excepciones o convierte fallos en silencio.
- Recursos no liberados (files, conexiones, locks).
- Race conditions, deadlocks, condiciones de carrera en concurrencia.
- Dependencias de orden de arranque o estado global mutable.

## maintainability and code quality
- Nombres que no revelan intención.
- Duplicación del mismo shape lógico en varios hunks.
- Complejidad ciclomática alta, funciones que hacen demasiado.
- Abstracciones especulativas sin necesidad en el spec.
- Código muerto o comentado.
- Tests ausentes para el comportamiento nuevo o modificado.
- Documentación/contratos desincronizados del código.

> Cada observación es un hallazgo con sus cuatro ejes; no toda observación merece un comentario bajo el perfil `chill`.
