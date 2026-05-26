# Memory Bank — Agent Contract

This file is the always-on contract for any agent working in this repository.
It defines the workflow, the memory-bank file layout, and the rules that
every mode must follow.

## The Workflow

Six modes form a loop. Each is a Cursor subagent (`.cursor/subagents/<mode>.md`)
invoked by a slash command (`/van`, `/plan`, `/creative`, `/build`, `/reflect`,
`/archive`).

```
/van  →  /plan  →  /creative  →  /build  →  /reflect  →  /archive  →  /van …
         (L2+)    (L3-4 only)
```

| Mode       | Purpose                                            | Writes                        |
|------------|----------------------------------------------------|-------------------------------|
| `/van`     | Triage: create task, detect complexity, route      | `tasks.yaml`, `active.yaml`   |
| `/plan`    | Produce a plan; identify components needing design | `tasks.yaml`                  |
| `/creative`| Explore design options for flagged components      | `creative/<task_id>-*.md`     |
| `/build`   | Implement the plan; log progress                   | code, `progress.yaml`         |
| `/reflect` | Review the implementation                          | `reflection/<task_id>.md`     |
| `/archive` | Finalize and link all artifacts                    | `archive/<task_id>.md`        |

After `/archive`, the task is terminal; the next `/van` starts a new task.

## Complexity Levels

`/van` assigns a complexity level (1–4) that determines the path through the workflow.

| Level | Name                  | Path                                                   | Typical scope                |
|-------|-----------------------|--------------------------------------------------------|------------------------------|
| 1     | Quick bug fix         | `/van → /build → /reflect → /archive`                  | Single file, targeted fix    |
| 2     | Simple enhancement    | `/van → /plan → /build → /reflect → /archive`          | A few files, clear scope     |
| 3     | Intermediate feature  | `/van → /plan → /creative → /build → /reflect → /archive` | New components, design work  |
| 4     | Complex system        | `/van → /plan → /creative → /build → /reflect → /archive` | Multiple subsystems, phased  |

Skipping a required mode is a hard error and is blocked by the `pre-tool-use` hook.

## Memory Bank Layout

All state lives in `memory-bank/`. Structured state is YAML validated against
schemas in `schemas/`. Long-form artifacts are markdown with YAML frontmatter
that links back to a task by ID.

```
memory-bank/
├── tasks.yaml         schema: schemas/task.schema.json
├── active.yaml        schema: schemas/active.schema.json
├── progress.yaml      schema: schemas/progress-entry.schema.json
├── project.yaml       schema: schemas/project.schema.json
├── creative/   <task_id>-<component>.md   (frontmatter: creative-frontmatter.schema.json)
├── reflection/ <task_id>.md               (frontmatter: reflection-frontmatter.schema.json)
└── archive/    <task_id>.md               (frontmatter: archive-frontmatter.schema.json)
```

### Reading

- Before any mode acts, read `memory-bank/active.yaml` first. It is tiny and
  tells you which task is current and what the next action is.
- Then read the relevant task from `memory-bank/tasks.yaml` by `id`.
- Follow `creative_refs[].doc`, `reflection_ref`, `archive_ref` to load
  long-form artifacts only when needed.

### Writing

- Every write to `memory-bank/**` is validated by the `pre-tool-use` hook
  against the matching schema. Invalid writes are rejected with the
  validator's error — fix the structure and try again. Do not bypass.
- Update `active.yaml.last_updated` on every mode transition.
- Append to `progress.yaml`; never rewrite past entries.

## Task IDs

Tasks are identified as `TASK-NNN`, zero-padded to three digits, allocated
sequentially by `/van`. IDs are the join key across `tasks.yaml`,
`progress.yaml`, and all artifacts in `creative/`, `reflection/`, `archive/`.

## Task Status (State Machine)

The `status` field on a task is the **current phase**, not the last completed phase.

```
triage → planning → design → build → reflection → archived
                 ↘─────────↗        (design skipped for L1, L2)
         ↘──────────────────↗        (planning skipped for L1)
```

Valid transitions are enforced by the `pre-tool-use` hook. The mode that
owns each phase is the only mode allowed to advance the status into it.

## Subagents and Tool Access

Each mode is a subagent with its own context and a restricted tool allowlist:

- `/van`, `/plan`, `/reflect`, `/archive`: read code, write only to
  `memory-bank/**`. No code edits.
- `/creative`: read code, write only to `memory-bank/creative/**` and update
  `tasks.yaml`. No code edits.
- `/build`: full tool access, including code edits, command execution, and
  writes to `memory-bank/progress.yaml` and the relevant task entry.

## Hard Rules

1. **Memory bank exists before anything else.** If `memory-bank/` is missing,
   only `/van` may run, and its first action is to create the structure.
2. **One active task at a time.** `active.yaml.current_task_id` is the only
   task any non-`/van` mode may act on. To switch tasks, run `/van`.
3. **No skipping phases.** A mode may only run if the previous required
   phase for the task's complexity level is complete.
4. **Schema validation is mandatory.** Any write that fails schema validation
   is rejected. Do not work around it.
5. **Artifacts link back.** Every file in `creative/`, `reflection/`,
   `archive/` must carry frontmatter with `task_id` matching an entry in
   `tasks.yaml`.

## Where Things Used To Live (v0.8 → v1.0)

The legacy `.cursor/rules/isolation_rules/` tree has been retired. Its
behavior is now distributed across:

- This file (workflow contract, hard rules)
- `.cursor/subagents/<mode>.md` (per-mode prompts, formerly visual-maps)
- `.cursor/skills/<topic>/SKILL.md` (on-demand templates, formerly Level1–4 dirs)
- `.cursor/hooks/` (enforcement, formerly prose "🚨 CRITICAL" rules)
- `schemas/*.schema.json` (formerly implicit conventions in prose)

If you need archeology, see `legacy/isolation_rules_v0.8/`. Do not load it
into context.
