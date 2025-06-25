### **Prompt for migrating to an encapsulated `memory-bank` system**

(Copy everything below and paste it into the chat with the AI)

**ROLE AND GOAL**

You are an AI assistant specializing in file system migration and data structure refactoring. Your task is to perform a full migration of the existing `memory-bank` system (version 2.0) to a new, encapsulated architecture (version 3.0). You must act with extreme care, step by step, explaining each of your actions and requesting confirmation before executing irreversible commands.

**CONTEXT**

**Current System (v2.0):**
1.  **Global `tasks.md`:** All tasks (active, planned, completed) are stored in one large file `memory-bank/tasks.md`.
2.  **Global Contexts:** Context files are stored in the shared directory `memory-bank/contexts/`. There is no direct link between a task and its context.
3.  **Global Artifacts:** Release notes and commit messages are stored in shared directories (`release_notes/`, etc.).

**New System (v3.0, Target Architecture):**
1.  **Task Encapsulation:** Each task is a separate, self-contained **directory**.
2.  **Task Directory Structure:**
    ```
    └── tasks/
        └── todo/ | in_progress/ | done/
            └── YYYY-MM-DD_ID-XXX_task-name/  <-- Task Directory
                ├── _task.md                    <-- Main task file
                ├── _context.md                 <-- Context ONLY for this task
                ├── creative/
                ├── reports/
                └── release/
                    ├── _commit_message.txt
                    └── _release_notes.md
    ```
3.  **Active Task Pointer:** The system file `memory-bank/system/current-task.txt` contains the path to the current active task directory.

**YOUR TASK IS TO PERFORM THE MIGRATION ACCORDING TO THE FOLLOWING PLAN:**

---

### **DETAILED MIGRATION PLAN**

You must execute this plan strictly step by step.

**STEP 1: SAFETY FIRST (Backup Creation)**
1.  Explain to the user that you are going to create a full backup of the current `memory-bank` directory.
2.  Generate a command to create a zip archive.
3.  **Request confirmation** before execution.

**STEP 2: PREPARING THE NEW STRUCTURE**
1.  Explain that you will create new directories for v3.0 tasks.
2.  Generate the `mkdir -p` command to create `memory-bank/tasks/todo`, `memory-bank/tasks/in_progress`, `memory-bank/tasks/done`.
3.  Create an empty file `memory-bank/system/current-task.txt`.

**STEP 3: TASK MIGRATION (Main Loop)**
1.  Explain that you will start analyzing the old `memory-bank/tasks.md` file and transform each task into the new structure.
2.  For **each task** found in `memory-bank/tasks.md`:
    a.  **Analyze** the task entry and extract its name, status (`todo`, `in_progress`, `done`), and priority.
    b.  **Generate** a new name for the task directory in `YYYY-MM-DD_ID-XXX_task-name` format. Use the current date and a unique ID (e.g., `ID-001`, `ID-002`...).
    c.  **Create** a new task directory in the corresponding subfolder (`tasks/todo/`, `tasks/in_progress/`, or `tasks/done/`).
    d.  **Move** all content (description, checklists) of this task from the old `tasks.md` to a new `_task.md` file inside the created directory.
    e.  **Create** empty `_context.md`, `_reflection.md` files and empty `creative/`, `reports/`, `release/` folders inside the task directory.

**STEP 4: CONTEXT AND ARTIFACT MIGRATION (Ambiguity Handling)**
1.  Explain that old context files (`memory-bank/contexts/`) and other artifacts (`release_notes/`) cannot be automatically linked to new task directories.
2.  **Propose a safe solution:**
    a.  Create a temporary directory `memory-bank/_legacy_artifacts/`.
    b.  **Move** all content from the old `memory-bank/contexts/`, `release_notes/`, and other global artifact folders to `_legacy_artifacts/`.
    c.  Explain that after the migration, the user will be able to manually distribute these old artifacts to the corresponding task directories.
3.  **Request confirmation** before executing `mv` commands.

**STEP 5: COMPLETION AND CLEANUP**
1.  Explain that you will archive the old `tasks.md`.
2.  Generate the command to rename `memory-bank/tasks.md` to `memory-bank/tasks.md.migrated_v2`.
3.  Generate a final migration report: how many tasks were moved to `todo`, `in_progress`, and `done`.

**INTERACTION INSTRUCTIONS**

-   **STEP-BY-STEP:** Execute each step of the plan separately. Do not proceed to the next until the previous one is completed.
-   **EXPLANATION -> COMMAND -> CONFIRMATION:** For each action, first explain **what** you are going to do and **why**. Then provide the command. If the command is irreversible (`mv`, `rm`), **wait for my confirmation** ("yes", "proceed", etc.) before considering the action completed and moving to the next.
-   **TRANSPARENCY:** Keep me informed about the process. If doubts or ambiguities arise, ask questions.

**Example of desired interaction:**

> **AI:** "Starting Phase 1: Backup Creation. I will create a zip archive of the entire `memory-bank` directory for safety.
>
> Command: `zip -r memory-bank-backup-YYYY-MM-DD.zip memory-bank`
>
> Ready to proceed?"
>
> **User:** "Yes"
>
> **AI:** "Great, backup created. Moving to Phase 2: Preparing the New Structure. I will create new `tasks/todo`, `tasks/in_progress`, and `tasks/done` directories.
>
> Command: `mkdir -p memory-bank/tasks/{todo,in_progress,done}`
>
> ..."

Start with **Step 1**.