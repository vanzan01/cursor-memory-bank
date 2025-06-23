---
description: Level 3 Archive: Intermediate Feature Documentation
globs: "**/archive-intermediate.mdc", "**/memory-bank/**"
alwaysApply: false
---

# LEVEL 3 ARCHIVE: INTERMEDIATE FEATURE DOCUMENTATION

> **TL;DR:** This guide outlines the archiving process for a completed Level 3 intermediate feature. The aim is to create a self-contained, easily accessible record of the feature's development lifecycle, including its planning, design decisions, implementation summary, and reflection.

## 🚀 Before You Start Archiving (L3 Pre-Archive Checklist)

1.  **Confirm Reflection Complete:** Verify in `memory-bank/tasks.md` that the reflection phase for this feature is marked as complete and `memory-bank/reflection-[feature_id].md` exists and is finalized.
2.  **Gather All Feature-Specific Documents:**
    * The feature plan section from `memory-bank/tasks.md` (or a copy of it).
    * All `memory-bank/creative/creative-[aspect_name].md` documents related to this feature.
    * The `memory-bank/reflection/reflection-[feature_id].md` document.
    * Key diagrams or architectural notes from `memory-bank/progress.md` if not captured elsewhere.
    * A link to the primary commit(s) or feature branch merge for the implemented code.

## 📦 Level 3 Archiving Workflow

```mermaid
graph TD
    StartArchive["Start L3 Archiving"] -->
    VerifyReflect["1. Verify Reflection Complete<br>Check `tasks.md` & `reflection-[feature_id].md`"] -->
    GatherDocs["2. Gather All Feature Documents<br>(Plan, Creative outputs, Reflection, Code links)"] -->
    CreateArchiveFile["3. Create Feature Archive File<br>e.g., `memory-bank/archive/feature-[FeatureNameOrID]_YYYYMMDD.md`"] -->
    PopulateArchive["4. Populate Archive File<br>(Using L3 Archive Template below)"] -->
    VerifyLinks["5. Verify All Internal Links<br>in Archive File are Correct"] -->
    FinalUpdateTasks["6. Final Update to `tasks.md`<br>(Mark Feature FULLY COMPLETED & ARCHIVED, link to archive file)"] -->
    UpdateProgressFile["7. Add Final Entry to `progress.md`<br>(Note archiving & link to archive file)"] -->
    ClearActiveCtx["8. Clear `activeContext.md`<br>Reset for Next Task/Project"] -->
    ArchiveDone["L3 Archiving Complete<br>Feature successfully documented and closed."]

    style StartArchive fill:#90a4ae,stroke:#607d8b
    style ArchiveDone fill:#b0bec5,stroke:#90a4ae
````

## 📝 Structure for `memory-bank/archive/feature-[FeatureNameOrID]_YYYYMMDD.md`

  * **Feature Title:** (e.g., "Archive: User Profile Feature - Avatar Upload Enhancement")
  * **Feature ID (from `tasks.md`):**
  * **Date Archived:** YYYY-MM-DD
  * **Status:** COMPLETED & ARCHIVED
  * **1. Feature Overview:**
      * Brief description of the feature and its purpose (can be extracted from `tasks.md` or `projectbrief.md`).
      * Link to the original task entry/plan in `tasks.md` (if `tasks.md` is versioned or kept historically).
  * **2. Key Requirements Met:**
      * List the main functional and non-functional requirements this feature addressed.
  * **3. Design Decisions & Creative Outputs:**
      * Summary of key design choices.
      * Direct links to all relevant `memory-bank/creative/creative-[aspect_name].md` documents.
      * Link to `memory-bank/style-guide.md` version used (if applicable).
  * **4. Implementation Summary:**
      * High-level overview of how the feature was implemented.
      * List of primary new components/modules created.
      * Key technologies or libraries utilized specifically for this feature.
      * Link to the main feature branch merge commit or primary code location/pull request.
  * **5. Testing Overview:**
      * Brief summary of the testing strategy employed for this feature (unit, integration, E2E).
      * Outcome of the testing.
  * **6. Reflection & Lessons Learned:**
      * Direct link to `memory-bank/reflection/reflection-[feature_id].md`.
      * Optionally, copy 1-2 most critical lessons directly into the archive summary.
  * **7. Known Issues or Future Considerations (Optional, if any remaining from reflection):**
      * Any minor known issues deferred.
      * Potential future enhancements related to this feature.

### Key Files and Components Affected (from tasks.md)
[Summary or direct copy of file/component checklists from the original tasks.md for this project. This provides a quick reference to the scope of changes at a component/file level.]

## 📌 What to Emphasize in L3 Archiving

  * **Self-Contained Feature Record:** The goal is to have a go-to document in the archive that summarizes the "story" of this feature.
  * **Traceability:** Easy navigation from the archive summary to detailed planning, design, and reflection documents.
  * **Maintainability Focus:** Information that would help a future developer understand, maintain, or build upon this specific feature.
  * **Not a Full System Archive:** Unlike Level 4, this is not about archiving the entire application state, but rather the lifecycle of one significant feature.
