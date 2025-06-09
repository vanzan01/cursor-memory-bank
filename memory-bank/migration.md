# TASK MIGRATION SYSTEM

## MIGRATION PACKAGE TEMPLATE

### FROM CYCLE: [Previous Cycle ID]
### TO CYCLE: [Current Cycle ID]
### MIGRATION DATE: [Date]
### MIGRATION REASON: [Reason for incomplete tasks]

---

## 📦 UNFINISHED TASKS MIGRATION

### TASK CATEGORIES:

#### 🔄 IN_PROGRESS TASKS
Tasks that were actively being worked on but not completed:

```markdown
- **Task ID**: [Task identifier]
  - **Status**: IN_PROGRESS
  - **Progress**: [Percentage or description]
  - **Context**: [What was being worked on]
  - **Dependencies**: [What this task depends on]
  - **Next Steps**: [What needs to be done next]
  - **Files Modified**: [List of files that were changed]
  - **Estimated Completion**: [Time estimate]
```

#### 📋 PLANNED TASKS
Tasks that were planned but not started:

```markdown
- **Task ID**: [Task identifier]
  - **Status**: PLANNED
  - **Priority**: [High/Medium/Low]
  - **Context**: [Why this task was planned]
  - **Dependencies**: [What this task depends on]
  - **Requirements**: [What needs to be done]
  - **Estimated Effort**: [Time estimate]
```

#### ⛔ BLOCKED TASKS
Tasks that were blocked by dependencies or issues:

```markdown
- **Task ID**: [Task identifier]
  - **Status**: BLOCKED
  - **Blocking Issue**: [What is blocking this task]
  - **Context**: [Background information]
  - **Resolution Required**: [What needs to be resolved]
  - **Dependencies**: [What this task depends on]
  - **Priority**: [High/Medium/Low]
```

---

## 🔄 INTEGRATION INSTRUCTIONS

### For VAN Mode:
When starting a new development cycle, VAN mode should:

1. **Check for migration.md**: Look for existing migration.md file
2. **Process Unfinished Tasks**: Integrate unfinished tasks into new tasks.md
3. **Preserve Context**: Maintain task context and dependencies
4. **Update Status**: Mark tasks as MIGRATED in new cycle
5. **Archive Migration**: Move processed migration.md to archive/

### For REFLECT Mode:
When analyzing completed work, REFLECT mode should:

1. **Analyze Task Status**: Categorize all tasks by completion status
2. **Identify Unfinished**: Find IN_PROGRESS, PLANNED, and BLOCKED tasks
3. **Prepare Migration**: Create migration package for unfinished tasks
4. **Document Context**: Preserve all relevant context for continuation

### For ARCHIVE Mode:
When archiving completed work, ARCHIVE mode should:

1. **Separate Completed**: Archive only completed tasks
2. **Preserve Unfinished**: Create migration.md for unfinished tasks
3. **Maintain Links**: Keep references between archived and migrated tasks
4. **Update Status**: Mark tasks appropriately in archive

---

## 📊 MIGRATION METRICS

### Task Continuity Tracking:
- **Total Tasks**: [Number]
- **Completed**: [Number] ([Percentage]%)
- **Migrated**: [Number] ([Percentage]%)
- **Blocked**: [Number] ([Percentage]%)
- **Migration Success Rate**: [Percentage]%

### Context Preservation:
- **Dependencies Preserved**: [Yes/No]
- **Progress Context Maintained**: [Yes/No]
- **File References Updated**: [Yes/No]
- **Integration Successful**: [Yes/No]

---

## 🔍 VALIDATION CHECKLIST

Before completing migration:

- [ ] All unfinished tasks categorized correctly
- [ ] Task context and dependencies documented
- [ ] Integration instructions provided
- [ ] File references updated
- [ ] Dependencies mapped
- [ ] Next steps clearly defined
- [ ] Migration metrics calculated
- [ ] Validation completed

---

## 📝 MIGRATION HISTORY

### Previous Migrations:
[Record of previous task migrations between cycles]

### Lessons Learned:
[Insights from previous migrations to improve the process]

---

## 🚀 NEXT STEPS

After migration processing:

1. **VAN Mode**: Integrate migrated tasks into new development cycle
2. **Update tasks.md**: Add migrated tasks with MIGRATED status
3. **Archive Migration**: Move processed migration.md to archive/
4. **Continue Development**: Proceed with new cycle including migrated tasks

---

*This migration system ensures no tasks are lost during development cycle transitions and maintains continuity of work across REFLECT/ARCHIVE → VAN mode changes.*