# MEMORY BANK 2.0.0 MASTER INDEX

**Last Updated**: 2025-06-20 20:30:00
**System Version**: Memory Bank 2.0.0
**Index Status**: ACTIVE

## 📊 SYSTEM OVERVIEW

### Current Statistics
- **Total Tasks**: $(find memory-bank/tasks -name "*.md" | wc -l)
- **Active Tasks**: $(find memory-bank/tasks/in_progress -name "*.md" | wc -l)
- **Completed Tasks**: $(find memory-bank/tasks/done -name "*.md" | wc -l)
- **Active Contexts**: $(find memory-bank/contexts/active -name "*.md" | wc -l)
- **Generated Reports**: $(find memory-bank/reports -name "*.md" | wc -l)

## 🎯 ACTIVE TASKS

### Critical Priority
$(find memory-bank/tasks/in_progress -name "*CRITICAL*.md" 2>/dev/null | while read file; do
    if [ -f "$file" ]; then
        title=$(grep "^title:" "$file" | sed 's/title: //')
        echo "- [$title]($file)"
    fi
done)

### High Priority
$(find memory-bank/tasks/in_progress -name "*HIGH*.md" 2>/dev/null | while read file; do
    if [ -f "$file" ]; then
        title=$(grep "^title:" "$file" | sed 's/title: //')
        echo "- [$title]($file)"
    fi
done)

## 📋 PENDING TASKS

### Todo - Critical
$(find memory-bank/tasks/todo/critical -name "*.md" 2>/dev/null | while read file; do
    if [ -f "$file" ]; then
        title=$(grep "^title:" "$file" | sed 's/title: //')
        echo "- [$title]($file)"
    fi
done)

### Todo - High
$(find memory-bank/tasks/todo/high -name "*.md" 2>/dev/null | while read file; do
    if [ -f "$file" ]; then
        title=$(grep "^title:" "$file" | sed 's/title: //')
        echo "- [$title]($file)"
    fi
done)

## 🔄 ACTIVE CONTEXTS

### Current Working Contexts
$(find memory-bank/contexts/active -name "*.md" 2>/dev/null | while read file; do
    if [ -f "$file" ]; then
        echo "- [$(basename "$file")]($file)"
    fi
done)

## 📊 RECENT REPORTS

### Daily Reports (Last 7 Days)
$(find memory-bank/reports/daily -name "*.md" -mtime -7 2>/dev/null | sort -r | head -7 | while read file; do
    if [ -f "$file" ]; then
        echo "- [$(basename "$file")]($file)"
    fi
done)

### Weekly Reports (Last 4 Weeks)
$(find memory-bank/reports/weekly -name "*.md" -mtime -28 2>/dev/null | sort -r | head -4 | while read file; do
    if [ -f "$file" ]; then
        echo "- [$(basename "$file")]($file)"
    fi
done)

## 🎯 COMPLETED TASKS (RECENT)

### This Month
$(find memory-bank/tasks/done -name "$(date +%Y-%m)*" 2>/dev/null | head -10 | while read file; do
    if [ -f "$file" ]; then
        title=$(grep "^title:" "$file" | sed 's/title: //')
        date=$(basename "$file" | cut -d'-' -f1-3)
        echo "- [$date] [$title]($file)"
    fi
done)

## 📚 SYSTEM RESOURCES

### Templates
- [Task Template](../../_cursor/rules/isolation_rules/Templates/task-template.mdc.md)
- [Context Template](../../_cursor/rules/isolation_rules/Templates/context-template.mdc.md)
- [QA Audit Template](../../_cursor/rules/isolation_rules/Templates/qa-audit-template.mdc.md)
- [Research Template](../../_cursor/rules/isolation_rules/Templates/research-template.mdc.md)

### Scripts
- [Daily Report Generator](../scripts/daily-report.sh)
- [Weekly Report Generator](../scripts/weekly-report.sh)

### Rules Documentation
- [YYYY-MM-DD Date Format](../rules/yyyy-mm-dd-date-format.md)
- [Memory Bank 2.0.0 Task Management](../rules/memory-bank-2-task-management.md)
- [VAN Mode Auto Migration](../rules/van-mode-auto-migration.md)
- [Mandatory @Web Search](../rules/mandatory-web-search.md)

## 🔍 QUICK NAVIGATION

### By Priority
- [Critical Tasks](../tasks/todo/critical/)
- [High Priority Tasks](../tasks/todo/high/)
- [Medium Priority Tasks](../tasks/todo/medium/)
- [Low Priority Tasks](../tasks/todo/low/)

### By Status
- [Todo Tasks](../tasks/todo/)
- [In Progress Tasks](../tasks/in_progress/)
- [Completed Tasks](../tasks/done/)

### By Category
- Feature Development: `find memory-bank/tasks -name "*FEATURE*.md"`
- Bug Fixes: `find memory-bank/tasks -name "*BUGFIX*.md"`
- Enhancements: `find memory-bank/tasks -name "*ENHANCEMENT*.md"`
- Research: `find memory-bank/tasks -name "*RESEARCH*.md"`
- Administration: `find memory-bank/tasks -name "*ADMIN*.md"`

## 📈 PRODUCTIVITY METRICS

### Task Completion Rate
- **This Week**: $(find memory-bank/tasks/done -name "$(date +%Y-%m)*" -mtime -7 | wc -l) tasks
- **This Month**: $(find memory-bank/tasks/done -name "$(date +%Y-%m)*" | wc -l) tasks
- **Total Completed**: $(find memory-bank/tasks/done -name "*.md" | wc -l) tasks

### Context Efficiency
- **Active Contexts**: $(find memory-bank/contexts/active -name "*.md" | wc -l)
- **Suspended Contexts**: $(find memory-bank/contexts/suspended -name "*.md" | wc -l)
- **WIP Limit Status**: $(if [ $(find memory-bank/contexts/active -name "*.md" | wc -l) -le 3 ]; then echo "✅ Within Limit"; else echo "⚠️ Over Limit"; fi)

## 🔧 SYSTEM MAINTENANCE

### Health Checks
- **Date Format Compliance**: $(find memory-bank/tasks -name "*.md" | grep -c "^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-" || echo "0")/$(find memory-bank/tasks -name "*.md" | wc -l) files
- **Template Compliance**: All new tasks use standard templates
- **Context Integrity**: All active tasks have corresponding contexts

### Maintenance Commands
```bash
# Generate fresh reports
./memory-bank/scripts/daily-report.sh
./memory-bank/scripts/weekly-report.sh

# Check system health
find memory-bank/tasks -name "*.md" | grep -v "^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-" # Non-compliant files

# Update master index
./memory-bank/scripts/update-indexes.sh  # Coming soon
```

---
*Master Index generated by Memory Bank 2.0.0 System*
*Auto-updated on task creation, completion, and reporting*