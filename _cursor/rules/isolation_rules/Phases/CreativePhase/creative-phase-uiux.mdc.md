---
description: UI/UX Design Guidelines and Process for the Creative Phase
globs: creative-phase-uiux.mdc
alwaysApply: false
---
Okay, I've updated the style guide location to `memory-bank/style-guide.md` and will provide the entire content for the new `creative-phase-uiux.md` file within a single markdown code block for easy copying. I've also reviewed the Mermaid diagrams to ensure they are correctly formatted.

# Creative Phase: UI/UX Design Guidelines

**Document Purpose:** This document outlines the structured approach for UI/UX design decisions during the Creative Phase. It ensures user-centric designs, exploration of multiple options, adherence to a style guide (if available or created), and clear documentation of UI/UX choices, aligning with React/Tailwind best practices.

## 🎨 UI/UX Design Philosophy

* **User-Centricity**: Designs must prioritize the user's needs, goals, and context.
* **Clarity & Simplicity**: Interfaces should be intuitive and easy to understand.
* **Consistency**: Maintain consistency with established design patterns, project-specific styles, and platform conventions.
* **Accessibility (A11y)**: Adhere to WCAG guidelines to ensure usability for people with disabilities.
* **Efficiency**: Enable users to accomplish tasks with minimal effort.
* **Feedback**: Provide clear and timely feedback for user actions.
* **Visual Cohesion**: Ensure new UI elements align with the existing or defined project style guide.

## 🌊 UI/UX Design Workflow

This workflow guides the UI/UX design process within the Creative Phase, incorporating a crucial style guide check.

```mermaid
graph TD
    Start["UI/UX Design Start"] --> StyleGuideCheck["0. Style Guide Check<br>Attempt to locate 'memory-bank/style-guide.md' or user-provided path."]
    StyleGuideCheck --> HasStyleGuide{"Style Guide<br>Available/Loaded?"}

    HasStyleGuide -- "Yes" --> Understand["Understand User & Task<br>(Personas, User Stories, Requirements)"]
    HasStyleGuide -- "No" --> PromptCreateStyleGuide["Prompt User: Create/Link Style Guide?"]

    PromptCreateStyleGuide --> UserResponse{"User Opts to Create/Link?"}
    UserResponse -- "Yes, Create" --> DefineStyleGuideSubProcess["SUB-PROCESS:Define Basic Style Guide"]
    UserResponse -- "Yes, Link" --> LinkStyleGuide["User provides path/URL.<br>Load Style Guide."]
    UserResponse -- "No" --> Understand_NoGuide["Understand User & Task<br>(Proceeding without Style Guide - WARN user of inconsistencies)"]

    DefineStyleGuideSubProcess --> StyleGuideCreated["Basic 'memory-bank/style-guide.md' Created/Defined"]
    StyleGuideCreated --> Understand
    LinkStyleGuide --> Understand
    Understand_NoGuide --> InfoArch_NoGuide["Information Architecture"]

    Understand --> InfoArch["Information Architecture<br>(Structure, Navigation, Content Hierarchy)"]
    InfoArch --> Interaction["Interaction Design<br>(User Flows, Wireframes, Prototypes - Conceptual)"]
    Interaction --> VisualDesign["Visual Design<br>(APPLY STYLE GUIDE, Leverage React/Tailwind, Mockups - Conceptual)"]
    VisualDesign --> Options["Explore UI/UX Options<br>(Generate 2-3 distinct solutions)"]
    Options --> Evaluate["Evaluate Options<br>(Usability, Feasibility, A11y, Aesthetics, <b>Style Guide Alignment</b>)"]
    Evaluate --> Decision["Make & Document UI/UX Decision<br>(Use Optimized Creative Template)"]
    Decision --> Validate["Validate Against Requirements, Principles & <b>Style Guide</b>"]
    Validate --> UIUX_Complete["UI/UX Design Complete for Component"]

    InfoArch_NoGuide --> Interaction_NoGuide["Interaction Design"]
    Interaction_NoGuide --> VisualDesign_NoGuide["Visual Design<br>(Leverage React/Tailwind, Aim for Internal Consistency)"]
    VisualDesign_NoGuide --> Options_NoGuide["Explore UI/UX Options"]
    Options_NoGuide --> Evaluate_NoGuide["Evaluate Options<br>(Usability, Feasibility, A11y, Aesthetics)"]
    Evaluate_NoGuide --> Decision_NoGuide["Make & Document UI/UX Decision"]
    Decision_NoGuide --> Validate_NoGuide["Validate Against Requirements & Principles"]
    Validate_NoGuide --> UIUX_Complete

    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style StyleGuideCheck fill:#ab87ff,stroke:#7d5bbe,color:white
    style HasStyleGuide fill:#ab87ff,stroke:#7d5bbe,color:white
    style PromptCreateStyleGuide fill:#ffcb6b,stroke:#f9a825,color:black
    style UserResponse fill:#ffcb6b,stroke:#f9a825,color:black
    style DefineStyleGuideSubProcess fill:#c3e88d,stroke:#82a75c,color:black
    style LinkStyleGuide fill:#c3e88d,stroke:#82a75c,color:black
    style StyleGuideCreated fill:#c3e88d,stroke:#82a75c,color:black
    style VisualDesign fill:#4dbbbb,stroke:#368787,color:white
    style Evaluate fill:#d971ff,stroke:#a33bc2,color:white
    style Validate fill:#71c2ff,stroke:#3b8aa3,color:white
    style Understand_NoGuide fill:#ff8a80,stroke:#c85a54,color:black
    style UIUX_Complete fill:#5fd94d,stroke:#3da336,color:white
```

## 📖 Style Guide Integration

A consistent visual style is paramount for good UI/UX. This section details how to reference an existing style guide or prompt for its creation. **The primary location for the style guide in this system will be `memory-bank/style-guide.md`.**

### Step 0: Style Guide Check & Handling

**A. Checking for an Existing Style Guide:**
1.  **Primary Location Check**: The system **MUST** first look for the style guide at this specific path:
    * `memory-bank/style-guide.md`
2.  **Secondary Check (User Prompt)**: If `memory-bank/style-guide.md` is not found, the system **MUST** prompt the user:
    ```
    "I could not find 'memory-bank/style-guide.md'.
    Is there an existing style guide at a different location, or a URL I should reference?
    If yes, please provide the full path or URL.
    Otherwise, we can create a basic 'memory-bank/style-guide.md' now, or you can opt to proceed without one (though this is not recommended for new UI development)."
    ```

**B. Using an Existing Style Guide:**
* If `memory-bank/style-guide.md` is found or an alternative path/URL is provided by the user:
    * Load its content into context.
    * **CRITICAL**: All subsequent UI/UX design proposals (colors, typography, spacing, component appearance) **MUST** adhere strictly to this guide.
    * When evaluating options (Step 6 of the workflow), "Adherence to Style Guide" **MUST** be a key evaluation criterion.

**C. If No Style Guide Exists or is Provided (User Interaction):**
* If no style guide is found or linked by the user, the system **MUST** strongly recommend creating one:
    ```
    "No style guide has been referenced. For optimal UI consistency and development efficiency, creating 'memory-bank/style-guide.md' is highly recommended."

    "Would you like to:"
    "1. Create a basic 'memory-bank/style-guide.md' now? (I can help you define core elements like colors, typography, and spacing based on observations or your input.)"
    "2. Proceed with UI/UX design without a style guide? (WARNING: This may lead to visual inconsistencies and is strongly discouraged for new features or significant UI changes.)"
    "Please choose 1 or 2."
    ```
    (If the user previously chose to link one but it failed, this prompt should adapt).

**D. Assisting in Style Guide Creation (If user opts-in for option 1):**
This initiates a sub-process to define and document a basic style guide, which will be saved as `memory-bank/style-guide.md`.

```mermaid
graph TD
    StartCreate["User Opts to Create Style Guide"] --> GatherInspiration["Gather Inspiration<br>(e.g., Analyze user-provided image, existing UI, or direct user input)"]
    GatherInspiration --> DefineColors["Define Core Color Palette<br>(Primary, Secondary, Accent, Neutrals, Status Colors - with hex codes)"]
    DefineColors --> DefineTypography["Define Typography<br>(Font Families, Sizes, Weights for Headings, Body, Links)"]
    DefineTypography --> DefineSpacing["Define Spacing System<br>(Base unit, margins, paddings, Tailwind scale usage)"]
    DefineSpacing --> DefineComponents["Define Key Component Styles (Conceptual)<br>(Buttons, Inputs, Cards - using Tailwind utility classes if applicable)"]
    DefineComponents --> DefineTone["Define Tone of Voice & Imagery Style (Optional)"]
    DefineTone --> GenerateDoc["Generate content for 'memory-bank/style-guide.md'<br>(Populate with defined elements)"]
    GenerateDoc --> SaveFile["Save the generated content to 'memory-bank/style-guide.md'"]
    SaveFile --> Confirm["Confirm 'memory-bank/style-guide.md' creation & Proceed with UI/UX Design"]

    style StartCreate fill:#c3e88d,stroke:#82a75c,color:black
    style GatherInspiration fill:#e0f2f1,stroke:#a7c4c0,color:black
    style SaveFile fill:#89cff0,stroke:#50a6c2,color:black
```
* **Process**:
    1.  **Inspiration**: Analyze user-provided examples (like the dashboard image `original-a5959a2926d1e7ede16dbe1d27593a59.webp`) or ask for user preferences.
        * `AI: "To create a style guide, do you have an existing design, screenshot, or website I can analyze for styles? Or would you like to define them from scratch?"`
    2.  **Define Elements**: Guide the user through defining colors, typography, spacing, and key component styles (as detailed in the previous response regarding the sample based on the image).
    3.  **Documentation**: Generate the content for `memory-bank/style-guide.md`. The structure should be similar to the sample style guide created from the dashboard image.
    4.  **Save File**: The system should then create and save this content to the file `memory-bank/style-guide.md`.
* Once `memory-bank/style-guide.md` is created/loaded, it becomes the **single source of truth for visual design**.

## 🖼️ Key UI/UX Design Considerations (To be applied using `memory-bank/style-guide.md`)

### 1. User Needs Analysis
* **Personas**: Define target user personas.
* **User Stories/Jobs-to-be-Done**: Clarify what users need to achieve.
* **Use Cases**: Detail specific interaction scenarios.

### 2. Information Architecture (IA)
* **Content Inventory & Audit**: Understand existing content.
* **Hierarchy & Structure**: Organize content logically.
* **Navigation Design**: Design intuitive navigation (menus, breadcrumbs) adhering to `memory-bank/style-guide.md` for appearance.
* **Labeling**: Use clear and consistent labels.

### 3. Interaction Design (IxD)
* **User Flows**: Map out the user's path.
* **Wireframes**: Create low-fidelity layouts.
* **Prototypes (Conceptual)**: Describe interactive elements and transitions.
* **Error Handling & Prevention**: Design clear error messages (styled per `memory-bank/style-guide.md`).
* **Feedback Mechanisms**: Implement visual/textual feedback (styled per `memory-bank/style-guide.md`).

### 4. Visual Design (Strictly follow `memory-bank/style-guide.md`)
* **Style Guide Adherence**: **CRITICAL** - All visual choices **MUST** conform to `memory-bank/style-guide.md`.
* **Visual Hierarchy**: Use the Style Guide's typography and spacing to guide the user.
* **Layout & Composition**: Arrange elements effectively using Tailwind CSS and Style Guide spacing.
* **Typography**: Apply defined font families, sizes, and weights from the Style Guide.
* **Color Palette**: Exclusively use colors defined in the Style Guide.
* **Imagery & Iconography**: Use icons and images that match the Style Guide's defined style.
* **Branding**: Align with project branding guidelines as documented in the Style Guide.

### 5. Accessibility (A11y)
* **WCAG Compliance Level**: Target AA or AAA.
* **Semantic HTML**.
* **Keyboard Navigation**.
* **ARIA Attributes**.
* **Color Contrast**: Verify against Style Guide colors.
* **Alternative Text**.

### 6. Platform & Responsiveness
* **Responsive Design**: Ensure UI adapts to screen sizes using Style Guide's responsive principles (if defined).
* **Platform Conventions**: Adhere to UI patterns for the target platform(s).

## 🛠️ UI/UX Option Evaluation & Decision Making

Reference the project's `optimized-creative-template.mdc`. Key evaluation criteria **must** include:

* Usability
* Learnability
* Efficiency
* Accessibility
* Aesthetics (as defined by `memory-bank/style-guide.md`)
* Feasibility (React/Tailwind)
* Alignment with Requirements
* **Adherence to `memory-bank/style-guide.md` (CRITICAL if guide exists)**

```mermaid
graph TD
    subgraph "UI/UX EVALUATION CRITERIA"
        C1["Usability"]
        C2["Learnability"]
        C3["Efficiency"]
        C4["Accessibility (A11y)"]
        C5["Aesthetics (Per Style Guide)"]
        C6["Feasibility (React/Tailwind)"]
        C7["Alignment with Requirements"]
        C8["<b>Style Guide Adherence</b>"]
    end

    style C8 fill:#ff5555,stroke:#c30052,color:white
```

## 📝 Documentation Standards

* Use the project's `optimized-creative-template.mdc` for documenting UI/UX decisions.
* Clearly describe chosen UI patterns and rationale, referencing `memory-bank/style-guide.md`.
* Document considerations for responsive states and accessibility, as guided by `memory-bank/style-guide.md`.

## ✅ UI/UX Design Verification Checklist

* [ ] **Style Guide (`memory-bank/style-guide.md`) referenced or created?**
* [ ] User needs clearly understood and addressed?
* [ ] Information architecture logical and intuitive?
* [ ] Interaction design clear and efficient?
* [ ] **Visual design strictly adheres to `memory-bank/style-guide.md`?**
* [ ] Accessibility standards met?
* [ ] Responsive design addressed?
* [ ] Design decisions documented with rationale and Style Guide references?
* [ ] Alignment with React/Tailwind best practices and Style Guide considered?

## 🔄 Integration with Other Creative Phases

* **Architecture Design**: Ensure UI/UX is compatible with system architecture.
* **Data Model Design**: UI should effectively present/capture data from the data model.
* **Style Guide**: All UI/UX work **must** be a direct application or extension of the established `memory-bank/style-guide.md`.

```
