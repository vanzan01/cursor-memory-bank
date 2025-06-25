---
description: "PLAN mode integration rules for Memory Bank workflow"
globs: "**/plan/**", "**/PLAN/**", "**/workflow/**"
alwaysApply: false
---

# PLAN MODE INTEGRATION

> **TL;DR:** Integration rules for PLAN mode within Memory Bank workflow system, ensuring comprehensive planning and seamless transition to implementation phases.

```mermaid
graph TD
    Start["📋 PLAN MODE ACTIVATION"] --> LoadContext["📖 Load Active Context"]
    LoadContext --> AnalyzeTask["🔍 Analyze Current Task"]
    AnalyzeTask --> DetermineLevel["🧩 Determine Complexity Level"]

    DetermineLevel --> Level1["Level 1: Quick Bug Fix"]
    DetermineLevel --> Level2["Level 2: Simple Enhancement"]
    DetermineLevel --> Level3["Level 3: Intermediate Feature"]
    DetermineLevel --> Level4["Level 4: Complex System"]

    Level1 --> MinimalPlan["📝 Minimal Planning<br>Direct to Implementation"]
    Level2 --> BasicPlan["📋 Basic Planning<br>Component Analysis"]
    Level3 --> ComprehensivePlan["🎯 Comprehensive Planning<br>+ Creative Phase"]
    Level4 --> ArchitecturalPlan["🏗️ Architectural Planning<br>+ Multiple Creative Phases"]

    MinimalPlan --> UpdateTasks["📝 Update tasks.md"]
    BasicPlan --> UpdateTasks
    ComprehensivePlan --> CreativePhase["🎨 Trigger Creative Phase"]
    ArchitecturalPlan --> CreativePhase

    CreativePhase --> UpdateTasks
    UpdateTasks --> SuggestNext["➡️ Suggest Next Mode"]

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style Level1 fill:#4dbb5f,stroke:#36873f,color:white
    style Level2 fill:#ffa64d,stroke:#cc7a30,color:white
    style Level3 fill:#ff5555,stroke:#cc0000,color:white
    style Level4 fill:#d971ff,stroke:#a33bc2,color:white
    style CreativePhase fill:#ff69b4,stroke:#e91e63,color:white
```

## PLAN MODE RESPONSIBILITIES

### Primary Functions:
1. **Task Analysis**: Analyze current task requirements and scope
2. **Complexity Assessment**: Determine appropriate planning depth
3. **Resource Planning**: Identify required resources and dependencies
4. **Implementation Strategy**: Create detailed implementation approach
5. **Creative Phase Coordination**: Trigger creative phases for complex tasks

### Integration Points:
- **Memory Bank Files**: tasks.md, activeContext.md, progress.md
- **Planning Documents**: implementation-plan.md, phase-plans/
- **Creative System**: creative/ directory for design decisions
- **Level Rules**: Level-specific planning approaches

## COMPLEXITY-BASED PLANNING

### Level 1: Quick Bug Fix Planning
```mermaid
graph TD
    L1Start["Level 1 Planning"] --> IdentifyBug["🐛 Identify Bug"]
    IdentifyBug --> LocateCode["📍 Locate Affected Code"]
    LocateCode --> PlanFix["🔧 Plan Targeted Fix"]
    PlanFix --> EstimateTime["⏱️ Estimate Time"]
    EstimateTime --> DirectImplement["➡️ Direct to IMPLEMENT"]

    style L1Start fill:#4dbb5f,stroke:#36873f,color:white
    style DirectImplement fill:#ff5555,stroke:#cc0000,color:white
```

**Planning Output**: Minimal documentation in tasks.md with fix approach

### Level 2: Simple Enhancement Planning
```mermaid
graph TD
    L2Start["Level 2 Planning"] --> AnalyzeRequirements["📋 Analyze Requirements"]
    AnalyzeRequirements --> IdentifyComponents["🧩 Identify Components"]
    IdentifyComponents --> PlanSequence["📝 Plan Implementation Sequence"]
    PlanSequence --> CreatePlan["📄 Create Implementation Plan"]
    CreatePlan --> ToImplement["➡️ To IMPLEMENT"]

    style L2Start fill:#ffa64d,stroke:#cc7a30,color:white
    style ToImplement fill:#ff5555,stroke:#cc0000,color:white
```

**Planning Output**: Basic implementation plan with component breakdown

### Level 3: Intermediate Feature Planning
```mermaid
graph TD
    L3Start["Level 3 Planning"] --> ComprehensiveAnalysis["🔍 Comprehensive Analysis"]
    ComprehensiveAnalysis --> ArchitecturalDecisions["🏗️ Architectural Decisions"]
    ArchitecturalDecisions --> TriggerCreative["🎨 Trigger CREATIVE Phase"]
    TriggerCreative --> IntegrateDesign["🔗 Integrate Design Decisions"]
    IntegrateDesign --> DetailedPlan["📋 Create Detailed Plan"]
    DetailedPlan --> ToImplement["➡️ To IMPLEMENT"]

    style L3Start fill:#ff5555,stroke:#cc0000,color:white
    style TriggerCreative fill:#ff69b4,stroke:#e91e63,color:white
    style ToImplement fill:#ff5555,stroke:#cc0000,color:white
```

**Planning Output**: Comprehensive plan + creative phase documentation

### Level 4: Complex System Planning
```mermaid
graph TD
    L4Start["Level 4 Planning"] --> SystemAnalysis["🔬 System Analysis"]
    SystemAnalysis --> MultiPhaseDesign["🎨 Multi-Phase Creative Design"]
    MultiPhaseDesign --> ArchitecturalPlan["🏗️ Architectural Planning"]
    ArchitecturalPlan --> PhasedImplementation["📋 Phased Implementation Plan"]
    PhasedImplementation --> ToImplement["➡️ To IMPLEMENT"]

    style L4Start fill:#d971ff,stroke:#a33bc2,color:white
    style MultiPhaseDesign fill:#ff69b4,stroke:#e91e63,color:white
    style ToImplement fill:#ff5555,stroke:#cc0000,color:white
```

**Planning Output**: Architectural documentation + phased implementation strategy

## CREATIVE PHASE INTEGRATION

### Creative Phase Triggers:
- **Level 3+**: Automatic creative phase activation
- **Complex UI/UX**: User interface design decisions
- **Architecture Changes**: System design decisions
- **Integration Challenges**: Component interaction design

### Creative Phase Coordination:
```mermaid
graph TD
    PlanComplete["Planning Complete"] --> NeedsCreative{"Requires Creative<br>Phase?"}
    NeedsCreative -->|"Yes"| SetupCreative["🎨 Setup Creative Phase"]
    NeedsCreative -->|"No"| DirectImplement["➡️ Direct to IMPLEMENT"]

    SetupCreative --> CreateCreativeDoc["📄 Create creative-[feature].md"]
    CreateCreativeDoc --> TriggerCreativeMode["🎨 Trigger CREATIVE Mode"]
    TriggerCreativeMode --> WaitForDesign["⏳ Wait for Design Decisions"]
    WaitForDesign --> IntegrateDecisions["🔗 Integrate Design into Plan"]
    IntegrateDecisions --> FinalPlan["📋 Finalize Implementation Plan"]
    FinalPlan --> ToImplement["➡️ To IMPLEMENT"]

    style NeedsCreative fill:#ffa64d,stroke:#cc7a30,color:white
    style TriggerCreativeMode fill:#ff69b4,stroke:#e91e63,color:white
    style ToImplement fill:#ff5555,stroke:#cc0000,color:white
```

## MEMORY BANK INTEGRATION

### Core File Updates:
1. **tasks.md**: Update with planning status and implementation approach
2. **activeContext.md**: Set context for implementation phase
3. **progress.md**: Record planning completion and next steps
4. **implementation-plan.md**: Create detailed implementation guide

### Planning Documentation Structure:
```
memory-bank/
├── tasks.md (updated with plan status)
├── implementation-plan.md (detailed plan)
├── creative/ (if creative phase triggered)
│   └── creative-[feature-name].md
└── phase-plans/ (for Level 4 tasks)
    ├── phase-1-plan.md
    ├── phase-2-plan.md
    └── phase-3-plan.md
```

## MODE TRANSITION LOGIC

### Next Mode Determination:
```mermaid
graph TD
    PlanComplete["Planning Complete"] --> HasCreative{"Creative Phase<br>Required?"}
    HasCreative -->|"Yes"| ToCreative["➡️ To CREATIVE Mode"]
    HasCreative -->|"No"| ToImplement["➡️ To IMPLEMENT Mode"]

    ToCreative --> CreativeComplete["Creative Phase Complete"]
    CreativeComplete --> ToImplement

    ToImplement --> UpdateContext["📝 Update activeContext.md"]
    UpdateContext --> ReadyForBuild["✅ Ready for Implementation"]

    style PlanComplete fill:#4da6ff,stroke:#0066cc,color:white
    style HasCreative fill:#ffa64d,stroke:#cc7a30,color:white
    style ToCreative fill:#ff69b4,stroke:#e91e63,color:white
    style ToImplement fill:#ff5555,stroke:#cc0000,color:white
```

## VERIFICATION CHECKLIST

```
✓ PLAN MODE INTEGRATION CHECKLIST
- Task requirements analyzed thoroughly? [YES/NO]
- Complexity level determined correctly? [YES/NO]
- Appropriate planning depth applied? [YES/NO]
- Creative phase triggered if needed? [YES/NO/NA]
- Implementation plan created? [YES/NO]
- Dependencies identified and documented? [YES/NO]
- Resource requirements assessed? [YES/NO]
- tasks.md updated with plan status? [YES/NO]
- Next mode transition prepared? [YES/NO]

→ If all YES: Planning complete, ready for next mode
→ If any NO: Complete missing planning elements
```

## PLANNING TEMPLATES

### Level 1 Planning Template:
```markdown
## Bug Fix Plan
- **Issue**: [Description of bug]
- **Location**: [File/function affected]
- **Root Cause**: [Identified cause]
- **Fix Approach**: [How to fix]
- **Testing**: [How to verify fix]
- **Estimated Time**: [Time estimate]
```

### Level 2 Planning Template:
```markdown
## Enhancement Plan
- **Feature**: [Enhancement description]
- **Components**: [List of components to modify]
- **Implementation Sequence**: [Order of implementation]
- **Dependencies**: [Required dependencies]
- **Testing Strategy**: [How to test]
- **Estimated Time**: [Time estimate]
```

### Level 3+ Planning Template:
```markdown
## Feature Implementation Plan
- **Feature Overview**: [Comprehensive description]
- **Architectural Decisions**: [Key design decisions]
- **Implementation Phases**: [Breakdown of phases]
- **Creative Phase Results**: [Design decisions made]
- **Component Integration**: [How components work together]
- **Testing Strategy**: [Comprehensive testing approach]
- **Risk Assessment**: [Potential risks and mitigations]
- **Timeline**: [Detailed timeline with milestones]
```

## ERROR HANDLING

### Common Planning Issues:
1. **Unclear Requirements**: Request clarification before proceeding
2. **Scope Creep**: Identify and document scope boundaries
3. **Missing Dependencies**: Research and document all dependencies
4. **Complexity Underestimation**: Re-assess and adjust planning approach

### Recovery Procedures:
- Validate requirements with stakeholders
- Break down complex tasks into manageable components
- Document assumptions and constraints
- Provide multiple implementation options when uncertain

This integration ensures PLAN mode provides appropriate planning depth based on task complexity while seamlessly coordinating with creative phases and preparing for smooth transition to implementation.