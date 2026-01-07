# VAN Command - Initialization & Entry Point

This command initializes the Memory Bank system, performs platform detection, determines task complexity, and routes to appropriate workflows.

## Memory Bank Integration

**CRITICAL:** All Memory Bank files are located in `memory-bank/` directory:
- `memory-bank/tasks.md` - Source of truth for task tracking
- `memory-bank/activeContext.md` - Current focus
- `memory-bank/progress.md` - Implementation status
- `memory-bank/projectbrief.md` - Project foundation

## Progressive Rule Loading

This command loads rules progressively to optimize context usage:

### Step 1: Load Core Rules (Always Required)
```
Load: .cursor/rules/isolation_rules/main.mdc
Load: .cursor/rules/isolation_rules/Core/memory-bank-paths.mdc
Load: .cursor/rules/isolation_rules/Core/platform-awareness.mdc
Load: .cursor/rules/isolation_rules/Core/file-verification.mdc
```

### Step 2: Load VAN Mode Map
```
Load: .cursor/rules/isolation_rules/visual-maps/van_mode_split/van-mode-map.mdc
```

### Step 3: Load Complexity-Specific Rules (Based on Task Analysis)
After determining complexity level, load:
- **Level 1:** `.cursor/rules/isolation_rules/Level1/workflow-level1.mdc`
- **Level 2-4:** Load plan mode rules (transition to PLAN command)

## Workflow

1. **Platform Detection**
   - Detect operating system
   - Adapt commands for platform
   - Set path separators

2. **Memory Bank Verification**
   - Check if `memory-bank/` directory exists
   - If not, create Memory Bank structure
   - Verify essential files exist

3. **Task Analysis**
   - Read `memory-bank/tasks.md` if exists
   - Analyze task requirements
   - Determine complexity level (1-4)

4. **Route Based on Complexity**
   - **Level 1:** Continue in VAN mode, proceed to implementation
   - **Level 2-4:** Transition to `/plan` command

5. **Update Memory Bank**
   - Update `memory-bank/tasks.md` with complexity determination
   - Update `memory-bank/activeContext.md` with current focus

## Usage

Type `/van` followed by your task description or initialization request.

Example:
```
/van Initialize project for adding user authentication feature
```

## Next Steps

- **Level 1 tasks:** Proceed directly to `/build` command
- **Level 2-4 tasks:** Use `/plan` command for detailed planning

