# REFLECT Command - Task Reflection

This command facilitates structured reflection on completed implementation, documenting lessons learned and process improvements.

## Memory Bank Integration

Reads from:
- `memory-bank/tasks.md` - Completed implementation details
- `memory-bank/progress.md` - Implementation status and observations
- `memory-bank/creative/creative-*.md` - Design decisions (Level 3-4)

Creates:
- `memory-bank/reflection/reflection-[task_id].md` - Reflection document

Updates:
- `memory-bank/tasks.md` - Reflection status

## Progressive Rule Loading

### Step 1: Load Core Rules
```
Load: .cursor/rules/isolation_rules/main.mdc
Load: .cursor/rules/isolation_rules/Core/memory-bank-paths.mdc
```

### Step 2: Load REFLECT Mode Map
```
Load: .cursor/rules/isolation_rules/visual-maps/reflect-mode-map.mdc
```

### Step 3: Load Complexity-Specific Reflection Rules
Based on complexity level from `memory-bank/tasks.md`:

**Level 1:**
```
Load: .cursor/rules/isolation_rules/Level1/quick-documentation.mdc
```

**Level 2:**
```
Load: .cursor/rules/isolation_rules/Level2/reflection-basic.mdc
```

**Level 3:**
```
Load: .cursor/rules/isolation_rules/Level3/reflection-intermediate.mdc
```

**Level 4:**
```
Load: .cursor/rules/isolation_rules/Level4/reflection-comprehensive.mdc
```

## Workflow

1. **Verify Implementation Complete**
   - Check `memory-bank/tasks.md` for implementation completion
   - If not complete, return to `/build` command

2. **Review Implementation**
   - Compare implementation against original plan
   - Review creative phase decisions (Level 3-4)
   - Review code changes and testing

3. **Document Reflection**

   **Level 1:**
   - Quick review of bug fix
   - Document solution

   **Level 2:**
   - Review enhancement
   - Document what went well
   - Document challenges
   - Document lessons learned

   **Level 3-4:**
   - Comprehensive review of implementation
   - Compare against original plan
   - Document what went well
   - Document challenges encountered
   - Document lessons learned
   - Document process improvements
   - Document technical improvements

4. **Create Reflection Document**
   - Create `memory-bank/reflection/reflection-[task_id].md`
   - Structure: Summary, What Went Well, Challenges, Lessons Learned, Process Improvements, Technical Improvements, Next Steps

5. **Update Memory Bank**
   - Update `memory-bank/tasks.md` with reflection status
   - Mark reflection phase as complete

## Usage

Type `/reflect` to start reflection on the completed task.

## Next Steps

After reflection complete, proceed to `/archive` command to finalize task documentation.

