---
title: Fix File Naming Compliance with YYYY-MM-DD Format
created: 2025-06-20 23:15:00
updated: 2025-06-20 23:15:00
priority: CRITICAL
category: ADMIN
status: TODO
tags: [qa, compliance, naming, memory-bank-2.0]
context_file: contexts/active/2025-06-20-fix-file-naming-compliance-context.md
---

# Fix File Naming Compliance with YYYY-MM-DD Format

## 📋 Task Description
QA audit revealed multiple files in memory-bank that do not comply with YYYY-MM-DD naming format. Need to rename all non-compliant files to follow Memory Bank 2.0.0 standards.

## 🎯 Acceptance Criteria
- [ ] All report files renamed to YYYY-MM-DD format
- [ ] All system files (where applicable) renamed to YYYY-MM-DD format
- [ ] Template files remain as-is (they are templates)
- [ ] Rule files remain as-is (they are documentation)
- [ ] Update all internal references to renamed files
- [ ] Validate no broken links after renaming

## 📊 Files Requiring Renaming

### Non-Compliant Files Found:
```
qa-report-2025-06-20.md → memory-bank/qa/reports/2025-06-20-qa-report.md
activeContext.md → 2025-06-20-active-context.md
archive-universal-init-2025-06-20.md → 2025-06-20-archive-universal-init.md
legacy-tasks-backup-2025-06-20.md → 2025-06-20-legacy-tasks-backup.md
progress.md → 2025-06-20-progress.md
current-context.md → 2025-06-20-current-context.md
daily-report-2025-06-20.md → memory-bank/reports/daily/2025-06-20-daily-report.md
reflection-2025-06-20.md → 2025-06-20-reflection.md
```

### QA Files Organization:
- QA reports should be moved to `memory-bank/qa/reports/`
- Research files should be placed in `memory-bank/qa/research/`
- Analysis files should be placed in `memory-bank/qa/analysis/`
- Audit files should be placed in `memory-bank/qa/audits/`

### Files to Keep As-Is:
- RELEASE-NOTES-2.0.0.md (version documentation)
- projectbrief.md (project documentation)
- master-index.md (system index)
- Templates and rules (documentation files)

## 📝 Implementation Strategy
1. Create backup of current state
2. Rename files systematically
3. Update all internal references
4. Validate system integrity
5. Update scripts if needed

## 🧪 Testing Strategy
- Verify all renamed files are accessible
- Check all internal links work
- Run daily report script to ensure compatibility
- Validate master index references

## 📚 Documentation Requirements
- Update master index with new file locations
- Update any scripts that reference renamed files
- Document the renaming changes

## ⏱️ Time Tracking
- **Estimated**: 2 hours
- **Actual**: [to be filled]
- **Started**: [to be filled]
- **Completed**: [to be filled]

## 🤔 Context Notes
**Related Context**: contexts/active/2025-06-20-fix-file-naming-compliance-context.md

## 📊 Completion Status
**Overall Progress**: 0%

### Phase Breakdown:
- **Analysis**: 100% (QA audit completed)
- **Planning**: 0%
- **Implementation**: 0%
- **Testing**: 0%
- **Documentation**: 0%