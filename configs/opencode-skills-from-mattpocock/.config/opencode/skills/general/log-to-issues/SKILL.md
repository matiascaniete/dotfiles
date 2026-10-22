---
name: log-to-issues
description: Barre logs locales, remotos y telemetría y convierte fallos recurrentes en issues, con dedupe y confirmación.
disable-model-invocation: true
---

# Log to Issues

Convierte fallos recurrentes de logs en issues. Cada paso termina en un criterio;
pasa al siguiente solo cuando se cumpla.

## Contrato del repo

Lee `docs/agents/log-sources.md`. Debe declarar:

- fuentes locales y remotas, con su comando de lectura;
- entornos en alcance, producción incluida por defecto;
- ruido y excepciones esperadas;
- redacción de PII;
- ventana, topes y muestras;
- label, marcador de dedupe y cualquier desviación de las reglas de publicación
  del issue tracker.

Si falta, explora el repo (configuración de loggers, jobs, compose, árbol de logs,
scripts de acceso remoto), propón el contrato con esos campos, confírmalo y escríbelo.

Publicación: sigue `docs/agents/issue-tracker.md`, que es la única fuente de sus
campos y comandos.

## Pasos

### 1. Cargar el contrato

Lee el contrato y el issue tracker. Identifica fuentes, entornos, ruido, redacción y
topes.

Criterio: puedes nombrar cada fuente y entorno en alcance y la regla de publicación.
Si falta el contrato, queda escrito y confirmado.

### 2. Acotar el barrido

Por defecto, todas las fuentes y entornos del contrato, incluido producción. Si el
usuario acota ("solo cron", "sin producción", "3 días"), respétalo.

Criterio: lista explícita de fuentes, entornos y ventana.

### 3. Barrer

Ejecuta el comando de lectura de cada fuente en cada entorno: local, remoto vivo,
backups y telemetría. Agrega en el origen y trae solo las líneas coincidentes.
Verifica el acceso antes de dar un entorno por barrido.

Criterio: cada fuente y entorno seleccionado fue intentado; los inaccesibles y las
credenciales ausentes quedan reportados; las entradas crudas respetan el tope.

### 4. Agrupar por firma

Normaliza el mensaje: quita fechas, IDs, números, rutas de usuario, query strings y
direcciones. Firma = clase de excepción + frame + mensaje normalizado. Si el fallo no
tiene frame (por ejemplo, un error de JS o de un contenedor), usa fuente + canal/tarea
+ mensaje. La firma identifica el fallo; la fuente y el entorno van en la evidencia.

Descarta las excepciones esperadas, el ruido del contrato y los datos de test.

Criterio: cada hallazgo tiene firma, ocurrencias por entorno, primera/última vez,
ubicación y muestra redactada; cada descarte tiene motivo contado.

### 5. Deduplicar

Lee los issues del tracker con el label del contrato, abiertos y cerrados, y compara
la firma. Busca posibles relacionados por scope, ruta y tokens del error.

Criterio: cada hallazgo marcado nuevo, abierto, cerrado o relacionado.

### 6. Presentar

Tabla con firma, severidad, ocurrencias por entorno, fuente, ubicación probable y
acción propuesta. Solo lectura hasta la confirmación.

Criterio: el usuario elige qué publicar.

### 7. Publicar

Sigue el issue tracker al pie de la letra. Aplica la label del contrato; créala si
falta. Si el issue está cerrado, comenta y avisa; la reapertura la decide el usuario.

El body lleva: firma, fuentes y entornos, ocurrencias, primera/última vez, versiones,
ubicación probable, reproducción y una muestra redactada. En producción, publica solo
esa muestra redactada.

Criterio: cada hallazgo seleccionado creado, actualizado o saltado; URL registrada.

### 8. Cerrar

Resumen con URLs, descartes, fuentes omitidas y topes alcanzados.

Criterio: resumen entregado; toda escritura queda dentro de lo confirmado.

## Reglas

- Una firma, un issue, aunque aparezca en varios entornos.
- Redacta nombres, emails, teléfonos, documentos de identidad, IBAN, IPs, tokens y
  query strings; agrega usuarios en lugar de listarlos.
- Publica solo lo seleccionado y dentro de los topes del contrato.
- Aplica el juicio de tipo, prioridad y esfuerzo del issue tracker.
