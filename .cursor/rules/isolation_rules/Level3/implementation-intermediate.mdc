---
description: Level 3 Implementation: Building Intermediate Features
globs: "**/implementation-intermediate.mdc", "**/memory-bank/**"
alwaysApply: false
---
# LEVEL 3 IMPLEMENTATION: BUILDING INTERMEDIATE FEATURES

> **TL;DR:** This guide focuses on the systematic implementation of a planned and designed Level 3 feature. It emphasizes modular development, strict adherence to creative decisions and the style guide, integration with existing systems, and thorough feature-specific testing.

## 🛠️ Level 3 Feature Implementation Workflow

This workflow outlines the typical steps for building an intermediate feature.

```mermaid
graph TD
    StartImpl["Start L3 Implementation"] -->
    ReviewDocs["1. Review All Relevant Docs<br>(Tasks, Creative Docs, Style Guide)"] -->
    SetupEnv["2. Setup/Verify Dev Environment<br>(Branch, Tools, Dependencies)"] -->
    ModuleBreakdown["3. Break Down Feature into Modules/Major Components<br>(Based on plan in `tasks.md`)"] -->
    BuildIterate["4. Implement Modules/Components Iteratively"]

    BuildIterate --> ImplementModule["4a. Select Next Module/Component"]
    ImplementModule --> CodeModule["4b. Code Module<br>(Adhere to design, style guide, coding standards)"]
    CodeModule --> UnitTests["4c. Write & Pass Unit Tests"]
    UnitTests --> SelfReview["4d. Self-Review/Code Linting"]
    SelfReview --> MoreModules{"4e. More Modules<br>for this Feature?"}
    MoreModules -- Yes --> ImplementModule

    MoreModules -- No --> IntegrateModules["5. Integrate All Feature Modules/Components"]
    IntegrateModules --> IntegrationTesting["6. Perform Integration Testing<br>(Feature modules + existing system parts)"]
    IntegrationTesting --> E2EFeatureTesting["7. End-to-End Feature Testing<br>(Validate against user stories & requirements)"]
    E2EFeatureTesting --> AccessibilityCheck["8. Accessibility & Responsiveness Check<br>(If UI is involved)"]
    AccessibilityCheck --> CodeCleanup["9. Code Cleanup & Refinement"]
    CodeCleanup --> UpdateMB["10. Update Memory Bank<br>(`tasks.md` sub-tasks, `progress.md` details)"]
    UpdateMB --> FinalFeatureReview["11. Final Feature Review (Conceptual Peer Review if possible)"]
    FinalFeatureReview --> ImplementationDone["L3 Implementation Complete<br>Ready for REFLECT Mode"]

    style StartImpl fill:#e57373,stroke:#f44336
    style BuildIterate fill:#ffcdd2,stroke:#ef9a9a
    style ImplementationDone fill:#ef9a9a,stroke:#e57373
````

## 🔑 Key Considerations for Level 3 Implementation

  * **Modularity & Encapsulation:** Design and build the feature in well-defined, reusable, and loosely coupled modules or components.
  * **Adherence to Design:** Strictly follow the decisions documented in `memory-bank/creative-*.md` files and the `memory-bank/style-guide.md`. Deviations must be justified and documented.
  * **State Management:** If the feature introduces or significantly interacts with complex application state, ensure the state management strategy (potentially defined in CREATIVE mode) is correctly implemented and tested.
  * **API Interactions:**
      * If consuming new or existing APIs, ensure requests and responses are handled correctly, including error states.
      * If exposing new API endpoints as part of the feature, ensure they are robust, secure, and documented.
  * **Error Handling:** Implement user-friendly error messages and robust error handling within the feature's scope.
  * **Performance:** Be mindful of performance implications. Avoid common pitfalls like N+1 database queries, inefficient algorithms, or large asset loading without optimization, especially if identified as a concern in the PLAN or CREATIVE phase.
  * **Security:** Implement with security best practices in mind, particularly for features handling user input, authentication, or sensitive data. Refer to any security design decisions from CREATIVE mode.

## 🧪 Testing Focus for Level 3 Features

  * **Unit Tests:** Each new function, method, or logical unit within the feature's components should have corresponding unit tests. Aim for good coverage of core logic and edge cases.
  * **Component Tests (for UI features):** Test UI components in isolation, verifying rendering, props handling, and event emissions.
  * **Integration Tests:** Crucial for L3. Test how the different modules/components of the new feature work together. Also, test how the completed feature integrates with existing parts of the application it interacts with.
  * **User Scenario / Acceptance Tests (Feature-Specific):** Validate that the feature fulfills its defined requirements and user stories from the user's perspective. This can be manual or automated.

## 📝 Documentation During Implementation

  * **`memory-bank/tasks.md`:** Update the status of sub-tasks related to the feature as they are completed. Note any blockers or changes in estimates.
  * **`memory-bank/progress.md`:** Make regular entries detailing:
      * Modules/components completed.
      * Key decisions made during implementation (if minor and not warranting a full CREATIVE cycle).
      * Files significantly modified
      * Test results for major integration points.
      * Any deviations from the plan or creative designs, with rationale.
  * **Code Comments:** Write clear, concise comments explaining complex logic, assumptions, or TODOs.
  * **READMEs (if applicable):** If the feature introduces new modules or libraries that require specific setup or usage notes, consider adding or updating relevant README files.
