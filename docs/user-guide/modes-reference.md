# Memory Bank Modes Reference

This comprehensive reference guide provides detailed information about each of Memory Bank's 7 modes. Use this guide to understand when to use each mode, what activities to perform, and how to maximize effectiveness.

## 🧭 Modes Overview

Memory Bank operates through 7 distinct modes, each designed for specific phases of development work:

| Mode          | Icon | Purpose                                   | When to Use                   | Duration        |
|---------------|------|-------------------------------------------|-------------------------------|-----------------|
| **VAN**       | 🔍   | Verification, Analysis, Navigation        | Start of every session       | 5-30 min       |
| **PLAN**      | 📋   | Strategic planning and architecture       | Level 2+ tasks               | 30 min - 2 days|
| **CREATIVE**  | 🎨   | Design decisions and creative solutions   | Level 3+ tasks               | 2-8 hours      |
| **IMPLEMENT** | 🔨   | Code implementation and development       | All coding tasks              | 15 min - weeks |
| **QA**        | ✅    | Quality assurance and validation          | Level 3+ tasks               | 30 min - 3 days|
| **REFLECT**   | 📚   | Learning capture and documentation        | Completion of significant tasks| 5-45 min      |
| **ARCHIVE**   | 📁   | Knowledge preservation and organization   | Task completion               | 2 min - 2 hours|

## 🔍 VAN Mode: Verification, Analysis, Navigation

**Purpose**: Entry point for all Memory Bank sessions. Analyzes your current situation and determines the appropriate workflow path.

### Core Objectives
- **Verify** current project state and environment
- **Analyze** task requirements and complexity
- **Navigate** to appropriate workflow

### Key Activities

#### Platform Detection
- Identify operating system and environment
- Discover package managers and development tools
- Verify Memory Bank system integrity
- Check project structure and dependencies

#### Task Analysis
- Understand the problem or requirement
- Assess scope and complexity
- Identify stakeholders and constraints
- Determine resource requirements

#### Complexity Assessment
```markdown
Level 1 (5-30 min): Quick fixes, minor adjustments
- Bug fixes
- Configuration updates
- Documentation corrections
- Simple refactoring

Level 2 (1-4 hours): Simple enhancements
- Feature additions
- UI improvements
- Performance optimizations
- Code organization

Level 3 (1-3 days): Feature development
- New features
- Significant UI changes
- API development
- Integration work

Level 4 (1+ weeks): Complex systems
- Major architectural changes
- New product development
- Large-scale refactoring
- System integration
```

#### Workflow Determination
Based on complexity assessment, VAN mode recommends:
- **Level 1**: VAN → IMPLEMENT → REFLECT → ARCHIVE
- **Level 2**: VAN → PLAN → IMPLEMENT → REFLECT → ARCHIVE
- **Level 3-4**: VAN → PLAN → CREATIVE → IMPLEMENT → QA → REFLECT → ARCHIVE

### Entry Criteria
- New development session begins
- Task or problem identified
- Memory Bank system available

### Exit Criteria
- Platform and environment verified
- Task complexity determined
- Workflow path selected
- Next mode identified

### Best Practices
- Always start with VAN mode for new sessions
- Be honest about complexity assessment
- Document any unusual findings
- Update assessment when new information emerges

### Common Outputs
- Platform analysis report
- Task complexity assessment
- Workflow recommendation
- Initial risk identification

## 📋 PLAN Mode: Strategic Planning and Architecture

**Purpose**: Create comprehensive plans and architectural designs for development tasks requiring structured approach.

### Core Objectives
- **Strategize** implementation approach
- **Architect** technical solutions
- **Plan** resource allocation and timelines
- **Mitigate** identified risks

### Key Activities

#### Requirements Analysis
- Gather and document requirements
- Identify acceptance criteria
- Map user stories and use cases
- Define success metrics

#### Architecture Design
- Design system architecture
- Define component interactions
- Plan data structures and APIs
- Consider scalability and performance

#### Implementation Planning
- Break down work into phases
- Estimate effort and timelines
- Identify dependencies and blockers
- Plan testing and validation strategy

#### Risk Assessment
- Identify technical risks
- Assess business risks
- Plan mitigation strategies
- Define contingency plans

### Planning Templates

#### Level 2 Planning Template
```markdown
## Enhancement Plan: [Feature Name]

### Requirements
- [ ] Requirement 1
- [ ] Requirement 2

### Implementation Approach
1. **Phase 1**: [Description]
2. **Phase 2**: [Description]

### Files to Modify
- `file1.js`: [Required changes]
- `file2.css`: [Required changes]

### Testing Plan
- [ ] Unit tests
- [ ] Integration tests
- [ ] Manual testing

### Risks and Mitigation
- **Risk**: [Description]
  - **Mitigation**: [Strategy]
```

#### Level 3-4 Planning Template
```markdown
## Feature Plan: [Feature Name]

### Business Requirements
- **Goal**: [Primary objective]
- **Success Metrics**: [How to measure success]
- **Stakeholders**: [Key stakeholders]

### Technical Architecture
- **Components**: [New/modified components]
- **APIs**: [API specifications]
- **Database**: [Schema changes]
- **Integration**: [External systems]

### Implementation Phases
1. **Foundation** (X days): [Core infrastructure]
2. **Core Logic** (X days): [Main functionality]
3. **User Interface** (X days): [Frontend components]
4. **Integration** (X days): [System integration]
5. **Polish** (X days): [Optimization and refinement]

### Quality Assurance
- **Testing Strategy**: [Approach]
- **Performance Requirements**: [Benchmarks]
- **Security Considerations**: [Security measures]

### Timeline and Resources
- **Total Estimate**: [Time estimate]
- **Key Milestones**: [Major checkpoints]
- **Dependencies**: [External dependencies]
```

### Entry Criteria
- VAN mode completed with Level 2+ complexity
- Requirements understood
- Stakeholders identified

### Exit Criteria
- Comprehensive plan created
- Architecture designed
- Risks identified and mitigated
- Implementation approach defined

### Best Practices
- Involve stakeholders in planning
- Plan for testing from the start
- Consider non-functional requirements
- Document assumptions and constraints
- Plan in phases for complex projects

### Common Outputs
- Implementation plan
- Architecture diagrams
- Risk assessment
- Timeline and milestones

## 🎨 CREATIVE Mode: Design Decisions and Creative Solutions

**Purpose**: Focus on design thinking, user experience, and creative problem-solving for complex features and systems.

### Core Objectives
- **Design** user experiences and interfaces
- **Explore** creative problem solutions
- **Resolve** design pattern and approach questions
- **Document** design decisions and rationale

### Key Activities

#### User Experience Design
- Create user journey maps
- Design wireframes and mockups
- Define interaction patterns
- Consider accessibility requirements

#### Technical Design
- Explore architectural patterns
- Design APIs and data structures
- Consider performance implications
- Plan for scalability and maintainability

#### Creative Problem Solving
- Brainstorm multiple solutions
- Prototype key concepts
- Evaluate trade-offs
- Make informed design decisions

#### Design Documentation
- Document design decisions
- Create design system components
- Establish design guidelines
- Plan design validation

### Creative Process Framework

#### 1. Research Phase
- Research existing solutions
- Brainstorm alternatives
- Create rough prototypes
- Gather inspiration

#### 2. Design Phase
- Create detailed designs
- Define interaction patterns
- Establish visual hierarchy
- Consider edge cases

#### 3. Validation Phase
- Review with stakeholders
- Test key assumptions
- Iterate based on feedback
- Finalize design decisions

#### 4. Documentation Phase
- Document design rationale
- Create implementation guidelines
- Establish design patterns
- Plan design system updates

### Design Deliverables

#### UI/UX Design
- Wireframes and mockups
- User flow diagrams
- Interaction specifications
- Accessibility guidelines

#### Technical Design
- Architecture diagrams
- API specifications
- Data model designs
- Integration patterns

#### Design System
- Component specifications
- Design tokens
- Usage guidelines
- Pattern library

### Entry Criteria
- PLAN mode completed for Level 3+ tasks
- Requirements and architecture understood
- Design challenges identified

### Exit Criteria
- Design decisions made and documented
- User experience defined
- Technical approach validated
- Implementation guidelines created

### Best Practices
- Start with user needs
- Consider multiple alternatives
- Prototype key interactions
- Document design rationale
- Plan for accessibility
- Consider mobile and responsive design

### Common Outputs
- UI/UX designs
- Technical architecture solutions
- Design system components
- Implementation guidelines

## 🔨 IMPLEMENT Mode: Code Implementation and Development

**Purpose**: Execute planned implementation, building actual code and features according to design and plan.

### Core Objectives
- **Build** features according to plan
- **Test** implementation continuously
- **Document** code and changes
- **Track** progress and issues

### Key Activities

#### Code Development
- Implement planned features
- Follow coding standards
- Write clean, maintainable code
- Handle edge cases and errors

#### Testing Implementation
- Write unit tests
- Perform integration testing
- Test user scenarios
- Validate against requirements

#### Documentation
- Update code comments
- Maintain README files
- Document API changes
- Update user documentation

#### Progress Tracking
- Update task status
- Regular code commits
- Track time and effort
- Communicate progress

### Implementation Approaches

#### Level 1: Quick Implementation
```markdown
## Quick Fix Implementation

### Approach
- Minimal changes only
- Focus on specific issue
- Thorough testing
- Document change

### Checklist
- [ ] Issue reproduced
- [ ] Fix implemented
- [ ] Fix tested
- [ ] No regression introduced
- [ ] Change documented
```

#### Level 2: Structured Implementation
```markdown
## Enhancement Implementation

### Phased Approach
1. **Setup**: Prepare development environment
2. **Core**: Implement main functionality
3. **Testing**: Add comprehensive tests
4. **Documentation**: Update all documentation
5. **Review**: Code review and refinement

### Progress Tracking
- [ ] Phase 1 completed
- [ ] Phase 2 completed
- [ ] Phase 3 completed
- [ ] Phase 4 completed
- [ ] Phase 5 completed
```

#### Level 3-4: Phased Implementation
```markdown
## Feature Implementation

### Implementation Phases
1. **Foundation**: Core infrastructure and APIs
2. **Core Logic**: Main business logic
3. **User Interface**: Frontend components
4. **Integration**: System integration
5. **Polish**: Optimization and refinement

### Quality Gates
- [ ] Code review completed
- [ ] Tests passing
- [ ] Performance acceptable
- [ ] Security validated
- [ ] Documentation updated
```

### Entry Criteria
- Plan created (for Level 2+)
- Design completed (for Level 3+)
- Development environment ready
- Requirements understood

### Exit Criteria
- All planned features implemented
- Tests passing
- Code reviewed
- Documentation updated

### Best Practices
- Implement in small, testable increments
- Commit frequently with descriptive messages
- Test continuously
- Follow established patterns
- Document as you go
- Handle errors gracefully

### Common Outputs
- Working code
- Test suites
- Updated documentation
- Progress reports

## ✅ QA Mode: Quality Assurance and Validation

**Purpose**: Comprehensive quality assurance to ensure implementation meets all requirements and quality standards.

### Core Objectives
- **Validate** functionality against requirements
- **Test** performance and reliability
- **Verify** security and accessibility
- **Ensure** compliance with quality standards

### Key Activities

#### Functional Testing
- Test all user scenarios
- Validate business logic
- Check edge cases
- Verify error handling

#### Non-Functional Testing
- Performance testing
- Security testing
- Accessibility testing
- Compatibility testing

#### Integration Testing
- API integration testing
- Database integration
- External system integration
- End-to-end testing

#### Quality Validation
- Code quality review
- Documentation review
- User experience validation
- Compliance checking

### QA Checklists

#### Functional Testing Checklist
```markdown
## Functional Testing

### Core Functionality
- [ ] All user stories work as expected
- [ ] Business logic is correct
- [ ] Data validation works properly
- [ ] Error messages are helpful

### Edge Cases
- [ ] Empty inputs handled
- [ ] Maximum limits respected
- [ ] Invalid data rejected
- [ ] Boundary conditions tested

### User Experience
- [ ] Navigation is intuitive
- [ ] Feedback is provided
- [ ] Loading states shown
- [ ] Error recovery possible
```

#### Technical Testing Checklist
```markdown
## Technical Testing

### Performance
- [ ] Page load times acceptable
- [ ] API response times within limits
- [ ] Memory usage reasonable
- [ ] No memory leaks detected

### Security
- [ ] Input validation implemented
- [ ] Authentication works
- [ ] Authorization correct
- [ ] Sensitive data not exposed

### Accessibility
- [ ] Keyboard navigation works
- [ ] Screen reader compatibility
- [ ] Color contrast sufficient
- [ ] Focus indicators visible

### Compatibility
- [ ] Works in target browsers
- [ ] Mobile responsiveness
- [ ] Different screen sizes
- [ ] Various devices tested
```

### Entry Criteria
- Implementation completed
- Basic testing performed
- Code review completed
- Documentation updated

### Exit Criteria
- All tests passing
- Quality standards met
- Issues resolved or documented
- Stakeholder approval obtained

### Best Practices
- Test early and often
- Automate repetitive tests
- Test with real data
- Include accessibility testing
- Document test results
- Involve stakeholders in testing

### Common Outputs
- Test reports
- Quality metrics
- Issue lists
- Approval documentation

## 📚 REFLECT Mode: Learning Capture and Documentation

**Purpose**: Capture lessons learned, document insights, and improve processes for future development work.

### Core Objectives
- **Analyze** what worked well and what didn't
- **Document** lessons learned
- **Improve** processes and practices
- **Share** knowledge with team

### Key Activities

#### Process Analysis
- Review development process
- Identify bottlenecks and inefficiencies
- Analyze decision points
- Evaluate tool effectiveness

#### Learning Capture
- Document technical insights
- Record problem-solving approaches
- Capture design decisions
- Note useful resources

#### Process Improvement
- Identify improvement opportunities
- Suggest process changes
- Update templates and checklists
- Refine estimation techniques

#### Knowledge Sharing
- Create reusable templates
- Document best practices
- Share insights with team
- Update knowledge base

### Reflection Templates

#### Quick Reflection (Level 1)
```markdown
## Quick Fix Reflection

### What Worked Well
- [Success factors]

### What Could Be Improved
- [Improvement opportunities]

### Lessons Learned
- [Key insights]

### Prevention
- [How to prevent similar issues]
```

#### Comprehensive Reflection (Level 2+)
```markdown
## Project Reflection: [Project Name]

### Project Overview
- **Duration**: [Actual vs estimated]
- **Scope**: [What was delivered]
- **Team**: [Who was involved]

### What Went Well
- [Successes and positive outcomes]

### Challenges Encountered
- [Issues and how they were resolved]

### Lessons Learned
- **Technical**: [Technical insights]
- **Process**: [Process improvements]
- **Team**: [Team dynamics insights]

### Recommendations
- **For Similar Projects**: [Specific advice]
- **For Process**: [Process improvements]
- **For Tools**: [Tool recommendations]

### Metrics
- **Time**: [Actual vs estimated]
- **Quality**: [Defect rates, etc.]
- **Satisfaction**: [Stakeholder feedback]
```

### Entry Criteria
- Implementation completed
- QA completed (if applicable)
- Task objectives achieved
- Time available for reflection

### Exit Criteria
- Lessons documented
- Improvements identified
- Knowledge shared
- Templates updated

### Best Practices
- Reflect while memory is fresh
- Be honest about challenges
- Focus on actionable insights
- Share learning with team
- Update processes based on insights

### Common Outputs
- Reflection documents
- Process improvements
- Updated templates
- Knowledge base entries

## 📁 ARCHIVE Mode: Knowledge Preservation and Organization

**Purpose**: Preserve knowledge, organize artifacts, and create reusable assets for future projects.

### Core Objectives
- **Preserve** project knowledge and artifacts
- **Organize** information for easy retrieval
- **Create** reusable templates and patterns
- **Maintain** searchable knowledge base

### Key Activities

#### Knowledge Preservation
- Archive all project artifacts
- Preserve decision rationale
- Document final outcomes
- Capture success metrics

#### Information Organization
- Categorize and tag content
- Create searchable metadata
- Establish naming conventions
- Organize by project type

#### Template Creation
- Extract reusable patterns
- Create project templates
- Document best practices
- Build pattern libraries

#### Knowledge Base Maintenance
- Update central knowledge base
- Cross-reference related projects
- Maintain searchability
- Ensure accessibility

### Archive Structure

#### Project Archive Template
```markdown
## Project Archive: [Project Name]

### Project Summary
- **Type**: [Level 1-4]
- **Duration**: [Actual time]
- **Team**: [Team members]
- **Outcome**: [Success/failure/partial]

### Artifacts
- **Planning**: [Links to planning documents]
- **Design**: [Links to design artifacts]
- **Code**: [Repository links]
- **Documentation**: [User and technical docs]
- **Tests**: [Test suites and reports]

### Key Decisions
- **Technical**: [Major technical decisions]
- **Design**: [Key design choices]
- **Process**: [Process decisions]

### Lessons Learned
- **What Worked**: [Successful approaches]
- **What Didn't**: [Failed approaches]
- **Recommendations**: [For future projects]

### Reusable Assets
- **Templates**: [Created templates]
- **Patterns**: [Useful patterns]
- **Code**: [Reusable components]

### Metadata
- **Tags**: [Search tags]
- **Related Projects**: [Similar projects]
- **Technologies**: [Tech stack used]
```

### Entry Criteria
- Project completed
- Reflection completed
- All artifacts available
- Knowledge ready for preservation

### Exit Criteria
- All artifacts archived
- Metadata created
- Templates extracted
- Knowledge base updated

### Best Practices
- Archive immediately after completion
- Use consistent naming conventions
- Create comprehensive metadata
- Extract reusable patterns
- Make archives searchable

### Common Outputs
- Project archives
- Reusable templates
- Pattern libraries
- Updated knowledge base

## 🔄 Mode Transitions and Flow

### Standard Workflows

#### Level 1 Workflow
```
🔍 VAN → 🔨 IMPLEMENT → 📚 REFLECT → 📁 ARCHIVE
```

#### Level 2 Workflow
```
🔍 VAN → 📋 PLAN → 🔨 IMPLEMENT → 📚 REFLECT → 📁 ARCHIVE
```

#### Level 3-4 Workflow
```
🔍 VAN → 📋 PLAN → 🎨 CREATIVE → 🔨 IMPLEMENT → ✅ QA → 📚 REFLECT → 📁 ARCHIVE
```

### Transition Guidelines

#### When to Move Forward
- All exit criteria met
- Deliverables completed
- Quality standards achieved
- Stakeholder approval obtained

#### When to Go Back
- New requirements discovered
- Quality issues found
- Assumptions proven wrong
- Better approach identified

#### Emergency Transitions
- Critical issues discovered
- Requirements significantly changed
- Resource constraints changed
- Timeline pressure

### Mode Customization

#### For Individual Developers
- Reduce documentation overhead
- Focus on personal learning
- Simplify approval processes
- Adapt to personal workflow

#### For Teams
- Add collaboration checkpoints
- Include peer reviews
- Enhance documentation
- Coordinate mode transitions

#### For Enterprise
- Add compliance checkpoints
- Include formal approvals
- Enhance audit trails
- Follow governance processes

## 📊 Mode Effectiveness Metrics

### Success Indicators

#### VAN Mode
- Accurate complexity assessment
- Appropriate workflow selection
- Complete environment analysis
- Clear next steps identified

#### PLAN Mode
- Comprehensive requirements capture
- Realistic timeline estimates
- Risk identification and mitigation
- Stakeholder alignment

#### CREATIVE Mode
- User-centered design decisions
- Technical feasibility validated
- Design consistency achieved
- Implementation clarity

#### IMPLEMENT Mode
- Requirements fully implemented
- Quality standards met
- Timeline adherence
- Technical debt minimized

#### QA Mode
- All tests passing
- Quality standards met
- Issues resolved
- Stakeholder satisfaction

#### REFLECT Mode
- Lessons captured
- Improvements identified
- Knowledge shared
- Processes updated

#### ARCHIVE Mode
- Knowledge preserved
- Assets organized
- Templates created
- Searchability maintained

### Optimization Strategies

#### Reducing Mode Switching
- Better upfront analysis
- Clearer exit criteria
- Improved planning
- Better risk management

#### Improving Quality
- Enhanced checklists
- Better testing strategies
- Regular reviews
- Continuous improvement

#### Accelerating Learning
- Regular reflection
- Knowledge sharing
- Template reuse
- Pattern recognition

---

**Next Steps**: Now that you understand each mode in detail, explore the [Best Practices Guide](best-practices.md) for advanced techniques, or return to the [Getting Started Guide](getting-started.md) to begin your Memory Bank journey.