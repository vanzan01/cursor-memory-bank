
---

#### **Phase 2: Core Refactoring (Abstraction to Pseudocode)**
-   **Purpose:** To decouple the rule logic from specific shell commands and environments, making them universally adaptable.
-   **Status:** `TODO`
-   **Progress:** 0%

**Tasks:**
-   **[TASK-P2-01]: Refactor `Core` rules.**
    -   **Description:** Abstract all hardcoded commands in the foundational rules.
    -   **Status:** `TODO`
    -   **Subtasks:**
        -   [ ] Identify platform-specific commands in all `Core/*.mdc` files.
        -   [ ] Replace with high-level pseudocode (e.g., `system.get_current_date()`).
        -   [ ] Add comments indicating the need for AI adaptation.
-   **[TASK-P2-02]: Refactor `visual-maps` and `Phases` rules.**
    -   **Description:** Abstract commands within the main workflow and phase-specific logic.
    -   **Status:** `TODO`
-   **[TASK-P2-03]: Refactor `CustomWorkflow` rules.**
    -   **Description:** Abstract commands in specialized workflow rules like `testing`, `refactoring`, etc.
    -   **Status:** `TODO`

---

#### **Phase 3: New Capability (Dynamic Script Management)**
-   **Purpose:** To implement a system where the AI can dynamically create and reuse scripts.
-   **Status:** `TODO`
-   **Progress:** 0%

**Tasks:**
-   **[TASK-P3-01]: Design the script management workflow.**
    -   **Description:** Define the logic the AI must follow: check for a script, create it if absent, then execute.
    -   **Status:** `TODO`
-   **[TASK-P3-02]: Integrate the workflow into `Core/command-execution.mdc`.**
    -   **Description:** Update the central command execution rule to include this new logic as a primary directive.
    -   **Status:** `TODO`
-   **[TASK-P3-03]: Create `memory-bank/scripts/` directory.**
    -   **Description:** Physically create the directory to store dynamically generated scripts.
    -   **Status:** `TODO`

---

#### **Phase 4: Final Validation & Documentation**
-   **Purpose:** To ensure the refactored system is cohesive, functional, and well-documented.
-   **Status:** `TODO`
-   **Progress:** 0%

**Tasks:**
-   **[TASK-P4-01]: Conduct a full review of all refactored rules.**
    -   **Description:** Verify clarity, consistency, and correctness of the new abstract rules.
    -   **Status:** `TODO`
-   **[TASK-P4-02]: Perform an end-to-end workflow dry run.**
    -   **Description:** Simulate a Level 3 task from `VAN` to `ARCHIVE` using the new rules to ensure logical continuity.
    -   **Status:** `TODO`
-   **[TASK-P4-03]: Update `ARCHITECTURE.md`.**
    -   **Description:** Create or update the master architecture document to reflect the new platform-agnostic design.
    -   **Status:** `TODO`

---

### **Risks and Mitigations**

| Risk ID | Description | Probability | Impact | Mitigation |
|:---|:---|:---|:---|:---|
| `RISK-01` | Loss of nuanced logic during translation from Russian to English. | Medium | Medium | Involve user in reviewing key translated rules. |
| `RISK-02` | Pseudocode is too ambiguous for the AI to correctly interpret. | Medium | High | Use a consistent, well-defined pseudocode syntax. Add explanatory comments. |
| `RISK-03` | Cross-references are broken during file renaming. | High | Medium | Perform a global search-and-replace for all renamed files after Phase 1. |
