# CREATIVE Command - Design Decisions

This command performs structured design exploration for components flagged during planning.

## Memory Bank Integration

Reads from:
- `memory-bank/tasks.md` - Components requiring creative phases
- `memory-bank/activeContext.md` - Current project context

Creates:
- `memory-bank/creative/creative-[feature_name].md` - Design decision documents

Updates:
- `memory-bank/tasks.md` - Records design decisions

## Progressive Rule Loading

### Step 1: Load Core Rules
```
Load: .cursor/rules/isolation_rules/main.mdc
Load: .cursor/rules/isolation_rules/Core/memory-bank-paths.mdc
```

### Step 2: Load CREATIVE Mode Map
```
Load: .cursor/rules/isolation_rules/visual-maps/creative-mode-map.mdc
```

### Step 3: Load Creative Phase Enforcement
```
Load: .cursor/rules/isolation_rules/Core/creative-phase-enforcement.mdc
Load: .cursor/rules/isolation_rules/Core/creative-phase-metrics.mdc
```

### Step 4: Load Specialized Creative Rules (Lazy Loaded)
Load only when specific creative phase type is needed:

**For Architecture Design:**
```
Load: .cursor/rules/isolation_rules/Phases/CreativePhase/creative-phase-architecture.mdc
```

**For UI/UX Design:**
```
Load: .cursor/rules/isolation_rules/Phases/CreativePhase/creative-phase-uiux.mdc
```

**For Algorithm Design:**
```
Load: .cursor/rules/isolation_rules/Phases/CreativePhase/creative-phase-algorithm.mdc
```

## Workflow

1. **Verify Planning Complete**
   - Check `memory-bank/tasks.md` for planning completion
   - Verify creative phases are identified
   - If not complete, return to `/plan` command

2. **Identify Creative Phases**
   - Read components flagged for creative work from `memory-bank/tasks.md`
   - Prioritize components for design exploration

3. **Execute Creative Phase**
   For each component:
   - **🎨🎨🎨 ENTERING CREATIVE PHASE: [TYPE]**
   - Define requirements and constraints
   - Generate 2-4 design options
   - Analyze pros/cons of each option
   - Select and justify recommended approach
   - Document implementation guidelines
   - Verify solution meets requirements
   - **🎨🎨🎨 EXITING CREATIVE PHASE**

4. **Document Decisions**
   - Create `memory-bank/creative/creative-[feature_name].md`
   - Update `memory-bank/tasks.md` with design decisions

5. **Verify Completion**
   - Ensure all flagged components have completed creative phases
   - Mark creative phase as complete in `memory-bank/tasks.md`

## Usage

Type `/creative` to start creative design work for components flagged in the plan.

## Next Steps

After all creative phases complete, proceed to `/build` command for implementation.

