# VAN.RULES SUBMODE - RULES MANAGEMENT

> **TL;DR:** Comprehensive VAN.RULES submode for managing .cursor rules integration with Memory Bank system, including Cursor workaround procedures and validation.

## 🧭 NAVIGATION
- 🏠 **[Main Instructions](van_instructions.md)** - Return to main VAN instructions
- 🔄 **[Core Workflow](van_core_workflow.md)** - Detailed VAN workflow with full diagrams
- 📋 **[Rules Submode](van_rules_submode.md)** ← You are here
- ⚙️ **[System Submode](van_system_submode.md)** - VAN.SYSTEM administration functionality

---

## 🎯 VAN.RULES COMMANDS

### Available Commands
- **`VAN.RULES`** - Activate rules management submode
- **`VAN.RULES.INTEGRATE`** - Integrate .cursor rules with Memory Bank
- **`VAN.RULES.MODIFY`** - Modify existing rules using Cursor workaround
- **`VAN.RULES.CREATE`** - Create new custom rules
- **`VAN.RULES.VALIDATE`** - Validate all rules for correctness
- **`VAN.RULES.STATUS`** - Check current rules integration status

---

## 🔄 VAN.RULES WORKFLOW

```mermaid
graph TD
    Start["VAN.RULES Command"] --> CommandType{"Command<br>Type?"}

    CommandType -->|"INTEGRATE"| Integrate["VAN.RULES.INTEGRATE<br>Process"]
    CommandType -->|"MODIFY"| Modify["VAN.RULES.MODIFY<br>Process"]
    CommandType -->|"CREATE"| Create["VAN.RULES.CREATE<br>Process"]
    CommandType -->|"VALIDATE"| Validate["VAN.RULES.VALIDATE<br>Process"]
    CommandType -->|"STATUS"| Status["VAN.RULES.STATUS<br>Process"]
    CommandType -->|"General"| General["General Rules<br>Management"]

    %% Integration Process
    Integrate --> LoadGuides["Load Rules Guides:<br>changing_the_rules.md<br>rules_instructions.md"]
    LoadGuides --> AnalyzeStructure["Analyze .cursor/rules<br>Structure"]
    AnalyzeStructure --> PlanIntegration["Plan Integration<br>Strategy"]
    PlanIntegration --> ExecuteIntegration["Execute Rules<br>Integration"]
    ExecuteIntegration --> UpdateIntegration["Update Memory Bank<br>Integration Status"]

    %% Modification Process
    Modify --> LoadWorkaround["Load Cursor<br>Workaround Process"]
    LoadWorkaround --> BackupRules["Create Rules<br>Backup"]
    BackupRules --> ApplyWorkaround["Apply Cursor<br>Workaround"]
    ApplyWorkaround --> ModifyRules["Modify Rules<br>Content"]
    ModifyRules --> RestoreRules["Restore Rules<br>Structure"]
    RestoreRules --> UpdateModification["Update Memory Bank<br>Modification Status"]

    %% Creation Process
    Create --> DefineRequirements["Define New Rule<br>Requirements"]
    DefineRequirements --> DesignRule["Design Rule<br>Structure"]
    DesignRule --> CreateRule["Create Rule<br>File"]
    CreateRule --> ValidateNewRule["Validate New<br>Rule"]
    ValidateNewRule --> UpdateCreation["Update Memory Bank<br>Creation Status"]

    %% Validation Process
    Validate --> ScanRules["Scan All<br>Rule Files"]
    ScanRules --> CheckFormat["Check Rule<br>Format"]
    CheckFormat --> CheckLinks["Check Internal<br>Links"]
    CheckLinks --> CheckSyntax["Check Rule<br>Syntax"]
    CheckSyntax --> GenerateReport["Generate Validation<br>Report"]
    GenerateReport --> UpdateValidation["Update Memory Bank<br>Validation Status"]

    %% Status Process
    Status --> CheckIntegration["Check Integration<br>Status"]
    CheckIntegration --> CheckHealth["Check Rules<br>Health"]
    CheckHealth --> CheckUsage["Check Rules<br>Usage"]
    CheckUsage --> GenerateStatus["Generate Status<br>Report"]
    GenerateStatus --> UpdateStatus["Update Memory Bank<br>Status"]

    %% General Process
    General --> LoadRulesMap["Load Rules via fetch_rules:<br>git-workflow/branch-management<br>implementation/dependency-checking<br>hierarchical-rule-loading"]
    LoadRulesMap --> ExecuteGeneral["Execute General<br>Rules Management"]
    ExecuteGeneral --> UpdateGeneral["Update Memory Bank<br>General Status"]

    %% Completion
    UpdateIntegration & UpdateModification & UpdateCreation & UpdateValidation & UpdateStatus & UpdateGeneral --> VerifyComplete["Verify Rules<br>Operation Complete"]
    VerifyComplete --> Complete["VAN.RULES<br>Complete"]

    style Start fill:#ffcc80,stroke:#ff9900,color:white
    style CommandType fill:#ffe6cc,stroke:#ffb366,color:black
    style Integrate fill:#d4e6f1,stroke:#85c1e9,color:black
    style Modify fill:#fadbd8,stroke:#f1948a,color:black
    style Create fill:#d5f4e6,stroke:#82e0aa,color:black
    style Validate fill:#fdeaa7,stroke:#f7dc6f,color:black
    style Status fill:#e8daef,stroke:#d2b4de,color:black
    style Complete fill:#5fd94d,stroke:#3da336,color:white
```

---

## 🔗 VAN.RULES.INTEGRATE PROCESS

### Integration Workflow

```mermaid
graph TD
    IntegrateStart["VAN.RULES.INTEGRATE<br>Start"] --> ReadGuides["Read Integration Guides"]
    ReadGuides --> AnalyzeCursor["Analyze .cursor/rules<br>Directory Structure"]
    AnalyzeCursor --> IdentifyRules["Identify Rules<br>for Integration"]
    IdentifyRules --> PlanStrategy["Plan Integration<br>Strategy"]

    PlanStrategy --> CreateMapping["Create Rules<br>Mapping"]
    CreateMapping --> ValidateMapping["Validate Rule<br>Dependencies"]
    ValidateMapping --> ExecuteIntegration["Execute Integration<br>Process"]
    ExecuteIntegration --> TestIntegration["Test Integrated<br>Rules"]
    TestIntegration --> DocumentIntegration["Document Integration<br>Results"]
    DocumentIntegration --> IntegrateComplete["Integration<br>Complete"]

    style IntegrateStart fill:#d4e6f1,stroke:#85c1e9,color:black
    style ReadGuides fill:#ebf5fb,stroke:#aed6f1,color:black
    style AnalyzeCursor fill:#ebf5fb,stroke:#aed6f1,color:black
    style IdentifyRules fill:#ebf5fb,stroke:#aed6f1,color:black
    style PlanStrategy fill:#ebf5fb,stroke:#aed6f1,color:black
    style CreateMapping fill:#ebf5fb,stroke:#aed6f1,color:black
    style ValidateMapping fill:#ebf5fb,stroke:#aed6f1,color:black
    style ExecuteIntegration fill:#ebf5fb,stroke:#aed6f1,color:black
    style TestIntegration fill:#ebf5fb,stroke:#aed6f1,color:black
    style DocumentIntegration fill:#ebf5fb,stroke:#aed6f1,color:black
    style IntegrateComplete fill:#5fd94d,stroke:#3da336,color:white
```

### Integration Rules Loading

```
fetch_rules([
  "isolation_rules/CustomWorkflow/git-workflow/branch-management",
  "isolation_rules/CustomWorkflow/implementation/dependency-checking",
  "isolation_rules/Core/hierarchical-rule-loading"
])
```

---

## 🔧 VAN.RULES.MODIFY PROCESS

### Cursor Workaround Procedure

```mermaid
graph TD
    ModifyStart["VAN.RULES.MODIFY<br>Start"] --> LoadWorkaround["Load Cursor<br>Workaround Guide"]
    LoadWorkaround --> CreateBackup["Create Backup:<br>backup-rules-YYYYMMDD-HHMM"]
    CreateBackup --> RenameDir["Rename Directory:<br>.cursor → _cursor"]
    RenameDir --> RenameFiles["Rename Files:<br>.mdc → .mdc.md"]

    RenameFiles --> ModifyContent["Modify Rule<br>Content"]
    ModifyContent --> ValidateChanges["Validate<br>Changes"]
    ValidateChanges --> RestoreFiles["Restore Files:<br>.mdc.md → .mdc"]
    RestoreFiles --> RestoreDir["Restore Directory:<br>_cursor → .cursor"]
    RestoreDir --> TestModified["Test Modified<br>Rules"]
    TestModified --> DocumentChanges["Document<br>Changes"]
    DocumentChanges --> ModifyComplete["Modification<br>Complete"]

    style ModifyStart fill:#fadbd8,stroke:#f1948a,color:black
    style LoadWorkaround fill:#fdf2e9,stroke:#f8c471,color:black
    style CreateBackup fill:#fdf2e9,stroke:#f8c471,color:black
    style RenameDir fill:#fdf2e9,stroke:#f8c471,color:black
    style RenameFiles fill:#fdf2e9,stroke:#f8c471,color:black
    style ModifyContent fill:#fdf2e9,stroke:#f8c471,color:black
    style ValidateChanges fill:#fdf2e9,stroke:#f8c471,color:black
    style RestoreFiles fill:#fdf2e9,stroke:#f8c471,color:black
    style RestoreDir fill:#fdf2e9,stroke:#f8c471,color:black
    style TestModified fill:#fdf2e9,stroke:#f8c471,color:black
    style DocumentChanges fill:#fdf2e9,stroke:#f8c471,color:black
    style ModifyComplete fill:#5fd94d,stroke:#3da336,color:white
```

### Cursor Workaround Commands

```bash
# Step 1: Create backup
git checkout -b "backup-rules-$(date +%Y%m%d-%H%M)"

# Step 2: Rename directory
mv .cursor _cursor

# Step 3: Rename files
find _cursor -name "*.mdc" -exec mv {} {}.md \;

# Step 4: Modify content (manual step)
# Edit files as needed

# Step 5: Restore files
find _cursor -name "*.mdc.md" -exec sh -c 'mv "$1" "${1%.md}"' _ {} \;

# Step 6: Restore directory
mv _cursor .cursor

# Step 7: Commit changes
git add .cursor/
git commit -m "Modified rules via Cursor workaround"
```

---

## ✅ VAN.RULES.VALIDATE PROCESS

### Validation Workflow

```mermaid
graph TD
    ValidateStart["VAN.RULES.VALIDATE<br>Start"] --> ScanFiles["Scan All<br>.mdc Files"]
    ScanFiles --> CheckExtensions["Check File<br>Extensions"]
    CheckExtensions --> CheckCase["Check Case<br>Sensitivity"]
    CheckCase --> CheckLinks["Check Internal<br>Links"]
    CheckLinks --> CheckSyntax["Check Rule<br>Syntax"]

    CheckSyntax --> CheckDependencies["Check Rule<br>Dependencies"]
    CheckDependencies --> CheckIntegrity["Check System<br>Integrity"]
    CheckIntegrity --> GenerateReport["Generate Validation<br>Report"]
    GenerateReport --> IdentifyIssues["Identify<br>Issues"]
    IdentifyIssues --> SuggestFixes["Suggest<br>Fixes"]
    SuggestFixes --> ValidateComplete["Validation<br>Complete"]

    style ValidateStart fill:#fdeaa7,stroke:#f7dc6f,color:black
    style ScanFiles fill:#fef9e7,stroke:#f4d03f,color:black
    style CheckExtensions fill:#fef9e7,stroke:#f4d03f,color:black
    style CheckCase fill:#fef9e7,stroke:#f4d03f,color:black
    style CheckLinks fill:#fef9e7,stroke:#f4d03f,color:black
    style CheckSyntax fill:#fef9e7,stroke:#f4d03f,color:black
    style CheckDependencies fill:#fef9e7,stroke:#f4d03f,color:black
    style CheckIntegrity fill:#fef9e7,stroke:#f4d03f,color:black
    style GenerateReport fill:#fef9e7,stroke:#f4d03f,color:black
    style IdentifyIssues fill:#fef9e7,stroke:#f4d03f,color:black
    style SuggestFixes fill:#fef9e7,stroke:#f4d03f,color:black
    style ValidateComplete fill:#5fd94d,stroke:#3da336,color:white
```

### Validation Checklist

```
✓ RULES VALIDATION CHECKLIST
- All .mdc files have correct extensions? [YES/NO]
- File names follow naming conventions? [YES/NO]
- Internal links are valid? [YES/NO]
- Rule syntax is correct? [YES/NO]
- Dependencies are satisfied? [YES/NO]
- No circular dependencies? [YES/NO]
- Integration points are valid? [YES/NO]
- fetch_rules references are correct? [YES/NO]

→ If all YES: Rules validation passed
→ If any NO: Address identified issues
```

---

## 📊 VAN.RULES.STATUS PROCESS

### Status Monitoring

```mermaid
graph TD
    StatusStart["VAN.RULES.STATUS<br>Start"] --> CheckIntegration["Check Integration<br>Status"]
    CheckIntegration --> CheckHealth["Check Rules<br>Health"]
    CheckHealth --> CheckUsage["Check Rules<br>Usage Statistics"]
    CheckUsage --> CheckPerformance["Check Rules<br>Performance"]

    CheckPerformance --> CheckErrors["Check Error<br>Logs"]
    CheckErrors --> CheckUpdates["Check Update<br>Status"]
    CheckUpdates --> GenerateStatus["Generate Status<br>Report"]
    GenerateStatus --> DisplayMetrics["Display<br>Metrics"]
    DisplayMetrics --> StatusComplete["Status Check<br>Complete"]

    style StatusStart fill:#e8daef,stroke:#d2b4de,color:black
    style CheckIntegration fill:#f4ecf7,stroke:#bb8fce,color:black
    style CheckHealth fill:#f4ecf7,stroke:#bb8fce,color:black
    style CheckUsage fill:#f4ecf7,stroke:#bb8fce,color:black
    style CheckPerformance fill:#f4ecf7,stroke:#bb8fce,color:black
    style CheckErrors fill:#f4ecf7,stroke:#bb8fce,color:black
    style CheckUpdates fill:#f4ecf7,stroke:#bb8fce,color:black
    style GenerateStatus fill:#f4ecf7,stroke:#bb8fce,color:black
    style DisplayMetrics fill:#f4ecf7,stroke:#bb8fce,color:black
    style StatusComplete fill:#5fd94d,stroke:#3da336,color:white
```

### Status Report Format

```
## VAN.RULES STATUS REPORT

### Integration Status
- Rules Integrated: X/Y (Z%)
- Last Integration: YYYY-MM-DD HH:MM
- Integration Health: [EXCELLENT/GOOD/NEEDS_ATTENTION]

### Rules Health
- Total Rules: X files
- Valid Rules: Y files
- Invalid Rules: Z files
- Health Score: X/100

### Usage Statistics
- Rules Loaded Today: X
- Most Used Rules: [list]
- Least Used Rules: [list]
- Average Load Time: X ms

### Performance Metrics
- Load Success Rate: X%
- Error Rate: Y%
- Average Response Time: Z ms

### Recent Issues
- [List of recent issues and resolutions]

### Recommendations
- [Actionable recommendations for improvement]
```

---

## 🔧 MEMORY BANK INTEGRATION

### Rules Integration Files

- **`memory-bank/rules/integration-status.md`** - Current integration status
- **`memory-bank/rules/validation-reports/`** - Validation report archive
- **`memory-bank/rules/modification-log.md`** - Modification history
- **`memory-bank/backup/rules/`** - Rules backup directory

### Integration with Other Modes

```
fetch_rules([
  "isolation_rules/CustomWorkflow/git-workflow/branch-management",
  "isolation_rules/CustomWorkflow/git-workflow/backup-verification",
  "isolation_rules/CustomWorkflow/git-workflow/change-documentation",
  "isolation_rules/CustomWorkflow/implementation/dependency-checking",
  "isolation_rules/Core/hierarchical-rule-loading"
])
```

---

## 💡 USAGE EXAMPLES

### Example 1: Rules Integration
```
User: VAN.RULES.INTEGRATE
Assistant: OK VAN.RULES

Activating VAN.RULES integration submode...
📚 Loading rules management guidelines...
🔍 Analyzing .cursor/rules structure...
📋 Found 37 .mdc files for integration...
⚡ Planning integration strategy...
🔗 Executing integration process...
✅ Rules integration completed successfully
📊 Integration status: 37/37 rules integrated (100%)
```

### Example 2: Rules Modification
```
User: VAN.RULES.MODIFY
Assistant: OK VAN.RULES

Activating VAN.RULES modification submode...
🔧 Loading Cursor workaround procedure...
💾 Creating backup: backup-rules-20250610-1430...
📁 Applying Cursor workaround (.cursor → _cursor)...
📝 Ready for rule modifications...
[User makes modifications]
🔄 Restoring structure (_cursor → .cursor)...
✅ Rules modification completed successfully
```

### Example 3: Rules Validation
```
User: VAN.RULES.VALIDATE
Assistant: OK VAN.RULES

Activating VAN.RULES validation submode...
🔍 Scanning all .mdc files...
✅ File extensions: 37/37 correct
✅ Naming conventions: 37/37 valid
✅ Internal links: 156/156 valid
✅ Rule syntax: 37/37 correct
✅ Dependencies: All satisfied
📊 Validation score: 100/100 (EXCELLENT)
```

---

## ✅ VERIFICATION COMMITMENT

```
┌─────────────────────────────────────────────────────┐
│ I WILL use fetch_rules for all rule loading          │
│ I WILL follow the Cursor workaround process exactly  │
│ I WILL create backups before any modifications       │
│ I WILL validate all rules after changes              │
│ I WILL document all rules operations                 │
│ I WILL maintain rules integration integrity          │
│ I WILL update Memory Bank with all status changes    │
└─────────────────────────────────────────────────────┘
```

---

**Navigation**: Return to [Main Instructions](van_instructions.md) | Previous: [Core Workflow](van_core_workflow.md) | Next: [System Submode](van_system_submode.md)