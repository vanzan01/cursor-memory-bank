---
description: Advanced task tracking for Level 4 Complex System tasks
globs: "**/Level4/**", "**/task-tracking/**"
alwaysApply: false
---

# ADVANCED TASK TRACKING FOR LEVEL 4 TASKS

> **TL;DR:** This document outlines a comprehensive task tracking approach for Level 4 (Complex System) tasks, ensuring detailed tracking of complex, multi-phase work with clear dependencies, progress tracking, and architectural alignment.

## 🔍 ADVANCED TASK TRACKING OVERVIEW

Level 4 Complex System tasks require sophisticated task tracking to manage the complexity of system development, coordinate multiple team members, track dependencies, and ensure alignment with architectural principles. This document outlines a comprehensive task tracking approach for such complex endeavors.

```mermaid
flowchart TD
    classDef phase fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef artifact fill:#f4b8c4,stroke:#d498a4,color:#000
    classDef verification fill:#c5e8b7,stroke:#a5c897,color:#000

    Start([Begin Task<br>Tracking]) --> Framework[Establish Task<br>Framework]
    Framework --> Hierarchy[Define Task<br>Hierarchy]
    Hierarchy --> Breakdown[Create Work<br>Breakdown Structure]
    Breakdown --> Dependencies[Document<br>Dependencies]
    Dependencies --> Milestones[Define Key<br>Milestones]
    Milestones --> Schedule[Create<br>Schedule]
    Schedule --> Resources[Define Resource<br>Allocation]
    Resources --> Risks[Document<br>Risks]
    Risks --> Quality[Define Quality<br>Metrics]
    Quality --> Progress[Track<br>Progress]
    Progress --> Adaptations[Document<br>Adaptations]
    Adaptations --> Verification{Task Tracking<br>Verification}
    Verification -->|Pass| Complete([Task Tracking<br>Complete])
    Verification -->|Fail| Revise[Revise Task<br>Tracking]
    Revise --> Verification

    Framework -.-> TF((Task<br>Framework))
    Hierarchy -.-> TH((Task<br>Hierarchy))
    Breakdown -.-> WBS((Work Breakdown<br>Structure))
    Dependencies -.-> DP((Dependency<br>Matrix))
    Milestones -.-> MS((Milestone<br>Document))
    Schedule -.-> SC((Schedule<br>Document))
    Resources -.-> RA((Resource<br>Allocation))
    Risks -.-> RM((Risk<br>Management))
    Quality -.-> QM((Quality<br>Metrics))
    Progress -.-> PT((Progress<br>Tracking))
    Adaptations -.-> AD((Adaptation<br>Document))

    class Start,Complete milestone
    class Framework,Hierarchy,Breakdown,Dependencies,Milestones,Schedule,Resources,Risks,Quality,Progress,Adaptations,Revise step
    class Verification verification
    class TF,TH,WBS,DP,MS,SC,RA,RM,QM,PT,AD artifact
```

## 📋 TASK TRACKING PRINCIPLES

1. **Architectural Alignment**: All tasks must align with the established architectural principles and patterns.
2. **Hierarchical Organization**: Tasks are organized in a hierarchical structure with clear parent-child relationships.
3. **Dependency Management**: All task dependencies are explicitly documented and tracked.
4. **Progression Transparency**: Task status and progress are clearly documented and visible to all stakeholders.
5. **Quality Integration**: Quality metrics and verification are integrated into task definitions.
6. **Resource Allocation**: Tasks include clear allocation of resources required for completion.
7. **Risk Awareness**: Each significant task includes risk assessment and mitigation strategies.
8. **Adaptive Planning**: Task tracking accommodates changes and adaptations while maintaining system integrity.
9. **Milestone Tracking**: Clear milestones are defined and used to track overall progress.
10. **Comprehensive Documentation**: All aspects of the task lifecycle are documented thoroughly.

## 📋 TASK HIERARCHY STRUCTURE

Level 4 tasks follow a hierarchical structure:

```mermaid
flowchart TD
    classDef system fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef component fill:#a8d5ff,stroke:#88b5e0,color:#000
    classDef feature fill:#c5e8b7,stroke:#a5c897,color:#000
    classDef task fill:#f4b8c4,stroke:#d498a4,color:#000
    classDef subtask fill:#d8c1f7,stroke:#b8a1d7,color:#000

    System[System-Level Work] --> Component1[Component 1]
    System --> Component2[Component 2]
    System --> Component3[Component 3]

    Component1 --> Feature1[Feature 1.1]
    Component1 --> Feature2[Feature 1.2]

    Feature1 --> Task1[Task 1.1.1]
    Feature1 --> Task2[Task 1.1.2]

    Task1 --> Subtask1[Subtask 1.1.1.1]
    Task1 --> Subtask2[Subtask 1.1.1.2]
    Task1 --> Subtask3[Subtask 1.1.1.3]

    class System system
    class Component1,Component2,Component3 component
    class Feature1,Feature2 feature
    class Task1,Task2 task
    class Subtask1,Subtask2,Subtask3 subtask
```

### Levels of Hierarchy:

1. **System Level**: The overall system being built or modified.
2. **Component Level**: Major components or subsystems of the system.
3. **Feature Level**: Specific features within each component.
4. **Task Level**: Concrete tasks required to implement a feature.
5. **Subtask Level**: Detailed subtasks for complex tasks.

## 📋 COMPREHENSIVE TASK STRUCTURE

Each Level 4 task in `tasks.md` follows this comprehensive structure:

```markdown
## [SYSTEM-ID]: System Name

### System Overview
- **Purpose**: [Brief description of system purpose]
- **Architectural Alignment**: [How the system aligns with architectural principles]
- **Status**: [Planning/In Progress/Review/Complete]
- **Milestones**:
  - Milestone 1: [Date] - [Status]
  - Milestone 2: [Date] - [Status]
  - Milestone 3: [Date] - [Status]

### Components
#### [COMP-ID]: Component Name
- **Purpose**: [Brief description of component purpose]
- **Status**: [Planning/In Progress/Review/Complete]
- **Dependencies**: [List of dependencies]
- **Responsible**: [Team or individual responsible]

##### [FEAT-ID]: Feature Name
- **Description**: [Feature description]
- **Status**: [Planning/In Progress/Review/Complete]
- **Priority**: [Critical/High/Medium/Low]
- **Related Requirements**: [List of requirements IDs this feature addresses]
- **Quality Criteria**: [Measurable criteria for completion]
- **Progress**: [0-100%]

###### [TASK-ID]: Task Name
- **Description**: [Task description]
- **Status**: [TODO/In Progress/Review/Done]
- **Assigned To**: [Assignee]
- **Estimated Effort**: [Effort estimate]
- **Actual Effort**: [Actual effort]
- **Dependencies**: [Tasks this depends on]
- **Blocks**: [Tasks blocked by this]
- **Risk Assessment**: [Risk level and description]
- **Quality Gates**: [Quality gates this must pass]
- **Implementation Notes**: [Key implementation notes]

**Subtasks**:
- [ ] [SUB-ID]: [Subtask description] - [Status]
- [ ] [SUB-ID]: [Subtask description] - [Status]
- [ ] [SUB-ID]: [Subtask description] - [Status]

### System-Wide Tasks
- [ ] [SYS-TASK-ID]: [System-wide task description] - [Status]
- [ ] [SYS-TASK-ID]: [System-wide task description] - [Status]

### Risks and Mitigations
- **Risk 1**: [Description] - **Mitigation**: [Mitigation strategy]
- **Risk 2**: [Description] - **Mitigation**: [Mitigation strategy]

### Progress Summary
- **Overall Progress**: [0-100%]
- **Component 1**: [0-100%]
- **Component 2**: [0-100%]
- **Component 3**: [0-100%]

### Latest Updates
- [Date]: [Update description]
- [Date]: [Update description]
```

## 📋 TASK TRACKING ORGANIZATION IN TASKS.MD

For Level 4 Complex System tasks, organize `tasks.md` as follows:

```markdown
# TASK TRACKING

## ACTIVE SYSTEMS
- [SYSTEM-ID]: [System Name] - [Status]
- [SYSTEM-ID]: [System Name] - [Status]

## SYSTEM DETAILS

[Detailed task structure for each system as per the template above]

## COMPLETED SYSTEMS
- [SYSTEM-ID]: [System Name] - Completed [Date]
- [SYSTEM-ID]: [System Name] - Completed [Date]

## SYSTEM DEPENDENCIES
```mermaid
graph TD
    System1 --> System2
    System1 --> System3
    System2 --> System4
```

## RISK REGISTER
| Risk ID | Description | Probability | Impact | Mitigation |
|---------|-------------|-------------|--------|------------|
| RISK-01 | [Description] | High/Med/Low | High/Med/Low | [Strategy] |
| RISK-02 | [Description] | High/Med/Low | High/Med/Low | [Strategy] |

## RESOURCE ALLOCATION
| Resource | System | Allocation % | Time Period |
|----------|--------|--------------|------------|
| [Name/Team] | [System-ID] | [%] | [Start-End] |
| [Name/Team] | [System-ID] | [%] | [Start-End] |
```

## 📋 DEPENDENCY MANAGEMENT

```mermaid
flowchart TD
    classDef critical fill:#f8707e,stroke:#d85060,color:#000
    classDef high fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef medium fill:#a8d5ff,stroke:#88b5e0,color:#000
    classDef low fill:#c5e8b7,stroke:#a5c897,color:#000

    Task1[Task 1] --> Task2[Task 2]
    Task1 --> Task3[Task 3]
    Task2 --> Task4[Task 4]
    Task3 --> Task4
    Task4 --> Task5[Task 5]
    Task4 --> Task6[Task 6]
    Task5 --> Task7[Task 7]
    Task6 --> Task7

    class Task1,Task4,Task7 critical
    class Task2,Task5 high
    class Task3 medium
    class Task6 low
```

For complex systems, document dependencies in a dedicated section:

```markdown
## Dependency Matrix

| Task ID | Depends On | Blocks | Type | Status |
|---------|------------|--------|------|--------|
| TASK-01 | - | TASK-02, TASK-03 | Technical | Completed |
| TASK-02 | TASK-01 | TASK-04 | Technical | In Progress |
| TASK-03 | TASK-01 | TASK-04 | Resource | Not Started |
| TASK-04 | TASK-02, TASK-03 | TASK-05, TASK-06 | Technical | Not Started |
```

### Dependency Types:
- **Technical**: One task technically requires another to be completed first
- **Resource**: Tasks compete for the same resources
- **Information**: One task requires information produced by another
- **Architectural**: Tasks have architectural dependencies
- **Temporal**: Tasks must be completed in a specific time sequence

## 📋 MILESTONE TRACKING

For Level 4 tasks, track milestones explicitly:

```markdown
## System Milestones

| Milestone ID | Description | Target Date | Actual Date | Status | Deliverables |
|--------------|-------------|-------------|-------------|--------|--------------|
| MILE-01 | Architecture Approved | [Date] | [Date] | Completed | Architecture Document |
| MILE-02 | Component Design Completed | [Date] | - | In Progress | Design Documents |
| MILE-03 | Component 1 Implementation | [Date] | - | Not Started | Code, Tests |
| MILE-04 | Integration Complete | [Date] | - | Not Started | Integrated System |
| MILE-05 | System Testing Complete | [Date] | - | Not Started | Test Reports |
| MILE-06 | Deployment Ready | [Date] | - | Not Started | Deployment Package |
```

## 📋 PROGRESS VISUALIZATION

Include visual representations of progress in `tasks.md`:

```markdown
## Progress Visualization

### Overall System Progress
```mermaid
pie title System Progress
    "Completed" : 30
    "In Progress" : 25
    "Not Started" : 45
```

### Component Progress
```mermaid
graph TD
    subgraph Progress
    C1[Component 1: 75%]
    C2[Component 2: 50%]
    C3[Component 3: 20%]
    C4[Component 4: 5%]
    end
```

### Timeline
```mermaid
gantt
    title System Timeline
    dateFormat  YYYY-MM-DD

    section Architecture
    Architecture Design    :done, arch, 2023-01-01, 30d
    Architecture Review    :done, arch-rev, after arch, 10d

    section Component 1
    Design                 :active, c1-des, after arch-rev, 20d
    Implementation         :c1-imp, after c1-des, 40d
    Testing                :c1-test, after c1-imp, 15d

    section Component 2
    Design                 :active, c2-des, after arch-rev, 25d
    Implementation         :c2-imp, after c2-des, 50d
    Testing                :c2-test, after c2-imp, 20d
```
```

## 📋 UPDATING TASK STATUS

For Level 4 tasks, status updates include:

1. **Progress Updates**: Update task status and progress percentage
2. **Effort Tracking**: Record actual effort against estimates
3. **Risk Updates**: Update risk assessments and mitigations
4. **Dependency Status**: Update status of dependencies
5. **Milestone Tracking**: Update milestone status
6. **Issue Documentation**: Document issues encountered
7. **Adaptation Documentation**: Document any adaptations to the original plan
8. **Quality Gate Status**: Update status of quality gates

Status update cycle:
- **Daily**: Update task and subtask status
- **Weekly**: Update component status and progress visualization
- **Bi-weekly**: Update system-level progress and milestone status
- **Monthly**: Complete system review including risks and adaptations

## 📋 TASK TRACKING VERIFICATION CHECKLIST

```
✓ TASK TRACKING VERIFICATION CHECKLIST

Task Structure
- System level work properly defined? [YES/NO]
- Component level tasks identified? [YES/NO]
- Feature level tasks specified? [YES/NO]
- Task level details provided? [YES/NO]
- Subtasks created for complex tasks? [YES/NO]

Task Information
- All tasks have clear descriptions? [YES/NO]
- Status accurately reflected? [YES/NO]
- Proper assignments made? [YES/NO]
- Effort estimates provided? [YES/NO]
- Dependencies documented? [YES/NO]

Progress Tracking
- Overall progress calculated? [YES/NO]
- Component progress updated? [YES/NO]
- Milestone status updated? [YES/NO]
- Progress visualizations current? [YES/NO]
- Latest updates documented? [YES/NO]

Risk Management
- Risks identified and assessed? [YES/NO]
- Mitigation strategies documented? [YES/NO]
- Risk register updated? [YES/NO]
- Impact on schedule assessed? [YES/NO]
- Contingency plans documented? [YES/NO]

Resource Allocation
- Resources allocated to tasks? [YES/NO]
- Resource conflicts identified? [YES/NO]
- Resource allocation optimized? [YES/NO]
- Future resource needs projected? [YES/NO]
- Resource allocation documented? [YES/NO]

Quality Integration
- Quality criteria defined for tasks? [YES/NO]
- Quality gates specified? [YES/NO]
- Verification procedures documented? [YES/NO]
- Quality metrics being tracked? [YES/NO]
- Quality issues documented? [YES/NO]

Architectural Alignment
- Tasks align with architecture? [YES/NO]
- Architectural dependencies tracked? [YES/NO]
- Architectural constraints documented? [YES/NO]
- Architecture evolution tracked? [YES/NO]
- Architectural decisions documented? [YES/NO]
```

## 📋 INTEGRATION WITH MEMORY BANK

Level 4 task tracking is tightly integrated with the Memory Bank:

1. **projectbrief.md**: System-level tasks are derived from and linked to the project brief
2. **productContext.md**: Tasks are aligned with business context and objectives
3. **systemPatterns.md**: Tasks respect and implement defined architectural patterns
4. **techContext.md**: Tasks are aligned with the technology stack and constraints
5. **activeContext.md**: Current focus and status from `tasks.md` informs the active context
6. **progress.md**: System progress from `tasks.md` is reflected in overall progress

```mermaid
flowchart TD
    classDef memfile fill:#f4b8c4,stroke:#d498a4,color:#000
    classDef process fill:#f9d77e,stroke:#d9b95c,color:#000

    TaskTracking[Advanced Task<br>Tracking] --> PB[projectbrief.md]
    TaskTracking --> PC[productContext.md]
    TaskTracking --> AC[activeContext.md]
    TaskTracking --> SP[systemPatterns.md]
    TaskTracking --> TC[techContext.md]
    TaskTracking --> P[progress.md]

    P --> TU[Task<br>Updates]
    TU --> TaskTracking

    class PB,PC,AC,SP,TC,P memfile
    class TaskTracking,TU process
```

## 📋 MINIMAL MODE TASK TRACKING

For situations requiring a more compact tracking approach:

```markdown
## [SYSTEM-ID]: System Name - [Status]

### Key Components:
- [COMP-ID]: [Component Name] - [Status] - [Progress %]
- [COMP-ID]: [Component Name] - [Status] - [Progress %]

### Active Tasks:
- [ ] [TASK-ID]: [Task Description] - [Assignee] - [Status]
  - Dependencies: [List of task IDs]
  - Risks: [Brief risk description]
- [ ] [TASK-ID]: [Task Description] - [Assignee] - [Status]

### Milestones:
- [MILE-ID]: [Milestone description] - [Target Date] - [Status]
- [MILE-ID]: [Milestone description] - [Target Date] - [Status]

### Critical Paths:
- [TASK-ID] → [TASK-ID] → [TASK-ID] → [TASK-ID]
- [TASK-ID] → [TASK-ID] → [TASK-ID]

### Updates:
- [Date]: [Brief update]
```

## 🚨 TASK TRACKING PRIMACY PRINCIPLE

```
┌─────────────────────────────────────────────────────┐
│ tasks.md is the SINGLE SOURCE OF TRUTH for all task  │
│ tracking. All task-related decisions and status      │
│ updates MUST be reflected in tasks.md.               │
└─────────────────────────────────────────────────────┘
```