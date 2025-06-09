---
description: creative phase architecture
globs: creative-phase-architecture.md
alwaysApply: false
---

# CREATIVE PHASE: ARCHITECTURE DESIGN

> **TL;DR:** This document provides structured guidance for architectural design decisions during creative phases, ensuring comprehensive evaluation of options and clear documentation of architectural choices.

## 🏗️ ARCHITECTURE DESIGN WORKFLOW

```mermaid
graph TD
    Start["Architecture<br>Design Start"] --> Req["1. Requirements<br>Analysis"]
    Req --> Comp["2. Component<br>Identification"]
    Comp --> Options["3. Architecture<br>Options"]
    Options --> Eval["4. Option<br>Evaluation"]
    Eval --> Decision["5. Decision &<br>Documentation"]
    Decision --> Valid["6. Validation &<br>Verification"]

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style Req fill:#ffa64d,stroke:#cc7a30,color:white
    style Comp fill:#4dbb5f,stroke:#36873f,color:white
    style Options fill:#d94dbb,stroke:#a3378a,color:white
    style Eval fill:#4dbbbb,stroke:#368787,color:white
    style Decision fill:#d971ff,stroke:#a33bc2,color:white
    style Valid fill:#ff71c2,stroke:#c23b8a,color:white
```

## 📋 ARCHITECTURE DECISION TEMPLATE

```markdown
# Architecture Decision Record

## Context
- System Requirements:
  - [Requirement 1]
  - [Requirement 2]
- Technical Constraints:
  - [Constraint 1]
  - [Constraint 2]

## Component Analysis
- Core Components:
  - [Component 1]: [Purpose/Role]
  - [Component 2]: [Purpose/Role]
- Interactions:
  - [Interaction 1]
  - [Interaction 2]

## Architecture Options
### Option 1: [Name]
- Description: [Brief description]
- Pros:
  - [Pro 1]
  - [Pro 2]
- Cons:
  - [Con 1]
  - [Con 2]
- Technical Fit: [High/Medium/Low]
- Complexity: [High/Medium/Low]
- Scalability: [High/Medium/Low]

### Option 2: [Name]
[Same structure as Option 1]

## Decision
- Chosen Option: [Option name]
- Rationale: [Explanation]
- Implementation Considerations:
  - [Consideration 1]
  - [Consideration 2]

## Validation
- Requirements Met:
  - [✓] Requirement 1
  - [✓] Requirement 2
- Technical Feasibility: [Assessment]
- Risk Assessment: [Evaluation]
```

## 🎯 ARCHITECTURE EVALUATION CRITERIA

```mermaid
graph TD
    subgraph "EVALUATION CRITERIA"
    C1["Scalability"]
    C2["Maintainability"]
    C3["Performance"]
    C4["Security"]
    C5["Cost"]
    C6["Time to Market"]
    end

    style C1 fill:#4dbb5f,stroke:#36873f,color:white
    style C2 fill:#ffa64d,stroke:#cc7a30,color:white
    style C3 fill:#d94dbb,stroke:#a3378a,color:white
    style C4 fill:#4dbbbb,stroke:#368787,color:white
    style C5 fill:#d971ff,stroke:#a33bc2,color:white
    style C6 fill:#ff71c2,stroke:#c23b8a,color:white
```

## 📊 ARCHITECTURE VISUALIZATION TEMPLATES

### Component Diagram Template
```mermaid
graph TD
    subgraph "SYSTEM ARCHITECTURE"
    C1["Component 1"]
    C2["Component 2"]
    C3["Component 3"]

    C1 -->|"Interface 1"| C2
    C2 -->|"Interface 2"| C3
    end

    style C1 fill:#4dbb5f,stroke:#36873f,color:white
    style C2 fill:#ffa64d,stroke:#cc7a30,color:white
    style C3 fill:#d94dbb,stroke:#a3378a,color:white
```

### Data Flow Template
```mermaid
sequenceDiagram
    participant C1 as Component 1
    participant C2 as Component 2
    participant C3 as Component 3

    C1->>C2: Request
    C2->>C3: Process
    C3-->>C2: Response
    C2-->>C1: Result
```

## ✅ VERIFICATION CHECKLIST

```markdown
## Architecture Design Verification
- [ ] All system requirements addressed
- [ ] Component responsibilities defined
- [ ] Interfaces specified
- [ ] Data flows documented
- [ ] Security considerations addressed
- [ ] Scalability requirements met
- [ ] Performance requirements met
- [ ] Maintenance approach defined

## Implementation Readiness
- [ ] All components identified
- [ ] Dependencies mapped
- [ ] Technical constraints documented
- [ ] Risk assessment completed
- [ ] Resource requirements defined
- [ ] Timeline estimates provided
```

## 🔄 ARCHITECTURE REVIEW PROCESS

```mermaid
graph TD
    subgraph "REVIEW PROCESS"
    R1["Technical<br>Review"]
    R2["Security<br>Review"]
    R3["Performance<br>Review"]
    R4["Final<br>Approval"]
    end

    R1 --> R2 --> R3 --> R4

    style R1 fill:#4dbb5f,stroke:#36873f,color:white
    style R2 fill:#ffa64d,stroke:#cc7a30,color:white
    style R3 fill:#d94dbb,stroke:#a3378a,color:white
    style R4 fill:#4dbbbb,stroke:#368787,color:white
```

## 🔄 DOCUMENT MANAGEMENT

```mermaid
graph TD
    Current["Current Document"] --> Active["Active:<br>- creative-phase-architecture.mdc"]
    Current --> Related["Related:<br>- creative-phase-enforcement.mdc<br>- planning-comprehensive.mdc"]

    style Current fill:#4da6ff,stroke:#0066cc,color:white
    style Active fill:#4dbb5f,stroke:#36873f,color:white
    style Related fill:#ffa64d,stroke:#cc7a30,color:white
```