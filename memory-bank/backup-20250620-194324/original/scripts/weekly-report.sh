#!/bin/bash

# Weekly Report Generator for Memory Bank 2.0
# Generates comprehensive weekly task and productivity reports

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
MEMORY_BANK_DIR="$PROJECT_ROOT/memory-bank"

# Calculate week dates
if [ -n "$1" ]; then
    WEEK_START="$1"
else
    # Get Monday of current week
    WEEK_START=$(date -d "monday" +%Y-%m-%d 2>/dev/null || date -v monday +%Y-%m-%d 2>/dev/null || date +%Y-%m-%d)
fi

WEEK_END=$(date -d "$WEEK_START + 6 days" +%Y-%m-%d 2>/dev/null || date -v +6d -j -f %Y-%m-%d "$WEEK_START" +%Y-%m-%d 2>/dev/null || date +%Y-%m-%d)
WEEK_NUMBER=$(date -d "$WEEK_START" +%V 2>/dev/null || date -j -f %Y-%m-%d "$WEEK_START" +%V 2>/dev/null || echo "$(date +%V)")
YEAR=$(date -d "$WEEK_START" +%Y 2>/dev/null || date -j -f %Y-%m-%d "$WEEK_START" +%Y 2>/dev/null || echo "$(date +%Y)")

REPORT_FILE="$MEMORY_BANK_DIR/reports/weekly/weekly-report-$YEAR-W$WEEK_NUMBER.md"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

success() {
    echo -e "${GREEN}✅ $1${NC}"
}

warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

# Create report directory
mkdir -p "$(dirname "$REPORT_FILE")"

# Count tasks by status
count_tasks() {
    local dir="$1"
    find "$dir" -name "*.md" 2>/dev/null | wc -l
}

# Get tasks completed this week
get_completed_this_week() {
    local week_start_epoch=$(date -d "$WEEK_START" +%s 2>/dev/null || date -j -f %Y-%m-%d "$WEEK_START" +%s 2>/dev/null || echo "0")
    local week_end_epoch=$(date -d "$WEEK_END 23:59:59" +%s 2>/dev/null || date -j -f "%Y-%m-%d %H:%M:%S" "$WEEK_END 23:59:59" +%s 2>/dev/null || echo "9999999999")

    find "$MEMORY_BANK_DIR/tasks/done" -name "*.md" -newer "$MEMORY_BANK_DIR/tasks/done" 2>/dev/null | while read file; do
        if [ -f "$file" ]; then
            local file_epoch=$(stat -c %Y "$file" 2>/dev/null || stat -f %m "$file" 2>/dev/null || echo "0")
            if [ "$file_epoch" -ge "$week_start_epoch" ] && [ "$file_epoch" -le "$week_end_epoch" ]; then
                basename "$file" .md
            fi
        fi
    done
}

# Calculate productivity metrics
calculate_weekly_metrics() {
    local total_tasks=$(count_tasks "$MEMORY_BANK_DIR/tasks")
    local todo_tasks=$(count_tasks "$MEMORY_BANK_DIR/tasks/todo")
    local in_progress_tasks=$(count_tasks "$MEMORY_BANK_DIR/tasks/in_progress")
    local done_tasks=$(count_tasks "$MEMORY_BANK_DIR/tasks/done")
    local completed_this_week=$(get_completed_this_week | wc -l)

    # Calculate completion rate
    local completion_rate="0"
    if [ "$total_tasks" -gt 0 ]; then
        completion_rate=$(echo "scale=1; $done_tasks * 100 / $total_tasks" | bc 2>/dev/null || echo "0")
    fi

    # Calculate weekly velocity
    local weekly_velocity="$completed_this_week"

    echo "### 📊 Weekly Metrics"
    echo ""
    echo "| Metric | Value | Trend |"
    echo "|--------|-------|-------|"
    echo "| Total Tasks | $total_tasks | ➡️ |"
    echo "| Completed This Week | $completed_this_week | 📈 |"
    echo "| Weekly Velocity | $weekly_velocity tasks/week | ⚡ |"
    echo "| Overall Completion | $completion_rate% | 📊 |"
    echo "| Active Tasks | $in_progress_tasks | 🔄 |"
    echo "| Pending Tasks | $todo_tasks | 📋 |"
    echo ""
}

# Generate weekly achievements
generate_achievements() {
    echo "### 🏆 Weekly Achievements"
    echo ""

    local completed_tasks=$(get_completed_this_week)

    if [ -n "$completed_tasks" ] && [ "$(echo "$completed_tasks" | wc -l)" -gt 0 ]; then
        echo "$completed_tasks" | while read task; do
            if [ -n "$task" ]; then
                echo "- ✅ \`$task\`"
            fi
        done
        echo ""
    else
        echo "*No tasks completed this week. Focus on finishing current work.*"
        echo ""
    fi
}

# Analyze task distribution
analyze_task_distribution() {
    echo "### 📈 Task Distribution Analysis"
    echo ""

    local critical_count=$(count_tasks "$MEMORY_BANK_DIR/tasks/todo/critical")
    local high_count=$(count_tasks "$MEMORY_BANK_DIR/tasks/todo/high")
    local medium_count=$(count_tasks "$MEMORY_BANK_DIR/tasks/todo/medium")
    local low_count=$(count_tasks "$MEMORY_BANK_DIR/tasks/todo/low")

    local active_count=$(count_tasks "$MEMORY_BANK_DIR/tasks/in_progress/active")
    local blocked_count=$(count_tasks "$MEMORY_BANK_DIR/tasks/in_progress/blocked")
    local review_count=$(count_tasks "$MEMORY_BANK_DIR/tasks/in_progress/review")

    echo "#### Priority Distribution"
    echo "- 🚨 **Critical**: $critical_count tasks"
    echo "- ⚡ **High**: $high_count tasks"
    echo "- 📋 **Medium**: $medium_count tasks"
    echo "- 📝 **Low**: $low_count tasks"
    echo ""

    echo "#### Status Distribution"
    echo "- 🔄 **Active**: $active_count tasks"
    echo "- ⛔ **Blocked**: $blocked_count tasks"
    echo "- 👀 **Review**: $review_count tasks"
    echo ""

    # Recommendations based on distribution
    echo "#### 💡 Recommendations"
    if [ "$critical_count" -gt 0 ]; then
        echo "- ⚠️ **Focus on critical tasks**: $critical_count critical tasks need attention"
    fi
    if [ "$blocked_count" -gt 0 ]; then
        echo "- 🚧 **Unblock tasks**: $blocked_count tasks are blocked and need resolution"
    fi
    if [ "$active_count" -gt 5 ]; then
        echo "- 🎯 **Reduce WIP**: $active_count active tasks may be too many - consider focusing"
    fi
    echo ""
}

# Generate next week planning
generate_next_week_planning() {
    echo "### 🎯 Next Week Planning"
    echo ""

    echo "#### Priorities for Week $(($WEEK_NUMBER + 1))"
    echo ""

    # Critical tasks first
    if [ "$(count_tasks "$MEMORY_BANK_DIR/tasks/todo/critical")" -gt 0 ]; then
        echo "##### 🚨 Critical Priority"
        find "$MEMORY_BANK_DIR/tasks/todo/critical" -name "*.md" -exec basename {} .md \; | head -3 | while read task; do
            echo "- [ ] \`$task\`"
        done
        echo ""
    fi

    # High priority tasks
    if [ "$(count_tasks "$MEMORY_BANK_DIR/tasks/todo/high")" -gt 0 ]; then
        echo "##### ⚡ High Priority"
        find "$MEMORY_BANK_DIR/tasks/todo/high" -name "*.md" -exec basename {} .md \; | head -5 | while read task; do
            echo "- [ ] \`$task\`"
        done
        echo ""
    fi

    # Continue active work
    if [ "$(count_tasks "$MEMORY_BANK_DIR/tasks/in_progress/active")" -gt 0 ]; then
        echo "##### 🔄 Continue Active Work"
        find "$MEMORY_BANK_DIR/tasks/in_progress/active" -name "*.md" -exec basename {} .md \; | head -3 | while read task; do
            echo "- [ ] \`$task\`"
        done
        echo ""
    fi

    echo "#### Goals for Next Week"
    echo "- [ ] Complete at least 3 high-priority tasks"
    echo "- [ ] Unblock any blocked tasks"
    echo "- [ ] Review and update task priorities"
    echo "- [ ] Maintain focus on critical objectives"
    echo ""
}

# Generate weekly insights
generate_insights() {
    local completed_count=$(get_completed_this_week | wc -l)
    local active_count=$(count_tasks "$MEMORY_BANK_DIR/tasks/in_progress/active")
    local blocked_count=$(count_tasks "$MEMORY_BANK_DIR/tasks/in_progress/blocked")

    echo "### 🧠 Weekly Insights"
    echo ""

    if [ "$completed_count" -eq 0 ]; then
        echo "- 🔄 **Focus Needed**: No tasks completed this week - review priorities and remove blockers"
    elif [ "$completed_count" -le 2 ]; then
        echo "- 📈 **Steady Progress**: $completed_count tasks completed - good momentum"
    else
        echo "- 🚀 **Excellent Progress**: $completed_count tasks completed - great productivity!"
    fi

    if [ "$blocked_count" -gt 0 ]; then
        echo "- ⚠️ **Blockers Present**: $blocked_count tasks blocked - prioritize unblocking"
    fi

    if [ "$active_count" -gt 5 ]; then
        echo "- 🎯 **Too Many Active**: $active_count active tasks - consider reducing WIP"
    elif [ "$active_count" -eq 0 ]; then
        echo "- 📋 **No Active Work**: Start working on high-priority tasks"
    fi

    echo ""
}

# Generate the report
info "Generating weekly report for Week $WEEK_NUMBER, $YEAR ($WEEK_START to $WEEK_END)"

cat > "$REPORT_FILE" << EOF
# Weekly Report - Week $WEEK_NUMBER, $YEAR

**Report Period**: $WEEK_START to $WEEK_END
**Generated**: $(date '+%Y-%m-%d %H:%M:%S')
**Report Type**: Weekly Task & Productivity Summary

---

## 🎯 Executive Summary

This week focused on task management and system productivity. Below is a comprehensive analysis of task completion, priority distribution, and planning for the upcoming week.

$(calculate_weekly_metrics)

$(generate_achievements)

$(analyze_task_distribution)

$(generate_insights)

$(generate_next_week_planning)

### 📝 Weekly Notes

*Add your weekly observations, learnings, and reflections here...*

#### Key Learnings:
-

#### Process Improvements:
-

#### Challenges Faced:
-

---

## 📊 Appendix

### Task Categories
- **FEATURE**: New functionality development
- **BUG**: Bug fixes and issue resolution
- **IMPROVEMENT**: System enhancements
- **DOCUMENTATION**: Documentation updates
- **MAINTENANCE**: System maintenance tasks

### Priority Levels
- **CRITICAL**: System-blocking, must be done immediately
- **HIGH**: Important for project success
- **MEDIUM**: Standard priority tasks
- **LOW**: Nice-to-have improvements

---

**Report ID**: weekly-$YEAR-W$WEEK_NUMBER
**Previous Week**: W$(($WEEK_NUMBER - 1))
**Next Week**: W$(($WEEK_NUMBER + 1))
EOF

success "Weekly report generated: $REPORT_FILE"
info "Report covers: $WEEK_START to $WEEK_END"
info "View report: cat $REPORT_FILE"

# Update master index
if [ -f "$MEMORY_BANK_DIR/indexes/master-index.md" ]; then
    sed -i.bak "s/\*\*Последний еженедельный отчет\*\*: Нет/**Последний еженедельный отчет**: weekly-$YEAR-W$WEEK_NUMBER/" "$MEMORY_BANK_DIR/indexes/master-index.md"
    rm -f "$MEMORY_BANK_DIR/indexes/master-index.md.bak"
    info "Updated master index with latest weekly report"
fi