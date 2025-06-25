---
description: "REFLECT and ARCHIVE mode integration rules for Memory Bank workflow"
globs: "**/reflect/**", "**/archive/**", "**/workflow/**"
alwaysApply: false
---

# REFLECT & ARCHIVE MODE INTEGRATION

> **TL;DR:** Integration rules for REFLECT and ARCHIVE modes within Memory Bank workflow system, ensuring comprehensive review, proper task migration, and seamless cycle transitions.

```mermaid
graph TD
    Start["🤔 REFLECT MODE ACTIVATION"] --> ReviewImpl["🔍 Review Implementation"]
    ReviewImpl --> DocSuccess["👍 Document Successes"]
    DocSuccess --> DocChallenges["👎 Document Challenges"]
    DocChallenges --> DocLessons["💡 Document Lessons Learned"]
    DocLessons --> CreateReflection["📄 Create reflection.md"]
    CreateReflection --> PromptArchive["💬 Prompt: 'ARCHIVE NOW'"]

    PromptArchive --> ArchiveCommand{"User Types<br>'ARCHIVE NOW'?"}
    ArchiveCommand -->|"Yes"| AnalyzeTasks["📊 Analyze All Tasks"]
    ArchiveCommand -->|"No"| WaitForCommand["⏳ Wait for Command"]

    AnalyzeTasks --> CategorizeStatus["📋 Categorize Task Status"]
    CategorizeStatus --> UnfinishedCheck{"Unfinished<br>Tasks Exist?"}

    UnfinishedCheck -->|"Yes"| CreateMigration["📝 Create migration.md"]
    UnfinishedCheck -->|"No"| CreateArchive["📄 Create Archive Document"]

    CreateMigration --> CreateArchive
    CreateArchive --> UpdateTasks["📝 Update tasks.md"]
    UpdateTasks --> SuggestVAN["➡️ Suggest VAN Mode"]

    style Start fill:#4dbb5f,stroke:#36873f,color:white
    style PromptArchive fill:#ffa64d,stroke:#cc7a30,color:white
    style AnalyzeTasks fill:#4da6ff,stroke:#0066cc,color:white
    style CreateMigration fill:#ff69b4,stroke:#e91e63,color:white
    style SuggestVAN fill:#5fd94d,stroke:#3da336,color:white
```

## REFLECT & ARCHIVE MODE RESPONSIBILITIES

### REFLECT Mode Functions:
1. **Implementation Review**: Comprehensive review of completed work
2. **Success Documentation**: Document what worked well
3. **Challenge Analysis**: Identify and document challenges faced
4. **Lesson Extraction**: Extract actionable lessons learned
5. **Process Improvement**: Identify process and technical improvements

### ARCHIVE Mode Functions:
1. **Task Analysis**: Analyze completion status of all tasks
2. **Migration Creation**: Create migration.md for unfinished tasks
3. **Archive Documentation**: Create comprehensive archive record
4. **Context Preservation**: Preserve important context for future cycles
5. **Cycle Transition**: Prepare for next development cycle

## TASK CONTINUITY SYSTEM

### Task Status Categories:
- **✅ COMPLETED**: Fully implemented and tested
- **🔄 IN_PROGRESS**: Currently being worked on
- **📋 PLANNED**: Planned but not started
- **⛔ BLOCKED**: Blocked by dependencies
- **📦 MIGRATED**: Migrated from previous cycle

### Migration Process:
```mermaid
graph TD
    ArchiveStart["📦 ARCHIVE MODE"] --> AnalyzeAll["📊 Analyze All Tasks"]
    AnalyzeAll --> Categorize["📋 Categorize by Status"]
    Categorize --> FindUnfinished["🔍 Find Unfinished Tasks"]

    FindUnfinished --> HasUnfinished{"Unfinished<br>Tasks Found?"}
    HasUnfinished -->|"Yes"| DocumentUnfinished["📝 Document in migration.md"]
    HasUnfinished -->|"No"| ArchiveOnly["📄 Archive Completed Only"]

    DocumentUnfinished --> PreserveContext["🔄 Preserve Task Context"]
    PreserveContext --> ArchiveCompleted["📄 Archive Completed Tasks"]
    ArchiveCompleted --> UpdateStatus["📝 Update Task Status"]
    ArchiveOnly --> UpdateStatus

    UpdateStatus --> PrepareNext["🚀 Prepare for Next Cycle"]

    style ArchiveStart fill:#4da6ff,stroke:#0066cc,color:white
    style HasUnfinished fill:#ffa64d,stroke:#cc7a30,color:white
    style DocumentUnfinished fill:#ff69b4,stroke:#e91e63,color:white
    style PrepareNext fill:#5fd94d,stroke:#3da336,color:white
```

## MEMORY BANK INTEGRATION

### REFLECT Phase File Updates:
1. **reflection.md**: Comprehensive reflection document
2. **tasks.md**: Update with reflection status
3. **progress.md**: Record reflection completion
4. **activeContext.md**: Prepare for archiving

### ARCHIVE Phase File Updates:
1. **Archive Document**: Create in docs/archive/ directory
2. **migration.md**: Create if unfinished tasks exist
3. **tasks.md**: Update task statuses appropriately
4. **activeContext.md**: Reset for next cycle

### Archive Document Structure:
```markdown
# [Task Name] - Archive

**Date**: [Archive Date]
**Complexity Level**: [1-4]
**Status**: COMPLETED

## Implementation Summary
[Summary of what was implemented]

## Successes
[What worked well]

## Challenges
[What was difficult]

## Lessons Learned
[Key insights for future]

## Unfinished Tasks (if any)
[Tasks migrated to migration.md]

## Technical Context
[Important technical details to preserve]
```

## MIGRATION DOCUMENT CREATION

### Migration.md Template:
```markdown
# TASK MIGRATION SYSTEM

## FROM CYCLE: [Previous Cycle ID]
## TO CYCLE: [Current Cycle ID]
## MIGRATION DATE: [Date]

### 🔄 IN_PROGRESS TASKS
- **Task ID**: [Task identifier]
  - **Status**: IN_PROGRESS
  - **Progress**: [Percentage or description]
  - **Context**: [What was being worked on]
  - **Next Steps**: [What needs to be done next]
  - **Files Modified**: [List of files changed]

### 📋 PLANNED TASKS
- **Task ID**: [Task identifier]
  - **Status**: PLANNED
  - **Priority**: [High/Medium/Low]
  - **Context**: [Why this task was planned]
  - **Requirements**: [What needs to be done]

### ⛔ BLOCKED TASKS
- **Task ID**: [Task identifier]
  - **Status**: BLOCKED
  - **Blocking Issue**: [What is blocking this task]
  - **Resolution Required**: [What needs to be resolved]
```

## MODE TRANSITION LOGIC

### REFLECT to ARCHIVE Transition:
```mermaid
graph TD
    ReflectComplete["Reflection Complete"] --> UserPrompt["💬 Prompt User:<br>'Type ARCHIVE NOW'"]
    UserPrompt --> UserInput{"User Input?"}
    UserInput -->|"ARCHIVE NOW"| StartArchive["📦 Start Archive Process"]
    UserInput -->|"Other"| WaitMore["⏳ Continue Waiting"]

    StartArchive --> VerifyReflection["✅ Verify reflection.md Exists"]
    VerifyReflection --> ArchiveProcess["📄 Execute Archive Process"]
    ArchiveProcess --> Complete["✅ Archive Complete"]

    style ReflectComplete fill:#4dbb5f,stroke:#36873f,color:white
    style UserPrompt fill:#ffa64d,stroke:#cc7a30,color:white
    style StartArchive fill:#4da6ff,stroke:#0066cc,color:white
    style Complete fill:#5fd94d,stroke:#3da336,color:white
```

### ARCHIVE to VAN Transition:
```mermaid
graph TD
    ArchiveComplete["Archive Complete"] --> CheckMigration{"migration.md<br>Created?"}
    CheckMigration -->|"Yes"| SuggestVANWithMigration["➡️ Suggest VAN Mode<br>(with migration processing)"]
    CheckMigration -->|"No"| SuggestVANClean["➡️ Suggest VAN Mode<br>(clean start)"]

    SuggestVANWithMigration --> NextCycle["🔄 Next Development Cycle"]
    SuggestVANClean --> NextCycle

    style ArchiveComplete fill:#4da6ff,stroke:#0066cc,color:white
    style CheckMigration fill:#ffa64d,stroke:#cc7a30,color:white
    style NextCycle fill:#5fd94d,stroke:#3da336,color:white
```

## VERIFICATION CHECKLISTS

### REFLECT Mode Checklist:
```
✓ REFLECT MODE CHECKLIST
- Implementation thoroughly reviewed? [YES/NO]
- Successes documented? [YES/NO]
- Challenges documented? [YES/NO]
- Lessons learned documented? [YES/NO]
- Process improvements identified? [YES/NO]
- reflection.md created? [YES/NO]
- tasks.md updated with reflection status? [YES/NO]

→ If all YES: Ready for ARCHIVE command
→ If any NO: Complete missing reflection elements
```

### ARCHIVE Mode Checklist:
```
✓ ARCHIVE MODE CHECKLIST
- All tasks analyzed and categorized? [YES/NO]
- Unfinished tasks documented in migration.md? [YES/NO/NA]
- Archive document created in docs/archive/? [YES/NO]
- tasks.md updated with final statuses? [YES/NO]
- activeContext.md reset for next cycle? [YES/NO]
- Context preserved for continuation? [YES/NO]

→ If all YES: Archive complete, ready for VAN mode
→ If any NO: Complete missing archive elements
```

## ERROR HANDLING

### Common Issues:
1. **Incomplete Reflection**: Ensure all reflection elements are documented
2. **Missing Task Context**: Preserve sufficient context for task continuation
3. **Broken File References**: Update all file references in migration
4. **Status Conflicts**: Resolve conflicting task status information

### Recovery Procedures:
- Validate all reflection documentation before archiving
- Ensure migration.md contains sufficient context for task continuation
- Verify all file references are correct and accessible
- Maintain data integrity throughout the transition process

## INTEGRATION EXAMPLES

### Successful Reflection:
```
REFLECT Mode Activated
🔍 Reviewing implementation of user authentication feature
👍 Successes: Clean architecture, comprehensive testing
👎 Challenges: Integration complexity, third-party API issues
💡 Lessons: Better API documentation needed, more integration tests
📄 reflection.md created with comprehensive review
💬 Type 'ARCHIVE NOW' to proceed with archiving
```

### Archive with Migration:
```
ARCHIVE Mode Activated (triggered by 'ARCHIVE NOW')
📊 Analyzing all tasks...
✅ Found 3 completed tasks
🔄 Found 2 in-progress tasks
📋 Found 1 planned task
📝 Creating migration.md with 3 unfinished tasks
📄 Creating archive document in docs/archive/
📝 Updating tasks.md with final statuses
➡️ Suggesting VAN mode to process migration and start next cycle
```

### Clean Archive (No Migration):
```
ARCHIVE Mode Activated (triggered by 'ARCHIVE NOW')
📊 Analyzing all tasks...
✅ All tasks completed successfully
📄 Creating archive document in docs/archive/
📝 Updating tasks.md with completion status
➡️ Suggesting VAN mode for next development cycle
```

This integration ensures comprehensive reflection and proper task continuity across development cycles, preventing task loss and maintaining development momentum.