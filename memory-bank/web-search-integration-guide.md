# WEB SEARCH INTEGRATION GUIDE - MEMORY BANK

## 🌐 OVERVIEW

This guide explains how to effectively use web search capabilities across all Memory Bank modes to enhance problem-solving, error resolution, and feature discovery.

## 🎯 WHEN TO USE WEB SEARCH

### Automatic Triggers
- **Error Detection**: Code errors, exceptions, build failures
- **Unknown Technology**: Unfamiliar libraries, frameworks, tools
- **Performance Issues**: Optimization needs, slow performance
- **Best Practices**: Architecture decisions, code patterns

### Manual Triggers
- **User Request**: Explicit request for web search
- **Research Mode**: Exploring new approaches or alternatives
- **Validation**: Verifying current practices or solutions
- **Learning**: Discovering new features or capabilities

## 🔍 SEARCH COMMAND SYNTAX

### General Commands
```bash
@web [search query]                    # General web search
@web error: [error message]           # Error-specific search
@web features: [technology] [version] # Feature discovery
@web best practices: [topic]          # Best practices search
@web compare: [option1] vs [option2]  # Comparison search
```

### Mode-Specific Commands
```bash
# VAN Mode
@web analyze: [problem description]

# PLAN Mode
@web research: [technology/approach]

# CREATIVE Mode
@web design: [pattern/approach]
@web examples: [pattern] implementation

# IMPLEMENT Mode
@web solve: [specific issue]
@web error: [error message]

# QA Mode
@web test: [testing approach/issue]
@web debug: [testing framework] [issue]

# REFLECT Mode
@web improve: [area for improvement]
@web trends: [technology] 2024
```

## 📋 SEARCH CATEGORIES & STRATEGIES

### 1. Error Resolution
**Use Cases**: Code errors, exceptions, build failures, debugging

**Search Strategies**:
- Copy exact error message in quotes
- Include language/framework version
- Add relevant context keywords
- Search Stack Overflow and GitHub issues
- Check official documentation

**Examples**:
```bash
@web error: "TypeError: Cannot read property 'map' of undefined React"
@web error: "Python ModuleNotFoundError: No module named 'requests'"
@web error: "npm ERR! peer dep missing webpack"
```

### 2. Feature Discovery
**Use Cases**: New language features, library updates, tool capabilities

**Search Strategies**:
- Search for "new features [technology] [version]"
- Look for release notes and changelogs
- Check official blogs and documentation
- Find community discussions and tutorials

**Examples**:
```bash
@web features: JavaScript ES2024 new features
@web features: React 18 new hooks
@web features: Python 3.12 new features
@web features: TypeScript 5.0 new features
```

### 3. Best Practices Research
**Use Cases**: Architecture decisions, code patterns, optimization

**Search Strategies**:
- Search for "[technology] best practices [current year]"
- Look for authoritative sources (official docs, well-known blogs)
- Check multiple perspectives and opinions
- Find real-world examples and case studies

**Examples**:
```bash
@web best practices: React state management 2024
@web best practices: Node.js security
@web best practices: database indexing
@web best practices: API design REST
```

### 4. Solution Validation
**Use Cases**: Verifying approach, comparing alternatives, decision making

**Search Strategies**:
- Search for comparisons and benchmarks
- Look for pros/cons discussions
- Find performance comparisons
- Check community consensus and opinions

**Examples**:
```bash
@web compare: Redux vs Zustand vs Context API
@web compare: PostgreSQL vs MongoDB performance
@web compare: Jest vs Vitest testing framework
@web compare: Docker vs Podman containers
```

## 🎯 MODE-SPECIFIC USAGE

### VAN Mode Integration
**Purpose**: Research during initial problem analysis
```bash
@web analyze: React application performance issues
@web analyze: database connection timeout errors
@web analyze: deployment pipeline failures
```

**Documentation**: Update `activeContext.md` with research findings

### PLAN Mode Integration
**Purpose**: Research during planning phase for technology decisions
```bash
@web research: microservices architecture patterns
@web research: state management solutions React
@web research: testing strategies Node.js
```

**Documentation**: Include research findings in implementation plan

### CREATIVE Mode Integration
**Purpose**: Explore design alternatives and patterns
```bash
@web design: authentication flow patterns
@web design: responsive navigation components
@web examples: infinite scroll implementation
```

**Documentation**: Document design decisions with web sources

### IMPLEMENT Mode Integration
**Purpose**: Solve implementation challenges in real-time
```bash
@web solve: async/await error handling
@web solve: CORS issues Express.js
@web error: "Module not found" webpack
```

**Documentation**: Track solutions in build reports

### QA Mode Integration
**Purpose**: Research testing strategies and debug test issues
```bash
@web test: unit testing React components
@web test: API testing best practices
@web debug: Jest test timeout issues
```

**Documentation**: Include testing research in QA reports

### REFLECT Mode Integration
**Purpose**: Research improvements and document learnings
```bash
@web improve: code review process
@web trends: frontend development 2024
@web improve: team collaboration tools
```

**Documentation**: Add findings to reflection.md with sources

## 📊 SOURCE EVALUATION CRITERIA

### Priority Order
1. **Official Documentation** - Framework/language official docs
2. **Official Blogs** - Technology company blogs and announcements
3. **GitHub Repositories** - Official repos, popular libraries
4. **Stack Overflow** - High-voted, recent answers
5. **Authoritative Blogs** - Well-known developers and companies
6. **Community Forums** - Reddit, Discord, specialized forums

### Quality Indicators
- ✅ **Recent Publication Date** - Information from current year
- ✅ **High Community Validation** - Upvotes, stars, positive feedback
- ✅ **Authoritative Source** - Known experts, official channels
- ✅ **Multiple Confirmations** - Same solution found in multiple places
- ✅ **Working Examples** - Code samples that can be tested
- ✅ **Clear Documentation** - Well-explained solutions with context

### Red Flags
- ❌ **Outdated Information** - Old versions, deprecated features
- ❌ **Unverified Sources** - Unknown authors, suspicious websites
- ❌ **Conflicting Information** - Solutions that contradict best practices
- ❌ **Security Concerns** - Solutions with potential security issues
- ❌ **No Community Validation** - No upvotes, comments, or feedback

## 📝 DOCUMENTATION REQUIREMENTS

### Research Documentation
For every web search, document:
1. **Search Query Used** - Exact query that found the solution
2. **Source URL** - Link to the helpful resource
3. **Key Findings** - Summary of relevant information
4. **Applied Solution** - How the finding was implemented
5. **Results** - Whether the solution worked

### Memory Bank Integration
Update relevant Memory Bank files:
```markdown
- activeContext.md: Current research findings and context
- techContext.md: Technology-specific discoveries
- systemPatterns.md: Patterns and best practices found
- progress.md: Solutions applied from web research
- [mode]-research.md: Mode-specific research findings
```

### Research Log Format
```markdown
## Web Search Log - [Date]

### Search: [Query]
- **Source**: [URL]
- **Finding**: [Key information discovered]
- **Applied**: [How it was used]
- **Result**: [Success/failure and details]
- **Mode**: [Which mode this was used in]
```

## 🚀 BEST PRACTICES

### Do's
- ✅ Search immediately when encountering unknown errors
- ✅ Include specific version numbers and context in queries
- ✅ Verify solutions with multiple sources before applying
- ✅ Document all findings for future reference
- ✅ Adapt solutions to your specific use case
- ✅ Share discoveries with team/Memory Bank
- ✅ Test solutions in safe environment first
- ✅ Keep track of helpful resources and sources

### Don'ts
- ❌ Don't copy solutions blindly without understanding them
- ❌ Don't rely on outdated information or deprecated features
- ❌ Don't skip verification of found solutions
- ❌ Don't forget to document successful searches and solutions
- ❌ Don't ignore security implications of found solutions
- ❌ Don't use first result without comparing alternatives
- ❌ Don't implement solutions without testing first

## 🔧 TROUBLESHOOTING WEB SEARCH

### No Relevant Results
**Problem**: Search returns no useful results
**Solutions**:
- Try different keywords and synonyms
- Use broader search terms
- Remove version-specific terms
- Search for the general concept instead of specific implementation

### Too Many Results
**Problem**: Overwhelming number of search results
**Solutions**:
- Add more specific keywords
- Include framework/language context
- Add current year to search query
- Use exact phrases in quotes

### Outdated Information
**Problem**: Found solutions are for old versions
**Solutions**:
- Add current year to search query
- Search for "latest" or "current" version
- Check official migration guides
- Look for recent blog posts and tutorials

### Conflicting Information
**Problem**: Different sources provide different solutions
**Solutions**:
- Check publication dates and use most recent
- Look for official documentation
- Test multiple approaches if possible
- Ask in community forums for clarification

## 📈 SUCCESS METRICS

### Effectiveness Measures
- **Error Resolution Rate**: % of errors resolved via web search
- **Implementation Speed**: Time saved by finding solutions online
- **Quality Improvement**: Better solutions found through research
- **Knowledge Retention**: Documented learnings for future reference

### Quality Indicators
- **Source Reliability**: Using authoritative and current sources
- **Solution Applicability**: Found solutions work in specific context
- **Comprehensive Research**: Multiple perspectives considered
- **Documentation Quality**: Clear documentation of findings and sources

This guide ensures effective use of web search capabilities across all Memory Bank modes, enhancing problem-solving efficiency and keeping the system current with latest developments.