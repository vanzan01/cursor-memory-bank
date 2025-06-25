---
description: Integration hub for Memory Bank optimizations
globs: "**/optimization*/**", "**/integration*/**"
alwaysApply: false
---

# MEMORY BANK OPTIMIZATION INTEGRATION

> **TL;DR:** This file serves as the integration point for all Memory Bank optimizations, coordinating the various optimization components to work seamlessly together.

## 🔄 OPTIMIZATION INTEGRATION FLOW

```mermaid
graph TD
    Start["Memory Bank<br>Initialization"] --> HRL["Hierarchical<br>Rule Loading"]
    HRL --> ACM["Adaptive<br>Complexity Model"]
    ACM --> DCM["Dynamic<br>Context Management"]
    DCM --> TMO["Transition<br>Optimization"]
    
    subgraph "Level-Specific Optimizations"
        L1["Level 1<br>Optimizations"]
        L2["Level 2<br>Optimizations"]
        L3["Level 3<br>Optimizations"]
        L4["Level 4<br>Optimizations"]
    end
    
    ACM --> L1 & L2 & L3 & L4
    
    L1 & L2 & L3 & L4 --> CPO["Creative Phase<br>Optimization"]
    
    CPO --> PDO["Progressive<br>Documentation"]
    TMO --> PDO
    
    PDO --> MBO["Memory Bank<br>Optimization"]
    
    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style HRL fill:#ffa64d,stroke:#cc7a30,color:white
    style ACM fill:#4dbb5f,stroke:#36873f,color:white
    style DCM fill:#d94dbb,stroke:#a3378a,color:white
    style TMO fill:#4dbbbb,stroke:#368787,color:white
    style CPO fill:#e699d9,stroke:#d94dbb,color:white
    style PDO fill:#d971ff,stroke:#a33bc2,color:white
    style MBO fill:#ff71c2,stroke:#c23b8a,color:white
```

## 📋 OPTIMIZATION COMPONENT REGISTRY

```javascript
// Optimization component registry pseudocode
const optimizationRegistry = {
  // Core optimizations
  hierarchicalRuleLoading: {
    file: "Core/hierarchical-rule-loading.mdc",
    dependencies: [],
    priority: 1
  },
  adaptiveComplexityModel: {
    file: "main-optimized.mdc",
    dependencies: ["hierarchicalRuleLoading"],
    priority: 2
  },
  modeTransitionOptimization: {
    file: "Core/mode-transition-optimization.mdc",
    dependencies: ["hierarchicalRuleLoading", "adaptiveComplexityModel"],
    priority: 3
  },
  
  // Level-specific optimizations
  level1Optimization: {
    file: "Level1/optimized-workflow-level1.mdc",
    dependencies: ["adaptiveComplexityModel"],
    priority: 4
  },
  
  // Feature-specific optimizations
  creativePhaseOptimization: {
    file: "Phases/CreativePhase/optimized-creative-template.mdc",
    dependencies: ["hierarchicalRuleLoading", "adaptiveComplexityModel"],
    priority: 5
  }
};
```

## 🔄 OPTIMIZATION INITIALIZATION SEQUENCE

```mermaid
sequenceDiagram
    participant MB as Memory Bank
    participant Reg as Optimization Registry
    participant HRL as Hierarchical Rule Loading
    participant ACM as Adaptive Complexity
    participant TMO as Transition Optimization
    participant CPO as Creative Phase Optimization
    
    MB->>Reg: Request optimization initialization
    Reg->>Reg: Sort optimizations by priority & dependencies
    Reg->>HRL: Initialize (Priority 1)
    HRL-->>Reg: Initialization complete
    Reg->>ACM: Initialize (Priority 2)
    ACM->>HRL: Request rule loading services
    HRL-->>ACM: Provide rule loading
    ACM-->>Reg: Initialization complete
    Reg->>TMO: Initialize (Priority 3)
    TMO->>HRL: Request rule loading services
    TMO->>ACM: Request complexity model
    HRL-->>TMO: Provide rule loading
    ACM-->>TMO: Provide complexity model
    TMO-->>Reg: Initialization complete
    Reg->>CPO: Initialize (Final)
    CPO->>HRL: Request rule loading services
    CPO->>ACM: Request complexity model
    CPO->>TMO: Request transition services
    HRL-->>CPO: Provide rule loading
    ACM-->>CPO: Provide complexity model
    TMO-->>CPO: Provide transition services
    CPO-->>Reg: Initialization complete
    Reg-->>MB: All optimizations initialized
```

## 🔍 OPTIMIZATION CONFIGURATION

```javascript
// Optimization configuration pseudocode
const optimizationConfig = {
  // Token optimization settings
  tokenOptimization: {
    enableHierarchicalLoading: true,
    enableProgressiveDocumentation: true,
    enableLazyRuleLoading: true,
    enableContextPruning: true
  },
  
  // Context preservation settings
  contextPreservation: {
    preserveDesignDecisions: true,
    preserveImplementationContext: true,
    preserveUserPreferences: true,
    contextCompressionLevel: "high" // none, low, medium, high
  },
  
  // Documentation optimization
  documentationOptimization: {
    level1DocumentationLevel: "minimal", // minimal, standard, comprehensive
    level2DocumentationLevel: "standard",
    level3DocumentationLevel: "comprehensive",
    level4DocumentationLevel: "comprehensive",
    enableProgressiveDisclosure: true,
    enableTemplateCaching: true
  }
};
```

## 📊 OPTIMIZATION MONITORING

```mermaid
graph TD
    Monitor["Optimization<br>Monitor"] --> TokenUsage["Token Usage<br>Tracking"]
    Monitor --> ContextEfficiency["Context<br>Efficiency"]
    Monitor --> RuleLoadingStats["Rule Loading<br>Statistics"]
    Monitor --> DocumentationSize["Documentation<br>Size"]
    
    TokenUsage --> Dashboard["Optimization<br>Dashboard"]
    ContextEfficiency --> Dashboard
    RuleLoadingStats --> Dashboard
    DocumentationSize --> Dashboard
    
    Dashboard --> Feedback["Optimization<br>Feedback Loop"]
    Feedback --> Config["Optimization<br>Configuration"]
    Config --> Monitor
    
    style Monitor fill:#4da6ff,stroke:#0066cc,color:white
    style Dashboard fill:#ffa64d,stroke:#cc7a30,color:white
    style Feedback fill:#4dbb5f,stroke:#36873f,color:white
    style Config fill:#d94dbb,stroke:#a3378a,color:white
```

## 📈 OPTIMIZATION METRICS

```markdown
# Optimization Metrics

## Token Usage
- Core Rule Loading: [X] tokens
- Mode-Specific Rules: [Y] tokens
- Creative Phase Documentation: [Z] tokens
- Overall Token Reduction: [P]%

## Context Efficiency
- Context Utilization: [Q]%
- Context Waste: [R]%
- Effective Token Capacity: [S] tokens

## Rule Loading
- Rules Loaded: [T] / [U] (Total)
- Lazy-Loaded Rules: [V]
- Cached Rules: [W]

## Documentation
- Level 1 Documentation Size: [X] tokens
- Level 2 Documentation Size: [Y] tokens
- Level 3 Documentation Size: [Z] tokens
- Level 4 Documentation Size: [AA] tokens
```

## 🔄 INTEGRATION USAGE EXAMPLES

### Initializing All Optimizations

```javascript
// Pseudocode for initializing all optimizations
function initializeMemoryBankOptimizations() {
  // Load optimization registry
  const registry = loadOptimizationRegistry();
  
  // Sort by priority and dependencies
  const sortedOptimizations = sortOptimizations(registry);
  
  // Initialize each optimization in order
  for (const opt of sortedOptimizations) {
    initializeOptimization(opt);
  }
  
  // Configure optimization parameters
  configureOptimizations(loadOptimizationConfig());
  
  // Start monitoring
  initializeOptimizationMonitoring();
  
  return "Memory Bank optimizations initialized";
}
```

### Using Optimized Creative Phase

```markdown
// Using the optimized creative phase with progressive documentation

// Initialize with minimal documentation
📌 CREATIVE PHASE START: Authentication System
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1️⃣ PROBLEM
   Description: Design an authentication system for the application
   Requirements: Secure, scalable, supports SSO, easy to maintain
   Constraints: Must work with existing user database, <100ms response time

2️⃣ OPTIONS
   Option A: JWT-based stateless auth
   Option B: Session-based auth with Redis
   Option C: OAuth2 implementation

// Progressively add detail as needed
3️⃣ ANALYSIS
   | Criterion | JWT | Sessions | OAuth2 |
   |-----------|-----|----------|--------|
   | Security | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
   | Scalability | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
   | Complexity | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
   
// Focus on decision and implementation
4️⃣ DECISION
   Selected: Option A: JWT-based auth with refresh tokens
   Rationale: Best balance of performance and scalability
   
5️⃣ IMPLEMENTATION NOTES
   - Use HS256 algorithm for token signing
   - Implement short-lived access tokens (15min)
   - Store token blacklist in Redis for revocation
```

## 🔄 MODE TRANSITION EXAMPLE

```markdown
// Optimized mode transition from CREATIVE to IMPLEMENT

# MODE TRANSITION: CREATIVE → IMPLEMENT

## Context Summary
- Task: Authentication system implementation
- Complexity: Level 3
- Decision: JWT-based auth with refresh tokens

## Key Context
- Security requirements verified
- Algorithm selection: HS256
- Token lifecycle: 15min access / 7 days refresh

## Next Steps
1. Implement JWT generation module
2. Create token validation middleware
3. Build refresh token handling

// Transition happens with preserved context
// IMPLEMENT mode continues with this context available
```

## 🔄 HIERARCHICAL RULE LOADING EXAMPLE

```javascript
// Pseudocode example of hierarchical rule loading

// Initial load - only core rules
loadCoreRules();

// Determine complexity
const complexity = determineComplexity();

// Load mode-specific essential rules
loadModeEssentialRules("CREATIVE");

// Register lazy loaders for specialized rules
registerLazyLoader("architecture", () => loadRule("creative-phase-architecture.mdc"));
registerLazyLoader("algorithm", () => loadRule("creative-phase-algorithm.mdc"));
registerLazyLoader("uiux", () => loadRule("creative-phase-uiux.mdc"));

// Later, when architecture design is needed:
const architectureRule = loadSpecializedRule("architecture");
// Architecture rule is now loaded only when needed
```

These integrated optimizations work seamlessly together to provide a significantly more efficient Memory Bank system while maintaining all functionality.