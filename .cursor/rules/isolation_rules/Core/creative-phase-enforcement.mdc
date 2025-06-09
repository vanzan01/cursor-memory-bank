---
description: creative phase enforcement
globs: creative-phase-enforcement.mdc
alwaysApply: false
---
# CREATIVE PHASE ENFORCEMENT

> **TL;DR:** This document implements strict enforcement of creative phase requirements for Level 3-4 tasks, ensuring all design decisions are properly documented and verified before implementation can proceed.

## 🔍 ENFORCEMENT WORKFLOW

```mermaid
graph TD
    Start["Task Start"] --> Check{"Level 3-4<br>Task?"}
    Check -->|Yes| Analyze["Analyze Design<br>Decision Points"]
    Check -->|No| Optional["Creative Phase<br>Optional"]

    Analyze --> Decision{"Design Decisions<br>Required?"}
    Decision -->|Yes| Gate["🚨 IMPLEMENTATION<br>BLOCKED"]
    Decision -->|No| Allow["Allow<br>Implementation"]

    Gate --> Creative["Enter Creative<br>Phase"]
    Creative --> Verify{"All Decisions<br>Documented?"}
    Verify -->|No| Return["Return to<br>Creative Phase"]
    Verify -->|Yes| Proceed["Allow<br>Implementation"]

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style Check fill:#ffa64d,stroke:#cc7a30,color:white
    style Analyze fill:#4dbb5f,stroke:#36873f,color:white
    style Gate fill:#d94dbb,stroke:#a3378a,color:white
    style Creative fill:#4dbbbb,stroke:#368787,color:white
    style Verify fill:#d971ff,stroke:#a33bc2,color:white
```

## 🚨 ENFORCEMENT GATES

```mermaid
graph TD
    subgraph "CREATIVE PHASE GATES"
    G1["Entry Gate<br>Verify Requirements"]
    G2["Process Gate<br>Verify Progress"]
    G3["Exit Gate<br>Verify Completion"]
    end

    G1 --> G2 --> G3

    style G1 fill:#4dbb5f,stroke:#36873f,color:white
    style G2 fill:#ffa64d,stroke:#cc7a30,color:white
    style G3 fill:#d94dbb,stroke:#a3378a,color:white
```

## 📋 ENFORCEMENT CHECKLIST

```markdown
## Entry Gate Verification
- [ ] Task complexity is Level 3-4
- [ ] Design decisions identified
- [ ] Creative phase requirements documented
- [ ] Required participants notified

## Process Gate Verification
- [ ] All options being considered
- [ ] Pros/cons documented
- [ ] Technical constraints identified
- [ ] Implementation impacts assessed

## Exit Gate Verification
- [ ] All decisions documented
- [ ] Rationale provided for choices
- [ ] Implementation plan outlined
- [ ] Verification against requirements
```

## 🚨 IMPLEMENTATION BLOCK NOTICE

When a creative phase is required but not completed:

```
🚨 IMPLEMENTATION BLOCKED
Creative phases MUST be completed before implementation.

Required Creative Phases:
- [ ] [Creative Phase 1]
- [ ] [Creative Phase 2]
- [ ] [Creative Phase 3]

⛔ This is a HARD BLOCK
Implementation CANNOT proceed until all creative phases are completed.
Type "PHASE.REVIEW" to begin creative phase review.
```

## ✅ VERIFICATION PROTOCOL

```mermaid
graph TD
    subgraph "VERIFICATION STEPS"
    V1["1. Requirements<br>Check"]
    V2["2. Documentation<br>Review"]
    V3["3. Decision<br>Validation"]
    V4["4. Implementation<br>Readiness"]
    end

    V1 --> V2 --> V3 --> V4

    style V1 fill:#4dbb5f,stroke:#36873f,color:white
    style V2 fill:#ffa64d,stroke:#cc7a30,color:white
    style V3 fill:#d94dbb,stroke:#a3378a,color:white
    style V4 fill:#4dbbbb,stroke:#368787,color:white
```

## 🔄 CREATIVE PHASE MARKERS

Use these markers to clearly indicate creative phase boundaries:

```markdown
🎨🎨🎨 ENTERING CREATIVE PHASE: [TYPE] 🎨🎨🎨
Focus: [Specific component/feature]
Objective: [Clear goal of this creative phase]
Requirements: [List of requirements]

[Creative phase content]

🎨 CREATIVE CHECKPOINT: [Milestone]
- Progress: [Status]
- Decisions: [List]
- Next steps: [Plan]

🎨🎨🎨 EXITING CREATIVE PHASE 🎨🎨🎨
Summary: [Brief description]
Key Decisions: [List]
Next Steps: [Implementation plan]
```

## 🔄 DOCUMENT MANAGEMENT

```mermaid
graph TD
    Current["Current Document"] --> Active["Active:<br>- creative-phase-enforcement.mdc"]
    Current --> Related["Related:<br>- creative-phase-architecture.mdc<br>- task-tracking-intermediate.mdc"]

    style Current fill:#4da6ff,stroke:#0066cc,color:white
    style Active fill:#4dbb5f,stroke:#36873f,color:white
    style Related fill:#ffa64d,stroke:#cc7a30,color:white
```