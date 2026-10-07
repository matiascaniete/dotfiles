#!/usr/bin/env node
// read-session.mjs — print a readable transcript from an opencode session.
//
// Usage:
//   node read-session.mjs <sessionID | export.json> [--reasoning] [--full-output]
//
// A session ID (ses_…) is exported with `opencode export`; a path is read as a
// previously exported JSON. Output goes to stdout, ordered, for the agent to read.

import { readFileSync } from "node:fs";
import { spawnSync } from "node:child_process";

const args = process.argv.slice(2);
const source = args.find((a) => !a.startsWith("--"));
const wantReasoning = args.includes("--reasoning");
const fullOutput = args.includes("--full-output");

if (!source || args.includes("-h") || args.includes("--help")) {
  console.log(`Usage: read-session.mjs <sessionID | export.json> [--reasoning] [--full-output]`);
  process.exit(source ? 0 : 1);
}

let json;
if (source.startsWith("ses_")) {
  const res = spawnSync("opencode", ["export", source], { encoding: "utf8", maxBuffer: 1 << 30 });
  if (res.status !== 0 || !res.stdout) {
    console.error(`opencode export ${source} failed: ${(res.stderr || "").trim()}`);
    process.exit(1);
  }
  const start = res.stdout.indexOf("{");
  json = JSON.parse(res.stdout.slice(start));
} else {
  json = JSON.parse(readFileSync(source, "utf8"));
}

const info = json.info || {};
const messages = json.messages || [];
const line = (s) => process.stdout.write(s + "\n");
const truncate = (s, maxLines) => {
  const lines = String(s).split("\n");
  if (fullOutput || lines.length <= maxLines) return lines.join("\n");
  return lines.slice(0, maxLines).join("\n") + `\n… (+${lines.length - maxLines} lines)`;
};

line(`# Session ${info.id || source}`);
if (info.title) line(`Title: ${info.title}`);
if (info.directory) line(`Directory: ${info.directory}`);
line(`Messages: ${messages.length}`);
line("");

for (const m of messages) {
  const role = m.info?.role || "?";
  const model = m.info?.modelID ? ` (${m.info.modelID})` : "";
  line(`\n======== ${role}${model} ========`);
  for (const p of m.parts || []) {
    if (p.type === "text" && p.text?.trim()) {
      line(p.text.trim());
    } else if (p.type === "reasoning" && wantReasoning && p.text?.trim()) {
      line(`\n[reasoning] ${p.text.trim()}`);
    } else if (p.type === "tool") {
      const st = p.state || {};
      const input = st.input ? JSON.stringify(st.input) : "";
      line(`\n[tool] ${p.tool} — ${st.title || truncate(input, 3)}`);
      if (st.output) line("  " + truncate(st.output, 20).split("\n").join("\n  "));
    }
  }
}
