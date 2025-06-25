---
description: Visual process map for REFLECT mode (Task Reflection and Analysis)
globs: reflect-mode-map.mdc, **/active-task-manager.mdc, **/reflection*.mdc
alwaysApply: false
---

# REFLECT MODE: TASK REFLECTION PROCESS MAP

> **TL;DR:** This visual map guides the REFLECT mode process, focusing on comprehensive task reflection, quality assessment, and preparation for archiving.

## 📋 REQUIRED RULES LOADING

Before starting REFLECT mode, load the following rules:

1. `fetch_rules(["isolation_rules/Level1/optimized-workflow-level1.mdc"])` - Level 1 reflection workflow
2. `fetch_rules(["isolation_rules/Level2/reflection-basic.mdc"])` - Level 2 reflection workflow
3. `fetch_rules(["isolation_rules/Level3/workflow-level3.mdc"])` - Level 3 reflection workflow
4. `fetch_rules(["isolation_rules/Level4/reflection-comprehensive.mdc"])` - Level 4 reflection workflow

## 🔧 REFACTORING & ADVANCED REPORTING

For Level 3-4 tasks, this map now includes:

### **Quality-Driven Refactoring**:
- **Quality Metrics Analysis**: Automated quality assessment using established metrics
- **Conditional Refactoring**: Refactoring is triggered only when metrics indicate necessity
- **Gradual Refactoring**: Structured approach to incremental improvements
- **Legacy Support**: Maintains backward compatibility during refactoring
- **Backward Compatibility**: Ensures existing functionality remains intact

### **Advanced Creative Reporting**:
- **Creative Analysis**: Comprehensive analysis of creative phase results
- **Statistics Tracking**: Detailed tracking of creative decision effectiveness
- **Creative Results Capture**: Systematic capture of creative outputs
- **Decision Recording**: Structured documentation of design decisions
- **Usage Examples**: Generation of practical usage examples
- **Creative Versioning**: Version control for creative archives

### Refactoring Phase Rules Loading

Для фазы рефакторинга задач L3/L4 загрузите правила:

1. `fetch_rules(["isolation_rules/CustomWorkflow/refactoring/quality-metrics.mdc"])`
2. При необходимости рефакторинга:
   - `fetch_rules(["isolation_rules/CustomWorkflow/refactoring/refactoring-patterns.mdc"])`
   - `fetch_rules(["isolation_rules/CustomWorkflow/refactoring/gradual-refactoring.mdc"])`
   - `fetch_rules(["isolation_rules/CustomWorkflow/refactoring/legacy-support.mdc"])`
   - `fetch_rules(["isolation_rules/CustomWorkflow/refactoring/backward-compatibility.mdc"])`

### Advanced Reporting Rules Loading

Для продвинутых отчетов задач L3/L4 загрузите правила:

1. `fetch_rules(["isolation_rules/CustomWorkflow/documentation/creative-analysis-reporting.mdc"])`
2. `fetch_rules(["isolation_rules/CustomWorkflow/documentation/statistics-tracking.mdc"])`
3. `fetch_rules(["isolation_rules/CustomWorkflow/documentation/creative-results-capture.mdc"])`
4. `fetch_rules(["isolation_rules/CustomWorkflow/documentation/decision-recording.mdc"])`
5. `fetch_rules(["isolation_rules/CustomWorkflow/documentation/usage-examples.mdc"])`
6. `fetch_rules(["isolation_rules/CustomWorkflow/documentation/creative-versioning-system.mdc"])`

## 🧭 REFLECT MODE PROCESS FLOW

```mermaid
graph TD
    Start["START REFLECT MODE"] --> TaskContinuityCheck["🔄 TASK CONTINUITY CHECK"]

    %% Task Continuity Validation - CRITICAL ADDITION
    TaskContinuityCheck --> CheckImplementation{"Implementation<br>Complete?"}
    CheckImplementation -->|"No"| BlockReflect["🚫 BLOCK REFLECT MODE<br>Implementation Incomplete"]
    CheckImplementation -->|"Yes"| CheckSubtasks{"All Subtasks<br>Complete?"}

    CheckSubtasks -->|"No"| WarnIncomplete["⚠️ WARN: Incomplete<br>Subtasks Found"]
    CheckSubtasks -->|"Yes"| ReadTasks["Read _task.md<br>of active task"]

    WarnIncomplete --> UserDecision{"User Wants to<br>Continue?"}
    UserDecision -->|"No"| ReturnImplement["Return to<br>IMPLEMENT Mode"]
    UserDecision -->|"Yes"| CreatePartialMigration["Create Partial<br>Migration"]

    CreatePartialMigration --> ReadTasks
    BlockReflect --> ReturnImplement

    %% Initial Assessment
    ReadTasks --> VerifyImplement{"Implementation<br>Complete?"}
    VerifyImplement -->|"No"| ReturnImplement
    VerifyImplement -->|"Yes"| AssessLevel{"Determine<br>Complexity Level"}

    %% Level-Based Reflection
    AssessLevel -->|"Level 1"| L1Reflect["LEVEL 1 REFLECTION<br>Level1/optimized-workflow-level1.mdc"]
    AssessLevel -->|"Level 2"| L2Reflect["LEVEL 2 REFLECTION<br>Level2/reflection-basic.mdc"]
    AssessLevel -->|"Level 3"| L3Reflect["LEVEL 3 REFLECTION<br>Level3/workflow-level3.mdc"]
    AssessLevel -->|"Level 4"| L4Reflect["LEVEL 4 REFLECTION<br>Level4/reflection-comprehensive.mdc"]

    %% Level 1 Reflection (Quick)
    L1Reflect --> L1Review["Review<br>Bug Fix"]
    L1Review --> L1Document["Document<br>Solution"]
    L1Document --> L1Update["Update<br>_task.md"]

    %% Level 2 Reflection (Standard)
    L2Reflect --> L2Review["Review<br>Enhancement"]
    L2Review --> L2WWW["Document<br>What Went Well"]
    L2WWW --> L2Challenges["Document<br>Challenges"]
    L2Challenges --> L2Lessons["Document<br>Lessons Learned"]
    L2Lessons --> L2Update["Update<br>_task.md"]

    %% Level 3-4 Reflection (Comprehensive)
    L3Reflect & L4Reflect --> L34Review["Review Implementation<br>& Creative Phases"]

    subgraph "Начало рефлексии"
        L34Review
    end

    subgraph "НОВАЯ ФАЗА: ОЦЕНКА КАЧЕСТВА И РЕФАКТОРИНГ (L3/L4)"
        L34QualityAssess["📊 <b>Quality Assessment</b><br>fetch_rules(isolation_rules/CustomWorkflow/refactoring/quality-metrics.mdc)"]
        L34RefactorDecision{"Refactoring<br>Needed?"}

        subgraph "Refactoring Sub-Workflow"
            direction LR
            L34RefactorPatterns["🔄 <b>Analyze Patterns</b><br>fetch_rules(isolation_rules/CustomWorkflow/refactoring/refactoring-patterns.mdc)"]
            L34GradualRefactor["📈 <b>Gradual Refactoring</b><br>fetch_rules(isolation_rules/CustomWorkflow/refactoring/gradual-refactoring.mdc)"]
            L34LegacySupport["🔧 <b>Ensure Legacy Support</b><br>fetch_rules(isolation_rules/CustomWorkflow/refactoring/legacy-support.mdc)"]
            L34BackwardCompat["⬅️ <b>Check Compatibility</b><br>fetch_rules(isolation_rules/CustomWorkflow/refactoring/backward-compatibility.mdc)"]
        end
    end

    subgraph "Продолжение рефлексии"
        L34Plan["Compare Against Plan"]
    end

    subgraph "НОВАЯ ФАЗА: ПРОДВИНУТЫЕ ОТЧЕТЫ (L3/L4)"
        L34ImproveProcess["Document Process Improvements"]
        L34Reports["📊 <b>Generate Advanced Reports</b><br>fetch_rules(isolation_rules/CustomWorkflow/documentation/creative-analysis-reporting.mdc, isolation_rules/CustomWorkflow/documentation/statistics-tracking.mdc)"]
        L34UsageExamples["📚 <b>Generate Usage Examples</b><br>fetch_rules(isolation_rules/CustomWorkflow/documentation/usage-examples.mdc)"]
    end

    L34Review --> L34QualityAssess
    L34QualityAssess --> L34RefactorDecision
    L34RefactorDecision -- "Yes" --> L34RefactorPatterns
    L34RefactorPatterns --> L34GradualRefactor
    L34GradualRefactor --> L34LegacySupport
    L34LegacySupport --> L34BackwardCompat
    L34BackwardCompat --> L34Plan
    L34RefactorDecision -- "No" --> L34Plan

    L34Plan --> L34WWW["Document<br>What Went Well"]
    L34WWW --> L34Challenges["Document<br>Challenges"]
    L34Challenges --> L34Lessons["Document<br>Lessons Learned"]
    L34Lessons --> L34ImproveProcess

    L34ImproveProcess --> L34Reports
    L34Reports --> L34UsageExamples
    L34UsageExamples --> L34Update["Update<br>_task.md"]

    %% Completion & Transition
    L1Update & L2Update & L34Update --> AnalyzeUnfinished["🔍 ANALYZE UNFINISHED TASKS<br>[TASK CONTINUITY]"]
    AnalyzeUnfinished --> CategorizeUnfinished["📊 Categorize Unfinished Tasks<br>by Status & Priority"]
    CategorizeUnfinished --> CreateMigration["📦 Create migration.md<br>for Next Cycle"]
    CreateMigration --> CreateReflection["Create<br>_reflection.md"]

    subgraph "НОВАЯ ФАЗА: ПРОДВИНУТАЯ АНАЛИТИКА И ОТЧЕТЫ"
        GenerateCreativeReport["📊 <b>Generate Creative Analysis Report</b><br>fetch_rules(.../documentation/creative-analysis-reporting.mdc)"]
        TrackStats["📈 <b>Track & Report Statistics</b><br>fetch_rules(.../documentation/statistics-tracking.mdc)"]
        GenerateExamples["📖 <b>Generate Usage Examples</b><br>fetch_rules(.../documentation/usage-examples.mdc)"]
    end

    CreateReflection --> GenerateCreativeReport
    GenerateCreativeReport --> TrackStats
    TrackStats --> GenerateExamples
    GenerateExamples --> PromptArchive["💬 Prompt: 'ARCHIVE NOW'"]

    %% Task Continuity Styling
    style TaskContinuityCheck fill:#80ff80,stroke:#40cc40,color:black,stroke-width:2px
    style CheckImplementation fill:#b3ffb3,stroke:#80ff80,color:black
    style CheckSubtasks fill:#b3ffb3,stroke:#80ff80,color:black
    style BlockReflect fill:#ff6666,stroke:#cc0000,color:white,stroke-width:2px
    style WarnIncomplete fill:#ffcc80,stroke:#ff9900,color:black
    style UserDecision fill:#cce6ff,stroke:#80bfff,color:black
    style CreatePartialMigration fill:#b3ffb3,stroke:#80ff80,color:black
    style AnalyzeUnfinished fill:#80ff80,stroke:#40cc40,color:black,stroke-width:2px
    style CategorizeUnfinished fill:#b3ffb3,stroke:#80ff80,color:black
    style CreateMigration fill:#b3ffb3,stroke:#80ff80,color:black

    %% Refactoring Phase Styling
    style L34QualityAssess fill:#80deea,stroke:#0097a7
    style L34RefactorDecision fill:#ffb74d,stroke:#f57c00
    style L34RefactorPatterns fill:#a1887f,stroke:#5d4037
    style L34GradualRefactor fill:#a1887f,stroke:#5d4037
    style L34BackwardCompat fill:#a1887f,stroke:#5d4037
    style L34LegacySupport fill:#a1887f,stroke:#5d4037

    %% Advanced Reporting Styling
    style L34Reports fill:#ba68c8,stroke:#8e24aa
    style L34CreativeResults fill:#ba68c8,stroke:#8e24aa
    style L34DecisionRecord fill:#ba68c8,stroke:#8e24aa
    style L34UsageExamples fill:#ba68c8,stroke:#8e24aa
    style L34CreativeVersioning fill:#ba68c8,stroke:#8e24aa
    style GenerateCreativeReport fill:#ba68c8,stroke:#8e24aa
    style TrackStats fill:#ba68c8,stroke:#8e24aa
    style GenerateExamples fill:#ba68c8,stroke:#8e24aa
```

## 📋 REFLECTION STRUCTURE

The reflection should follow this structured format:

```mermaid
graph TD
    subgraph "Reflection Document Structure"
        Header["# TASK REFLECTION: [Task Name]"]
        Summary["## SUMMARY<br>Brief summary of completed task"]
        WWW["## WHAT WENT WELL<br>Successful aspects of implementation"]
        Challenges["## CHALLENGES<br>Difficulties encountered during implementation"]
        Lessons["## LESSONS LEARNED<br>Key insights gained from the experience"]
        ProcessImp["## PROCESS IMPROVEMENTS<br>How to improve for future tasks"]
        TechImp["## TECHNICAL IMPROVEMENTS<br>Better approaches for similar tasks"]
        NextSteps["## NEXT STEPS<br>Follow-up actions or future work"]
    end

    Header --> Summary --> WWW --> Challenges --> Lessons --> ProcessImp --> TechImp --> NextSteps
```

## 📊 REQUIRED FILE STATE VERIFICATION

Before reflection can begin, verify file state:

```mermaid
graph TD
    Start["File State<br>Verification"] --> CheckTasks{"_task.md has<br>implementation<br>complete?"}

    CheckTasks -->|"No"| ErrorImplement["ERROR:<br>Return to IMPLEMENT Mode"]
    CheckTasks -->|"Yes"| ReadyReflect["Ready for<br>Reflection"]
```

## 🔍 IMPLEMENTATION REVIEW APPROACH

```mermaid
graph TD
    subgraph "Implementation Review"
        Original["Review Original<br>Requirements"]
        Plan["Compare Against<br>Implementation Plan"]
        Actual["Assess Actual<br>Implementation"]
        Creative["Review Creative<br>Phase Decisions"]
        Changes["Identify Deviations<br>from Plan"]
        Results["Evaluate<br>Results"]
    end

    Original --> Plan --> Actual
    Plan --> Creative --> Changes
    Actual --> Results
    Changes --> Results
```

## 📝 REFLECTION DOCUMENT TEMPLATES

### Level 1 (Basic) Reflection
```
# Bug Fix Reflection: [Bug Name]

## Summary
[Brief description of the bug and solution]

## Implementation
[Description of the fix implemented]

## Testing
[Description of testing performed]

## Additional Notes
[Any other relevant information]
```

### Levels 2-4 (Comprehensive) Reflection
```
# Task Reflection: [Task Name]

## Summary
[Brief summary of the task and what was achieved]

## What Went Well
- [Success point 1]
- [Success point 2]
- [Success point 3]

## Challenges
- [Challenge 1]: [How it was addressed]
- [Challenge 2]: [How it was addressed]
- [Challenge 3]: [How it was addressed]

## Lessons Learned
- [Lesson 1]
- [Lesson 2]
- [Lesson 3]

## Process Improvements
- [Process improvement 1]
- [Process improvement 2]

## Technical Improvements
- [Technical improvement 1]
- [Technical improvement 2]

## Next Steps
- [Follow-up task 1]
- [Follow-up task 2]
```

## 📊 REFLECTION QUALITY METRICS

```mermaid
graph TD
    subgraph "Reflection Quality Metrics"
        Specific["Specific<br>Not general or vague"]
        Actionable["Actionable<br>Provides clear direction"]
        Honest["Honest<br>Acknowledges successes and failures"]
        Forward["Forward-Looking<br>Focuses on future improvement"]
        Evidence["Evidence-Based<br>Based on concrete examples"]
    end
```

## 📋 TASKS.MD UPDATE FORMAT

During reflection, update tasks.md with:

```
## Status
- [x] Initialization complete
- [x] Planning complete
[For Level 3-4:]
- [x] Creative phases complete
- [x] Implementation complete
- [x] Reflection complete
- [ ] Archiving

## Reflection Highlights
- **What Went Well**: [Key successes]
- **Challenges**: [Key challenges]
- **Lessons Learned**: [Key lessons]
- **Next Steps**: [Follow-up actions]
```

## 📊 REFLECTION VERIFICATION CHECKLIST

```
✓ REFLECTION VERIFICATION
- Implementation thoroughly reviewed? [YES/NO]
- What Went Well section completed? [YES/NO]
- Challenges section completed? [YES/NO]
- Lessons Learned section completed? [YES/NO]
- Process Improvements identified? [YES/NO]
- Technical Improvements identified? [YES/NO]
- Next Steps documented? [YES/NO]
- reflection.md created? [YES/NO]
- tasks.md updated with reflection status? [YES/NO]

→ If all YES: Reflection complete - ready for ARCHIVE mode
→ If any NO: Complete missing reflection elements
```

## 🔄 MODE TRANSITION NOTIFICATION

When reflection is complete, notify user with:

```
## REFLECTION COMPLETE

✅ Implementation thoroughly reviewed
✅ Reflection document created
✅ Lessons learned documented
✅ Process improvements identified
✅ tasks.md updated with reflection status

→ NEXT RECOMMENDED MODE: ARCHIVE MODE
```