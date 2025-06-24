---
description: Visual process map for CREATIVE mode (Design Decisions)
globs: "**/creative*/**", "**/design*/**", "**/decision*/**", "**/active-task-manager.mdc"
alwaysApply: false
---

# CREATIVE MODE: DESIGN PROCESS MAP

> **TL;DR:** This visual map guides the CREATIVE mode process, focusing on structured design decision-making for components that require deeper exploration before implementation.

## 🧭 CREATIVE MODE PROCESS FLOW

```mermaid
graph TD
    Start["START CREATIVE MODE"] --> ReadTasks["Read _task.md<br>For Creative Requirements"]

    %% Initial Assessment
    ReadTasks --> VerifyPlan{"Plan Complete<br>& Creative Phases<br>Identified?"}
    VerifyPlan -->|"No"| ReturnPlan["Return to<br>PLAN Mode"]
    VerifyPlan -->|"Yes"| IdentifyPhases["Identify Creative<br>Phases Required"]

    %% Creative Phase Selection
    IdentifyPhases --> SelectPhase["Select Next<br>Creative Phase"]
    SelectPhase --> PhaseType{"Creative<br>Phase Type?"}

    %% Creative Phase Types
    PhaseType -->|"UI/UX<br>Design"| UIPhase["UI/UX CREATIVE PHASE<br>Core/creative-phase-uiux.md"]
    PhaseType -->|"Architecture<br>Design"| ArchPhase["ARCHITECTURE CREATIVE PHASE<br>Core/creative-phase-architecture.md"]
    PhaseType -->|"Data Model<br>Design"| DataPhase["DATA MODEL CREATIVE PHASE<br>Core/creative-phase-data.md"]
    PhaseType -->|"Algorithm<br>Design"| AlgoPhase["ALGORITHM CREATIVE PHASE<br>Core/creative-phase-algorithm.md"]

    %% UI/UX Creative Phase
    UIPhase --> UI_Problem["Define UI/UX<br>Problem"]
    UI_Problem --> UI_Research["Research UI<br>Patterns"]
    UI_Research --> UI_Options["Explore UI<br>Options"]
    UI_Options --> UI_Evaluate["Evaluate User<br>Experience"]
    UI_Evaluate --> Decision["✅ Make Design Decision"]

    %% Architecture Creative Phase
    ArchPhase --> Arch_Problem["Define Architecture<br>Challenge"]
    Arch_Problem --> Arch_Options["Explore Architecture<br>Options"]
    Arch_Options --> Arch_Analyze["Analyze Tradeoffs"]
    Arch_Analyze --> Arch_Decision["Make Architecture<br>Decision"]
    Arch_Decision --> Arch_Document["Document<br>Architecture"]
    Arch_Document --> Arch_Diagram["Create Architecture<br>Diagram"]

    %% Data Model Creative Phase
    DataPhase --> Data_Requirements["Define Data<br>Requirements"]
    Data_Requirements --> Data_Structure["Design Data<br>Structure"]
    Data_Structure --> Data_Relations["Define<br>Relationships"]
    Data_Relations --> Data_Validation["Design<br>Validation"]
    Data_Validation --> Data_Document["Document<br>Data Model"]

    %% Algorithm Creative Phase
    AlgoPhase --> Algo_Problem["Define Algorithm<br>Problem"]
    Algo_Problem --> Algo_Options["Explore Algorithm<br>Approaches"]
    Algo_Options --> Algo_Evaluate["Evaluate Time/Space<br>Complexity"]
    Algo_Evaluate --> Algo_Decision["Make Algorithm<br>Decision"]
    Algo_Decision --> Algo_Document["Document<br>Algorithm"]

    %% NEW PHASE: DOCUMENTATION AND VERSIONING
    subgraph "НОВАЯ ФАЗА: ДОКУМЕНТИРОВАНИЕ И ВЕРСИОНИРОВАНИЕ"
        RecordDecision["📝 <b>Record Decision (ADR)</b><br>fetch_rules(.../documentation/decision-recording.mdc)"]
        CaptureResults["📸 <b>Capture Creative Results</b><br>fetch_rules(.../documentation/creative-results-capture.mdc)"]
        VersionCreativeDoc["🔖 <b>Version Creative Document</b><br>fetch_rules(.../documentation/creative-versioning-system.mdc)"]
    end

    Decision --> RecordDecision
    RecordDecision --> CaptureResults
    CaptureResults --> VersionCreativeDoc
    VersionCreativeDoc --> UpdateTasks["📝 Update _task.md<br>with Decision & Version"]

    style RecordDecision fill:#80deea,stroke:#0097a7
    style CaptureResults fill:#80deea,stroke:#0097a7
    style VersionCreativeDoc fill:#80deea,stroke:#0097a7
```

### Decision Recording and Versioning
After a design decision is made, but before updating `_task.md`, the following steps are mandatory:

1.  **Record the Decision**: Use the Architecture Decision Record (ADR) template to formalize the choice.
    -   `fetch_rules(["isolation_rules/CustomWorkflow/documentation/decision-recording.mdc"])`
2.  **Capture the Results**: Structure the output of the creative phase, including diagrams, rationale, and alternatives considered.
    -   `fetch_rules(["isolation_rules/CustomWorkflow/documentation/creative-results-capture.mdc"])`
3.  **Version the Document**: Assign a version number to the creative document to track its evolution.
    -   `fetch_rules(["isolation_rules/CustomWorkflow/documentation/creative-versioning-system.mdc"])`

Only after these steps are completed can you proceed to update `_task.md` and check for more creative phases.

## 📋 CREATIVE PHASE DOCUMENT FORMAT

Each creative phase should produce a document with this structure:

```mermaid
graph TD
    subgraph "Creative Phase Document"
        Header["🎨 CREATIVE PHASE: [TYPE]"]
        Problem["PROBLEM STATEMENT<br>Clear definition of the problem"]
        Options["OPTIONS ANALYSIS<br>Multiple approaches considered"]
        Pros["PROS & CONS<br>Tradeoffs for each option"]
        Decision["DECISION<br>Selected approach + rationale"]
        Impl["IMPLEMENTATION PLAN<br>Steps to implement the decision"]
        Diagram["VISUALIZATION<br>Diagrams of the solution"]
    end

    Header --> Problem --> Options --> Pros --> Decision --> Impl --> Diagram
```

## 🔍 CREATIVE TYPES AND APPROACHES

```mermaid
graph TD
    subgraph "UI/UX Design"
        UI1["User Flow<br>Analysis"]
        UI2["Component<br>Hierarchy"]
        UI3["Interaction<br>Patterns"]
        UI4["Visual Design<br>Principles"]
    end

    subgraph "Architecture Design"
        A1["Component<br>Structure"]
        A2["Data Flow<br>Patterns"]
        A3["Interface<br>Design"]
        A4["System<br>Integration"]
    end

    subgraph "Data Model Design"
        D1["Entity<br>Relationships"]
        D2["Schema<br>Design"]
        D3["Validation<br>Rules"]
        D4["Query<br>Optimization"]
    end

    subgraph "Algorithm Design"
        AL1["Complexity<br>Analysis"]
        AL2["Efficiency<br>Optimization"]
        AL3["Edge Case<br>Handling"]
        AL4["Scaling<br>Considerations"]
    end
```

## 📊 REQUIRED FILE STATE VERIFICATION

Before creative phase work can begin, verify file state:

```mermaid
graph TD
    Start["File State<br>Verification"] --> CheckTasks{"_task.md has<br>planning complete?"}

    CheckTasks -->|"No"| ErrorPlan["ERROR:<br>Return to PLAN Mode"]
    CheckTasks -->|"Yes"| CheckCreative{"Creative phases<br>identified?"}

    CheckCreative -->|"No"| ErrorCreative["ERROR:<br>Return to PLAN Mode"]
    CheckCreative -->|"Yes"| ReadyCreative["Ready for<br>Creative Phase"]
```

## 📋 OPTIONS ANALYSIS TEMPLATE

For each creative phase, analyze multiple options:

```
## OPTIONS ANALYSIS

### Option 1: [Name]
**Description**: [Brief description]
**Pros**:
- [Pro 1]
- [Pro 2]
**Cons**:
- [Con 1]
- [Con 2]
**Complexity**: [Low/Medium/High]
**Implementation Time**: [Estimate]

### Option 2: [Name]
**Description**: [Brief description]
**Pros**:
- [Pro 1]
- [Pro 2]
**Cons**:
- [Con 1]
- [Con 2]
**Complexity**: [Low/Medium/High]
**Implementation Time**: [Estimate]

### Option 3: [Name]
**Description**: [Brief description]
**Pros**:
- [Pro 1]
- [Pro 2]
**Cons**:
- [Con 1]
- [Con 2]
**Complexity**: [Low/Medium/High]
**Implementation Time**: [Estimate]
```

## 🎨 CREATIVE PHASE MARKERS

Use these visual markers for creative phases:

```
🎨🎨🎨 ENTERING CREATIVE PHASE: [TYPE] 🎨🎨🎨

[Creative phase content]

🎨 CREATIVE CHECKPOINT: [Milestone]

[Additional content]

🎨🎨🎨 EXITING CREATIVE PHASE - DECISION MADE 🎨🎨🎨
```

## 📊 CREATIVE PHASE VERIFICATION CHECKLIST

```
✓ CREATIVE PHASE VERIFICATION
- Problem clearly defined? [YES/NO]
- Multiple options considered (3+)? [YES/NO]
- Pros/cons documented for each option? [YES/NO]
- Decision made with clear rationale? [YES/NO]
- Implementation plan included? [YES/NO]
- Visualization/diagrams created? [YES/NO]
- _task.md updated with decision? [YES/NO]

→ If all YES: Creative phase complete
→ If any NO: Complete missing elements
```

## 🔄 MODE TRANSITION NOTIFICATION

When all creative phases are complete, notify user with:

```
## CREATIVE PHASES COMPLETE

✅ All required design decisions made
✅ Creative phase documents created
✅ _task.md updated with decisions
✅ Implementation plan updated

→ NEXT RECOMMENDED MODE: IMPLEMENT MODE
```