# MANDATORY @WEB SEARCH REQUIREMENT

## CRITICAL RULE: NO TASK EXECUTION WITHOUT CLARITY

**ABSOLUTE REQUIREMENT**: PLAN and CREATIVE modes MUST perform @web search for ANY unclear requirements before task execution.

## PRE-EXECUTION CHECKLIST

### MANDATORY QUESTIONS BEFORE STARTING
```markdown
Pre-Execution Analysis:
- [ ] Are ALL user requirements crystal clear?
- [ ] Do I understand EVERY technical detail?
- [ ] Are ALL implementation approaches validated?
- [ ] Have ALL dependencies been identified?
- [ ] Are there ANY ambiguous aspects?

IF ANY ANSWER IS "NO" OR "UNCLEAR" → MANDATORY @web RESEARCH
```

## @WEB SEARCH INTEGRATION

### When @web Search is MANDATORY

#### 1. **Unclear Technical Requirements**
```markdown
Examples requiring @web search:
- Unknown API specifications
- Unfamiliar technology stack
- Best practices for specific implementation
- Performance optimization techniques
- Security considerations
- Cross-platform compatibility issues
```

#### 2. **Ambiguous User Intent**
```markdown
Examples requiring @web search:
- Industry-specific terminology
- Standard workflows in domain
- Common patterns and practices
- User experience expectations
- Accessibility requirements
```

#### 3. **Implementation Uncertainty**
```markdown
Examples requiring @web search:
- Multiple possible approaches
- Technology comparison needed
- Integration patterns
- Error handling strategies
- Testing methodologies
```

### @Web Search Command Format
```markdown
# Research Pattern:
@web analyze: [specific technical question]
@web research: [technology/pattern/approach]
@web compare: [option A vs option B]
@web best-practices: [specific domain/technology]
@web troubleshoot: [specific problem/error]
```

## MODE-SPECIFIC REQUIREMENTS

### PLAN MODE @WEB INTEGRATION
```markdown
PLAN Phase Web Search Requirements:

1. **Requirement Analysis**
   @web research: [user domain/industry standards]
   @web analyze: [technical requirements clarity]

2. **Technology Validation**
   @web compare: [technology options for requirement]
   @web best-practices: [chosen technology stack]

3. **Implementation Strategy**
   @web research: [implementation patterns for use case]
   @web analyze: [potential challenges and solutions]

4. **Dependency Analysis**
   @web research: [required dependencies and compatibility]
   @web troubleshoot: [known integration issues]
```

### CREATIVE MODE @WEB INTEGRATION
```markdown
CREATIVE Phase Web Search Requirements:

1. **Design Pattern Research**
   @web research: [UI/UX patterns for use case]
   @web analyze: [accessibility standards]

2. **Architecture Validation**
   @web compare: [architectural approaches]
   @web best-practices: [scalability patterns]

3. **Technology Deep-Dive**
   @web research: [advanced features of chosen technology]
   @web analyze: [performance implications]

4. **Innovation Research**
   @web research: [latest developments in domain]
   @web analyze: [emerging best practices]
```

## ENFORCEMENT MECHANISMS

### Pre-Task Validation
```bash
# Before starting any PLAN/CREATIVE task
validate_requirements_clarity() {
    echo "🔍 REQUIREMENT CLARITY CHECK"
    echo "Are ALL requirements completely clear? (y/n)"
    read -r clarity_response

    if [[ "$clarity_response" != "y" ]]; then
        echo "❌ TASK BLOCKED: @web research required"
        echo "Use: @web research: [specific unclear aspect]"
        return 1
    fi

    echo "✅ Requirements validated - proceeding with task"
    return 0
}
```

### Research Documentation
```markdown
# Required Research Documentation Format:
## @Web Research Summary

### Research Questions:
1. [Question 1]
2. [Question 2]
...

### Research Results:
#### [Question 1]
- **Sources**: [URLs/references]
- **Key Findings**: [summary]
- **Implementation Impact**: [how this affects approach]

#### [Question 2]
- **Sources**: [URLs/references]
- **Key Findings**: [summary]
- **Implementation Impact**: [how this affects approach]

### Research-Based Decisions:
- [Decision 1]: Based on [research finding]
- [Decision 2]: Based on [research finding]
...

### Confidence Level: [HIGH/MEDIUM/LOW]
```

## QUALITY ASSURANCE

### Research Quality Standards
1. **Multiple Sources**: Minimum 2-3 authoritative sources
2. **Recent Information**: Prefer sources from last 2 years
3. **Authoritative Sources**: Official documentation, reputable sites
4. **Practical Examples**: Real-world implementation examples
5. **Community Validation**: Stack Overflow, GitHub discussions

### Research Completeness Checklist
```markdown
Research Completeness Verification:
- [ ] All unclear aspects researched?
- [ ] Multiple authoritative sources consulted?
- [ ] Implementation approach validated?
- [ ] Potential issues identified?
- [ ] Dependencies clarified?
- [ ] Best practices confirmed?
- [ ] Alternative approaches considered?
```

## INTEGRATION WITH WORKFLOW

### VAN Mode Integration
```markdown
VAN Phase @Web Requirements:
- Research problem domain before analysis
- Validate understanding of user context
- Research similar solved problems
- Identify industry standards and practices
```

### IMPLEMENT Mode Support
```markdown
IMPLEMENT Phase @Web Support:
- Research specific implementation issues
- Troubleshoot encountered problems
- Validate technical solutions
- Find optimization opportunities
```

### QA Mode Validation
```markdown
QA Phase @Web Validation:
- Research testing best practices
- Validate quality standards
- Research performance benchmarks
- Identify edge cases and scenarios
```

## ERROR PREVENTION

### Common Research Gaps
1. **Insufficient Domain Knowledge**
   - Solution: @web research: [domain-specific requirements]

2. **Technology Unfamiliarity**
   - Solution: @web research: [technology documentation and tutorials]

3. **Implementation Uncertainty**
   - Solution: @web compare: [implementation approaches]

4. **Performance Concerns**
   - Solution: @web research: [performance optimization techniques]

5. **Security Considerations**
   - Solution: @web research: [security best practices for technology]

### Research Gap Detection
```bash
# Detect potential research gaps
detect_research_gaps() {
    local task_description="$1"

    # Check for technical terms that might need research
    if echo "$task_description" | grep -qE "(API|integration|performance|security|scalability)"; then
        echo "⚠️  Technical complexity detected - consider @web research"
    fi

    # Check for domain-specific language
    if echo "$task_description" | grep -qE "(business|workflow|process|compliance)"; then
        echo "⚠️  Domain complexity detected - consider @web research"
    fi
}
```

## SUCCESS METRICS

### Research Effectiveness Indicators
1. **Reduced Implementation Errors**: Fewer bugs due to better understanding
2. **Faster Development**: Less trial-and-error during implementation
3. **Higher Quality Solutions**: Better architecture and design decisions
4. **Improved User Satisfaction**: Solutions that better meet actual needs
5. **Knowledge Retention**: Building institutional knowledge base

### Research Quality Metrics
```markdown
Research Quality Assessment:
- Relevance: How well does research address the question?
- Authority: Are sources credible and authoritative?
- Currency: Is information recent and up-to-date?
- Completeness: Are all aspects of question covered?
- Applicability: Can findings be directly applied to task?
```

## COMPLIANCE VERIFICATION

### Daily Research Audit
```bash
# Verify @web research was performed for unclear requirements
audit_research_compliance() {
    local task_files=$(find memory-bank/tasks -name "*.md" -mtime -1)

    for task_file in $task_files; do
        if grep -q "unclear\|unknown\|unsure" "$task_file"; then
            if ! grep -q "@web research" "$task_file"; then
                echo "❌ COMPLIANCE VIOLATION: $task_file - unclear requirements without @web research"
            fi
        fi
    done
}
```

### Weekly Research Review
```bash
# Generate research effectiveness report
generate_research_report() {
    local total_tasks=$(find memory-bank/tasks -name "*.md" -mtime -7 | wc -l)
    local researched_tasks=$(find memory-bank/tasks -name "*.md" -mtime -7 -exec grep -l "@web research" {} \; | wc -l)
    local research_rate=$((researched_tasks * 100 / total_tasks))

    echo "Weekly Research Rate: ${research_rate}% (${researched_tasks}/${total_tasks})"
}
```

## CRITICAL SUCCESS FACTORS

1. **Zero Tolerance for Ambiguity**: No task starts with unclear requirements
2. **Research First Mindset**: Default to research when in doubt
3. **Quality Over Speed**: Better to research thoroughly than implement incorrectly
4. **Documentation Discipline**: All research must be documented
5. **Continuous Learning**: Build knowledge base through systematic research

This rule ensures that all PLAN and CREATIVE mode tasks begin with complete understanding, leading to higher quality implementations and reduced errors.