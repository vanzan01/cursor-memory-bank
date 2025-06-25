---
description: "VAN mode integration rules for Memory Bank workflow"
globs: "**/van/**", "**/VAN/**", "**/workflow/**"
alwaysApply: false
---

# VAN MODE INTEGRATION

> **TL;DR:** Integration rules for VAN (Validation and Navigation) mode within Memory Bank workflow system, ensuring seamless task continuity and proper mode transitions.

```mermaid
graph TD
    Start["🚀 VAN MODE ACTIVATION"] --> CheckMigration["📦 Check migration.md<br>Exists?"]

    CheckMigration -->|"Yes"| ProcessMigration["🔄 PROCESS MIGRATION<br>Integrate Unfinished Tasks"]
    CheckMigration -->|"No"| StandardFlow["📋 STANDARD VAN FLOW"]

    ProcessMigration --> AnalyzeTasks["📊 Analyze Migrated Tasks"]
    AnalyzeTasks --> IntegrateTasks["🔗 Integrate into tasks.md"]
    IntegrateTasks --> ArchiveMigration["📁 Archive migration.md"]
    ArchiveMigration --> StandardFlow

    StandardFlow --> LoadVanMap["🗺️ Load VAN Mode Map"]
    LoadVanMap --> DetermineComplexity["🧩 Determine Complexity Level"]
    DetermineComplexity --> LoadLevelRules["📚 Load Level-Specific Rules"]
    LoadLevelRules --> ExecuteVan["⚡ Execute VAN Process"]

    ExecuteVan --> UpdateMemoryBank["📝 Update Memory Bank"]
    UpdateMemoryBank --> SuggestNext["✅ Suggest Next Mode"]

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style ProcessMigration fill:#ffa64d,stroke:#cc7a30,color:white
    style StandardFlow fill:#4dbb5f,stroke:#36873f,color:white
    style ExecuteVan fill:#d971ff,stroke:#a33bc2,color:white
    style SuggestNext fill:#5fd94d,stroke:#3da336,color:white
```

## VAN MODE RESPONSIBILITIES

### Primary Functions:
1. **Task Continuity Management**: Process migration.md and integrate unfinished tasks
2. **Complexity Assessment**: Determine appropriate workflow level (1-4)
3. **Context Initialization**: Set up Memory Bank context for new development cycle
4. **Mode Transition**: Guide transition to appropriate next mode (PLAN/IMPLEMENT)

### Integration Points:
- **Memory Bank Files**: tasks.md, activeContext.md, progress.md
- **Migration System**: migration.md processing and archival
- **Rule System**: Level-specific workflow rules
- **Mode Maps**: Visual process maps for workflow guidance

## TASK CONTINUITY PROCESSING

### Migration Detection:
```mermaid
graph TD
    VanStart["VAN Mode Start"] --> CheckFile{"migration.md<br>exists?"}
    CheckFile -->|"Yes"| ReadMigration["📖 Read migration.md"]
    CheckFile -->|"No"| NormalFlow["➡️ Normal VAN Flow"]

    ReadMigration --> ParseTasks["📋 Parse Unfinished Tasks"]
    ParseTasks --> ValidateTasks["✅ Validate Task Data"]
    ValidateTasks --> IntegrateNew["🔗 Integrate into tasks.md"]
    IntegrateNew --> ArchiveOld["📁 Archive migration.md"]
    ArchiveOld --> NormalFlow

    style VanStart fill:#4da6ff,stroke:#0066cc,color:white
    style CheckFile fill:#ffa64d,stroke:#cc7a30,color:white
    style ReadMigration fill:#80bfff,stroke:#4da6ff,color:black
    style NormalFlow fill:#4dbb5f,stroke:#36873f,color:white
```

### Task Status Integration:
- **🔄 IN_PROGRESS** → Continue with current status
- **📋 PLANNED** → Maintain planning status
- **⛔ BLOCKED** → Identify and address blockers
- **📦 MIGRATED** → Mark as migrated from previous cycle

## COMPLEXITY DETERMINATION

### Level Assessment Criteria:
```mermaid
graph TD
    Assess["🧩 COMPLEXITY ASSESSMENT"] --> CheckTasks["📊 Analyze Task Scope"]
    CheckTasks --> Level1{"Quick Bug Fix?<br>Single file changes"}
    CheckTasks --> Level2{"Simple Enhancement?<br>Limited scope"}
    CheckTasks --> Level3{"Intermediate Feature?<br>Multiple components"}
    CheckTasks --> Level4{"Complex System?<br>Architecture changes"}

    Level1 -->|"Yes"| L1Rules["📚 Load Level 1 Rules"]
    Level2 -->|"Yes"| L2Rules["📚 Load Level 2 Rules"]
    Level3 -->|"Yes"| L3Rules["📚 Load Level 3 Rules"]
    Level4 -->|"Yes"| L4Rules["📚 Load Level 4 Rules"]

    L1Rules & L2Rules & L3Rules & L4Rules --> Proceed["➡️ Proceed with VAN"]

    style Assess fill:#d94dbb,stroke:#a3378a,color:white
    style Level1 fill:#4dbb5f,stroke:#36873f,color:white
    style Level2 fill:#ffa64d,stroke:#cc7a30,color:white
    style Level3 fill:#ff5555,stroke:#cc0000,color:white
    style Level4 fill:#d971ff,stroke:#a33bc2,color:white
```

## MEMORY BANK INTEGRATION

### Core File Updates:
1. **tasks.md**: Integrate migrated tasks, set current task status
2. **activeContext.md**: Update context for new development cycle
3. **progress.md**: Record VAN mode execution and task integration
4. **systemPatterns.md**: Update with any new patterns from migration

### Context Preservation:
- Maintain task dependencies from migration
- Preserve progress context where applicable
- Update file references and links
- Ensure continuity of technical context

## MODE TRANSITION LOGIC

### Next Mode Determination:
```mermaid
graph TD
    Complete["VAN Complete"] --> HasTasks{"Active Tasks<br>Exist?"}
    HasTasks -->|"Yes"| CheckType{"Task Type?"}
    HasTasks -->|"No"| Idle["💤 Idle State"]

    CheckType -->|"New Feature"| SuggestPlan["➡️ Suggest PLAN Mode"]
    CheckType -->|"Bug Fix"| SuggestImplement["➡️ Suggest IMPLEMENT Mode"]
    CheckType -->|"Complex"| SuggestCreative["➡️ Suggest PLAN → CREATIVE"]

    SuggestPlan --> UpdateContext["📝 Update activeContext.md"]
    SuggestImplement --> UpdateContext
    SuggestCreative --> UpdateContext

    style Complete fill:#4da6ff,stroke:#0066cc,color:white
    style HasTasks fill:#ffa64d,stroke:#cc7a30,color:white
    style SuggestPlan fill:#4dbb5f,stroke:#36873f,color:white
    style SuggestImplement fill:#ff5555,stroke:#cc0000,color:white
    style SuggestCreative fill:#d971ff,stroke:#a33bc2,color:white
```

## VERIFICATION CHECKLIST

```
✓ VAN MODE INTEGRATION CHECKLIST
- Migration.md checked and processed? [YES/NO/NA]
- Unfinished tasks integrated into tasks.md? [YES/NO/NA]
- Complexity level determined correctly? [YES/NO]
- Appropriate level rules loaded? [YES/NO]
- Memory Bank files updated? [YES/NO]
- Context preserved from migration? [YES/NO/NA]
- Next mode transition suggested? [YES/NO]
- All integration points verified? [YES/NO]

→ If all YES: VAN mode integration complete
→ If any NO: Address missing integration elements
```

## ERROR HANDLING

### Common Issues:
1. **Corrupted migration.md**: Validate and recover what's possible
2. **Missing task context**: Request clarification from user
3. **Conflicting task priorities**: Apply priority resolution rules
4. **Broken file references**: Update and fix references

### Recovery Procedures:
- Backup current state before processing migration
- Validate all task data before integration
- Provide clear error messages for resolution
- Maintain system integrity during error conditions

## INTEGRATION EXAMPLES

### Successful Migration Processing:
```
VAN Mode Activated
📦 Found migration.md with 3 unfinished tasks
🔄 Processing IN_PROGRESS: Feature implementation (80% complete)
📋 Processing PLANNED: Unit test creation
⛔ Processing BLOCKED: Documentation update (waiting for review)
✅ All tasks integrated into tasks.md
📁 migration.md archived to memory-bank/archive/
➡️ Suggesting IMPLEMENT mode to continue feature work
```

### Standard VAN Flow:
```
VAN Mode Activated
📋 No migration.md found - proceeding with standard flow
🧩 Analyzing new task: "Add user authentication"
📊 Complexity assessment: Level 3 (Intermediate Feature)
📚 Loading Level 3 workflow rules
➡️ Suggesting PLAN mode for feature planning
```

This integration ensures VAN mode serves as the central coordination point for Memory Bank workflow, maintaining task continuity and providing intelligent mode transitions based on current context and task requirements.