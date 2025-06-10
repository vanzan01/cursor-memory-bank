---
description: "Creative archive integration for Memory Bank workflow modes"
globs: "**/creative/**", "**/workflow/**", "**/archive/**"
alwaysApply: false
---

# CREATIVE ARCHIVE INTEGRATION SYSTEM

> **TL;DR:** Seamless integration of creative phase archiving across all Memory Bank modes, ensuring comprehensive preservation of architectural decisions and design processes.

## 🔄 INTEGRATION OVERVIEW

The Creative Archive Integration System connects creative phase results with all Memory Bank modes, creating a continuous flow of architectural knowledge from creation to long-term preservation.

### Integration Architecture

```mermaid
graph TD
    Creative["🎨 CREATIVE MODE"] --> Capture["📸 Results Capture"]
    Capture --> Structure["🗂️ Archive Structure"]
    Structure --> Analysis["📊 Analysis Engine"]
    Analysis --> Integration["🔄 Mode Integration"]

    Integration --> VAN["🚀 VAN Mode<br>Decision Discovery"]
    Integration --> PLAN["📋 PLAN Mode<br>Pattern Reuse"]
    Integration --> IMPLEMENT["⚙️ IMPLEMENT Mode<br>Reference Access"]
    Integration --> REFLECT["🤔 REFLECT Mode<br>Quality Assessment"]
    Integration --> ARCHIVE["📚 ARCHIVE Mode<br>Long-term Storage"]

    VAN --> Search["🔍 Decision Search"]
    PLAN --> Patterns["📐 Pattern Library"]
    IMPLEMENT --> Reference["📖 Implementation Guide"]
    REFLECT --> Assessment["📈 Quality Metrics"]
    ARCHIVE --> Preservation["🏛️ Knowledge Preservation"]
```

## 🎨 CREATIVE MODE INTEGRATION

### Automatic Results Capture

**Real-time Archiving**
- Automatic saving of creative phase documents
- Metadata extraction from creative sessions
- Decision point identification and tagging
- Architectural diagram preservation

**Structured Documentation**
```yaml
creative_result:
  metadata:
    task_id: "TASK-ID-YYYY-MM-DD"
    phase_type: "architecture|algorithm|ui_ux|data_model"
    duration: "90 minutes"
    participants: ["architect", "developer", "stakeholder"]
    complexity_level: "Level 1-4"

  decisions:
    - decision_id: "ARCH-001"
      title: "Database Architecture Choice"
      description: "Selected PostgreSQL for ACID compliance"
      alternatives_considered: ["MongoDB", "MySQL", "SQLite"]
      rationale: "ACID compliance critical for financial data"
      impact_assessment: "High - affects all data operations"

  artifacts:
    - type: "architecture_diagram"
      file: "architecture-2024-12-09.md"
      description: "System architecture overview"
    - type: "decision_matrix"
      file: "database-choice-matrix.md"
      description: "Database selection criteria and scoring"
```

### Quality Scoring Integration

**Automated Quality Assessment**
- Technical soundness evaluation
- Business alignment scoring
- Implementation feasibility analysis
- Risk assessment integration

**Quality Metrics Collection**
```yaml
quality_metrics:
  technical_soundness: 8.5/10
  business_alignment: 9.0/10
  implementation_feasibility: 7.5/10
  risk_management: 8.0/10
  innovation_factor: 7.0/10
  overall_score: 8.0/10

  assessment_criteria:
    - scalability_consideration: "Excellent"
    - maintainability_focus: "Good"
    - performance_analysis: "Adequate"
    - security_assessment: "Excellent"
```

## 🚀 VAN MODE INTEGRATION

### Decision Discovery System

**Historical Decision Search**
- Semantic search across archived decisions
- Pattern matching for similar problems
- Success rate analysis for proposed approaches
- Risk assessment based on historical data

**Context-Aware Recommendations**
```markdown
## Similar Decisions Found

### Database Architecture (85% match)
**Previous Task**: ECOMMERCE-DB-2024-11-15
**Decision**: PostgreSQL with read replicas
**Success Rate**: 95% (implemented successfully, no major issues)
**Lessons Learned**:
- Connection pooling critical for performance
- Backup strategy must be planned early
- Migration scripts need thorough testing

**Recommendation**: Consider this proven approach for current task
```

### Pattern Library Access

**Architectural Pattern Repository**
- Categorized by problem domain
- Success rate tracking
- Implementation complexity scoring
- Resource requirement estimates

**Pattern Matching Algorithm**
```python
def find_relevant_patterns(current_context):
    patterns = search_archive_by_context(current_context)
    scored_patterns = []

    for pattern in patterns:
        similarity_score = calculate_similarity(current_context, pattern.context)
        success_rate = pattern.implementation_success_rate
        complexity_match = assess_complexity_match(current_context.complexity, pattern.complexity)

        relevance_score = (similarity_score * 0.4 +
                          success_rate * 0.4 +
                          complexity_match * 0.2)

        scored_patterns.append((pattern, relevance_score))

    return sorted(scored_patterns, key=lambda x: x[1], reverse=True)[:5]
```

## 📋 PLAN MODE INTEGRATION

### Pattern Reuse System

**Proven Solution Templates**
- Pre-validated architectural templates
- Implementation roadmaps from successful projects
- Resource allocation patterns
- Timeline estimation based on historical data

**Template Adaptation Engine**
```yaml
template_adaptation:
  base_template: "microservices-architecture-v2.1"
  adaptations:
    - scale: "medium → large (3x service count)"
    - technology: "Node.js → Python (team expertise)"
    - database: "MongoDB → PostgreSQL (ACID requirements)"
    - deployment: "Docker → Kubernetes (scalability needs)"

  estimated_changes:
    timeline_impact: "+20% (technology change)"
    resource_impact: "+15% (learning curve)"
    risk_impact: "-10% (proven patterns)"
```

### Decision Framework Integration

**Structured Decision Making**
- Decision templates based on successful patterns
- Criteria weighting from historical effectiveness
- Stakeholder involvement patterns
- Risk assessment frameworks

## ⚙️ IMPLEMENT MODE INTEGRATION

### Reference Access System

**Implementation Guidance**
- Step-by-step implementation guides from successful projects
- Common pitfall warnings based on historical failures
- Code pattern libraries with proven implementations
- Configuration templates and best practices

**Real-time Advisory System**
```markdown
## Implementation Advisory

### Current Phase: Database Setup
**Similar Implementation**: ECOMMERCE-DB-2024-11-15
**Success Factors**:
- Use connection pooling from day 1
- Implement proper indexing strategy
- Set up monitoring before production

**Common Pitfalls**:
- ⚠️ Don't skip migration testing (caused 2-day delay in previous project)
- ⚠️ Plan for backup storage costs (unexpected 40% budget increase)
- ⚠️ Test connection limits under load (production issue in 3 projects)

**Recommended Next Steps**:
1. Set up connection pooling configuration
2. Create initial database schema with proper indexes
3. Implement backup and recovery procedures
```

### Code Pattern Integration

**Proven Implementation Patterns**
- Code templates from successful implementations
- Configuration patterns with success tracking
- Testing strategies with effectiveness metrics
- Deployment patterns with reliability scores

## 🤔 REFLECT MODE INTEGRATION

### Quality Assessment System

**Automated Analysis**
- Compare implemented solution with original creative decisions
- Assess deviation from planned architecture
- Measure implementation quality against creative phase goals
- Generate improvement recommendations

**Reflection Enhancement**
```yaml
reflection_analysis:
  creative_vs_implementation:
    architecture_adherence: 85%
    decision_implementation: 90%
    quality_achievement: 80%
    timeline_adherence: 75%

  deviations:
    - decision: "Database choice"
      planned: "PostgreSQL"
      implemented: "PostgreSQL with Redis cache"
      reason: "Performance requirements exceeded expectations"
      impact: "Positive - 40% performance improvement"

  lessons_learned:
    - "Cache layer should be considered in creative phase"
    - "Performance testing earlier would have identified need"
    - "Redis expertise was available but not leveraged in planning"

  recommendations:
    - "Update database architecture template to include caching considerations"
    - "Add performance testing to creative phase checklist"
    - "Create team expertise inventory for better planning"
```

### Pattern Effectiveness Tracking

**Success Rate Updates**
- Update pattern success rates based on implementation results
- Track long-term effectiveness of architectural decisions
- Identify patterns that need refinement or retirement
- Generate pattern improvement recommendations

## 📚 ARCHIVE MODE INTEGRATION

### Long-term Preservation System

**Comprehensive Archiving**
- Complete creative phase documentation
- Implementation results and deviations
- Lessons learned and improvement recommendations
- Pattern effectiveness updates

**Knowledge Synthesis**
```yaml
archive_synthesis:
  project_summary:
    creative_phases: 3
    total_decisions: 12
    implementation_success: 85%
    timeline_adherence: 90%

  key_innovations:
    - "Hybrid database approach with PostgreSQL + Redis"
    - "Microservice communication pattern with event sourcing"
    - "Automated testing pipeline with performance gates"

  reusable_patterns:
    - pattern_id: "HYBRID-DB-v1.0"
      success_rate: 95%
      applicability: "High-performance applications with ACID requirements"

  institutional_knowledge:
    - "Team expertise in Redis significantly impacts implementation speed"
    - "Performance testing should be integrated into creative phases"
    - "Event sourcing patterns work well with microservice architectures"
```

### Strategic Knowledge Building

**Pattern Evolution Tracking**
- Track how patterns evolve over time
- Identify emerging architectural trends
- Assess technology adoption success rates
- Generate strategic technology recommendations

## 🔧 TECHNICAL IMPLEMENTATION

### File System Integration

**Archive Structure**
```
memory-bank/
├── creative/
│   ├── architecture/
│   │   ├── 2024-12-09-task-continuity-architecture.md
│   │   ├── 2024-12-08-rules-integration-architecture.md
│   │   └── index.md
│   ├── algorithms/
│   ├── ui-ux/
│   ├── data-models/
│   ├── patterns/
│   │   ├── database-patterns.md
│   │   ├── microservice-patterns.md
│   │   └── deployment-patterns.md
│   ├── metrics/
│   │   ├── quality-scores.json
│   │   ├── success-rates.json
│   │   └── pattern-effectiveness.json
│   └── search-index/
│       ├── decisions.index
│       ├── patterns.index
│       └── metadata.index
```

### API Integration Points

**Search API**
```python
def search_creative_archive(query, context=None, mode=None):
    """
    Search creative archive with context awareness

    Args:
        query: Search terms or problem description
        context: Current project context
        mode: Memory Bank mode for context-specific results

    Returns:
        List of relevant decisions, patterns, and recommendations
    """
    pass

def get_pattern_recommendations(problem_context):
    """
    Get pattern recommendations based on problem context

    Args:
        problem_context: Current problem description and constraints

    Returns:
        Ranked list of applicable patterns with success rates
    """
    pass
```

### Integration Hooks

**Mode Transition Hooks**
- VAN mode startup: Load relevant historical decisions
- PLAN mode: Suggest applicable patterns and templates
- IMPLEMENT mode: Provide implementation guidance
- REFLECT mode: Analyze implementation vs. creative decisions
- ARCHIVE mode: Synthesize and preserve knowledge

This comprehensive integration system ensures that creative phase results are seamlessly woven into the entire Memory Bank workflow, creating a continuous learning and improvement cycle that builds institutional knowledge and improves decision-making quality over time.