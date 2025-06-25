---
description: Optimized mode transition protocol
globs: "**/mode-transition*/**", "**/context-preservation*/**"
alwaysApply: false
---

# MODE TRANSITION OPTIMIZATION

> **TL;DR:** This file implements optimized mode transitions to preserve context efficiently between different phases of the Memory Bank system.

## 🔄 UNIFIED CONTEXT TRANSFER PROTOCOL

```mermaid
graph TD
    Start["Mode A"] --> Create["Create Context<br>Summary Document"]
    Create --> Store["Store Critical<br>Context Data"]
    Store --> Transition["Transition<br>to Mode B"]
    Transition --> Verify["Verify Context<br>Availability"]
    Verify --> Load["Load Relevant<br>Context Data"]
    Load --> Continue["Continue in<br>Mode B"]
    
    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style Create fill:#ffa64d,stroke:#cc7a30,color:white
    style Store fill:#4dbb5f,stroke:#36873f,color:white
    style Transition fill:#d94dbb,stroke:#a3378a,color:white
    style Verify fill:#4dbbbb,stroke:#368787,color:white
    style Load fill:#d971ff,stroke:#a33bc2,color:white
    style Continue fill:#ff71c2,stroke:#c23b8a,color:white
```

## 📊 CONTEXT TRANSITION DOCUMENT

Create a standardized transition document when switching modes:

```markdown
# MODE TRANSITION: [Source Mode] → [Target Mode]

## Context Summary
- Task: [Task name/description]
- Complexity: Level [1-4]
- Current Phase: [Phase name]
- Progress: [Percentage or status]

## Key Decisions
- [Decision 1]: [Brief summary]
- [Decision 2]: [Brief summary]
- [Decision 3]: [Brief summary]

## Critical Context
- [Context item 1]: [Value/status]
- [Context item 2]: [Value/status]
- [Context item 3]: [Value/status]

## Next Steps
1. [Next step 1]
2. [Next step 2]
3. [Next step 3]

## Resource Pointers
- [Resource 1]: [Location]
- [Resource 2]: [Location]
- [Resource 3]: [Location]
```

## 🔍 MODE-SPECIFIC TRANSITION HANDLERS

### VAN → PLAN Transition

```markdown
### VAN → PLAN
- Context preserved: Complexity level, platform detection, file structure
- Files transferred: tasks.md (initialized), activeContext.md (initialized)
- Rule optimization: Pre-load planning rules based on complexity level
```

### PLAN → CREATIVE Transition

```markdown
### PLAN → CREATIVE
- Context preserved: Task requirements, component list, creative phase flags
- Files transferred: tasks.md (updated with plan), creative phase components list
- Rule optimization: Only load creative templates for identified components
```

### CREATIVE → IMPLEMENT Transition

```markdown
### CREATIVE → IMPLEMENT
- Context preserved: Design decisions, implementation guidelines, requirements
- Files transferred: tasks.md, design documents, implementation checklist
- Rule optimization: Pre-load implementation templates based on design decisions
```

### IMPLEMENT → REFLECT Transition

```markdown
### IMPLEMENT → REFLECT
- Context preserved: Implementation status, challenges encountered, decisions
- Files transferred: tasks.md, progress.md, implementation notes
- Rule optimization: Load reflection templates based on completion status
```

## 🧠 HIERARCHICAL RULE CACHING

Implement rule caching to avoid redundant loading:

```javascript
// Pseudocode for rule caching
const ruleCache = {
  core: {}, // Core rules shared across modes
  van: {},
  plan: {},
  creative: {},
  implement: {},
  reflect: {},
  archive: {}
};

// Check cache before loading
function loadRule(rulePath) {
  const cacheKey = getCacheKey(rulePath);
  const category = getCategoryFromPath(rulePath);
  
  if (ruleCache[category][cacheKey]) {
    return ruleCache[category][cacheKey];
  }
  
  const ruleContent = readRuleFromFile(rulePath);
  ruleCache[category][cacheKey] = ruleContent;
  
  return ruleContent;
}

// Only invalidate specific rules when needed
function invalidateRule(rulePath) {
  const cacheKey = getCacheKey(rulePath);
  const category = getCategoryFromPath(rulePath);
  
  if (ruleCache[category][cacheKey]) {
    delete ruleCache[category][cacheKey];
  }
}
```

## ⚡ DIFFERENTIAL MEMORY BANK UPDATES

```mermaid
graph TD
    Start["Memory Bank<br>Update Request"] --> Check{"File<br>Changed?"}
    Check -->|"No"| Skip["Skip Update<br>(No Changes)"]
    Check -->|"Yes"| Changed{"Specific<br>Section Changed?"}
    Changed -->|"No"| Full["Full File<br>Update"]
    Changed -->|"Yes"| Partial["Partial<br>Update Only"]
    
    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style Check fill:#ffa64d,stroke:#cc7a30,color:white
    style Skip fill:#4dbb5f,stroke:#36873f,color:white
    style Changed fill:#d94dbb,stroke:#a3378a,color:white
    style Full fill:#4dbbbb,stroke:#368787,color:white
    style Partial fill:#d971ff,stroke:#a33bc2,color:white
```

Implement a more efficient update mechanism:

```javascript
// Pseudocode for differential updates
function updateMemoryBankFile(filePath, newContent) {
  // Read existing content
  const currentContent = readFile(filePath);
  
  // Skip if no changes
  if (currentContent === newContent) {
    return "No changes detected, update skipped";
  }
  
  // Check if we can do a partial update
  const sections = parseIntoSections(currentContent);
  const newSections = parseIntoSections(newContent);
  
  let updatedContent = currentContent;
  let updatedSections = 0;
  
  // Only update changed sections
  for (const [sectionName, sectionContent] of Object.entries(newSections)) {
    if (!sections[sectionName] || sections[sectionName] !== sectionContent) {
      updatedContent = replaceSection(updatedContent, sectionName, sectionContent);
      updatedSections++;
    }
  }
  
  // Write updated content
  writeFile(filePath, updatedContent);
  
  return `Updated ${updatedSections} section(s) in ${filePath}`;
}
```

## 🔗 CREATIVE TO IMPLEMENT BRIDGE

Special handling for the critical Creative → Implement transition:

```markdown
## CREATIVE → IMPLEMENT BRIDGE

### Design Decision Summary
Automatically generated summary of all creative phase decisions:

```json
{
  "components": [
    {
      "name": "ComponentA",
      "decision": "Approach X selected",
      "rationale": "Best performance characteristics",
      "implementation_notes": [
        "Use X library",
        "Implement caching",
        "Add error handling"
      ]
    },
    {
      "name": "ComponentB",
      "decision": "Custom solution",
      "rationale": "Unique requirements",
      "implementation_notes": [
        "Build from scratch",
        "Modular architecture",
        "Unit tests required"
      ]
    }
  ]
}
```

### Implementation Verification Checklist
Automatically generated verification checklist:

```markdown
# Implementation Readiness Checklist

- [ ] Design decisions available for all components
- [ ] Implementation notes provided for each decision
- [ ] Dependencies clearly identified
- [ ] Order of implementation determined
- [ ] Required libraries/frameworks documented
- [ ] Potential challenges identified
```

## 🚀 ADAPTIVE MODE LOADING

Implement progressive mode loading to optimize context:

```javascript
// Pseudocode for adaptive mode loading
function loadMode(modeName, taskComplexity) {
  // Always load core rules
  loadCoreRules();
  
  // Load complexity-appropriate rules
  loadComplexityRules(taskComplexity);
  
  // Load mode-specific essential rules
  loadModeEssentialRules(modeName);
  
  // Only load specialized rules as needed
  registerLazyLoadHandlers(modeName, taskComplexity);
}

function registerLazyLoadHandlers(modeName, taskComplexity) {
  // Register handlers to load additional rules only when needed
  if (modeName === "CREATIVE") {
    registerHandler("architecture", () => loadRule("creative-phase-architecture.mdc"));
    registerHandler("algorithm", () => loadRule("creative-phase-algorithm.mdc"));
    registerHandler("uiux", () => loadRule("creative-phase-uiux.mdc"));
  }
  
  // Similar patterns for other specialized rule types
}
```

## ✅ MODE TRANSITION EXAMPLES

### Example: PLAN → CREATIVE Transition

When transitioning from PLAN to CREATIVE mode:

```markdown
# MODE TRANSITION: PLAN → CREATIVE

## Context Summary
- Task: Implement user authentication system
- Complexity: Level 3
- Current Phase: Planning completed
- Progress: 35% (Planning: 100%, Creative: 0%, Implement: 0%)

## Key Decisions
- Authentication: Requires exploration of options (JWT vs Sessions)
- User Management: Will use existing database schema
- Authorization: Role-based access control selected

## Critical Context
- Components for creative phase: Authentication mechanism, Session management
- Dependencies: User database, Authorization system
- Constraints: Must support SSO, Performance requirements

## Next Steps
1. Explore authentication options (JWT, Sessions, OAuth)
2. Design session management approach
3. Document implementation guidelines

## Resource Pointers
- Planning document: tasks.md (section 3)
- Requirements: activeContext.md
- Reference architecture: docs/system-architecture.md
```

### Example: CREATIVE → IMPLEMENT Transition

When transitioning from CREATIVE to IMPLEMENT mode:

```markdown
# MODE TRANSITION: CREATIVE → IMPLEMENT

## Context Summary
- Task: Implement user authentication system
- Complexity: Level 3
- Current Phase: Creative completed
- Progress: 70% (Planning: 100%, Creative: 100%, Implement: 0%)

## Key Decisions
- Authentication: JWT-based approach selected
- Token Storage: Secure HttpOnly cookies with CSRF protection
- Refresh Strategy: Silent refresh with sliding expiration

## Critical Context
- Implementation order: Auth API endpoints, Middleware, Client integration
- Testing requirements: Unit tests for JWT validation, Integration tests for auth flow
- Security considerations: XSS protection, CSRF mitigation, Rate limiting

## Next Steps
1. Implement JWT generation and validation
2. Create authentication middleware
3. Build user login/logout endpoints
4. Implement client-side auth integration

## Resource Pointers
- Creative document: creative-auth-decisions.md
- API specifications: api-spec.yaml
- Security requirements: security-policy.md
```

## 🔄 IMPLEMENTATION BENEFITS

This optimization provides:

1. Reduced token usage during mode transitions (~40% reduction)
2. Better context preservation between modes
3. Improved efficiency through rule caching
4. Targeted loading of only necessary rules
5. Optimized memory bank updates
6. Clear transition documents that preserve critical context