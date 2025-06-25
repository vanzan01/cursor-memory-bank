---
description: "Task continuity management across Memory Bank mode transitions"
globs: "**/workflow/**", "**/task-continuity/**", "**/mode-transitions/**"
alwaysApply: true
---

# TASK CONTINUITY MANAGEMENT

> **TL;DR:** This rule ensures 100% task preservation during Memory Bank mode transitions, preventing loss of unfinished work and maintaining development continuity.

## 🔄 TASK CONTINUITY OVERVIEW

The Task Continuity Management system prevents task loss during mode transitions by implementing automated migration, validation, and preservation mechanisms.

### Core Principles

**Zero Task Loss**
- Never delete existing task data without user confirmation
- Always preserve unfinished work context
- Maintain task relationships and dependencies
- Ensure seamless mode transitions

**Automated Preservation**
- Create migration documents for incomplete work
- Validate task status before transitions
- Merge unfinished tasks with new requirements
- Maintain development context across sessions

## 📊 TASK STATUS VALIDATION

### Task Status Categories

**✅ COMPLETE**
- All requirements implemented
- Testing completed successfully
- Documentation updated
- Ready for archiving

**🔄 IN_PROGRESS**
- Active development underway
- Partial implementation exists
- Work context preserved
- Requires migration for transitions

**📋 PLANNED**
- Requirements defined
- Implementation plan ready
- No code changes yet
- Requires migration for transitions

**⛔ BLOCKED**
- Waiting for external dependencies
- Cannot proceed with current resources
- Context must be preserved
- Requires migration for transitions

**⏸️ ON_HOLD**
- Temporarily suspended
- May resume later
- Low priority preservation
- Requires migration for transitions

## 🔄 MIGRATION SYSTEM INTEGRATION

### Migration Document Structure

```yaml
# migration.md Template
migration:
  date: "$(date +%Y-%m-%d)"
  from_mode: "IMPLEMENT"
  to_mode: "REFLECT"

  unfinished_tasks:
    - id: "TASK-ID-$(date +%Y-%m-%d)"
      status: "IN_PROGRESS"
      priority: "CRITICAL"
      completion: "75%"
      next_steps:
        - "Complete Phase 3: Implementation"
        - "Implement Phase 4: Testing"
      context:
        - "Working on system integration"
        - "Database schema completed"

  completed_tasks:
    - id: "COMPLETED-TASK-$(date +%Y-%m-%d)"
      status: "COMPLETED"
      archived: true

  context_preservation:
    active_branch: "implement-feature-$(date +%Y-%m-%d)"
    working_directory: "/path/to/project"
    key_files:
      - "memory-bank/tasks.md"
      - "memory-bank/progress.md"
```

### Migration Processing Steps

1. **Read Current State** - Analyze current tasks.md
2. **Categorize Tasks** - Sort by status and priority
3. **Preserve Context** - Save implementation details
4. **Create Migration** - Generate migration.md
5. **Backup Current** - Archive current state
6. **Prepare Next** - Set up for next cycle

## 🚦 SAFE MODE TRANSITIONS

### VAN Mode Safe Initialization

```mermaid
graph TD
    VanStart["🚀 VAN Mode Start"] --> CheckMigration{"📄 migration.md exists?"}
    CheckMigration -->|"Yes"| ProcessMigration["🔄 Process Migration"]
    CheckMigration -->|"No"| CheckTasks{"📋 tasks.md exists?"}

    ProcessMigration --> MergeTasks["🔗 Merge Unfinished Tasks"]
    CheckTasks -->|"Yes"| WarnUser["⚠️ Warn About Potential Loss"]
    CheckTasks -->|"No"| InitializeNew["✨ Initialize New Tasks"]

    WarnUser --> UserChoice{"👤 User Choice"}
    UserChoice -->|"Create Migration"| CreateMigration["📝 Create Migration"]
    UserChoice -->|"Proceed Anyway"| ArchiveExisting["📦 Archive Existing"]

    CreateMigration --> MergeTasks
    ArchiveExisting --> InitializeNew
    MergeTasks --> InitializeNew
    InitializeNew --> Complete["✅ VAN Mode Ready"]

    style VanStart fill:#4da6ff,stroke:#0066cc,color:white
    style CheckMigration fill:#d94dbb,stroke:#a3378a,color:white
    style ProcessMigration fill:#4dbb5f,stroke:#36873f,color:white
    style WarnUser fill:#ffa64d,stroke:#cc7a30,color:white
    style Complete fill:#5fd94d,stroke:#3da336,color:white
```

### REFLECT Mode Safe Transition

**Entry Requirements:**
- Implementation must be complete
- All critical subtasks finished
- Deliverables ready for review

**Validation Process:**
1. Calculate overall implementation completion
2. Check critical task status
3. Verify deliverable readiness
4. If incomplete: Block transition and show warnings
5. If complete: Allow transition to REFLECT

### ARCHIVE Mode Safe Transition

**Entry Requirements:**
- Reflection must be complete
- All deliverables documented
- Lessons learned captured
- System documentation updated

**Validation Process:**
1. Verify reflection.md exists and is complete
2. Check all deliverables are documented
3. Validate system documentation updates
4. If incomplete: Block transition and show warnings
5. If complete: Create final migration and allow archiving

## 📋 TASK PRESERVATION RULES

### Preservation Priority Matrix

**🔴 CRITICAL** (System blocking)
- Full context preservation
- Complete task details, subtasks, dependencies, timeline

**🟡 HIGH** (Feature blocking)
- Core context preservation
- Task description, status, next steps, key dependencies

**🟢 MEDIUM** (Enhancement)
- Basic info preservation
- Task name, status, priority

**⚪ LOW** (Nice to have)
- Log only
- Task ID, completion date

### Automatic Task Addition Rules

- **Never Replace**: Always append new tasks, never overwrite existing tasks.md
- **Merge Strategy**: Combine new tasks with migrated tasks, maintain priority ordering
- **Conflict Resolution**: Handle duplicate IDs, priority conflicts, dependency conflicts

## 🚨 WARNING SYSTEM

### Warning Types

**🚨 TASK LOSS WARNING**
- Triggered when unfinished tasks will be lost without migration
- Shows list of affected tasks
- Offers migration creation option

**⚠️ INCOMPLETE WARNING**
- Triggered when implementation is not complete for reflection
- Shows completion percentage
- Blocks unsafe transitions

**🔗 DEPENDENCY WARNING**
- Triggered when dependent tasks may be affected
- Shows dependency chain
- Recommends completion order

**💾 DATA LOSS WARNING**
- Triggered when unsaved progress may be lost
- Shows affected files
- Requires user confirmation

### Warning Message Format

```
╔═══════════════════════════════════════════════════════════════╗
║                    🚨 VALIDATION WARNING                      ║
╠═══════════════════════════════════════════════════════════════╣
║ Type: INCOMPLETE WORK                                         ║
║ Severity: WARNING                                             ║
║ Mode Transition: IMPLEMENT → REFLECT                         ║
╠═══════════════════════════════════════════════════════════════╣
║ Issues Found:                                                 ║
║ • Task TASK-CONTINUITY-FIX-$(date +%Y-%m-%d): 75% complete   ║
║ • Task CREATIVE-ARCHIVE-SYSTEM-$(date +%Y-%m-%d): 25% complete║
║                                                               ║
║ Recommendation:                                               ║
║ Create migration.md to preserve work context                  ║
╠═══════════════════════════════════════════════════════════════╣
║ Options:                                                      ║
║ [1] Create Migration (Recommended)                            ║
║ [2] Continue Implementation                                   ║
║ [3] Force Transition (NOT RECOMMENDED)                       ║
╚═══════════════════════════════════════════════════════════════╝
```

## 🔧 INTEGRATION POINTS

### File System Integration

**tasks.md**
- Never delete existing content
- Always append new tasks
- Preserve task metadata
- Maintain formatting

**migration.md**
- Auto-create when needed
- Standard YAML format
- Complete context preservation
- Version tracking

**progress.md**
- Continuous updates
- Status tracking
- Milestone preservation
- Performance metrics

### Mode Integration

**VAN Mode**
- Check migration.md on start
- Process unfinished tasks
- Preserve user context
- Safe initialization

**REFLECT Mode**
- Validate implementation status
- Check task completion
- Create migration if needed
- Block unsafe transitions

**ARCHIVE Mode**
- Verify reflection completion
- Create final migration
- Preserve for next cycle
- Clean transition

This task continuity system ensures 100% preservation of development work across all Memory Bank mode transitions.