---
description: Architectural planning guidelines for Level 4 Complex System tasks
globs: "**/Level4/**", "**/architecture/**"
alwaysApply: false
---

# ARCHITECTURAL PLANNING FOR LEVEL 4 TASKS

> **TL;DR:** This document outlines a comprehensive architectural planning approach for Level 4 (Complex System) tasks, ensuring a robust, scalable, and maintainable architecture that aligns with business objectives and technical requirements.

## 🔍 ARCHITECTURAL PLANNING OVERVIEW

Level 4 Complex System tasks require thorough architectural planning to ensure the resulting system is robust, scalable, maintainable, and aligned with business objectives. This document outlines a structured approach to architectural planning that systematically addresses key concerns and produces comprehensive documentation.

```mermaid
flowchart TD
    classDef phase fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef artifact fill:#f4b8c4,stroke:#d498a4,color:#000
    classDef verification fill:#c5e8b7,stroke:#a5c897,color:#000

    Start([Begin Architectural<br>Planning]) --> Reqs[Analyze<br>Requirements]
    Reqs --> Context[Define Business<br>Context]
    Context --> Vision[Establish Vision<br>and Goals]
    Vision --> Principles[Define Architectural<br>Principles]
    Principles --> Constraints[Identify<br>Constraints]
    Constraints --> Explore[Explore<br>Alternatives]
    Explore --> Evaluate[Evaluate<br>Options]
    Evaluate --> Decision[Document<br>Decisions]
    Decision --> Create[Create Architecture<br>Documentation]
    Create --> Validate[Validate<br>Architecture]
    Validate --> Communicate[Communicate<br>Architecture]
    Communicate --> Verification{Architecture<br>Verification}
    Verification -->|Pass| Complete([Architectural<br>Planning Complete])
    Verification -->|Fail| Revise[Revise<br>Architecture]
    Revise --> Verification

    Reqs -.-> ReqDoc((Requirements<br>Document))
    Context -.-> ConDoc((Context<br>Document))
    Vision -.-> VisDoc((Vision<br>Document))
    Principles -.-> PrinDoc((Principles<br>Document))
    Explore -.-> AltDoc((Alternatives<br>Analysis))
    Decision -.-> ADR((Architecture<br>Decision Records))
    Create -.-> ArchDoc((Architecture<br>Documentation))

    class Start,Complete milestone
    class Reqs,Context,Vision,Principles,Constraints,Explore,Evaluate,Decision,Create,Validate,Communicate,Revise step
    class Verification verification
    class ReqDoc,ConDoc,VisDoc,PrinDoc,AltDoc,ADR,ArchDoc artifact
```

## 📋 ARCHITECTURAL PLANNING PRINCIPLES

1. **Business Alignment**: Architecture must directly support business objectives and user needs.
2. **Future-Proofing**: Architecture must anticipate future requirements and facilitate change.
3. **Simplicity**: Prefer simple solutions over complex ones when possible.
4. **Separation of Concerns**: Systems should be divided into distinct components with minimal overlap.
5. **Defense in Depth**: Multiple layers of security controls should be employed.
6. **Loose Coupling**: Components should interact through well-defined interfaces with minimal dependencies.
7. **High Cohesion**: Related functionality should be grouped together, unrelated functionality separated.
8. **Resilience**: Architecture should anticipate failures and provide mechanisms for recovery.
9. **Scalability**: Architecture should support growth in users, data, and functionality.
10. **Measurability**: Architecture should enable monitoring and measurement of key metrics.

## 📋 ARCHITECTURAL REQUIREMENTS ANALYSIS

Begin architectural planning with a comprehensive analysis of requirements:

### Functional Requirements Analysis

```mermaid
flowchart LR
    classDef req fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef arch fill:#a8d5ff,stroke:#88b5e0,color:#000

    FR[Functional<br>Requirements] --> USE[Use Cases/<br>User Stories]
    USE --> DOM[Domain<br>Model]
    DOM --> COMP[Component<br>Identification]
    COMP --> INT[Interface<br>Definition]
    INT --> FLOW[Information<br>Flow]

    class FR,USE,DOM req
    class COMP,INT,FLOW arch
```

**Template for Functional Requirements Analysis:**

```markdown
## Functional Requirements Analysis

### Key Use Cases
- Use Case 1: [Description]
- Use Case 2: [Description]
- Use Case 3: [Description]

### Domain Model
- Entity 1: [Description and attributes]
- Entity 2: [Description and attributes]
- Entity 3: [Description and attributes]
- Relationships:
  - Entity 1 → Entity 2: [Relationship type and description]
  - Entity 2 → Entity 3: [Relationship type and description]

### Component Identification
- Component 1: [Description and responsibilities]
- Component 2: [Description and responsibilities]
- Component 3: [Description and responsibilities]

### Interface Definitions
- Interface 1: [Description, methods, parameters]
- Interface 2: [Description, methods, parameters]
- Interface 3: [Description, methods, parameters]

### Information Flow
- Flow 1: [Description of information exchange]
- Flow 2: [Description of information exchange]
- Flow 3: [Description of information exchange]
```

### Non-Functional Requirements Analysis

```mermaid
flowchart LR
    classDef req fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef arch fill:#a8d5ff,stroke:#88b5e0,color:#000

    NFR[Non-Functional<br>Requirements] --> PERF[Performance<br>Requirements]
    NFR --> SEC[Security<br>Requirements]
    NFR --> SCAL[Scalability<br>Requirements]
    NFR --> AVAIL[Availability<br>Requirements]
    NFR --> MAINT[Maintainability<br>Requirements]

    PERF & SEC & SCAL & AVAIL & MAINT --> ARCH[Architectural<br>Decisions]

    class NFR,PERF,SEC,SCAL,AVAIL,MAINT req
    class ARCH arch
```

**Template for Non-Functional Requirements Analysis:**

```markdown
## Non-Functional Requirements Analysis

### Performance Requirements
- Response Time: [Requirements]
- Throughput: [Requirements]
- Resource Utilization: [Requirements]
- Architectural Implications: [Implications for architecture]

### Security Requirements
- Authentication: [Requirements]
- Authorization: [Requirements]
- Data Protection: [Requirements]
- Audit/Logging: [Requirements]
- Architectural Implications: [Implications for architecture]

### Scalability Requirements
- User Scalability: [Requirements]
- Data Scalability: [Requirements]
- Transaction Scalability: [Requirements]
- Architectural Implications: [Implications for architecture]

### Availability Requirements
- Uptime Requirements: [Requirements]
- Fault Tolerance: [Requirements]
- Disaster Recovery: [Requirements]
- Architectural Implications: [Implications for architecture]

### Maintainability Requirements
- Modularity: [Requirements]
- Extensibility: [Requirements]
- Testability: [Requirements]
- Architectural Implications: [Implications for architecture]
```

## 📋 BUSINESS CONTEXT DOCUMENTATION

Document the business context to ensure architectural alignment:

```markdown
## Business Context Documentation

### Business Objectives
- Objective 1: [Description]
- Objective 2: [Description]
- Objective 3: [Description]

### Key Stakeholders
- Stakeholder Group 1: [Description, needs, and concerns]
- Stakeholder Group 2: [Description, needs, and concerns]
- Stakeholder Group 3: [Description, needs, and concerns]

### Business Processes
- Process 1: [Description and flow]
- Process 2: [Description and flow]
- Process 3: [Description and flow]

### Business Constraints
- Constraint 1: [Description and impact]
- Constraint 2: [Description and impact]
- Constraint 3: [Description and impact]

### Business Metrics
- Metric 1: [Description and target]
- Metric 2: [Description and target]
- Metric 3: [Description and target]

### Business Risks
- Risk 1: [Description, probability, impact, and mitigation]
- Risk 2: [Description, probability, impact, and mitigation]
- Risk 3: [Description, probability, impact, and mitigation]
```

## 📋 ARCHITECTURAL VISION AND GOALS

Document the architectural vision and goals:

```markdown
## Architectural Vision and Goals

### Vision Statement
[Concise statement of the architectural vision]

### Strategic Goals
- Goal 1: [Description and success criteria]
- Goal 2: [Description and success criteria]
- Goal 3: [Description and success criteria]

### Quality Attributes
- Quality Attribute 1: [Description and importance]
- Quality Attribute 2: [Description and importance]
- Quality Attribute 3: [Description and importance]

### Technical Roadmap
- Short-term (0-6 months): [Key architectural milestones]
- Medium-term (6-18 months): [Key architectural milestones]
- Long-term (18+ months): [Key architectural milestones]

### Key Success Indicators
- Indicator 1: [Description and measurement]
- Indicator 2: [Description and measurement]
- Indicator 3: [Description and measurement]
```

## 📋 ARCHITECTURAL PRINCIPLES

Document architectural principles to guide decision-making:

```markdown
## Architectural Principles

### Principle 1: [Name]
- **Statement**: [Concise statement of the principle]
- **Rationale**: [Why this principle is important]
- **Implications**: [What this principle means for the architecture]
- **Examples**: [Examples of applying this principle]

### Principle 2: [Name]
- **Statement**: [Concise statement of the principle]
- **Rationale**: [Why this principle is important]
- **Implications**: [What this principle means for the architecture]
- **Examples**: [Examples of applying this principle]

### Principle 3: [Name]
- **Statement**: [Concise statement of the principle]
- **Rationale**: [Why this principle is important]
- **Implications**: [What this principle means for the architecture]
- **Examples**: [Examples of applying this principle]

...
```

## 📋 CONSTRAINTS IDENTIFICATION

Document constraints that impact architectural decisions:

```markdown
## Architectural Constraints

### Technical Constraints
- Constraint 1: [Description and impact]
- Constraint 2: [Description and impact]
- Constraint 3: [Description and impact]

### Organizational Constraints
- Constraint 1: [Description and impact]
- Constraint 2: [Description and impact]
- Constraint 3: [Description and impact]

### External Constraints
- Constraint 1: [Description and impact]
- Constraint 2: [Description and impact]
- Constraint 3: [Description and impact]

### Regulatory/Compliance Constraints
- Constraint 1: [Description and impact]
- Constraint 2: [Description and impact]
- Constraint 3: [Description and impact]

### Resource Constraints
- Constraint 1: [Description and impact]
- Constraint 2: [Description and impact]
- Constraint 3: [Description and impact]
```

## 📋 ARCHITECTURAL ALTERNATIVES EXPLORATION

Document and evaluate architectural alternatives:

```markdown
## Architectural Alternatives

### Alternative 1: [Name]
- **Description**: [Brief description of the alternative]
- **Key Components**:
  - Component 1: [Description]
  - Component 2: [Description]
  - Component 3: [Description]
- **Advantages**:
  - [Advantage 1]
  - [Advantage 2]
  - [Advantage 3]
- **Disadvantages**:
  - [Disadvantage 1]
  - [Disadvantage 2]
  - [Disadvantage 3]
- **Risks**:
  - [Risk 1]
  - [Risk 2]
  - [Risk 3]
- **Cost Factors**:
  - [Cost Factor 1]
  - [Cost Factor 2]
  - [Cost Factor 3]
- **Alignment with Requirements**:
  - [How well this alternative addresses requirements]

### Alternative 2: [Name]
...

### Alternative 3: [Name]
...

## Evaluation Criteria
- Criterion 1: [Description and weighting]
- Criterion 2: [Description and weighting]
- Criterion 3: [Description and weighting]

## Evaluation Matrix
| Criterion | Alternative 1 | Alternative 2 | Alternative 3 |
|-----------|---------------|---------------|---------------|
| Criterion 1 | Score | Score | Score |
| Criterion 2 | Score | Score | Score |
| Criterion 3 | Score | Score | Score |
| Total | Sum | Sum | Sum |

## Recommended Approach
[Description of the recommended architectural approach with justification]
```

## 📋 ARCHITECTURE DECISION RECORDS (ADRs)

Document key architectural decisions:

```markdown
# Architecture Decision Record: [Decision Title]

## Status
[Proposed/Accepted/Deprecated/Superseded]

## Context
[Description of the context and problem statement]

## Decision
[Description of the decision made]

## Consequences
[Description of the consequences of the decision]

## Alternatives Considered
[Description of alternatives considered]

## Related Decisions
[References to related decisions]

## Notes
[Additional notes and considerations]
```

## 📋 COMPREHENSIVE ARCHITECTURE DOCUMENTATION

Create comprehensive architecture documentation:

### System Context Diagram

```mermaid
flowchart TD
    classDef system fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef external fill:#a8d5ff,stroke:#88b5e0,color:#000
    classDef user fill:#c5e8b7,stroke:#a5c897,color:#000

    U1[User 1] --> S[System]
    U2[User 2] --> S
    S --> E1[External<br>System 1]
    S --> E2[External<br>System 2]
    S --> E3[External<br>System 3]

    class S system
    class E1,E2,E3 external
    class U1,U2 user
```

### High-Level Architecture Diagram

```mermaid
flowchart TD
    classDef frontend fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef backend fill:#a8d5ff,stroke:#88b5e0,color:#000
    classDef data fill:#c5e8b7,stroke:#a5c897,color:#000
    classDef integration fill:#f4b8c4,stroke:#d498a4,color:#000

    U[Users] --> F[Frontend<br>Layer]
    F --> B[Backend<br>Layer]
    B --> D[Data<br>Layer]
    B --> I[Integration<br>Layer]
    I --> E[External<br>Systems]

    class F frontend
    class B backend
    class D data
    class I integration
    class U,E external
```

### Component Architecture Diagram

```mermaid
flowchart TD
    classDef ui fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef service fill:#a8d5ff,stroke:#88b5e0,color:#000
    classDef data fill:#c5e8b7,stroke:#a5c897,color:#000

    UI[User Interface] --> API[API Gateway]
    API --> S1[Service 1]
    API --> S2[Service 2]
    API --> S3[Service 3]
    S1 --> DB1[Database 1]
    S2 --> DB1
    S2 --> DB2[Database 2]
    S3 --> DB2

    class UI ui
    class API,S1,S2,S3 service
    class DB1,DB2 data
```

### Data Architecture Diagram

```mermaid
flowchart TD
    classDef entity fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef relation fill:#a8d5ff,stroke:#88b5e0,color:#000

    E1[Entity 1] -- 1:N --> E2[Entity 2]
    E1 -- 1:1 --> E3[Entity 3]
    E2 -- N:M --> E4[Entity 4]
    E3 -- 1:N --> E4

    class E1,E2,E3,E4 entity
```

### Security Architecture Diagram

```mermaid
flowchart TD
    classDef security fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef app fill:#a8d5ff,stroke:#88b5e0,color:#000

    U[Users] --> WAF[Web Application<br>Firewall]
    WAF --> LB[Load<br>Balancer]
    LB --> API[API Gateway]
    API --> AuthZ[Authorization<br>Service]
    API --> S1[Service 1]
    API --> S2[Service 2]
    AuthZ --> IAM[Identity &<br>Access Management]

    class WAF,AuthZ,IAM security
    class API,S1,S2 app
    class U,LB external
```

### Deployment Architecture Diagram

```mermaid
flowchart TD
    classDef env fill:#f9d77e,stroke:#d9b95c,color:#000
    classDef component fill:#a8d5ff,stroke:#88b5e0,color:#000

    subgraph Production
    LB[Load Balancer] --> W1[Web Server 1]
    LB --> W2[Web Server 2]
    W1 & W2 --> A1[App Server 1]
    W1 & W2 --> A2[App Server 2]
    A1 & A2 --> DB[Database<br>Cluster]
    end

    class Production env
    class LB,W1,W2,A1,A2,DB component
```

### Architecture Documentation Template

```markdown
# System Architecture Document

## 1. Introduction
- **Purpose**: [Purpose of the architecture]
- **Scope**: [Scope of the architecture]
- **Audience**: [Intended audience for the document]
- **References**: [Related documents and references]

## 2. System Context
- **System Purpose**: [Brief description of system purpose]
- **Context Diagram**: [System context diagram]
- **External Systems**: [Description of external systems and interfaces]
- **User Types**: [Description of user types and interactions]

## 3. Architecture Overview
- **Architecture Style**: [Description of the architectural style/pattern]
- **High-Level Architecture**: [High-level architecture diagram]
- **Key Components**: [Overview of key components]
- **Technology Stack**: [Overview of technology stack]

## 4. Component Architecture
- **Component Diagram**: [Component architecture diagram]
- **Component Descriptions**:
  - Component 1: [Description, responsibilities, interfaces]
  - Component 2: [Description, responsibilities, interfaces]
  - Component 3: [Description, responsibilities, interfaces]
- **Component Interactions**: [Description of component interactions]
- **API Specifications**: [Overview of key APIs]

## 5. Data Architecture
- **Data Model**: [Data architecture diagram]
- **Entity Descriptions**:
  - Entity 1: [Description, attributes, relationships]
  - Entity 2: [Description, attributes, relationships]
  - Entity 3: [Description, attributes, relationships]
- **Data Storage**: [Description of data storage approaches]
- **Data Access**: [Description of data access patterns]
- **Data Migration**: [Overview of data migration approach]

## 6. Security Architecture
- **Security Model**: [Security architecture diagram]
- **Authentication**: [Authentication approach]
- **Authorization**: [Authorization approach]
- **Data Protection**: [Data protection mechanisms]
- **Security Controls**: [Key security controls]
- **Audit and Logging**: [Audit and logging approach]

## 7. Deployment Architecture
- **Deployment Model**: [Deployment architecture diagram]
- **Environment Descriptions**:
  - Environment 1: [Description and configuration]
  - Environment 2: [Description and configuration]
  - Environment 3: [Description and configuration]
- **Infrastructure Requirements**: [Infrastructure requirements]
- **Scaling Approach**: [Scaling approach]

## 8. Quality Attributes
- **Performance**: [Performance characteristics and mechanisms]
- **Scalability**: [Scalability approach]
- **Availability**: [Availability approach]
- **Maintainability**: [Maintainability approach]
- **Reliability**: [Reliability approach]
- **Portability**: [Portability considerations]

## 9. Cross-Cutting Concerns
- **Logging**: [Logging approach]
- **Error Handling**: [Error handling approach]
- **Monitoring**: [Monitoring approach]
- **Configuration Management**: [Configuration management approach]
- **Internationalization**: [Internationalization approach]

## 10. Architecture Decisions
- [References to Architecture Decision Records]

## 11. Risks and Mitigations
- Risk 1: [Description and mitigation]
- Risk 2: [Description and mitigation]
- Risk 3: [Description and mitigation]

## 12. Glossary
- Term 1: [Definition]
- Term 2: [Definition]
- Term 3: [Definition]
```

## 📋 ARCHITECTURE VALIDATION

Validate architecture against requirements and principles:

```markdown
## Architecture Validation

### Requirements Coverage
- Requirement 1: [Covered/Partially Covered/Not Covered] - [Explanation]
- Requirement 2: [Covered/Partially Covered/Not Covered] - [Explanation]
- Requirement 3: [Covered/Partially Covered/Not Covered] - [Explanation]

### Principles Alignment
- Principle 1: [Aligned/Partially Aligned/Not Aligned] - [Explanation]
- Principle 2: [Aligned/Partially Aligned/Not Aligned] - [Explanation]
- Principle 3: [Aligned/Partially Aligned/Not Aligned] - [Explanation]

### Quality Attribute Scenarios
- Scenario 1: [Description and validation]
- Scenario 2: [Description and validation]
- Scenario 3: [Description and validation]

### Architecture Review Findings
- Finding 1: [Description and resolution]
- Finding 2: [Description and resolution]
- Finding 3: [Description and resolution]

### Risk Assessment
- Risk 1: [Description, probability, impact, and mitigation]
- Risk 2: [Description, probability, impact, and mitigation]
- Risk 3: [Description, probability, impact, and mitigation]

### Validation Outcome
[Summary of validation outcome and next steps]
```

## 📋 ARCHITECTURE COMMUNICATION

Communicate architecture to stakeholders:

```markdown
## Architecture Communication Plan

### Key Stakeholders
- Stakeholder Group 1: [Communication needs]
- Stakeholder Group 2: [Communication needs]
- Stakeholder Group 3: [Communication needs]

### Communication Materials
- **Executive Summary**: [Purpose and audience]
- **Technical Reference**: [Purpose and audience]
- **Developer Guide**: [Purpose and audience]
- **Operations Guide**: [Purpose and audience]

### Communication Schedule
- Event 1: [Date, audience, purpose]
- Event 2: [Date, audience, purpose]
- Event 3: [Date, audience, purpose]

### Feedback Mechanism
[Description of how feedback will be collected and incorporated]
```

## 📋 MEMORY BANK INTEGRATION

```mermaid
flowchart TD
    classDef memfile fill:#f4b8c4,stroke:#d498a4,color:#000
    classDef process fill:#f9d77e,stroke:#d9b95c,color:#000

    Architecture[Architectural<br>Planning] --> PB[projectbrief.md]
    Architecture --> PC[productContext.md]
    Architecture --> SP[systemPatterns.md]
    Architecture --> TC[techContext.md]

    PB & PC & SP & TC --> MBI[Memory Bank<br>Integration]
    MBI --> Next[Implementation<br>Phase]

    class PB,PC,SP,TC memfile
    class Architecture,MBI,Next process
```

### Memory Bank Updates

Update the following Memory Bank files during architectural planning:

1. **projectbrief.md**
   - Update with architectural vision
   - Document high-level architecture approach
   - Link to architecture documentation

2. **productContext.md**
   - Update with business context documentation
   - Document key stakeholder requirements
   - Capture business drivers for architectural decisions

3. **systemPatterns.md**
   - Document architectural patterns and styles chosen
   - Capture key architecture decisions with rationales
   - Document technical patterns to be used

4. **techContext.md**
   - Update with technology stack decisions
   - Document technical constraints and considerations
   - Capture integration approaches

## 📋 ARCHITECTURAL PLANNING VERIFICATION CHECKLIST

```
✓ ARCHITECTURAL PLANNING VERIFICATION CHECKLIST

Requirements Analysis
- Functional requirements analyzed? [YES/NO]
- Non-functional requirements analyzed? [YES/NO]
- Domain model created? [YES/NO]
- Component identification completed? [YES/NO]

Business Context
- Business objectives documented? [YES/NO]
- Key stakeholders identified? [YES/NO]
- Business processes documented? [YES/NO]
- Business constraints identified? [YES/NO]

Vision and Goals
- Architectural vision stated? [YES/NO]
- Strategic goals defined? [YES/NO]
- Quality attributes identified? [YES/NO]
- Technical roadmap created? [YES/NO]

Architectural Principles
- Core principles defined? [YES/NO]
- Principles have clear rationales? [YES/NO]
- Implications of principles documented? [YES/NO]
- Examples of applying principles provided? [YES/NO]

Constraints Identification
- Technical constraints documented? [YES/NO]
- Organizational constraints documented? [YES/NO]
- External constraints documented? [YES/NO]
- Regulatory constraints documented? [YES/NO]

Alternatives Exploration
- Multiple alternatives identified? [YES/NO]
- Alternatives evaluated against criteria? [YES/NO]
- Advantages and disadvantages documented? [YES/NO]
- Recommended approach justified? [YES/NO]

Architecture Documentation
- System context documented? [YES/NO]
- High-level architecture documented? [YES/NO]
- Component architecture documented? [YES/NO]
- Data architecture documented? [YES/NO]
- Security architecture documented? [YES/NO]
- Deployment architecture documented? [YES/NO]

Architecture Validation
- Requirements coverage validated? [YES/NO]
- Principles alignment checked? [YES/NO]
- Quality attribute scenarios assessed? [YES/NO]
- Architecture review conducted? [YES/NO]

Memory Bank Integration
- projectbrief.md updated? [YES/NO]
- productContext.md updated? [YES/NO]
- systemPatterns.md updated? [YES/NO]
- techContext.md updated? [YES/NO]
```

## 📋 MINIMAL MODE ARCHITECTURE PLANNING FORMAT

For situations requiring a more compact architectural planning approach:

```markdown
## Level 4 Architecture Planning: [System Name]

### System Context
- **Purpose**: [Brief description of system purpose]
- **Users**: [Primary users]
- **External Systems**: [Key external systems]

### Key Architectural Decisions
- **Architecture Style**: [Chosen style with brief rationale]
- **Component Structure**: [Key components with brief descriptions]
- **Data Model**: [Brief description of data approach]
- **Technical Stack**: [Key technologies]

### Quality Attributes
- **Performance**: [Brief description of approach]
- **Security**: [Brief description of approach]
- **Scalability**: [Brief description of approach]
- **Maintainability**: [Brief description of approach]

### Architecture Diagram
[Simple architecture diagram]

### Key Risks and Mitigations
- **Risk 1**: [Brief description] - **Mitigation**: [Brief approach]
- **Risk 2**: [Brief description] - **Mitigation**: [Brief approach]

### Memory Bank Updates
- [Brief description of updates needed]
```

## 🚨 ARCHITECTURAL PLANNING ENFORCEMENT PRINCIPLE

```
┌─────────────────────────────────────────────────────┐
│ ARCHITECTURAL PLANNING IS MANDATORY for Level 4      │
│ tasks. Implementation CANNOT begin until             │
│ architectural planning is complete and approved.     │
└─────────────────────────────────────────────────────┘
```