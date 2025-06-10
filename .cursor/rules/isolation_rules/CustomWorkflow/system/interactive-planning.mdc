---
description: "Interactive planning methodology for PLAN mode with clarifying questions"
globs: "**/planning/**", "**/PLAN/**", "**/plan-mode/**"
alwaysApply: false
---

# INTERACTIVE PLANNING METHODOLOGY

> **TL;DR:** This rule implements interactive planning for PLAN mode, ensuring clarifying questions are asked when requirements are unclear, preventing assumptions and improving planning quality.

## 🎯 INTERACTIVE PLANNING OVERVIEW

The Interactive Planning system activates in PLAN mode when interaction-mode is set to "MANUAL", ensuring the AI asks clarifying questions instead of making assumptions about unclear requirements.

### Core Principles

**Question-First Approach**
- Ask clarifying questions before making assumptions
- Gather complete requirements before planning
- Validate understanding with user confirmation
- Document all clarifications in planning documents

**Structured Inquiry**
- Use categorized question templates
- Follow logical question sequences
- Prioritize critical clarifications first
- Maintain context throughout conversation

## 📋 QUESTION CATEGORIES

### 1. Scope Clarification Questions
**When to use**: Requirements are vague or incomplete
**Examples**:
- "What specific functionality should be included/excluded?"
- "Are there any constraints or limitations I should consider?"
- "What is the expected timeline for this feature?"

### 2. Technical Specification Questions
**When to use**: Technical details are missing
**Examples**:
- "Which technologies or frameworks should be used?"
- "Are there existing systems this needs to integrate with?"
- "What are the performance requirements?"

### 3. User Experience Questions
**When to use**: UX/UI aspects are unclear
**Examples**:
- "Who is the target user for this feature?"
- "What is the expected user workflow?"
- "Are there accessibility requirements?"

### 4. Implementation Priority Questions
**When to use**: Multiple approaches are possible
**Examples**:
- "Should we prioritize speed of development or long-term maintainability?"
- "Are there any features that are must-have vs nice-to-have?"
- "What is the acceptable level of technical debt for this iteration?"

## 🔄 INTERACTIVE PLANNING WORKFLOW

```mermaid
graph TD
    Start["🚀 PLAN Mode Start"] --> CheckMode{"🔍 Check Interaction Mode"}
    CheckMode -->|"AUTO"| AutoPlan["🤖 Automatic Planning"]
    CheckMode -->|"MANUAL"| LoadQuestions["📋 Load Question Templates"]

    LoadQuestions --> AnalyzeRequest["🔍 Analyze User Request"]
    AnalyzeRequest --> IdentifyGaps{"❓ Identify Information Gaps"}

    IdentifyGaps -->|"Gaps Found"| SelectQuestions["📝 Select Relevant Questions"]
    IdentifyGaps -->|"Complete"| CreatePlan["📋 Create Implementation Plan"]

    SelectQuestions --> AskQuestions["❓ Ask Clarifying Questions"]
    AskQuestions --> WaitResponse["⏳ Wait for User Response"]
    WaitResponse --> ProcessAnswers["📝 Process Answers"]
    ProcessAnswers --> UpdateContext["🔄 Update Planning Context"]
    UpdateContext --> IdentifyGaps

    CreatePlan --> ValidatePlan["✅ Validate Plan with User"]
    ValidatePlan --> DocumentPlan["📚 Document Final Plan"]

    AutoPlan --> DocumentPlan
    DocumentPlan --> Complete["✅ Planning Complete"]

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style CheckMode fill:#d94dbb,stroke:#a3378a,color:white
    style LoadQuestions fill:#4dbb5f,stroke:#36873f,color:white
    style AskQuestions fill:#ffa64d,stroke:#cc7a30,color:white
    style CreatePlan fill:#4dbbbb,stroke:#368787,color:white
    style Complete fill:#5fd94d,stroke:#3da336,color:white
```

## 📝 QUESTION SELECTION ALGORITHM

### Priority Matrix

**CRITICAL (Must Ask)**
- Scope boundaries and constraints
- Technical requirements and dependencies
- User safety and security considerations
- Performance and scalability requirements

**HIGH (Should Ask)**
- Implementation preferences and priorities
- Integration requirements
- Timeline and resource constraints
- Quality and testing requirements

**MEDIUM (May Ask)**
- Nice-to-have features
- Future extensibility considerations
- Alternative implementation approaches
- Documentation and maintenance preferences

**LOW (Optional)**
- Aesthetic preferences
- Minor implementation details
- Non-critical optimizations
- Advanced configuration options

### Question Selection Rules

1. **Always ask CRITICAL questions** if information is missing
2. **Ask HIGH priority questions** for complex features (Level 3-4)
3. **Ask MEDIUM questions** when multiple valid approaches exist
4. **Skip LOW questions** unless specifically relevant

## 🔧 IMPLEMENTATION INTEGRATION

### File System Integration

**Question Templates**: `memory-bank/config/questions.yaml`
- Categorized question templates
- Context-specific question sets
- Priority-based question ordering
- Customizable question formats

**Planning Context**: `memory-bank/planning-context.md`
- Current planning session state
- Questions asked and answers received
- Identified gaps and clarifications needed
- Planning decisions and rationale

**Interaction Mode**: `memory-bank/system/interaction-mode.txt`
- Current interaction mode (AUTO/MANUAL)
- Mode-specific behavior settings
- User preferences and overrides
- Session-specific configurations

### Mode Integration

**VAN Mode Integration**
- Check interaction mode on startup
- Load question templates if MANUAL mode
- Prepare interactive planning context
- Initialize clarification tracking

**PLAN Mode Integration**
- Activate interactive planning if MANUAL mode
- Use question templates for clarifications
- Document all questions and answers
- Validate plan completeness before proceeding

**CREATIVE Mode Integration**
- Present options for user choice in MANUAL mode
- Ask for preferences on architectural decisions
- Gather input on design trade-offs
- Document user preferences for future reference

## 📊 QUALITY METRICS

### Planning Quality Indicators

**Completeness Score**
- All critical questions answered: +25 points
- All high priority questions addressed: +20 points
- Clear scope definition: +15 points
- Technical requirements specified: +15 points
- Implementation approach defined: +15 points
- Timeline and milestones set: +10 points

**Clarity Score**
- No ambiguous requirements: +20 points
- Clear acceptance criteria: +20 points
- Well-defined deliverables: +20 points
- Explicit constraints documented: +20 points
- Dependencies identified: +20 points

**User Engagement Score**
- User actively participated in clarifications: +25 points
- User validated final plan: +25 points
- User provided detailed answers: +25 points
- User confirmed understanding: +25 points

### Success Thresholds

- **EXCELLENT**: 90-100 points - Plan ready for implementation
- **GOOD**: 75-89 points - Minor clarifications may be needed
- **ACCEPTABLE**: 60-74 points - Some assumptions documented
- **POOR**: <60 points - Significant gaps remain, more clarification needed

## 🚨 ERROR HANDLING

### Missing Information Handling

**Critical Information Missing**
- Block progression to CREATIVE/IMPLEMENT modes
- Require explicit user confirmation to proceed
- Document assumptions clearly
- Set up validation checkpoints

**Non-Critical Information Missing**
- Document assumptions made
- Note areas for future clarification
- Proceed with documented caveats
- Plan validation points during implementation

### User Non-Response Handling

**Timeout Handling**
- Wait reasonable time for responses (default: 15 minutes)
- Send reminder after 10 minutes
- Escalate to assumption mode after timeout
- Document all assumptions made

**Incomplete Responses**
- Ask follow-up questions for clarity
- Summarize understanding for confirmation
- Identify remaining gaps
- Prioritize most critical missing information

## 📚 BEST PRACTICES

### Question Formulation

**Clear and Specific**
- Use concrete examples when possible
- Avoid technical jargon unless necessary
- Provide context for why information is needed
- Offer multiple choice options when appropriate

**Respectful and Efficient**
- Group related questions together
- Prioritize most important questions first
- Explain the impact of different choices
- Acknowledge user's time constraints

### Context Preservation

**Document Everything**
- Record all questions asked
- Save all answers received
- Note any assumptions made
- Track decision rationale

**Maintain Continuity**
- Reference previous clarifications
- Build on established context
- Avoid repeating resolved questions
- Connect new questions to existing understanding

This interactive planning methodology ensures high-quality planning by gathering complete requirements through structured questioning, preventing costly assumptions and rework during implementation phases.