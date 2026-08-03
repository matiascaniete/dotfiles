# Incubate Ideas — Reference

## Research methodology

### Query strategy

| Query type | Template | Purpose |
|-----------|----------|---------|
| Existence | `"{keywords}"` | Has this been done before? |
| History | `"history of {keywords}"` | Origins and evolution |
| Experts | `"{keywords} expert researcher pioneer"` | Key figures past and present |
| Future | `"{keywords} future trends innovation 2026"` | Trajectory and gaps |

### Source evaluation

- Prefer Wikipedia, academic sources, established publications
- Avoid social media unless expert account
- Note publication year — older sources useful for historical context
- If no records found, document `"Sin registro previo encontrado."` and continue

### Research to profile mapping

Cross-reference research findings with USER.md:
- Found expert appears in Influences → mention in Expertos section
- Research domain matches Interests → connect in Notas and Conexiones
- Goal alignment → surface in 5W+H (¿Por qué?, ¿Cómo?)

## Per-type expansion

### general

Focus: exploratory, Zettelkasten-style conceptual connections.

**5W+H specifics:**
- ¿Qué?: concepto o idea en una frase
- ¿Por qué?: relevancia intelectual o práctica
- ¿Quién?: pensadores clave, comunidad interesada
- ¿Cuándo?: madurez del tema, momento histórico
- ¿Dónde?: disciplinas, comunidades, contextos donde aplica
- ¿Cómo?: cómo explorarlo, ángulos de investigación

**Notas content:**
- 2-3 párrafos: definición, importancia, conexiones con otros conceptos
- 2-3 [[wikilinks]] a conceptos del vault o entidades del perfil
- 2-3 preguntas abiertas (formato `- [ ] ¿...?`)
- Si la investigación encontró precedentes, contrastar el ángulo original

**Voice:** especulativa, curiosa, integradora.

---

### book

Focus: the tag `#ideaforbook` means "idea to create/write a book", not "idea from a book".

**5W+H specifics:**
- ¿Qué?: tesis o premisa central del libro
- ¿Por qué?: por qué este libro ahora, qué hueco llena
- ¿Quién?: público objetivo, lectores ideales
- ¿Cuándo?: ventana de oportunidad, contexto cultural
- ¿Dónde?: mercado editorial, plataforma, formato
- ¿Cómo?: proceso de escritura, investigación necesaria

**Notas content:**
- Tesis/ángulo único: qué lo diferencia (1 párrafo)
- "Why now": por qué este libro es relevante hoy
- Estructura tentativa: 3-5 capítulos como bullets con descripción de 1 línea
- No competition: usa la investigación para mostrar que no existe algo similar (o en qué se distingue)
- Público objetivo y tono

**Voice:** ambiciosa, propositiva, comercialmente consciente.

---

### app

Focus: practical, buildable, useful.

**5W+H specifics:**
- ¿Qué?: aplicación o herramienta concreta
- ¿Por qué?: problema que resuelve, necesidad
- ¿Quién?: usuarios objetivo, stakeholders
- ¿Cuándo?: timing técnico, mercado
- ¿Dónde?: plataforma (web, mobile, desktop), ecosistema
- ¿Cómo?: arquitectura, stack, desarrollo

**Notas content:**
- Problema que resuelve y para quién (1 párrafo)
- Features principales (3-5 bullets priorizados)
- Stack sugerido (si aplica: "Posible stack: React + Node" etc.)
- Preguntas de validación: "¿Existe ya algo similar? ¿Es un feature o un producto?"
- Monetización si aplica

**Voice:** técnica, pragmática, constructiva.

---

### prompt

Focus: ready to use, tested in concept.

**5W+H specifics:**
- ¿Qué?: prompt o instrucción concreta
- ¿Por qué?: propósito, qué produce
- ¿Quién?: quién lo usaría, skill necesario
- ¿Cuándo?: en qué momento del flujo se usa
- ¿Dónde?: plataforma LLM, herramienta
- ¿Cómo?: parámetros, formato esperado

**Notas content:**
- Prompt completo en bloque código (```markdown o ```text)
- Para qué sirve y cuándo usarlo (1 párrafo)
- Contexto necesario para que funcione
- Variantes o parámetros (opcional)
- Resultado esperado (ejemplo de output)

**Voice:** precisa, instructiva, funcional.

---

### song

Focus: creative, musical. Three sub-types detected from context:

**If song/lyrics:**
- ¿Qué?: canción, letra, concepto musical
- ¿Por qué?: expresión artística, mensaje
- ¿Quién?: oyentes, comunidad musical
- ¿Cuándo?: momento creativo, contexto emocional
- ¿Dónde?: género, escena musical
- ¿Cómo?: composición, producción, grabación

**Notas:** letra o fragmento (español/inglés según idea), mood (adjetivos de atmósfera: etéreo, oscuro, bailable), estructura (verso/estribillo/puente), referencias sonoras [[bandas/artistas del perfil]].

**If effect/technique:**
- ¿Qué?: efecto o técnica musical
- ¿Por qué?: resultado sonoro buscado
- ¿Quién?: productores, artistas que lo usan
- ¿Cuándo?: contexto de uso (estudio, live, post-producción)
- ¿Dónde?: DAW, hardware, formato
- ¿Cómo?: herramientas, proceso paso a paso

**Notas:** descripción del efecto (1 párrafo), cómo se logra (herramientas, proceso), referentes que lo usan, aplicación práctica.

**If plugin/tool:**
- ¿Qué?: plugin o herramienta
- ¿Por qué?: funcionalidad, gap en el mercado
- ¿Quién?: usuarios (productores, músicos, DJs)
- ¿Cuándo?: en el flujo de producción
- ¿Dónde?: DAW (Ableton/FL Studio), formato (VST/Max4Live/CLAP)
- ¿Cómo?: especificación, inputs, outputs, parámetros

**Notas:** funcionalidad (1 párrafo), integración, ¿existe algo similar? (de la investigación), especificación mínima.

**Voice:** creativa, técnica, referencial.

## Full note template

```
---
idea_type: {type}
idea_state: collected | grouped | incubating | developed | archived
summary: ""
theme: ""
priority: alta | media | baja
source: "[[file]]"
profile_rel: [category]
tags: [original_tag]
created: YYYY-MM-DD
---
# {Title}
## Idea original
{raw text, verbatim — never modified}
## Conexiones con el perfil
- [[Entity]] — {reason}
## Investigación
### Existencia previa
{findings}
### Contexto histórico
{findings}
### Expertos
[[Name]] — {contribution}
### Potencial de desarrollo
{trajectory, gaps, opportunities}
## Las 5W+H
### ¿Qué?
### ¿Por qué?
### ¿Quién?
### ¿Cuándo?
### ¿Dónde?
### ¿Cómo?
## Notas
{2-3 paragraphs, references investigación and 5W+H, wikilinks}
```

## Examples

### Example: book

**Idea original:** "Filosofía en tiempos de IA #ideaforbook"

**Investigación:**
```
### Existencia previa
Varios libros sobre IA y filosofía (Nick Bostrom — Superintelligence, Max Tegmark — Life 3.0, Stuart Russell — Human Compatible). Ninguno aborda la intersección desde una perspectiva no-dualista (advaita) ni integra tradiciones orientales.

### Contexto histórico
Debate filosófico sobre conciencia artificial desde Turing (1950). Searle (Chinese Room, 1980). Dennett (Consciousness Explained, 1991). Boom de LLMs (2022-) reabre preguntas fundamentales sobre mente, yo y propósito.

### Expertos
[[Alan Watts]] — budismo Zen, filosofía de la no-dualidad
[[David Bohm]] — orden implicado/explicado, diálogo, conciencia
Nick Bostrom — riesgo existencial, simulación
Joscha Bach — arquitecturas cognitivas, conciencia artificial
Erik Hoel — teoría de la conciencia, causalidad emergente

### Potencial de desarrollo
Creciente interés público en intersección espiritualidad-tecnología. Audiencia busca profundidad más allá del tecno-optimismo o catastrofismo. Nicho de "filosofía para ingenieros" poco explotado.
```

**5W+H:**
```
### ¿Qué?
Un libro que explora qué revela la IA sobre preguntas filosóficas fundamentales — conciencia, identidad, propósito — desde la no-dualidad.
### ¿Por qué?
La mayoría de la literatura es técnica o alarmista. Falta integrar tradición contemplativa con realidad tecnológica actual.
### ¿Quién?
Lectores de filosofía accesible, profesionales tech con inquietud existencial, practicantes de meditación curiosos por la IA.
### ¿Cuándo?
2026: LLMs mainstream, ansiedad cultural sobre IA. Ventana de relevancia máxima.
### ¿Dónde?
Editorial de pensamiento (Kairós, Herder), audiolibro, auto-publicación con audiencia de Twitter/Substack.
### ¿Cómo?
Estructurar capítulos como diálogos entre conceptos. Escribir desde la experiencia directa usando LLMs + tradición no-dualista. Publicar capítulos como artículos para validar.
```

**Notas:**
```
La IA generativa no es solo una herramienta — es un espejo. Al construir sistemas que simulan inteligencia, nos vemos obligados a preguntarnos qué es realmente pensar, sentir, ser. La tradición no-dualista ([[Alan Watts]], advaita vedanta) sostiene que la separación entre yo y mundo es ilusoria. Si eso es cierto, ¿qué implica para una inteligencia artificial? ¿Puede despertar algo que nunca estuvo separado?

Estructura tentativa:
1. El espejo — cómo la IA refleja nuestra propia mente
2. Conciencia — ¿puede lo artificial experimentar?
3. Identidad — el yo en la era de la replicación digital
4. Propósito — sentido en un mundo post-trabajo
5. Integración — vivir con y más allá de la tecnología

No compite con Bostrom (riesgo) ni Tegmark (física). Compite con la ausencia de una voz que integre [[David Bohm]], [[Alan Watts]] y la experiencia directa con modelos de lenguaje. El momento es ahora: la conversación pública está saturada de miedo y hype, pero hambrienta de profundidad.
```

### Example: song (technique)

**Idea original:** "Comprimir canciones enteras aceleradas que ocupen un bar #ideaforsong"

**Investigación:**
```
### Existencia previa
Time-stretching extremo explorado por [[Aphex Twin]] (Ventolin EP, drukqs), Curtis Roads (microsound, granular synthesis). Plugins como PaulStretch permiten stretching pero no compresión extrema con calidad.

### Contexto histórico
Stockhausen (manipulación temporal en cinta, años 50). Música concreta (Schaeffer). Granular synthesis (Xenakis, Roads, años 70). Glitch y microsound (Oval, Alva Noto, años 90-00).

### Expertos
[[Aphex Twin]] — microediting, time-stretching, software personalizado
Curtis Roads — microsound, composición granular
Holly Herndon — IA + voz + procesamiento extremo
Amon Tobin — diseño sonoro, sampleo extremo

### Potencial de desarrollo
Herramientas IA para time-stretching mejoran rápidamente. Género "hyperflip" / "nightcore extremo" emergente en SoundCloud y TikTok. Live coding (TidalCycles, SuperCollider) permite exploración algorítmica.
```

**5W+H:**
```
### ¿Qué?
Técnica de compresión temporal extrema: una canción entera acelerada hasta ocupar 1 bar (~2 segundos), manteniendo armónicos y textura recognoscibles.
### ¿Por qué?
Transforma lo familiar en extraño. Crea texturas granuladas con identidad armónica que funcionan como transiciones, intros o piezas abstractas.
### ¿Quién?
Productores de electrónica experimental, DJs, diseñadores sonoros, artistas de glitch y noise.
### ¿Cuándo?
En el estudio o en live: como elemento de transición entre tracks, apertura de set, o capa textural en mezcla.
### ¿Dónde?
Cualquier DAW con time-stretch (Ableton Complex Pro, FL Studio). Plugins especializados (PaulStretch, IRCAM TS). Max/MSP para control granular.
### ¿Cómo?
Time-stretch sin pitch correction a 1/100-1/200 de velocidad. El resultado se convierte en una nube granular con artefactos de aliasing que preservan la huella armónica del original.
```

**Notas:**
```
Técnica: compresión temporal extrema de canciones completas al rango de 1 beat (un bar a 120 BPM ≈ 2 segundos). La canción entera se convierte en un evento sonoro microscópico manteniendo identidad armónica pero generando artefactos de aliasing que funcionan como textura.

Proceso:
1. Seleccionar canción con riqueza armónica (más capas = más textura resultante)
2. Time-stretch ×100-200 sin corrección de pitch (Ableton Complex Pro o PaulStretch)
3. El resultado: nube granular donde fragmentos de melodía, armonía y ritmo colapsan en una textura densa de ~2 segundos
4. Opcional: reverse, EQ, reverb para dar forma final

Referentes: [[Aphex Twin]] (microediting en drukqs, Ventolin), Curtis Roads (composición granular), [[Nurse With Wound]] (collage surrealista).

Aplicación: transiciones entre tracks, intros de sets, piezas de ruidismo melódico. En vivo, disparar desde sampler como evento puntual. En estudio, capa textural bajo beats.

¿Existe como plugin? PaulStretch es lo más cercano pero enfocado en stretching, no compresión. Un plugin dedicado con control de compresión, preservación de transientes y preview en tiempo real sí sería novedoso — posible proyecto [[app]] si se lleva a VST/Max4Live.
```

## Update rules

- `idea_state`: `grouped` → `incubating` after first expansion
- `idea_state`: `incubating` stays if being revised
- `idea_state`: `developed` is manual or set by a future publish skill
- Never change `source`, `tags`, or `created` frontmatter
- Add to `profile_rel` if research reveals new profile connections
