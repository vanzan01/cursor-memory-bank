# ARCHIVE Command - Task Archiving

This command creates comprehensive archive documentation and updates the Memory Bank for future reference.

## Memory Bank Integration

Reads from:
- `memory-bank/tasks.md` - Complete task details and checklists
- `memory-bank/reflection/reflection-[task_id].md` - Reflection document
- `memory-bank/progress.md` - Implementation status
- `memory-bank/creative/creative-*.md` - Creative phase documents (Level 3-4)

Creates:
- `memory-bank/archive/archive-[task_id].md` - Archive document

Updates:
- `memory-bank/tasks.md` - Mark task as COMPLETE
- `memory-bank/progress.md` - Add archive reference
- `memory-bank/activeContext.md` - Reset for next task

## Progressive Rule Loading

### Step 1: Load Core Rules
```
Load: .cursor/rules/isolation_rules/main.mdc
Load: .cursor/rules/isolation_rules/Core/memory-bank-paths.mdc
```

### Step 2: Load ARCHIVE Mode Map
```
Load: .cursor/rules/isolation_rules/visual-maps/archive-mode-map.mdc
```

### Step 3: Load Complexity-Specific Archive Rules
Based on complexity level from `memory-bank/tasks.md`:

**Level 1:**
```
Load: .cursor/rules/isolation_rules/Level1/quick-documentation.mdc
```

**Level 2:**
```
Load: .cursor/rules/isolation_rules/Level2/archive-basic.mdc
```

**Level 3:**
```
Load: .cursor/rules/isolation_rules/Level3/archive-intermediate.mdc
```

**Level 4:**
```
Load: .cursor/rules/isolation_rules/Level4/archive-comprehensive.mdc
```

## Workflow

1. **Verify Reflection Complete**
   - Check that `memory-bank/reflection/reflection-[task_id].md` exists
   - Verify reflection is complete
   - If not complete, return to `/reflect` command

2. **Create Archive Document**

   **Level 1:**
   - Create quick summary
   - Update `memory-bank/tasks.md` marking task complete

   **Level 2:**
   - Create basic archive document
   - Document changes made
   - Update `memory-bank/tasks.md` and `memory-bank/progress.md`

   **Level 3-4:**
   - Create comprehensive archive document
   - Include: Metadata, Summary, Requirements, Implementation details, Testing, Lessons Learned, References
   - Archive creative phase documents
   - Document code changes
   - Document testing approach
   - Summarize lessons learned
   - Update all Memory Bank files

3. **Archive Document Structure**
   ```
   # TASK ARCHIVE: [Task Name]
   
   ## METADATA
   - Task ID, dates, complexity level
   
   ## SUMMARY
   Brief overview of the task
   
   ## REQUIREMENTS
   What the task needed to accomplish
   
   ## IMPLEMENTATION
   How the task was implemented
   
   ## TESTING
   How the solution was verified
   
   ## LESSONS LEARNED
   Key takeaways from the task
   
   ## REFERENCES
   Links to related documents (reflection, creative phases, etc.)
   ```

4. **Update Memory Bank**
   - Create `memory-bank/archive/archive-[task_id].md`
   - Mark task as COMPLETE in `memory-bank/tasks.md`
   - Update `memory-bank/progress.md` with archive reference
   - Reset `memory-bank/activeContext.md` for next task
   - Clear completed task details from `memory-bank/tasks.md` (keep structure)

## Usage

Type `/archive` to archive the completed task after reflection is done.

## Next Steps

After archiving complete, use `/van` command to start the next task.

