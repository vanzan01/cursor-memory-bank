---
description: Visual process map for VAN mode complexity determination
globs: van-complexity-determination.mdc
alwaysApply: false
---
# VAN MODE: COMPLEXITY DETERMINATION

> **TL;DR:** This component determines the appropriate complexity level (1-4) for the current task and directs the workflow accordingly.

## 🔍 COMPLEXITY DECISION TREE

```mermaid
graph TD
    Start["New Task"] --> Q1{"Bug fix or<br>error correction?"}
    Q1 -->|Yes| Q1a{"Affects single<br>component?"}
    Q1a -->|Yes| L1["Level 1:<br>Quick Bug Fix"]
    Q1a -->|No| Q1b{"Affects multiple<br>components?"}
    Q1b -->|Yes| L2["Level 2:<br>Simple Enhancement"]
    Q1b -->|No| Q1c{"Affects system<br>architecture?"}
    Q1c -->|Yes| L3["Level 3:<br>Intermediate Feature"]
    Q1c -->|No| L2
    
    Q1 -->|No| Q2{"Adding small<br>feature or<br>enhancement?"}
    Q2 -->|Yes| Q2a{"Self-contained<br>change?"}
    Q2a -->|Yes| L2
    Q2a -->|No| Q2b{"Affects multiple<br>components?"}
    Q2b -->|Yes| L3
    Q2b -->|No| L2
    
    Q2 -->|No| Q3{"Complete feature<br>requiring multiple<br>components?"}
    Q3 -->|Yes| Q3a{"Architectural<br>implications?"}
    Q3a -->|Yes| L4["Level 4:<br>Complex System"]
    Q3a -->|No| L3
    
    Q3 -->|No| Q4{"System-wide or<br>architectural<br>change?"}
    Q4 -->|Yes| L4
    Q4 -->|No| L3

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style L1 fill:#10b981,stroke:#059669,color:white
    style L2 fill:#f6546a,stroke:#c30052,color:white
    style L3 fill:#f6546a,stroke:#c30052,color:white
    style L4 fill:#f6546a,stroke:#c30052,color:white
```

## 📋 LEVEL INDICATORS

### Level 1: Quick Bug Fix
- **Keywords**: fix, bug, error, crash, issue
- **Scope**: Single component
- **Time**: Minutes to hours
- **Risk**: Low, isolated
- **Example**: Button not working, styling issue

### Level 2: Simple Enhancement
- **Keywords**: add, improve, update, enhance
- **Scope**: Single component/subsystem
- **Time**: Hours to 1-2 days
- **Risk**: Moderate, contained
- **Example**: Add form field, improve validation

### Level 3: Intermediate Feature
- **Keywords**: implement, create, develop
- **Scope**: Multiple components
- **Time**: Days to 1-2 weeks
- **Risk**: Significant
- **Example**: User authentication, dashboard

### Level 4: Complex System
- **Keywords**: system, architecture, redesign
- **Scope**: Multiple subsystems
- **Time**: Weeks to months
- **Risk**: High, architectural
- **Example**: Payment system, microservices

## 📋 COMPLEXITY CHECKLIST

```
✓ COMPLEXITY DETERMINATION
- Task type identified? [YES/NO]
- Scope assessed? [YES/NO]
- Time estimated? [YES/NO]
- Risk evaluated? [YES/NO]
- Dependencies mapped? [YES/NO]

→ If all YES: Proceed with level-specific workflow
→ If any NO: Complete assessment
```

## 🔄 LEVEL TRANSITION TRIGGERS

```mermaid
graph TD
    Current["Current Level"] --> Higher["Level Up Triggers"]
    Current --> Lower["Level Down Triggers"]
    
    Higher --> H1["Multiple Components"]
    Higher --> H2["Design Decisions"]
    Higher --> H3["System Impact"]
    
    Lower --> L1["Isolated Change"]
    Lower --> L2["Simple Fix"]
    Lower --> L3["No Design Needed"]

    style Current fill:#4da6ff,stroke:#0066cc,color:white
    style Higher fill:#f6546a,stroke:#c30052,color:white
    style Lower fill:#10b981,stroke:#059669,color:white
```

## 📋 WORKFLOW LOADING

Based on determined level:
- Level 1: Continue in VAN mode
- Level 2-4: Transition to PLAN mode

**Next Step:** Load appropriate level-specific workflow

## 🚨 MODE TRANSITION TRIGGER (VAN to PLAN)

If complexity is determined to be Level 2, 3, or 4:

```
🚫 LEVEL [2-4] TASK DETECTED
Implementation in VAN mode is BLOCKED
This task REQUIRES PLAN mode
You MUST switch to PLAN mode for proper documentation and planning
Type 'PLAN' to switch to planning mode
```

## 📋 CHECKPOINT VERIFICATION TEMPLATE (Example)

```
✓ SECTION CHECKPOINT: COMPLEXITY DETERMINATION
- Task Analyzed? [YES/NO]
- Complexity Level Determined? [YES/NO]

→ If Level 1: Proceed to VAN Mode Completion.
→ If Level 2-4: Trigger PLAN Mode transition.
```

**Next Step (Level 1):** Complete VAN Initialization (e.g., initialize Memory Bank if needed).
**Next Step (Level 2-4):** Exit VAN mode and initiate PLAN mode. 