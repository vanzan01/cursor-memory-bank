---
description: Web Search Integration for Memory Bank 2.0.0
globs: "**/memory-bank/**"
alwaysApply: true
---

# WEB SEARCH INTEGRATION RULE

## OVERVIEW
This rule enables web search capabilities across all Memory Bank modes to assist with error resolution, feature discovery, and solution validation.

## SCOPE
- **Applies to**: All Memory Bank modes (VAN, PLAN, CREATIVE, IMPLEMENT, QA, REFLECT/ARCHIVE)
- **Priority**: HIGH
- **Integration**: Core system enhancement

## WEB SEARCH TRIGGERS

### Automatic Triggers
1. **Error Detection**: When encountering code errors or exceptions
2. **Unknown Technology**: When working with unfamiliar libraries/frameworks
3. **Performance Issues**: When optimization is needed
4. **Best Practices**: When design decisions require validation

### Manual Triggers
1. **User Request**: Explicit request for web search
2. **Research Mode**: When exploring new approaches
3. **Validation**: When verifying current practices
4. **Learning**: When discovering new features

## SEARCH CATEGORIES

### 1. ERROR RESOLUTION
```markdown
**When to Use**: Code errors, exceptions, build failures
**Search Strategy**:
- Copy exact error message
- Include language/framework version
- Add context keywords
- Search for Stack Overflow solutions
- Look for GitHub issues
- Check official documentation

**Example Searches**:
- "TypeError: Cannot read property 'map' of undefined React"
- "Python ModuleNotFoundError: No module named 'requests'"
- "npm ERR! peer dep missing"
```

### 2. FEATURE DISCOVERY
```markdown
**When to Use**: New language features, library updates, tool capabilities
**Search Strategy**:
- Search for "new features [technology] [version]"
- Look for release notes and changelogs
- Check official blogs and documentation
- Find community discussions and tutorials

**Example Searches**:
- "JavaScript ES2024 new features"
- "React 18 new hooks features"
- "Python 3.12 new features"
- "TypeScript 5.0 new features"
```

### 3. BEST PRACTICES
```markdown
**When to Use**: Architecture decisions, code patterns, optimization
**Search Strategy**:
- Search for "[technology] best practices [year]"
- Look for authoritative sources
- Check multiple perspectives
- Find real-world examples

**Example Searches**:
- "React state management best practices 2024"
- "Node.js security best practices"
- "Database indexing best practices"
```

### 4. SOLUTION VALIDATION
```markdown
**When to Use**: Verifying approach, comparing alternatives
**Search Strategy**:
- Search for comparisons and benchmarks
- Look for pros/cons discussions
- Find performance comparisons
- Check community consensus

**Example Searches**:
- "Redux vs Zustand vs Context API comparison"
- "PostgreSQL vs MongoDB performance"
- "Jest vs Vitest testing framework"
```

## MODE-SPECIFIC INTEGRATION

### VAN Mode Integration
```markdown
**Usage**: Research during problem analysis
**Triggers**:
- Unknown error patterns
- Technology identification
- Initial research phase

**Implementation**:
- Add web search step to analysis workflow
- Document findings in activeContext.md
- Update knowledge base with discoveries
```

### PLAN Mode Integration
```markdown
**Usage**: Research during planning phase
**Triggers**:
- Technology selection decisions
- Architecture pattern research
- Dependency evaluation

**Implementation**:
- Include research phase in planning workflow
- Document alternatives and rationale
- Validate chosen approaches with web search
```

### CREATIVE Mode Integration
```markdown
**Usage**: Explore design alternatives and patterns
**Triggers**:
- Design pattern selection
- UI/UX best practices research
- Algorithm optimization research

**Implementation**:
- Add research step to creative workflow
- Compare multiple approaches found online
- Document design decisions with web sources
```

### IMPLEMENT Mode Integration
```markdown
**Usage**: Solve implementation challenges
**Triggers**:
- Code errors during implementation
- API usage questions
- Performance optimization needs

**Implementation**:
- Immediate error resolution via web search
- Feature implementation guidance
- Code review and validation
```

### QA Mode Integration
```markdown
**Usage**: Research testing strategies and debug issues
**Triggers**:
- Test failure investigation
- Testing framework selection
- Performance testing approaches

**Implementation**:
- Debug test failures with web search
- Research testing best practices
- Find edge case handling examples
```

### REFLECT/ARCHIVE Mode Integration
```markdown
**Usage**: Research improvements and document learnings
**Triggers**:
- Post-implementation analysis
- Technology trend research
- Process improvement ideas

**Implementation**:
- Research alternative approaches retrospectively
- Document lessons learned with web sources
- Plan future improvements based on research
```

## SEARCH EXECUTION GUIDELINES

### Search Query Optimization
1. **Be Specific**: Include exact error messages, versions, context
2. **Use Keywords**: Add relevant technical terms and frameworks
3. **Include Timeframe**: Add year or "latest" for current information
4. **Multiple Queries**: Try different phrasings if first search fails

### Source Evaluation
1. **Prioritize Official Sources**: Documentation, official blogs, repositories
2. **Check Dates**: Ensure information is current and relevant
3. **Verify Multiple Sources**: Cross-reference important information
4. **Community Validation**: Look for upvotes, stars, positive feedback

### Information Processing
1. **Extract Key Points**: Summarize relevant findings
2. **Adapt to Context**: Modify solutions for specific use case
3. **Document Sources**: Keep track of helpful resources
4. **Share Findings**: Update Memory Bank with discoveries

## INTEGRATION COMMANDS

### Web Search Commands
```bash
# General web search
@web [search query]

# Error-specific search
@web error: [error message]

# Feature discovery search
@web features: [technology] [version]

# Best practices search
@web best practices: [topic]

# Comparison search
@web compare: [option1] vs [option2]
```

### Mode-Specific Usage
```markdown
VAN Mode: @web analyze: [problem description]
PLAN Mode: @web research: [technology/approach]
CREATIVE Mode: @web design: [pattern/approach]
IMPLEMENT Mode: @web solve: [specific issue]
QA Mode: @web test: [testing approach/issue]
REFLECT Mode: @web improve: [area for improvement]
```

## MEMORY BANK INTEGRATION

### Documentation Requirements
1. **Search Results**: Document key findings in relevant Memory Bank files
2. **Source Links**: Maintain references to helpful resources
3. **Applied Solutions**: Track which web-researched solutions were implemented
4. **Knowledge Base**: Build searchable knowledge base of discoveries

### File Updates
```markdown
- activeContext.md: Current research findings
- techContext.md: Technology-specific discoveries
- systemPatterns.md: Patterns and best practices found
- progress.md: Solutions applied from web research
- [mode]-research.md: Mode-specific research findings
```

## SUCCESS METRICS

### Effectiveness Measures
1. **Error Resolution Rate**: Percentage of errors resolved via web search
2. **Implementation Speed**: Time saved by finding solutions online
3. **Quality Improvement**: Better solutions found through research
4. **Knowledge Retention**: Documented learnings for future reference

### Quality Indicators
1. **Source Reliability**: Using authoritative and current sources
2. **Solution Applicability**: Found solutions work in specific context
3. **Comprehensive Research**: Multiple perspectives considered
4. **Documentation Quality**: Clear documentation of findings and sources

## BEST PRACTICES

### Do's
- ✅ Search immediately when encountering unknown errors
- ✅ Include specific version numbers and context
- ✅ Verify solutions with multiple sources
- ✅ Document findings for future reference
- ✅ Adapt solutions to specific use case
- ✅ Share discoveries with team/Memory Bank

### Don'ts
- ❌ Don't copy solutions blindly without understanding
- ❌ Don't rely on outdated information
- ❌ Don't skip verification of found solutions
- ❌ Don't forget to document successful searches
- ❌ Don't ignore security implications of found solutions
- ❌ Don't use first result without comparing alternatives

## TROUBLESHOOTING

### Common Issues
1. **No Relevant Results**: Try different keywords, broader search terms
2. **Outdated Information**: Add current year to search, check publication dates
3. **Too Many Results**: Be more specific, add framework/language context
4. **Conflicting Information**: Check multiple sources, look for consensus

### Escalation Process
1. **Refine Search**: Try different query formulations
2. **Community Help**: Ask in relevant forums/communities
3. **Official Support**: Contact official support channels
4. **Expert Consultation**: Seek help from domain experts

This rule ensures that web search capabilities are seamlessly integrated across all Memory Bank modes, enhancing problem-solving efficiency and keeping the system current with latest developments.