# Memory Bank Workflow Diagrams

> **Comprehensive visual guide to Memory Bank workflows with context management**

## 🔄 Complete Workflow with Context Management

```mermaid
graph TD
    Start[🚀 Project Start] --> CheckContext{📄 Context Exists?}

    CheckContext -->|Yes| RestoreContext[🔄 Restore Context<br>CONTINUE command]
    CheckContext -->|No| VanMode[🔍 VAN Mode<br>Initialize]

    RestoreContext --> ResumeMode{🎯 Resume Mode}
    ResumeMode --> VanMode
    ResumeMode --> PlanMode[📋 PLAN Mode]
    ResumeMode --> CreativeMode[🎨 CREATIVE Mode]
    ResumeMode --> ImplementMode[🔨 IMPLEMENT Mode]
    ResumeMode --> QAMode[✅ QA Mode]

    VanMode --> SaveContext1[💾 Save Context]
    SaveContext1 --> PlanMode

    PlanMode --> SaveContext2[💾 Update Context]
    SaveContext2 --> CreativeMode

    CreativeMode --> SaveContext3[💾 Update Context]
    SaveContext3 --> ImplementMode

    ImplementMode --> SaveContext4[💾 Update Context]
    SaveContext4 --> QAMode

    QAMode --> SaveContext5[💾 Update Context]
    SaveContext5 --> ReflectMode[📚 REFLECT Mode]

    ReflectMode --> ArchiveMode[📁 ARCHIVE Mode]
    ArchiveMode --> ClearContext[🗑️ Clear Context<br>Task Complete]

    ClearContext --> End[✅ Project Complete]

    %% Interruption handling
    VanMode -.->|Interruption| SaveState[💾 Save State]
    PlanMode -.->|Interruption| SaveState
    CreativeMode -.->|Interruption| SaveState
    ImplementMode -.->|Interruption| SaveState
    QAMode -.->|Interruption| SaveState

    SaveState -.-> WaitContinue[⏸️ Wait for CONTINUE]
    WaitContinue -.-> RestoreContext

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style CheckContext fill:#d94dbb,stroke:#a3378a,color:white
    style RestoreContext fill:#4dbb5f,stroke:#36873f,color:white
    style SaveContext1 fill:#ffa64d,stroke:#cc7a30,color:white
    style SaveContext2 fill:#ffa64d,stroke:#cc7a30,color:white
    style SaveContext3 fill:#ffa64d,stroke:#cc7a30,color:white
    style SaveContext4 fill:#ffa64d,stroke:#cc7a30,color:white
    style SaveContext5 fill:#ffa64d,stroke:#cc7a30,color:white
    style ClearContext fill:#ff5555,stroke:#cc0000,color:white
    style End fill:#5fd94d,stroke:#3da336,color:white
```

## 📊 Context Lifecycle Management

```mermaid
stateDiagram-v2
    [*] --> NoContext: Project Start

    NoContext --> ActiveContext: VAN Mode Start<br>Create Context
    ActiveContext --> UpdatedContext: Mode Transition<br>Update Progress
    UpdatedContext --> UpdatedContext: Continue Work<br>Update Details

    UpdatedContext --> PausedContext: Interruption<br>Save State
    PausedContext --> ActiveContext: CONTINUE Command<br>Restore State

    UpdatedContext --> CompletedContext: Task Complete<br>REFLECT/ARCHIVE
    CompletedContext --> [*]: Clear Context<br>Ready for Next Task

    ActiveContext --> ErrorContext: System Error<br>Emergency Save
    ErrorContext --> ActiveContext: Recovery<br>Restore Last State
```

## 🎯 Mode-Specific Context Operations

```mermaid
graph LR
    subgraph "VAN Mode Context"
        V1[📝 Create Context]
        V2[🔍 Scan Project]
        V3[📋 Discover Tasks]
        V4[💾 Save Initial State]
        V1 --> V2 --> V3 --> V4
    end

    subgraph "PLAN Mode Context"
        P1[📊 Update Progress]
        P2[📋 Plan Details]
        P3[🎯 Set Milestones]
        P4[💾 Save Plan State]
        P1 --> P2 --> P3 --> P4
    end

    subgraph "CREATIVE Mode Context"
        C1[🎨 Design Decisions]
        C2[📐 Architecture]
        C3[🔧 Technical Choices]
        C4[💾 Save Creative State]
        C1 --> C2 --> C3 --> C4
    end

    subgraph "IMPLEMENT Mode Context"
        I1[⚙️ Code Changes]
        I2[🔨 Build Progress]
        I3[📈 Implementation Status]
        I4[💾 Save Build State]
        I1 --> I2 --> I3 --> I4
    end

    subgraph "QA Mode Context"
        Q1[✅ Test Results]
        Q2[🐛 Bug Reports]
        Q3[📊 Quality Metrics]
        Q4[💾 Save QA State]
        Q1 --> Q2 --> Q3 --> Q4
    end
```

## 🔧 Command Flow with Context

```mermaid
sequenceDiagram
    participant User
    participant ContextEngine
    participant ModeController
    participant FileSystem

    User->>ContextEngine: VAN Command
    ContextEngine->>FileSystem: Check current-context.md
    FileSystem-->>ContextEngine: No context found
    ContextEngine->>ModeController: Initialize VAN Mode
    ModeController->>FileSystem: Create context file
    ModeController->>ContextEngine: Context created
    ContextEngine-->>User: VAN Mode active

    Note over User,FileSystem: Work interruption

    User->>ContextEngine: CONTINUE Command
    ContextEngine->>FileSystem: Read current-context.md
    FileSystem-->>ContextEngine: Context data
    ContextEngine->>ModeController: Restore previous mode
    ModeController-->>ContextEngine: Mode restored
    ContextEngine-->>User: Resumed where left off
```

## 📁 File System Integration

```mermaid
graph TD
    subgraph "Memory Bank Directory"
        subgraph "System Files"
            CurrentContext[📄 current-context.md<br>Active session state]
            InteractionMode[📝 interaction-mode.txt<br>AUTO/MANUAL mode]
            CurrentDate[📅 current-date.txt<br>Real date tracking]
        end

        subgraph "Task Management"
            TasksFile[📋 tasks.md<br>Current tasks]
            ProgressFile[📊 progress.md<br>Progress tracking]
        end

        subgraph "Archive System"
            ArchiveDir[📁 archive/<br>Completed projects]
            ReflectionDir[🤔 reflection/<br>Lessons learned]
            CreativeDir[🎨 creative/<br>Design decisions]
        end
    end

    subgraph "Rules System"
        CoreRules[🔧 .cursor/rules/<br>System rules]
        LocalRules[📝 rules/<br>Project rules]
    end

    CurrentContext --> TasksFile
    CurrentContext --> ProgressFile
    TasksFile --> ArchiveDir
    ReflectionDir --> ArchiveDir
    CreativeDir --> ArchiveDir

    CoreRules -.-> CurrentContext
    LocalRules -.-> CurrentContext
```

## 🚀 Project Discovery Flow

```mermaid
flowchart TD
    Start[🚀 VAN Mode Start] --> ScanRules[📁 Scan rules/ directory]
    ScanRules --> FindTasks[🔍 Find TODO/FIXME]
    FindTasks --> SearchCheckboxes[☑️ Search incomplete checkboxes]
    SearchCheckboxes --> RussianTasks[🇷🇺 Find Russian task markers]

    RussianTasks --> CompileContext[📋 Compile project context]
    CompileContext --> SaveContext[💾 Save to current-context.md]
    SaveContext --> PresentFindings[📊 Present findings to user]

    PresentFindings --> UserDecision{👤 User Decision}
    UserDecision -->|Continue with findings| ProceedWithTasks[▶️ Proceed with discovered tasks]
    UserDecision -->|Add new task| AddNewTask[➕ Add new task]
    UserDecision -->|Modify priorities| ModifyTasks[✏️ Modify task priorities]

    ProceedWithTasks --> NextMode[⏭️ Next Mode]
    AddNewTask --> NextMode
    ModifyTasks --> NextMode

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style ScanRules fill:#80bfff,stroke:#4da6ff,color:black
    style FindTasks fill:#80bfff,stroke:#4da6ff,color:black
    style SearchCheckboxes fill:#80bfff,stroke:#4da6ff,color:black
    style RussianTasks fill:#80bfff,stroke:#4da6ff,color:black
    style CompileContext fill:#ffa64d,stroke:#cc7a30,color:white
    style SaveContext fill:#4dbb5f,stroke:#36873f,color:white
    style NextMode fill:#5fd94d,stroke:#3da336,color:white
```

## 🔄 Universal Mode with Context

```mermaid
graph TD
    UniversalStart[🌐 UNIVERSAL Mode] --> ContextCheck{📄 Context?}

    ContextCheck -->|Exists| RestoreUniversal[🔄 Restore Universal Context]
    ContextCheck -->|New| InitUniversal[🚀 Initialize Universal]

    RestoreUniversal --> ResumePhase{📍 Resume Phase}
    InitUniversal --> VanPhase[🔍 VAN Phase]

    ResumePhase --> VanPhase
    ResumePhase --> PlanPhase[📋 PLAN Phase]
    ResumePhase --> CreativePhase[🎨 CREATIVE Phase]
    ResumePhase --> ImplementPhase[🔨 IMPLEMENT Phase]
    ResumePhase --> QAPhase[✅ QA Phase]
    ResumePhase --> ReflectPhase[📚 REFLECT Phase]

    VanPhase --> UpdateContext1[💾 Update Context]
    UpdateContext1 --> PlanPhase

    PlanPhase --> UpdateContext2[💾 Update Context]
    UpdateContext2 --> CreativePhase

    CreativePhase --> UpdateContext3[💾 Update Context]
    UpdateContext3 --> ImplementPhase

    ImplementPhase --> UpdateContext4[💾 Update Context]
    UpdateContext4 --> QAPhase

    QAPhase --> UpdateContext5[💾 Update Context]
    UpdateContext5 --> ReflectPhase

    ReflectPhase --> ArchivePhase[📁 ARCHIVE Phase]
    ArchivePhase --> ClearUniversalContext[🗑️ Clear Universal Context]

    ClearUniversalContext --> UniversalComplete[✅ Universal Complete]

    %% Auto-transition indicators
    VanPhase -.->|Auto Transition| PlanPhase
    PlanPhase -.->|Auto Transition| CreativePhase
    CreativePhase -.->|Auto Transition| ImplementPhase
    ImplementPhase -.->|Auto Transition| QAPhase
    QAPhase -.->|Auto Transition| ReflectPhase

    style UniversalStart fill:#6a5acd,stroke:#4b0082,color:white
    style RestoreUniversal fill:#4dbb5f,stroke:#36873f,color:white
    style UpdateContext1 fill:#ffa64d,stroke:#cc7a30,color:white
    style UpdateContext2 fill:#ffa64d,stroke:#cc7a30,color:white
    style UpdateContext3 fill:#ffa64d,stroke:#cc7a30,color:white
    style UpdateContext4 fill:#ffa64d,stroke:#cc7a30,color:white
    style UpdateContext5 fill:#ffa64d,stroke:#cc7a30,color:white
    style UniversalComplete fill:#5fd94d,stroke:#3da336,color:white
```

## 📈 Context Performance Metrics

```mermaid
graph LR
    subgraph "Context Metrics"
        SaveTime[⏱️ Save Time<br>< 2 seconds]
        RestoreTime[🔄 Restore Time<br>< 5 seconds]
        Accuracy[🎯 Accuracy<br>100% state preservation]
        Reliability[🛡️ Reliability<br>99.9% uptime]
    end

    subgraph "User Experience"
        Continuity[🔗 Seamless Continuity]
        NoDataLoss[💾 Zero Data Loss]
        FastResume[⚡ Instant Resume]
        SmartDiscovery[🧠 Smart Discovery]
    end

    SaveTime --> Continuity
    RestoreTime --> FastResume
    Accuracy --> NoDataLoss
    Reliability --> SmartDiscovery
```

This comprehensive workflow documentation shows how Memory Bank's context management system ensures seamless development continuity across all modes and scenarios.