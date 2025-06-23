# QA FILES AND RESEARCH NAMING RULES

## MANDATORY RULE: QA FILES ORGANIZATION

**CRITICAL REQUIREMENT**: All QA files, research documents, and analysis reports MUST follow YYYY-MM-DD naming format and be organized in the memory-bank/qa/ directory structure.

## QA DIRECTORY STRUCTURE

```
memory-bank/qa/
├── research/           # Research documents
├── audits/            # QA audit reports
├── analysis/          # Analysis reports
└── reports/           # QA summary reports
```

## NAMING CONVENTIONS

### QA Audit Files
```
Format: YYYY-MM-DD-qa-audit-[subject].md
Location: memory-bank/qa/audits/

Examples:
2025-06-20-qa-audit-memory-bank-2-0.md
2025-06-20-qa-audit-file-naming-compliance.md
2025-06-20-qa-audit-system-integration.md
```

### Research Files
```
Format: YYYY-MM-DD-research-[topic].md
Location: memory-bank/qa/research/

Examples:
2025-06-20-research-user-requirements.md
2025-06-20-research-technology-comparison.md
2025-06-20-research-best-practices.md
```

### Analysis Files
```
Format: YYYY-MM-DD-analysis-[subject].md
Location: memory-bank/qa/analysis/

Examples:
2025-06-20-analysis-performance-metrics.md
2025-06-20-analysis-system-architecture.md
2025-06-20-analysis-user-feedback.md
```

### QA Reports
```
Format: YYYY-MM-DD-qa-report-[type].md
Location: memory-bank/qa/reports/

Examples:
2025-06-20-qa-report-weekly-summary.md
2025-06-20-qa-report-compliance-status.md
2025-06-20-qa-report-testing-results.md
```

## VALIDATION PATTERNS

### Regex Validation
```regex
# QA Audit Files
^(\d{4}-\d{2}-\d{2})-qa-audit-[a-z0-9-]+\.md$

# Research Files
^(\d{4}-\d{2}-\d{2})-research-[a-z0-9-]+\.md$

# Analysis Files
^(\d{4}-\d{2}-\d{2})-analysis-[a-z0-9-]+\.md$

# QA Reports
^(\d{4}-\d{2}-\d{2})-qa-report-[a-z0-9-]+\.md$
```

## INTEGRATION WITH MEMORY BANK 2.0.0

### Task Integration
- QA tasks should reference QA files in memory-bank/qa/
- Research tasks should link to research documents
- Analysis tasks should connect to analysis reports

### Context Management
- QA contexts should be created for complex audits
- Research contexts for long-term investigations
- Analysis contexts for detailed studies

### Reporting Integration
- QA reports should be included in daily/weekly summaries
- Research findings should be referenced in task documentation
- Analysis results should inform decision-making

## TEMPLATE STRUCTURES

### QA Audit Template
```markdown
---
title: QA Audit - [Subject]
date: YYYY-MM-DD
type: qa-audit
scope: [system|process|compliance]
status: [in-progress|completed|follow-up-required]
---

# QA Audit: [Subject]

## 🎯 Audit Scope
[What is being audited]

## 📋 Audit Checklist
- [ ] [Criterion 1]
- [ ] [Criterion 2]

## 📊 Findings
### ✅ Compliant Items
### ⚠️ Issues Found
### ❌ Critical Problems

## 📝 Recommendations
## 🔄 Follow-up Actions
```

### Research Template
```markdown
---
title: Research - [Topic]
date: YYYY-MM-DD
type: research
category: [technical|user|market|competitive]
status: [active|completed|archived]
---

# Research: [Topic]

## 🎯 Research Objectives
## 📚 Sources and References
## 🔍 Key Findings
## 💡 Insights and Implications
## 📊 Data and Evidence
## 🎯 Conclusions
## 🔄 Next Steps
```

### Analysis Template
```markdown
---
title: Analysis - [Subject]
date: YYYY-MM-DD
type: analysis
focus: [performance|architecture|user|data]
status: [ongoing|completed|requires-review]
---

# Analysis: [Subject]

## 📊 Analysis Scope
## 📈 Metrics and KPIs
## 🔍 Methodology
## 📋 Data Sources
## 📊 Results
## 💡 Insights
## 🎯 Recommendations
## 🔄 Action Items
```

## ENFORCEMENT RULES

### File Creation
1. **Mandatory Date Prefix**: All QA files MUST start with YYYY-MM-DD
2. **Correct Location**: Files MUST be in appropriate qa/ subdirectory
3. **Descriptive Names**: File names MUST be descriptive and lowercase
4. **Template Usage**: New files SHOULD use provided templates

### Migration Requirements
1. **Existing QA Files**: Must be moved to qa/ directory with proper naming
2. **Legacy Research**: Must be renamed and relocated
3. **Old Analysis**: Must follow new naming convention
4. **Reference Updates**: All links must be updated after migration

### Integration Requirements
1. **Task References**: Tasks must link to related QA files
2. **Context Linking**: Contexts must reference relevant research/analysis
3. **Report Integration**: QA findings must be included in reports
4. **Master Index**: All QA files must be indexed in master-index.md

## BENEFITS

### Organization Benefits
- Clear separation of QA activities from development tasks
- Chronological organization of research and analysis
- Easy location of audit reports and findings
- Consistent naming across all QA activities

### Workflow Benefits
- Streamlined QA process with standardized locations
- Improved traceability of research and analysis
- Better integration with task management system
- Enhanced reporting and metrics collection

### Maintenance Benefits
- Easier cleanup and archival of old QA files
- Clear audit trail for compliance purposes
- Simplified backup and version control
- Reduced confusion about file locations

---

*This rule is part of Memory Bank 2.0.0 YYYY-MM-DD Date Format Enforcement System*