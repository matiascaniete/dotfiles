#!/usr/bin/env node
// build-report.mjs — turn a Markdown session report into a single self-contained HTML file.
//
// Usage:
//   node build-report.mjs --in report.md --out session-report.html [--title "…"] [--lang es]
//
// Inlines marked + highlight.js (light/dark) + mermaid into assets/report.html and
// embeds the Markdown as base64 (UTF-8 safe), so the output opens offline.

import { readFileSync, writeFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, join, resolve } from "node:path";

const HERE = dirname(fileURLToPath(import.meta.url));
const ASSETS = join(HERE, "..", "assets");

function arg(name, fallback) {
  const i = process.argv.indexOf(name);
  return i !== -1 && process.argv[i + 1] ? process.argv[i + 1] : fallback;
}

function htmlEscape(s) {
  return s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;")
          .replace(/"/g, "&quot;");
}

// Guard inline <script>/<style> payloads against premature tag termination.
function safe(code) {
  return code.replace(/<\/(script|style)/gi, "<\\/$1");
}

if (process.argv.includes("--help") || process.argv.includes("-h")) {
  console.log(`Usage: build-report.mjs --in <report.md> --out <report.html> [--title "..."] [--lang en]
  --in     Markdown report (default: report.md)
  --out    Output HTML file (default: session-report.html)
  --title  Report title for <title> (default: first H1 in the Markdown)
  --lang   BCP-47 language for the report and UI microcopy (default: en)`);
  process.exit(0);
}

const inFile = resolve(arg("--in", "report.md"));
const outFile = resolve(arg("--out", "session-report.html"));
const lang = arg("--lang", "en");

let md;
try {
  md = readFileSync(inFile, "utf8");
} catch (e) {
  console.error(`Cannot read ${inFile}: ${e.message}`);
  process.exit(1);
}

let title = arg("--title", null);
if (!title) {
  const h1 = md.match(/^#\s+(.+?)\s*$/m);
  title = h1 ? h1[1] : "Session Report";
}

const template = readFileSync(join(ASSETS, "report.html"), "utf8");
const marked = safe(readFileSync(join(ASSETS, "marked.min.js"), "utf8"));
const highlight = safe(readFileSync(join(ASSETS, "highlight.min.js"), "utf8"));
const mermaid = safe(readFileSync(join(ASSETS, "mermaid.min.js"), "utf8"));
const hljsLight = safe(readFileSync(join(ASSETS, "hljs-light.css"), "utf8"));
const hljsDark = safe(readFileSync(join(ASSETS, "hljs-dark.css"), "utf8"));
const source = Buffer.from(md, "utf8").toString("base64");

// Replace with a function so injected `$&`/`$'` sequences are treated as literals.
function put(text, token, value) {
  if (!text.includes(token)) throw new Error(`Template is missing placeholder ${token}`);
  return text.replaceAll(token, () => value);
}

let html = template;
html = put(html, "__LANG__", htmlEscape(lang));
html = put(html, "__TITLE__", htmlEscape(title));
html = put(html, "__HLJS_LIGHT__", hljsLight);
html = put(html, "__HLJS_DARK__", hljsDark);
html = put(html, "__SOURCE__", source);
html = put(html, "__MARKED__", marked);
html = put(html, "__HIGHLIGHT__", highlight);
html = put(html, "__MERMAID__", mermaid);

writeFileSync(outFile, html, "utf8");
const kb = (Buffer.byteLength(html, "utf8") / 1024).toFixed(0);
console.log(`Report: ${outFile} (${kb} KB, lang=${lang})`);
