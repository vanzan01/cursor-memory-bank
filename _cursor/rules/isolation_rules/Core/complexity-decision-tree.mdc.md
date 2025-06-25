---
description: complexity decision tree
globs: complexity-decision-tree.mdc
alwaysApply: false
---
# TASK COMPLEXITY DETERMINATION

> **TL;DR:** This document helps determine the appropriate complexity level (1-4) for any task. Use the decision tree and indicators to select the right process level, then load the corresponding process map.

## 🌳 COMPLEXITY DECISION TREE

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

    L1 --> LoadL1["Load Level 1 Map"]
    L2 --> LoadL2["Load Level 2 Map"]
    L3 --> LoadL3["Load Level 3 Map"]
    L4 --> LoadL4["Load Level 4 Map"]
```

## 📊 COMPLEXITY LEVEL INDICATORS

Use these indicators to help determine task complexity:

### Level 1: Quick Bug Fix
- **Keywords**: "fix", "broken", "not working", "issue", "bug", "error", "crash"
- **Scope**: Single component or UI element
- **Duration**: Can be completed quickly (minutes to hours)
- **Risk**: Low, isolated changes
- **Examples**:
  - Fix button not working
  - Correct styling issue
  - Fix validation error
  - Resolve broken link
  - Fix typo or text issue

### Level 2: Simple Enhancement
- **Keywords**: "add", "improve", "update", "change", "enhance", "modify"
- **Scope**: Single component or subsystem
- **Duration**: Hours to 1-2 days
- **Risk**: Moderate, contained to specific area
- **Examples**:
  - Add form field
  - Improve validation
  - Update styling
  - Add simple feature
  - Change text content
  - Enhance existing component

### Level 3: Intermediate Feature
- **Keywords**: "implement", "create", "develop", "build", "feature"
- **Scope**: Multiple components, complete feature
- **Duration**: Days to 1-2 weeks
- **Risk**: Significant, affects multiple areas
- **Examples**:
  - Implement user authentication
  - Create dashboard
  - Develop search functionality
  - Build user profile system
  - Implement data visualization
  - Create complex form system

### Level 4: Complex System
- **Keywords**: "system", "architecture", "redesign", "integration", "framework"
- **Scope**: Multiple subsystems or entire application
- **Duration**: Weeks to months
- **Risk**: High, architectural implications
- **Examples**:
  - Implement authentication system
  - Build payment processing framework
  - Create microservice architecture
  - Implement database migration system
  - Develop real-time communication system
  - Create multi-tenant architecture

## 🔍 COMPLEXITY ASSESSMENT QUESTIONS

Answer these questions to determine complexity:

1. **Scope Impact**
   - Does it affect a single component or multiple?
   - Are there system-wide implications?
   - How many files will need to be modified?

2. **Design Decisions**
   - Are complex design decisions required?
   - Will it require creative phases for design?
   - Are there architectural considerations?

3. **Risk Assessment**
   - What happens if it fails?
   - Are there security implications?
   - Will it affect critical functionality?

4. **Implementation Effort**
   - How long will it take to implement?
   - Does it require specialized knowledge?
   - Is extensive testing needed?

## 📊 KEYWORD ANALYSIS TABLE

| Keyword | Likely Level | Notes |
|---------|--------------|-------|
| "Fix" | Level 1 | Unless system-wide |
| "Bug" | Level 1 | Unless multiple components |
| "Error" | Level 1 | Unless architectural |
| "Add" | Level 2 | Unless complex feature |
| "Update" | Level 2 | Unless architectural |
| "Improve" | Level 2 | Unless system-wide |
| "Implement" | Level 3 | Complex components |
| "Create" | Level 3 | New functionality |
| "Develop" | Level 3 | Significant scope |
| "System" | Level 4 | Architectural implications |
| "Architecture" | Level 4 | Major structural changes |
| "Framework" | Level 4 | Core infrastructure |

## 🔄 COMPLEXITY ESCALATION

If during a task you discover it's more complex than initially determined:

```
⚠️ TASK ESCALATION NEEDED
Current Level: Level [X]
Recommended Level: Level [Y]
Reason: [Brief explanation]

Would you like me to escalate this task to Level [Y]?
```

If approved, switch to the appropriate higher-level process map.

## 🎯 PROCESS SELECTION

After determining complexity, load the appropriate process map:

| Level | Description | Process Map |
|-------|-------------|-------------|
| 1 | Quick Bug Fix | [Level 1 Workflow](mdc:workflow-level1.mdc) |
| 2 | Simple Enhancement | [Level 2 Workflow](mdc:workflow-level2.mdc) |
| 3 | Intermediate Feature | [Level 3 Workflow](mdc:workflow-level3.mdc) |
| 4 | Complex System | [Level 4 Workflow](mdc:workflow-level4.mdc) |

## 📝 COMPLEXITY DETERMINATION TEMPLATE

Use this template to document complexity determination:

```
## COMPLEXITY DETERMINATION

Task: [Task description]

Assessment:
- Scope: [Single component/Multiple components/System-wide]
- Design decisions: [Simple/Moderate/Complex]
- Risk: [Low/Moderate/High]
- Implementation effort: [Low/Moderate/High]

Keywords identified: [List relevant keywords]

Determination: Level [1/2/3/4] - [Quick Bug Fix/Simple Enhancement/Intermediate Feature/Complex System]

Loading process map: [Level X Map]
```
