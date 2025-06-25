---
description: "IMPLEMENT mode integration rules for Memory Bank workflow"
globs: "**/implement/**", "**/IMPLEMENT/**", "**/workflow/**"
alwaysApply: false
---

# IMPLEMENT MODE INTEGRATION

> **TL;DR:** Integration rules for IMPLEMENT mode within Memory Bank workflow system, ensuring systematic implementation following planned approach and proper transition to quality assurance.

```mermaid
graph TD
    Start["🔨 IMPLEMENT MODE ACTIVATION"] --> LoadPlan["📖 Load Implementation Plan"]
    LoadPlan --> DetermineLevel["🧩 Determine Complexity Level"]

    DetermineLevel --> Level1["Level 1: Quick Bug Fix"]
    DetermineLevel --> Level2["Level 2: Simple Enhancement"]
    DetermineLevel --> Level3["Level 3: Intermediate Feature"]
    DetermineLevel --> Level4["Level 4: Complex System"]

    Level1 --> DirectFix["🔧 Direct Implementation<br>Single focused fix"]
    Level2 --> SequentialBuild["📋 Sequential Build<br>Component by component"]
    Level3 --> PhasedBuild["🎯 Phased Implementation<br>With testing between phases"]
    Level4 --> ArchitecturalBuild["🏗️ Architectural Implementation<br>Multiple coordinated phases"]

    DirectFix --> TestChanges["✅ Test Changes"]
    SequentialBuild --> TestChanges
    PhasedBuild --> TestChanges
    ArchitecturalBuild --> TestChanges

    TestChanges --> UpdateTasks["📝 Update tasks.md"]
    UpdateTasks --> SuggestNext["➡️ Suggest Next Mode"]

    style Start fill:#ff5555,stroke:#cc0000,color:white
    style Level1 fill:#4dbb5f,stroke:#36873f,color:white
    style Level2 fill:#ffa64d,stroke:#cc7a30,color:white
    style Level3 fill:#ff5555,stroke:#cc0000,color:white
    style Level4 fill:#d971ff,stroke:#a33bc2,color:white
    style TestChanges fill:#4dbbbb,stroke:#368787,color:white
```

## IMPLEMENT MODE RESPONSIBILITIES

### Primary Functions:
1. **Plan Execution**: Follow implementation plan systematically
2. **Code Implementation**: Write and modify code according to specifications
3. **Testing Integration**: Test changes as they are implemented
4. **Progress Tracking**: Update Memory Bank with implementation progress
5. **Quality Assurance**: Ensure code quality and functionality

### Integration Points:
- **Memory Bank Files**: tasks.md, activeContext.md, progress.md
- **Implementation Plan**: implementation-plan.md guidance
- **Testing System**: Automated and manual testing integration
- **Command Execution**: Following command-execution.mdc rules

## COMPLEXITY-BASED IMPLEMENTATION

### Level 1: Quick Bug Fix Implementation
```mermaid
graph TD
    L1Start["Level 1 Implementation"] --> LocateBug["🔍 Locate Bug Code"]
    LocateBug --> ApplyFix["🔧 Apply Targeted Fix"]
    ApplyFix --> TestFix["✅ Test Fix Works"]
    TestFix --> VerifyNoRegression["🔍 Verify No Regression"]
    VerifyNoRegression --> Complete["✅ Implementation Complete"]

    style L1Start fill:#4dbb5f,stroke:#36873f,color:white
    style Complete fill:#5fd94d,stroke:#3da336,color:white
```

**Implementation Approach**: Direct, focused fix with immediate testing

### Level 2: Simple Enhancement Implementation
```mermaid
graph TD
    L2Start["Level 2 Implementation"] --> BuildComponents["🧩 Build Components"]
    BuildComponents --> TestComponent["✅ Test Each Component"]
    TestComponent --> IntegrateComponents["🔗 Integrate Components"]
    IntegrateComponents --> TestIntegration["✅ Test Integration"]
    TestIntegration --> Complete["✅ Implementation Complete"]

    style L2Start fill:#ffa64d,stroke:#cc7a30,color:white
    style Complete fill:#5fd94d,stroke:#3da336,color:white
```

**Implementation Approach**: Sequential component building with integration testing

### Level 3: Intermediate Feature Implementation
```mermaid
graph TD
    L3Start["Level 3 Implementation"] --> Phase1["📋 Phase 1: Core Components"]
    Phase1 --> TestPhase1["✅ Test Phase 1"]
    TestPhase1 --> Phase2["📋 Phase 2: Secondary Components"]
    Phase2 --> TestPhase2["✅ Test Phase 2"]
    TestPhase2 --> Phase3["📋 Phase 3: Integration & Polish"]
    Phase3 --> TestPhase3["✅ Test Phase 3"]
    TestPhase3 --> Complete["✅ Implementation Complete"]

    style L3Start fill:#ff5555,stroke:#cc0000,color:white
    style Complete fill:#5fd94d,stroke:#3da336,color:white
```

**Implementation Approach**: Phased implementation with testing between phases

### Level 4: Complex System Implementation
```mermaid
graph TD
    L4Start["Level 4 Implementation"] --> ArchPhase1["🏗️ Architecture Phase"]
    ArchPhase1 --> TestArch["✅ Test Architecture"]
    TestArch --> CorePhase["🧩 Core Systems Phase"]
    CorePhase --> TestCore["✅ Test Core Systems"]
    TestCore --> IntegrationPhase["🔗 Integration Phase"]
    IntegrationPhase --> TestIntegration["✅ Test Integration"]
    TestIntegration --> PolishPhase["✨ Polish & Optimization"]
    PolishPhase --> FinalTest["✅ Final Testing"]
    FinalTest --> Complete["✅ Implementation Complete"]

    style L4Start fill:#d971ff,stroke:#a33bc2,color:white
    style Complete fill:#5fd94d,stroke:#3da336,color:white
```

**Implementation Approach**: Multi-phase architectural implementation with comprehensive testing

## COMMAND EXECUTION INTEGRATION

### Following Command Execution Rules:
- **Platform Awareness**: Adapt commands for current platform (macOS/Linux/Windows)
- **Directory Verification**: Ensure commands run from correct directory
- **Command Chaining**: Use efficient command chaining where appropriate
- **Error Handling**: Proper error handling and recovery procedures
- **Documentation**: Document all commands and their results

### Command Documentation Template:
```markdown
## Command Execution: [Purpose]

### Command
```
[actual command or chain]
```

### Result
```
[command output]
```

### Effect
[Brief description of what changed in the system]

### Next Steps
[What needs to be done next]
```

## TESTING INTEGRATION

### Testing Strategy by Level:
- **Level 1**: Focused unit testing of fix
- **Level 2**: Component testing + integration testing
- **Level 3**: Phase-based testing + comprehensive integration testing
- **Level 4**: Architectural testing + system-wide testing + performance testing

### Testing Checkpoints:
```mermaid
graph TD
    Implement["Implementation Step"] --> UnitTest["🧪 Unit Tests"]
    UnitTest --> IntegrationTest["🔗 Integration Tests"]
    IntegrationTest --> SystemTest["🖥️ System Tests"]
    SystemTest --> UserTest["👤 User Acceptance Tests"]
    UserTest --> Complete["✅ Testing Complete"]

    style Implement fill:#ff5555,stroke:#cc0000,color:white
    style Complete fill:#5fd94d,stroke:#3da336,color:white
```

## MEMORY BANK INTEGRATION

### Core File Updates:
1. **tasks.md**: Update with implementation progress and status
2. **activeContext.md**: Maintain current implementation context
3. **progress.md**: Record implementation milestones and completion
4. **implementation-log.md**: Detailed log of implementation steps

### Progress Tracking:
- **Phase Completion**: Mark phases as complete in tasks.md
- **Code Changes**: Document significant code changes
- **Testing Results**: Record testing outcomes
- **Issues Encountered**: Document and resolve implementation issues

## MODE TRANSITION LOGIC

### Next Mode Determination:
```mermaid
graph TD
    ImplComplete["Implementation Complete"] --> HasIssues{"Issues Found<br>During Testing?"}
    HasIssues -->|"Yes"| BackToImplement["🔄 Continue IMPLEMENT<br>Fix Issues"]
    HasIssues -->|"No"| CheckComplexity{"Complexity Level?"}

    CheckComplexity -->|"Level 1-2"| ToReflect["➡️ To REFLECT Mode"]
    CheckComplexity -->|"Level 3-4"| ToQA["➡️ To QA Mode"]

    BackToImplement --> ImplComplete
    ToQA --> QAComplete["QA Complete"]
    QAComplete --> ToReflect

    ToReflect --> UpdateContext["📝 Update activeContext.md"]
    UpdateContext --> ReadyForReflection["✅ Ready for Reflection"]

    style ImplComplete fill:#ff5555,stroke:#cc0000,color:white
    style HasIssues fill:#ffa64d,stroke:#cc7a30,color:white
    style ToQA fill:#d971ff,stroke:#a33bc2,color:white
    style ToReflect fill:#4dbb5f,stroke:#36873f,color:white
```

## VERIFICATION CHECKLIST

```
✓ IMPLEMENT MODE INTEGRATION CHECKLIST
- Implementation plan loaded and followed? [YES/NO]
- Complexity-appropriate approach used? [YES/NO]
- All planned components implemented? [YES/NO]
- Code changes tested thoroughly? [YES/NO]
- Command execution documented? [YES/NO]
- No regressions introduced? [YES/NO]
- tasks.md updated with progress? [YES/NO]
- Implementation log maintained? [YES/NO]
- Next mode transition prepared? [YES/NO]

→ If all YES: Implementation complete, ready for next mode
→ If any NO: Complete missing implementation elements
```

## ERROR HANDLING

### Common Implementation Issues:
1. **Build Failures**: Debug and resolve compilation/build errors
2. **Test Failures**: Identify and fix failing tests
3. **Integration Problems**: Resolve component integration issues
4. **Performance Issues**: Optimize code for performance requirements

### Recovery Procedures:
- **Rollback Strategy**: Maintain ability to rollback changes
- **Incremental Fixes**: Apply fixes incrementally with testing
- **Documentation**: Document all issues and their resolutions
- **Learning Integration**: Update implementation approach based on learnings

## IMPLEMENTATION EXAMPLES

### Level 1 Bug Fix:
```
IMPLEMENT Mode Activated
📖 Loading bug fix plan for authentication issue
🔍 Located bug in auth.js line 45
🔧 Applied targeted fix: corrected token validation
✅ Tested fix: authentication now works correctly
📝 Updated tasks.md: Bug fix complete
➡️ Suggesting REFLECT mode for review
```

### Level 3 Feature Implementation:
```
IMPLEMENT Mode Activated
📖 Loading feature implementation plan
📋 Phase 1: Implementing core user management components
✅ Phase 1 testing complete
📋 Phase 2: Implementing user interface components
✅ Phase 2 testing complete
📋 Phase 3: Integration and polish
✅ Phase 3 testing complete
📝 Updated tasks.md: Feature implementation complete
➡️ Suggesting QA mode for comprehensive testing
```

This integration ensures IMPLEMENT mode executes planned changes systematically while maintaining quality through appropriate testing and providing clear transition to the next workflow phase.