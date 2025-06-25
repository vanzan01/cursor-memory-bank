---
description: Defines the standard workflow for Level 3 (Intermediate Feature) tasks, guiding through comprehensive planning, targeted creative design, structured implementation, detailed reflection, and feature-specific archiving.
globs: workflow-level3.mdc
alwaysApply: false
---

# LEVEL 3 WORKFLOW: INTERMEDIATE FEATURE DEVELOPMENT

> **TL;DR:** This document outlines a structured workflow for Level 3 (Intermediate Feature) tasks. These tasks involve developing significant new functionality that may span multiple components, requiring comprehensive planning, often necessitating targeted creative design phases, followed by systematic implementation, in-depth reflection, and feature-specific archiving. This workflow balances detailed process with efficiency for moderately complex features.

## 🔍 LEVEL 3 WORKFLOW OVERVIEW

Level 3 tasks represent a significant development effort, building a complete feature. The workflow ensures adequate planning, design for key aspects, and methodical execution.

```mermaid
graph LR
    Init["1. INITIALIZATION<br>(VAN Mode Output)"] -->
    DocSetup["2. DOCUMENTATION SETUP"] -->
    Plan["3. FEATURE PLANNING (PLAN Mode)"] -->
    Creative["4. CREATIVE PHASES (CREATIVE Mode)"] -->
    Impl["5. IMPLEMENTATION (IMPLEMENT Mode)"] -->
    Reflect["6. REFLECTION (REFLECT Mode)"] -->
    Archive["7. ARCHIVING (ARCHIVE Mode)"]

    %% Document connections for each phase (conceptual links to mode guidance)
    Init -.-> InitDocs["Core Rules & L3 Confirmation"]
    DocSetup -.-> DocSetupDocs["Memory Bank Setup for L3"]
    Plan -.-> PlanDocs["Comprehensive Feature Plan"]
    Creative -.-> CreativeDocs["Targeted Design Documents"]
    Impl -.-> ImplDocs["Feature Implementation & Testing"]
    Reflect -.-> ReflectDocs["In-depth Feature Reflection"]
    Archive -.-> ArchiveDocs["Feature Archive Package"]

    style Init fill:#a1c4fd,stroke:#669df6
    style DocSetup fill:#b3e5fc,stroke:#81d4fa
    style Plan fill:#c8e6c9,stroke:#a5d6a7
    style Creative fill:#ffd8b2,stroke:#ffcc80
    style Impl fill:#ffcdd2,stroke:#ef9a9a
    style Reflect fill:#d1c4e9,stroke:#b39ddb
    style Archive fill:#cfd8dc,stroke:#b0bec5
````

Level 3 tasks typically involve creating a new, distinct feature or making substantial modifications to an existing one that affects multiple parts of the application.

## 🔄 LEVEL TRANSITION HANDLING (Within Level 3 Workflow)

```mermaid
graph TD
    L3["Level 3 Task In Progress"] --> Assess["Continuous Assessment<br>During PLAN or early IMPLEMENT"]

    Assess --> Up["Upgrade to<br>Level 4?"]
    Assess --> Down["Downgrade to<br>Level 2?"]
    Assess --> MaintainL3["Maintain<br>Level 3"]

    Up --> L4Trigger["Triggers:<br>- Unforeseen system-wide impact<br>- Requires deep architectural changes<br>- Scope significantly larger than planned"]
    Down --> L2Trigger["Triggers:<br>- Feature simpler than anticipated<br>- Very limited component interaction<br>- No complex design decisions emerge"]

    L4Trigger --> L4Switch["Stop L3 Workflow.<br>Re-initialize task as Level 4 (VAN).<br>Preserve existing docs as input."]
    L2Trigger --> L2Switch["Adapt L3 Workflow:<br>Simplify remaining phases,<br>use L2 Reflection/Archive rules."]
    
    style Assess fill:#ffe082,stroke:#ffca28
    style Up fill:#ef9a9a,stroke:#e57373
    style Down fill:#a5d6a7,stroke:#81c784
    style MaintainL3 fill:#b3e5fc,stroke:#81d4fa
```

## 📋 WORKFLOW PHASES

### Phase 1: INITIALIZATION (Output from VAN Mode)

This phase is largely completed in VAN mode, which identifies the task as Level 3.

  * **Input:** User request leading to an "Intermediate Feature" classification.
  * **Key Existing Files (from VAN):**
      * `memory-bank/tasks.md`: Entry created, complexity set to Level 3.
      * `memory-bank/activeContext.md`: Initial context set.
      * Relevant Core Rules loaded (e.g., `Core/memory-bank-paths.mdc`, `Core/main-optimized.mdc`).
  * **Steps within this Workflow File (Confirmation):**
    1.  Confirm task is Level 3 by checking `memory-bank/tasks.md`.
    2.  Ensure core Memory Bank structure and paths are known (AI should have internalized from `main` rule).
  * **Milestone Checkpoint:**
    ```
    ✓ INITIALIZATION CONFIRMED (L3)
    - Task correctly identified as Level 3 in tasks.md? [YES/NO]
    - Core Memory Bank files (tasks.md, activeContext.md) accessible via canonical paths? [YES/NO]

    → If all YES: Proceed to Documentation Setup for L3.
    → If any NO: Revisit VAN mode or core file setup.
    ```

### Phase 2: DOCUMENTATION SETUP (L3 Specific)

Prepare the Memory Bank for a Level 3 feature.

```mermaid
graph TD
    StartDoc["Begin L3 Documentation<br>Setup"] --> LoadL3PlanTrack["Load L3 Planning & Tracking Rules<br>Level3/planning-comprehensive.mdc<br>Level3/task-tracking-intermediate.mdc"]
    LoadL3PlanTrack --> UpdateBrief["Review/Update `projectbrief.md`<br>Ensure feature aligns with overall project goals"]
    UpdateBrief --> UpdateActiveCtx["Update `activeContext.md`<br>Set focus to L3 Feature Planning"]
    UpdateActiveCtx --> PrepTaskFile["Prepare `tasks.md` for<br>Comprehensive Feature Plan sections"]
    PrepTaskFile --> DocSetupComplete["L3 Documentation<br>Setup Complete"]

    style StartDoc fill:#b3e5fc,stroke:#81d4fa
    style DocSetupComplete fill:#81d4fa,stroke:#4fc3f7
```

  * **Steps:**
    1.  Load Level 3 specific planning (`Level3/planning-comprehensive.mdc`) and task tracking (`Level3/task-tracking-intermediate.mdc`) rules.
    2.  Review `memory-bank/projectbrief.md`: Briefly note the new feature if it impacts the overall brief.
    3.  Update `memory-bank/activeContext.md`: Set current focus to "Level 3 Feature Planning: [Feature Name]".
    4.  Ensure `memory-bank/tasks.md` is ready for the detailed planning sections outlined in `Level3/planning-comprehensive.mdc`.
  * **Milestone Checkpoint:**
    ```
    ✓ L3 DOCUMENTATION SETUP CHECKPOINT
    - L3 Planning & Tracking rules loaded? [YES/NO]
    - projectbrief.md reviewed/updated for feature context? [YES/NO]
    - activeContext.md reflects focus on L3 feature planning? [YES/NO]
    - tasks.md prepared for detailed L3 plan? [YES/NO]

    → If all YES: Proceed to Feature Planning.
    → If any NO: Complete documentation setup steps.
    ```

### Phase 3: FEATURE PLANNING (PLAN Mode)

Guided by `visual-maps/plan-mode-map.mdc` and using `Level3/planning-comprehensive.mdc` and `Level3/task-tracking-intermediate.mdc`.

```mermaid
graph TD
    StartPlan["Begin L3 Feature<br>Planning"] --> ReqDef["Define Detailed<br>Requirements (Functional & Non-Functional)"]
    ReqDef --> CompAnalysis["Component Analysis<br>(New & Affected Components, Interactions)"]
    CompAnalysis --> ImplStrategy["Develop Implementation<br>Strategy & High-Level Steps"]
    ImplStrategy --> DepRiskMgmt["Identify Dependencies,<br>Risks, & Mitigations"]
    DepRiskMgmt --> CreativeFlag["Flag Aspects for<br>CREATIVE Mode (UI, Arch, Algo)"]
    CreativeFlag --> UpdateTasks["Update `tasks.md` with<br>Full L3 Feature Plan"]
    UpdateTasks --> PlanComplete["L3 Feature Planning<br>Complete"]

    style StartPlan fill:#c8e6c9,stroke:#a5d6a7
    style PlanComplete fill:#a5d6a7,stroke:#81c784
```

  * **Steps:**
    1.  Define detailed functional and non-functional requirements for the feature.
    2.  Perform component analysis: identify new components to build and existing ones that will be modified. Map their interactions.
    3.  Develop an implementation strategy: outline the main steps or stages for building the feature.
    4.  Identify dependencies (technical, data, other features) and potential risks, along with mitigation ideas.
    5.  **Critical for L3:** Explicitly identify and flag parts of the feature that require CREATIVE mode (e.g., specific UI/UX challenges, new architectural patterns for the feature, complex algorithms).
    6.  Document the complete plan (requirements, components, strategy, dependencies, risks, creative flags) in `memory-bank/tasks.md` under the Level 3 feature task entry.
  * **Milestone Checkpoint:**
    ```
    ✓ L3 FEATURE PLANNING CHECKPOINT
    - Detailed requirements documented in tasks.md? [YES/NO]
    - Component analysis (new/affected, interactions) complete? [YES/NO]
    - Implementation strategy outlined? [YES/NO]
    - Dependencies and risks documented? [YES/NO]
    - Aspects needing CREATIVE mode explicitly flagged in tasks.md? [YES/NO]
    - tasks.md comprehensively updated with the feature plan? [YES/NO]

    → If all YES: Proceed to CREATIVE Phases (if flagged) or IMPLEMENTATION.
    → If any NO: Complete planning steps.
    ```

### Phase 4: CREATIVE PHASES (CREATIVE Mode)

Triggered if aspects were flagged in the PLAN phase. Guided by `visual-maps/creative-mode-map.mdc` and `Phases/CreativePhase/*.mdc` rules.

```mermaid
graph TD
    StartCreative["Begin L3 Creative<br>Phases (If Needed)"] --> SelectAspect["Select Flagged Aspect<br>from `tasks.md`"]
    SelectAspect --> DesignExplore["Explore Design/Arch Options<br>(Use relevant creative-phase-*.mdc rules)"]
    DesignExplore --> DecideDocument["Make & Document Decision<br>in `creative-[aspect_name].md`"]
    DecideDocument --> UpdateTasksCreative["Update `tasks.md` with<br>Decision Summary & Link"]
    UpdateTasksCreative --> MoreAspects{"More Flagged<br>Aspects?"}
    MoreAspects -- Yes --> SelectAspect
    MoreAspects -- No --> CreativeComplete["L3 Creative Phases<br>Complete"]

    style StartCreative fill:#ffd8b2,stroke:#ffcc80
    style CreativeComplete fill:#ffcc80,stroke:#ffb74d
```

  * **Steps:**
    1.  For each aspect flagged in `tasks.md` for creative exploration:
        a.  Load relevant `creative-phase-*.mdc` rule (e.g., UI/UX, architecture).
        b.  Define the problem, explore options, analyze trade-offs.
        c.  Make a design decision and document it with rationale in a new `memory-bank/creative-[aspect_name].md` file.
        d.  Update `tasks.md`: mark the creative sub-task as complete and link to the decision document.
  * **Milestone Checkpoint:**
    ```
    ✓ L3 CREATIVE PHASES CHECKPOINT
    - All flagged aspects from PLAN phase addressed? [YES/NO]
    - Design decisions documented in respective `memory-bank/creative-*.md` files? [YES/NO]
    - Rationale for decisions clearly stated? [YES/NO]
    - tasks.md updated to reflect completion of creative sub-tasks and links to decision docs? [YES/NO]

    → If all YES: Proceed to Implementation.
    → If any NO: Complete creative phase work.
    ```

### Phase 5: IMPLEMENTATION (IMPLEMENT Mode)

Guided by `visual-maps/implement-mode-map.mdc` and `Level3/implementation-L3.mdc`.

```mermaid
graph TD
    StartImpl["Begin L3 Feature<br>Implementation"] --> ReviewPlanDesign["Review Plan (`tasks.md`)<br>& Creative Docs (`creative-*.md`)"]
    ReviewPlanDesign --> SetupDevEnv["Setup Dev Environment<br>(Branch, Dependencies, Tools)"]
    SetupDevEnv --> BuildModules["Implement Feature Modules/Components<br>Iteratively or Sequentially"]
    BuildModules --> UnitIntegrationTests["Conduct Unit & Integration Tests<br>for Each Module/Feature Part"]
    UnitIntegrationTests --> StyleAdherence["Ensure Adherence to<br>`memory-bank/style-guide.md`"]
    StyleAdherence --> UpdateProgressDocs["Regularly Update `tasks.md` (sub-tasks)<br>& `progress.md` (milestones)"]
    UpdateProgressDocs --> E2EFeatureTest["End-to-End Feature Testing<br>Against Requirements"]
    E2EFeatureTest --> ImplComplete["L3 Feature Implementation<br>Complete"]

    style StartImpl fill:#ffcdd2,stroke:#ef9a9a
    style ImplComplete fill:#ef9a9a,stroke:#e57373
```

  * **Steps:**
    1.  Thoroughly review the feature plan in `memory-bank/tasks.md` and all relevant `memory-bank/creative-*.md` decision documents.
    2.  Set up the development environment (new branch, install any new dependencies, configure tools).
    3.  Implement the feature, building out modules/components as planned. Prioritize clean code and adherence to design specifications.
    4.  Perform unit tests for new logic and integration tests as components are assembled.
    5.  Ensure all UI elements strictly follow `memory-bank/style-guide.md`.
    6.  Update `memory-bank/tasks.md` with progress on sub-tasks, and `memory-bank/progress.md` with details of implemented parts, commands used, and any significant findings.
    7.  Conduct end-to-end testing of the completed feature against its requirements.
  * **Milestone Checkpoint:**
    ```
    ✓ L3 IMPLEMENTATION CHECKPOINT
    - Feature fully implemented as per plan and creative designs? [YES/NO]
    - All UI elements adhere to `memory-bank/style-guide.md`? [YES/NO]
    - Unit and integration tests performed and passing? [YES/NO]
    - End-to-end feature testing successful? [YES/NO]
    - `tasks.md` and `progress.md` updated with implementation status? [YES/NO]

    → If all YES: Proceed to Reflection.
    → If any NO: Complete implementation and testing.
    ```

### Phase 6: REFLECTION (REFLECT Mode)

Guided by `visual-maps/reflect-mode-map.mdc` and `Level3/reflection-L3.mdc`.

```mermaid
graph TD
    StartReflect["Begin L3 Feature<br>Reflection"] --> ReviewCompleted["Review Completed Feature<br>(Code, Plan, Design Docs, Test Results)"]
    ReviewCompleted --> AnalyzeProcess["Analyze Development Process<br>(Successes, Challenges, Deviations)"]
    AnalyzeProcess --> DocumentLessons["Document Key Lessons Learned<br>(Technical & Process)"]
    DocumentLessons --> AssessDesignChoices["Assess Effectiveness of<br>Creative Phase Decisions"]
    AssessDesignChoices --> CreateReflectDoc["Create `reflection-[feature_id].md`"]
    CreateReflectDoc --> UpdateTasksReflect["Update `tasks.md` (Reflection Complete)"]
    UpdateTasksReflect --> ReflectComplete["L3 Feature Reflection<br>Complete"]

    style StartReflect fill:#d1c4e9,stroke:#b39ddb
    style ReflectComplete fill:#b39ddb,stroke:#9575cd
```

  * **Steps:**
    1.  Review the entire feature development lifecycle: initial requirements, plan, creative designs, implementation, and testing outcomes.
    2.  Analyze what went well, what was challenging, and any deviations from the original plan or design.
    3.  Document key lessons learned regarding technology, architecture, process, or team collaboration relevant to this feature.
    4.  Specifically assess how effective the creative phase decisions were during actual implementation.
    5.  Create the `memory-bank/reflection-[feature_id].md` document.
    6.  Update `memory-bank/tasks.md` to mark the reflection stage for the feature as complete.
  * **Milestone Checkpoint:**
    ```
    ✓ L3 REFLECTION CHECKPOINT
    - Feature development lifecycle thoroughly reviewed? [YES/NO]
    - Successes, challenges, and lessons learned documented in `reflection-[feature_id].md`? [YES/NO]
    - Effectiveness of creative/design decisions assessed? [YES/NO]
    - `tasks.md` updated to reflect reflection completion? [YES/NO]

    → If all YES: Proceed to Archiving.
    → If any NO: Complete reflection documentation.
    ```

### Phase 7: ARCHIVING (ARCHIVE Mode - Highly Recommended for L3)

Guided by `visual-maps/archive-mode-map.mdc` and `Level3/archive-L3.mdc`.

```mermaid
graph TD
    StartArchive["Begin L3 Feature<br>Archiving"] --> ConsolidateDocs["Consolidate All Feature Docs<br>(Plan, Creative, Reflection, Key Progress Notes)"]
    ConsolidateDocs --> CreateArchiveSummary["Create Archive Summary Document<br>`archive/feature-[feature_id]_YYYYMMDD.md`"]
    CreateArchiveSummary --> LinkDocs["Link to Detailed Docs<br>within Archive Summary"]
    LinkDocs --> FinalUpdateTasks["Final Update to `tasks.md`<br>(Mark Feature COMPLETED & ARCHIVED)"]
    FinalUpdateTasks --> ResetActiveCtx["Clear `activeContext.md`<br>Prepare for Next Task"]
    ResetActiveCtx --> ArchiveComplete["L3 Feature Archiving<br>Complete"]

    style StartArchive fill:#cfd8dc,stroke:#b0bec5
    style ArchiveComplete fill:#b0bec5,stroke:#90a4ae
```

  * **Steps:**
    1.  Consolidate all documentation related to the feature: the plan section from `tasks.md`, all `creative-*.md` files, the `reflection-*.md` file, and relevant summaries from `progress.md`.
    2.  Create a dedicated feature archive summary document in `memory-bank/archive/feature-[feature_id]_YYYYMMDD.md`. This summary should briefly describe the feature, its purpose, key decisions, and link to the more detailed documents.
    3.  Update `memory-bank/tasks.md` to mark the entire Level 3 feature task as "COMPLETED" and "ARCHIVED," providing a link to the new archive summary.
    4.  Update `memory-bank/activeContext.md` to clear information related to the completed feature, preparing for the next task.
  * **Milestone Checkpoint:**
    ```
    ✓ L3 ARCHIVING CHECKPOINT
    - Feature archive summary created in `memory-bank/archive/`? [YES/NO]
    - Archive summary links to all relevant planning, creative, and reflection docs? [YES/NO]
    - `tasks.md` shows the feature as COMPLETED and ARCHIVED with a link to the archive? [YES/NO]
    - `activeContext.md` cleared and ready for a new task? [YES/NO]

    → If all YES: Level 3 Task Fully Completed. Suggest VAN Mode for next task.
    → If any NO: Complete archiving steps.
    ```

## 🚨 LEVEL 3 GOVERNANCE PRINCIPLE

Remember:

```
┌─────────────────────────────────────────────────────┐
│ Level 3 tasks build significant features. Balance   │
│ detailed planning and targeted design with efficient│
│ execution. Document key decisions and outcomes to   │
│ ensure the feature is understandable and maintainable.│
└─────────────────────────────────────────────────────┘
```

This ensures that intermediate features are developed with an appropriate level of rigor, bridging the gap between simple enhancements and full-scale system development.

```
```