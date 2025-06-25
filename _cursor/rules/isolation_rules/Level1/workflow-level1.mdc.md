---
description: Streamlined workflow for Level 1 Quick Bug Fix tasks
globs: "**/Level1/**", "**/workflow/**"
alwaysApply: false
---
---
description: Streamlined workflow for Level 1 Quick Bug Fix tasks
globs: "**/Level1/**", "**/workflow/**"
alwaysApply: false
---
# STREAMLINED WORKFLOW FOR LEVEL 1 TASKS

> **TL;DR:** This document outlines a streamlined workflow for Level 1 (Quick Bug Fix) tasks, focusing on efficient problem resolution with minimal overhead while maintaining adequate documentation.

## 🔍 LEVEL 1 WORKFLOW OVERVIEW

```mermaid
graph LR
    Init["1. INITIALIZATION"] --> Impl["2. IMPLEMENTATION"]
    Impl --> Doc["3. DOCUMENTATION"]

    %% Document connections for each phase
    Init -.-> InitDocs["Quick setup<br>Issue understanding"]
    Impl -.-> ImplDocs["Focused fix<br>Verify resolution"]
    Doc -.-> DocDocs["Document solution<br>Update tracking"]
```

## 📋 WORKFLOW PHASES

### Phase 1: INITIALIZATION

```mermaid
graph TD
    Start["Start Level 1 Task"] --> Identify["Identify<br>Issue"]
    Identify --> Understand["Understand<br>Problem"]
    Understand --> Setup["Quick<br>Environment Setup"]
    Setup --> TaskEntry["Create Quick<br>Task Entry"]
    TaskEntry --> InitComplete["Initialization<br>Complete"]
```

**Steps:**
1. Identify the specific issue to fix
2. Understand the problem and its impact
3. Set up environment for quick fix
4. Create minimal task entry in tasks.md

**Milestone Checkpoint:**
```
✓ INITIALIZATION CHECKPOINT
- Issue clearly identified? [YES/NO]
- Problem understood? [YES/NO]
- Environment set up? [YES/NO]
- Task entry created? [YES/NO]

→ If all YES: Proceed to Implementation
→ If any NO: Complete initialization steps
```

### Phase 2: IMPLEMENTATION

```mermaid
graph TD
    Start["Begin<br>Implementation"] --> Locate["Locate<br>Issue Source"]
    Locate --> Develop["Develop<br>Fix"]
    Develop --> Test["Test<br>Solution"]
    Test --> Verify["Verify<br>Resolution"]
    Verify --> ImplComplete["Implementation<br>Complete"]
```

**Steps:**
1. Locate the source of the issue
2. Develop a targeted fix
3. Test the solution thoroughly
4. Verify that the issue is resolved

**Milestone Checkpoint:**
```
✓ IMPLEMENTATION CHECKPOINT
- Issue source located? [YES/NO]
- Fix developed? [YES/NO]
- Solution tested? [YES/NO]
- Resolution verified? [YES/NO]

→ If all YES: Proceed to Documentation
→ If any NO: Complete implementation steps
```

### Phase 3: DOCUMENTATION

```mermaid
graph TD
    Start["Begin<br>Documentation"] --> Update["Update<br>tasks.md"]
    Update --> Solution["Document<br>Solution"]
    Solution --> References["Create Minimal<br>Cross-References"]
    References --> NotifyStakeholders["Notify<br>Stakeholders"]
    NotifyStakeholders --> DocComplete["Documentation<br>Complete"]
```

**Steps:**
1. Update tasks.md with fix details
2. Document the solution concisely
3. Create minimal cross-references
4. Notify stakeholders as needed

**Milestone Checkpoint:**
```
✓ DOCUMENTATION CHECKPOINT
- tasks.md updated? [YES/NO]
- Solution documented? [YES/NO]
- Cross-references created? [YES/NO]
- Stakeholders notified? [YES/NO]

→ If all YES: Task Complete
→ If any NO: Complete documentation steps
```

## 📋 TASK STRUCTURE IN TASKS.MD

For Level 1 tasks, use this minimal structure:

```markdown
## Bug Fixes in Progress
- [ ] [Level 1] Fix: [Bug description] (Est: XX mins)

## Completed Bug Fixes
- [X] [Level 1] Fixed: [Bug description] (Completed: YYYY-MM-DD)
  - Issue: [Brief issue description]
  - Solution: [Brief solution description]
  - Files changed: [File paths]
```

## 📋 MEMORY BANK UPDATES

For Level 1 tasks, make minimal Memory Bank updates:

1. **tasks.md**: Update with fix details
2. **activeContext.md**: Brief mention of fix if relevant
3. **progress.md**: Add to list of completed fixes

## 📋 WORKFLOW VERIFICATION CHECKLIST

```
✓ FINAL WORKFLOW VERIFICATION
- Issue identified and understood? [YES/NO]
- Fix implemented and verified? [YES/NO]
- tasks.md updated? [YES/NO]
- Solution documented? [YES/NO]
- Memory Bank minimally updated? [YES/NO]

→ If all YES: Level 1 Task Successfully Completed
→ If any NO: Address outstanding items
```

## 📋 TASK ESCALATION

If during the Level 1 process you discover the task is more complex:

```
⚠️ TASK ESCALATION NEEDED
Current Level: Level 1
Recommended Level: Level [2/3/4]
Reason: [Brief explanation]

Would you like me to escalate this task to Level [2/3/4]?
```

Escalation indicators:
1. Fix requires changes to multiple components
2. Solution requires design decisions
3. Testing reveals broader issues
4. Fix impacts core functionality

## 🔄 INTEGRATION WITH MEMORY BANK

```mermaid
graph TD
    Workflow["Level 1<br>Workflow"] --> TM["Update<br>tasks.md"]
    Workflow --> AC["Minimal Update<br>activeContext.md"]
    Workflow --> PM["Brief Update<br>progress.md"]

    TM & AC & PM --> MB["Memory Bank<br>Integration"]
    MB --> NextTask["Transition to<br>Next Task"]
```

## 🚨 EFFICIENCY PRINCIPLE

Remember:

```
┌─────────────────────────────────────────────────────┐
│ Level 1 workflow prioritizes SPEED and EFFICIENCY.  │
│ Minimize process overhead while ensuring adequate   │
│ documentation of the solution.                     │
└─────────────────────────────────────────────────────┘
```