# PLAN Command - Task Planning

This command creates detailed implementation plans based on complexity level determined in VAN mode.

## Memory Bank Integration

Reads from:
- `memory-bank/tasks.md` - Task requirements and complexity level
- `memory-bank/activeContext.md` - Current project context
- `memory-bank/projectbrief.md` - Project foundation (if exists)

Updates:
- `memory-bank/tasks.md` - Adds detailed implementation plan

## Progressive Rule Loading

### Step 1: Load Core Rules
```
Load: .cursor/rules/isolation_rules/main.mdc
Load: .cursor/rules/isolation_rules/Core/memory-bank-paths.mdc
```

### Step 2: Load PLAN Mode Map
```
Load: .cursor/rules/isolation_rules/visual-maps/plan-mode-map.mdc
```

### Step 3: Load Complexity-Specific Planning Rules
Based on complexity level from `memory-bank/tasks.md`:

**Level 2:**
```
Load: .cursor/rules/isolation_rules/Level2/task-tracking-basic.mdc
Load: .cursor/rules/isolation_rules/Level2/workflow-level2.mdc
```

**Level 3:**
```
Load: .cursor/rules/isolation_rules/Level3/task-tracking-intermediate.mdc
Load: .cursor/rules/isolation_rules/Level3/planning-comprehensive.mdc
Load: .cursor/rules/isolation_rules/Level3/workflow-level3.mdc
```

**Level 4:**
```
Load: .cursor/rules/isolation_rules/Level4/task-tracking-advanced.mdc
Load: .cursor/rules/isolation_rules/Level4/architectural-planning.mdc
Load: .cursor/rules/isolation_rules/Level4/workflow-level4.mdc
```

## Workflow

1. **Read Task Context**
   - Read `memory-bank/tasks.md` to get complexity level
   - Read `memory-bank/activeContext.md` for current context
   - Review codebase structure

2. **Create Implementation Plan**
   - **Level 2:** Document planned changes, files to modify, implementation steps
   - **Level 3:** Create comprehensive plan with components, dependencies, challenges
   - **Level 4:** Create phased implementation plan with architectural considerations

3. **Technology Validation** (Level 2-4)
   - Document technology stack selection
   - Create proof of concept if needed
   - Verify dependencies and build configuration

4. **Identify Creative Phases**
   - Flag components requiring design decisions
   - Document which components need creative exploration

5. **Update Memory Bank**
   - Update `memory-bank/tasks.md` with complete plan
   - Mark planning phase as complete

## Usage

Type `/plan` to start planning based on the task in `memory-bank/tasks.md`.

## Next Steps

- **If creative phases identified:** Use `/creative` command
- **If no creative phases:** Proceed to `/build` command

