---
description: Visual process map for VAN QA mode (Technical Validation Entry Point)
globs: van-qa-main-optimized.mdc
alwaysApply: false
---
# VAN MODE: QA TECHNICAL VALIDATION (Main Entry)

> **TL;DR:** This is the entry point for the QA validation process that executes *after* CREATIVE mode and *before* BUILD mode. It ensures technical requirements are met before implementation begins.

## 📣 HOW TO USE THESE QA RULES

To access any QA validation rule or component, use the `fetch_rules` tool with exact rule names:

```
// CRITICAL: Always use fetch_rules to load validation components
// For detailed examples and guidance, load:
// isolation_rules/visual-maps/van-qa-utils/rule-calling-guide
```

## 🚀 VAN QA MODE ACTIVATION

After completing CREATIVE mode, when the user types "VAN QA", respond:

```mermaid
graph TD
    UserQA["User Types: QA"] --> HighPriority["⚠️ HIGH PRIORITY COMMAND"]
    HighPriority --> CurrentTask["Pause Current Task/Process"]
    CurrentTask --> LoadQA["Load QA Main Map (This File)"]
    LoadQA --> RunQA["Execute QA Validation Process"]
    RunQA --> QAResults{"QA Results"}

    QAResults -->|"PASS"| ResumeFlow["Resume Prior Process Flow"]
    QAResults -->|"FAIL"| FixIssues["Fix Identified Issues"]
    FixIssues --> ReRunQA["Re-run QA Validation"]
    ReRunQA --> QAResults

    style UserQA fill:#f8d486,stroke:#e8b84d,color:black
    style HighPriority fill:#ff0000,stroke:#cc0000,color:white,stroke-width:3px
    style LoadQA fill:#4da6ff,stroke:#0066cc,color:white
    style RunQA fill:#4da6ff,stroke:#0066cc,color:white
    style QAResults fill:#f6546a,stroke:#c30052,color:white
```

### QA Interruption Rules

1. **Immediate Precedence:** `QA` command interrupts everything.
2. **Load & Execute:** Load this map (`van-qa-main-optimized.mdc`) and its components (see below).
3. **Remediation Priority:** Fixes take priority over pending mode switches.
4. **Resume:** On PASS, resume the previous flow.

```
⚠️ QA OVERRIDE ACTIVATED
All other processes paused
QA validation checks now running...
Any issues found MUST be remediated before continuing with normal process flow
```

## 🔍 TECHNICAL VALIDATION OVERVIEW

Four-point validation process with selective loading:

```mermaid
graph TD
    VANQA["VAN QA MODE"] --> FourChecks["FOUR-POINT VALIDATION"]

    FourChecks --> DepCheck["1️⃣ DEPENDENCY VERIFICATION
    Load: van-qa-checks/dependency-check.mdc"]
    DepCheck --> ConfigCheck["2️⃣ CONFIGURATION VALIDATION
    Load: van-qa-checks/config-check.mdc"]
    ConfigCheck --> EnvCheck["3️⃣ ENVIRONMENT VALIDATION
    Load: van-qa-checks/environment-check.mdc"]
    EnvCheck --> MinBuildCheck["4️⃣ MINIMAL BUILD TEST
    Load: van-qa-checks/build-test.mdc"]

    MinBuildCheck --> ValidationResults{"All Checks<br>Passed?"}
    ValidationResults -->|"Yes"| SuccessReport["GENERATE SUCCESS REPORT
    Load: van-qa-utils/reports.mdc"]
    ValidationResults -->|"No"| FailureReport["GENERATE FAILURE REPORT
    Load: van-qa-utils/reports.mdc"]

    SuccessReport --> BUILD_Transition["Trigger BUILD Mode
    Load: van-qa-utils/mode-transitions.mdc"]
    FailureReport --> FixIssues["Fix Technical Issues
    Load: van-qa-utils/common-fixes.mdc"]
    FixIssues --> ReValidate["Re-validate (Re-run VAN QA)"]
    ReValidate --> FourChecks

    style VANQA fill:#4da6ff,stroke:#0066cc,color:white
    style FourChecks fill:#f6546a,stroke:#c30052,color:white
    style ValidationResults fill:#f6546a,stroke:#c30052,color:white
    style BUILD_Transition fill:#10b981,stroke:#059669,color:white
    style FixIssues fill:#ff5555,stroke:#dd3333,color:white
```

## 🔄 INTEGRATION WITH DESIGN DECISIONS

Reads Creative Phase outputs to inform validation:

```mermaid
graph TD
    Start["Read Design Decisions"] --> ReadCreative["Parse Creative Phase<br>Documentation"]
    ReadCreative --> ExtractTech["Extract Technology<br>Choices"]
    ExtractTech --> ExtractDeps["Extract Required<br>Dependencies"]
    ExtractDeps --> BuildValidationPlan["Build Validation<br>Plan"]
    BuildValidationPlan --> StartValidation["Start Four-Point<br>Validation Process"]

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style ExtractTech fill:#f6546a,stroke:#c30052,color:white
    style BuildValidationPlan fill:#10b981,stroke:#059669,color:white
    style StartValidation fill:#f6546a,stroke:#c30052,color:white
```

## 📋 COMPONENT LOADING SEQUENCE

The QA validation process follows this selective loading sequence:

1. **Main Entry (This File)**: `van-qa-main-optimized.mdc`
2. **Validation Checks**:
   - `van-qa-checks/dependency-check.mdc`
   - `van-qa-checks/config-check.mdc`
   - `van-qa-checks/environment-check.mdc`
   - `van-qa-checks/build-test.mdc`
3. **Utilities (As Needed)**:
   - `van-qa-utils/reports.mdc`
   - `van-qa-utils/common-fixes.mdc`
   - `van-qa-utils/mode-transitions.mdc`

## 📋 FINAL QA VALIDATION CHECKPOINT

```
✓ SECTION CHECKPOINT: QA VALIDATION
- Dependency Verification Passed? [YES/NO]
- Configuration Validation Passed? [YES/NO]
- Environment Validation Passed? [YES/NO]
- Minimal Build Test Passed? [YES/NO]

→ If all YES: Ready for BUILD mode transition.
→ If any NO: Fix identified issues and re-run VAN QA.
```

**Next Step (on PASS):** Trigger BUILD mode (load `van-qa-utils/mode-transitions.mdc`).
**Next Step (on FAIL):** Address issues (load `van-qa-utils/common-fixes.mdc`) and re-run `VAN QA`.