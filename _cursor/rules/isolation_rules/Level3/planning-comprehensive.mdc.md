---
description: planning comprehensive
globs: planning-comprehensive.mdc
alwaysApply: false
---
# LEVEL 3 COMPREHENSIVE PLANNING

> **TL;DR:** This document provides structured planning guidelines for Level 3 (Intermediate Feature) tasks, focusing on comprehensive planning with creative phases and clear implementation strategies.

## 🏗️ PLANNING WORKFLOW

```mermaid
graph TD
    Start["Planning Start"] --> Req["📋 Requirements<br>Analysis"]
    Req --> Comp["🔍 Component<br>Analysis"]
    Comp --> Design["🎨 Design<br>Decisions"]
    Design --> Impl["⚙️ Implementation<br>Strategy"]
    Impl --> Test["🧪 Testing<br>Strategy"]
    Test --> Doc["📚 Documentation<br>Plan"]
    
    Design --> Creative["Creative Phases:"]
    Creative --> UI["UI/UX Design"]
    Creative --> Arch["Architecture"]
    Creative --> Algo["Algorithm"]
    
    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style Req fill:#ffa64d,stroke:#cc7a30,color:white
    style Comp fill:#4dbb5f,stroke:#36873f,color:white
    style Design fill:#d94dbb,stroke:#a3378a,color:white
    style Impl fill:#4dbbbb,stroke:#368787,color:white
    style Test fill:#d971ff,stroke:#a33bc2,color:white
    style Doc fill:#ff71c2,stroke:#c23b8a,color:white
```

## 🔄 LEVEL TRANSITION HANDLING

```mermaid
graph TD
    L3["Level 3 Task"] --> Assess["Continuous<br>Assessment"]
    
    Assess --> Down["Downgrade to<br>Level 1/2"]
    Assess --> Up["Upgrade to<br>Level 4"]
    
    Down --> L12Trigger["Triggers:<br>- Simpler than expected<br>- Limited scope<br>- Few components"]
    
    Up --> L4Trigger["Triggers:<br>- System-wide impact<br>- Architectural changes<br>- High complexity"]
    
    L12Trigger --> L12Switch["Switch to<br>Level 1/2 Workflow"]
    L4Trigger --> L4Switch["Switch to<br>Level 4 Workflow"]
```

## 📋 PLANNING TEMPLATE

```markdown
# Feature Planning Document

## Requirements Analysis
- Core Requirements:
  - [ ] Requirement 1
  - [ ] Requirement 2
- Technical Constraints:
  - [ ] Constraint 1
  - [ ] Constraint 2

## Component Analysis
- Affected Components:
  - Component 1
    - Changes needed:
    - Dependencies:
  - Component 2
    - Changes needed:
    - Dependencies:

## Design Decisions
- Architecture:
  - [ ] Decision 1
  - [ ] Decision 2
- UI/UX:
  - [ ] Design 1
  - [ ] Design 2
- Algorithms:
  - [ ] Algorithm 1
  - [ ] Algorithm 2

## Implementation Strategy
1. Phase 1:
   - [ ] Task 1
   - [ ] Task 2
2. Phase 2:
   - [ ] Task 3
   - [ ] Task 4

## Testing Strategy
- Unit Tests:
  - [ ] Test 1
  - [ ] Test 2
- Integration Tests:
  - [ ] Test 3
  - [ ] Test 4

## Documentation Plan
- [ ] API Documentation
- [ ] User Guide Updates
- [ ] Architecture Documentation
```

## 🎨 CREATIVE PHASE IDENTIFICATION

```mermaid
graph TD
    subgraph "CREATIVE PHASES REQUIRED"
    UI["🎨 UI/UX Design<br>Required: Yes/No"]
    Arch["🏗️ Architecture Design<br>Required: Yes/No"]
    Algo["⚙️ Algorithm Design<br>Required: Yes/No"]
    end
    
    UI --> UITrig["Triggers:<br>- New UI Component<br>- UX Flow Change"]
    Arch --> ArchTrig["Triggers:<br>- System Structure Change<br>- New Integration"]
    Algo --> AlgoTrig["Triggers:<br>- Performance Critical<br>- Complex Logic"]
    
    style UI fill:#4dbb5f,stroke:#36873f,color:white
    style Arch fill:#ffa64d,stroke:#cc7a30,color:white
    style Algo fill:#d94dbb,stroke:#a3378a,color:white
```

## ✅ VERIFICATION CHECKLIST

```mermaid
graph TD
    subgraph "PLANNING VERIFICATION"
    R["Requirements<br>Complete"]
    C["Components<br>Identified"]
    D["Design Decisions<br>Made"]
    I["Implementation<br>Plan Ready"]
    T["Testing Strategy<br>Defined"]
    Doc["Documentation<br>Plan Ready"]
    end
    
    R --> C --> D --> I --> T --> Doc
    
    style R fill:#4dbb5f,stroke:#36873f,color:white
    style C fill:#ffa64d,stroke:#cc7a30,color:white
    style D fill:#d94dbb,stroke:#a3378a,color:white
    style I fill:#4dbbbb,stroke:#368787,color:white
    style T fill:#d971ff,stroke:#a33bc2,color:white
    style Doc fill:#ff71c2,stroke:#c23b8a,color:white
```

## 🔄 IMPLEMENTATION PHASES

```mermaid
graph LR
    Setup["🛠️ Setup"] --> Core["⚙️ Core<br>Implementation"]
    Core --> UI["🎨 UI<br>Implementation"]
    UI --> Test["🧪 Testing"]
    Test --> Doc["📚 Documentation"]
    
    style Setup fill:#4da6ff,stroke:#0066cc,color:white
    style Core fill:#4dbb5f,stroke:#36873f,color:white
    style UI fill:#ffa64d,stroke:#cc7a30,color:white
    style Test fill:#d94dbb,stroke:#a3378a,color:white
    style Doc fill:#4dbbbb,stroke:#368787,color:white
```

## 🔄 INTEGRATION WITH MEMORY BANK

```mermaid
graph TD
    L3["Level 3<br>Task"] --> PB["Comprehensive<br>projectbrief.md"]
    L3 --> AC["Detailed<br>activeContext.md"]
    L3 --> TM["Structured<br>tasks.md"]
    L3 --> PM["Detailed<br>progress.md"]
    
    PB & AC & TM & PM --> MB["Memory Bank<br>Integration"]
    MB --> NextPhase["Proceed to<br>Implementation"]
```

## 🚨 PLANNING EFFICIENCY PRINCIPLE

Remember:

```
┌─────────────────────────────────────────────────────┐
│ Level 3 planning requires COMPREHENSIVE DESIGN but   │
│ should avoid OVER-ENGINEERING. Focus on delivering  │
│ maintainable, well-documented features.            │
└─────────────────────────────────────────────────────┘
``` 