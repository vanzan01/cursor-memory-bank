#!/bin/bash

# Daily Report Generator for Memory Bank 2.0
# Generates comprehensive daily task reports

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
MEMORY_BANK_DIR="$PROJECT_ROOT/memory-bank"
REPORT_DATE="${1:-$(date +%Y-%m-%d)}"
REPORT_FILE="$MEMORY_BANK_DIR/reports/daily/daily-report-$REPORT_DATE.md"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

success() {
    echo -e "${GREEN}✅ $1${NC}"
}

# Create report directory if not exists
mkdir -p "$(dirname "$REPORT_FILE")"

# Count tasks by status and priority
count_tasks() {
    local dir="$1"
    find "$dir" -name "*.md" 2>/dev/null | wc -l
}

# Get task details
get_task_details() {
    local dir="$1"
    local category="$2"

    if [ -d "$dir" ] && [ "$(count_tasks "$dir")" -gt 0 ]; then
        echo "#### $category"
        echo ""
        find "$dir" -name "*.md" -exec basename {} .md \; | sort | while read task; do
            echo "- \`$task\`"
        done
        echo ""
    fi
}

# Calculate completion rate
calculate_completion_rate() {
    local total_tasks=$(count_tasks "$MEMORY_BANK_DIR/tasks")
    local done_tasks=$(count_tasks "$MEMORY_BANK_DIR/tasks/done")

    if [ "$total_tasks" -gt 0 ]; then
        echo "scale=1; $done_tasks * 100 / $total_tasks" | bc
    else
        echo "0"
    fi
}

# Get recent activity
get_recent_activity() {
    # Find files modified today
    find "$MEMORY_BANK_DIR/tasks" -name "*.md" -newermt "$REPORT_DATE 00:00:00" ! -newermt "$REPORT_DATE 23:59:59" 2>/dev/null | while read file; do
        local filename=$(basename "$file" .md)
        local status=$(grep "^**Статус**:" "$file" 2>/dev/null | sed 's/.*: //' || echo "Unknown")
        echo "- \`$filename\` → $status"
    done
}

# Generate productivity metrics
generate_metrics() {
    local total_tasks=$(count_tasks "$MEMORY_BANK_DIR/tasks")
    local todo_tasks=$(count_tasks "$MEMORY_BANK_DIR/tasks/todo")
    local in_progress_tasks=$(count_tasks "$MEMORY_BANK_DIR/tasks/in_progress")
    local done_tasks=$(count_tasks "$MEMORY_BANK_DIR/tasks/done")
    local completion_rate=$(calculate_completion_rate)

    # Critical tasks
    local critical_todo=$(count_tasks "$MEMORY_BANK_DIR/tasks/todo/critical")
    local critical_progress=$(count_tasks "$MEMORY_BANK_DIR/tasks/in_progress/active" | xargs -I {} sh -c 'find "$MEMORY_BANK_DIR/tasks/in_progress/active" -name "*CRITICAL*" | wc -l')

    echo "### 📊 Metrics"
    echo ""
    echo "| Metric | Value |"
    echo "|--------|-------|"
    echo "| Total Tasks | $total_tasks |"
    echo "| TODO | $todo_tasks |"
    echo "| In Progress | $in_progress_tasks |"
    echo "| Done | $done_tasks |"
    echo "| Completion Rate | $completion_rate% |"
    echo "| Critical TODO | $critical_todo |"
    echo "| Critical In Progress | $critical_progress |"
    echo ""
}

# Generate priorities section
generate_priorities() {
    echo "### 🔥 Today's Priorities"
    echo ""

    # Critical tasks first
    if [ "$(count_tasks "$MEMORY_BANK_DIR/tasks/todo/critical")" -gt 0 ]; then
        echo "#### 🚨 Critical Tasks"
        find "$MEMORY_BANK_DIR/tasks/todo/critical" -name "*.md" -exec basename {} .md \; | sort | while read task; do
            echo "- [ ] \`$task\`"
        done
        echo ""
    fi

    # High priority tasks
    if [ "$(count_tasks "$MEMORY_BANK_DIR/tasks/todo/high")" -gt 0 ]; then
        echo "#### ⚡ High Priority Tasks"
        find "$MEMORY_BANK_DIR/tasks/todo/high" -name "*.md" -exec basename {} .md \; | head -5 | while read task; do
            echo "- [ ] \`$task\`"
        done
        echo ""
    fi

    # Active tasks to continue
    if [ "$(count_tasks "$MEMORY_BANK_DIR/tasks/in_progress/active")" -gt 0 ]; then
        echo "#### 🔄 Continue Working On"
        find "$MEMORY_BANK_DIR/tasks/in_progress/active" -name "*.md" -exec basename {} .md \; | sort | while read task; do
            echo "- [ ] \`$task\`"
        done
        echo ""
    fi
}

# Generate the report
info "Generating daily report for $REPORT_DATE"

cat > "$REPORT_FILE" << EOF
# Daily Report - $REPORT_DATE

**Generated**: $(date '+%Y-%m-%d %H:%M:%S')
**Report Type**: Daily Task Summary

---

## 🎯 Executive Summary

$(generate_metrics)

$(generate_priorities)

### 📈 Task Breakdown

$(get_task_details "$MEMORY_BANK_DIR/tasks/todo/critical" "🚨 Critical TODO")
$(get_task_details "$MEMORY_BANK_DIR/tasks/todo/high" "⚡ High Priority TODO")
$(get_task_details "$MEMORY_BANK_DIR/tasks/todo/medium" "📋 Medium Priority TODO")
$(get_task_details "$MEMORY_BANK_DIR/tasks/todo/low" "📝 Low Priority TODO")

$(get_task_details "$MEMORY_BANK_DIR/tasks/in_progress/active" "🔄 Active Tasks")
$(get_task_details "$MEMORY_BANK_DIR/tasks/in_progress/blocked" "⛔ Blocked Tasks")
$(get_task_details "$MEMORY_BANK_DIR/tasks/in_progress/review" "👀 Review Tasks")

### 🎉 Recent Activity

$(get_recent_activity)

### 📝 Daily Notes

*Add your daily notes and observations here...*

---

## 🎯 Tomorrow's Focus

*Plan tomorrow's priorities based on today's progress...*

### Recommended Actions:
1. Address critical tasks first
2. Unblock any blocked tasks
3. Continue active development
4. Review completed work

---

**Report ID**: daily-$REPORT_DATE
**Next Report**: $(date -d "$REPORT_DATE + 1 day" +%Y-%m-%d)
EOF

success "Daily report generated: $REPORT_FILE"
info "View report: cat $REPORT_FILE"

# Update master index with latest report
if [ -f "$MEMORY_BANK_DIR/indexes/master-index.md" ]; then
    sed -i.bak "s/\*\*Последний отчет\*\*: Нет/**Последний отчет**: daily-$REPORT_DATE/" "$MEMORY_BANK_DIR/indexes/master-index.md"
    rm -f "$MEMORY_BANK_DIR/indexes/master-index.md.bak"
    info "Updated master index with latest report"
fi