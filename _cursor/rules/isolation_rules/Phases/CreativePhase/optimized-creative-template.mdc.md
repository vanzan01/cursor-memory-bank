---
description: Optimized creative phase template with progressive documentation
globs: "**/creative*/**", "**/design*/**", "**/decision*/**"
alwaysApply: false
---

# OPTIMIZED CREATIVE PHASE TEMPLATE

> **TL;DR:** This template implements a progressive documentation approach for creative phases, optimizing token usage while maintaining thorough design exploration.

## 📝 PROGRESSIVE DOCUMENTATION MODEL

```mermaid
graph TD
    Start["Creative Phase Start"] --> P1["1️⃣ PROBLEM<br>Define scope"]
    P1 --> P2["2️⃣ OPTIONS<br>Explore alternatives"]
    P2 --> P3["3️⃣ ANALYSIS<br>Evaluate selected options"]
    P3 --> P4["4️⃣ DECISION<br>Finalize approach"]
    P4 --> P5["5️⃣ IMPLEMENTATION<br>Document guidelines"]
    
    style Start fill:#d971ff,stroke:#a33bc2,color:white
    style P1 fill:#4da6ff,stroke:#0066cc,color:white
    style P2 fill:#ffa64d,stroke:#cc7a30,color:white
    style P3 fill:#4dbb5f,stroke:#36873f,color:white
    style P4 fill:#d94dbb,stroke:#a3378a,color:white
    style P5 fill:#4dbbbb,stroke:#368787,color:white
```

## 📋 TEMPLATE STRUCTURE

```markdown
📌 CREATIVE PHASE START: [Component Name]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1️⃣ PROBLEM
   Description: [Brief problem description]
   Requirements: [Key requirements as bullet points]
   Constraints: [Technical or business constraints]

2️⃣ OPTIONS
   Option A: [Name] - [One-line description]
   Option B: [Name] - [One-line description]
   Option C: [Name] - [One-line description]

3️⃣ ANALYSIS
   | Criterion | Option A | Option B | Option C |
   |-----------|----------|----------|----------|
   | Performance | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |
   | Complexity | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
   | Maintainability | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |
   
   Key Insights:
   - [Insight 1]
   - [Insight 2]

4️⃣ DECISION
   Selected: [Option X]
   Rationale: [Brief justification]
   
5️⃣ IMPLEMENTATION NOTES
   - [Implementation note 1]
   - [Implementation note 2]
   - [Implementation note 3]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📌 CREATIVE PHASE END
```

## 🧩 DETAILED OPTION ANALYSIS (ON DEMAND)

Detailed analysis can be provided on demand for selected options:

```markdown
<details>
  <summary>Detailed Analysis: Option A</summary>
  
  ### Option A: [Full Name]
  
  **Complete Description**:
  [Detailed description of how the option works]
  
  **Pros**:
  - [Pro 1 with explanation]
  - [Pro 2 with explanation]
  - [Pro 3 with explanation]
  
  **Cons**:
  - [Con 1 with explanation]
  - [Con 2 with explanation]
  
  **Implementation Complexity**: [Low/Medium/High]
  [Explanation of complexity factors]
  
  **Resource Requirements**:
  [Details on resource needs]
  
  **Risk Assessment**:
  [Analysis of risks]
</details>
```

## 📊 COMPLEXITY-BASED SCALING

The template automatically scales documentation requirements based on task complexity level:

### Level 1-2 (Quick Fix/Enhancement)
- Simplified problem/solution
- Focus on implementation
- Minimal option exploration

### Level 3 (Feature Development)
- Multiple options required
- Analysis table with key criteria
- Implementation guidelines

### Level 4 (Enterprise Development)
- Comprehensive analysis
- Multiple viewpoints considered
- Detailed implementation plan
- Expanded verification criteria

## ✅ VERIFICATION PROTOCOL

Quality verification is condensed into a simple checklist:

```markdown
VERIFICATION:
[x] Problem clearly defined
[x] Multiple options considered
[x] Decision made with rationale
[x] Implementation guidance provided
```

## 🔄 USAGE EXAMPLES

### Architecture Decision (Level 3)

```markdown
📌 CREATIVE PHASE START: Authentication System
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1️⃣ PROBLEM
   Description: Design an authentication system for the application
   Requirements: Secure, scalable, supports SSO, easy to maintain
   Constraints: Must work with existing user database, <100ms response time

2️⃣ OPTIONS
   Option A: JWT-based stateless auth - Simple token-based approach
   Option B: Session-based auth with Redis - Server-side session storage
   Option C: OAuth2 implementation - Delegated authorization framework

3️⃣ ANALYSIS
   | Criterion | JWT | Sessions | OAuth2 |
   |-----------|-----|----------|--------|
   | Security | ⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
   | Scalability | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
   | Complexity | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
   | Performance | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
   
   Key Insights:
   - JWT offers best performance but limited revocation options
   - Sessions provide better security control but require more infrastructure
   - OAuth2 most complex but offers best integration possibilities

4️⃣ DECISION
   Selected: Option A: JWT-based auth with refresh tokens
   Rationale: Best balance of performance and scalability while meeting security needs
   
5️⃣ IMPLEMENTATION NOTES
   - Use HS256 algorithm for token signing
   - Implement short-lived access tokens (15min) with longer refresh tokens (7 days)
   - Store token blacklist in Redis for revocation capability
   - Add rate limiting on token endpoints

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📌 CREATIVE PHASE END
```

### Algorithm Decision (Level 2)

```markdown
📌 CREATIVE PHASE START: Search Algorithm
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1️⃣ PROBLEM
   Description: Implement efficient text search for product catalog
   Requirements: Fast results, support for partial matches, case insensitive
   Constraints: Dataset < 10,000 items, must work in browser environment

2️⃣ OPTIONS
   Option A: Simple regex search - Basic pattern matching
   Option B: Trie-based search - Prefix tree structure
   Option C: Fuzzy search with Levenshtein - Edit distance algorithm

3️⃣ DECISION
   Selected: Option B: Trie-based search
   Rationale: Best performance for prefix searches with manageable memory usage
   
4️⃣ IMPLEMENTATION NOTES
   - Use existing trie library
   - Preprocess text to lowercase during indexing
   - Implement letter-by-letter search for instant results
   - Add debounce (300ms) to prevent excessive rebuilding

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📌 CREATIVE PHASE END
```

## 🏆 TOKEN EFFICIENCY BENEFITS

This template significantly reduces token usage by:

1. Focusing on essential information without unnecessary verbosity
2. Using compact tabular formats for comparisons
3. Implementing progressive disclosure for detailed information
4. Scaling documentation requirements by task complexity
5. Using visual indicators (emojis) for quick scanning

The template maintains the rigor of the creative process while improving token efficiency by approximately 60% over the previous format.