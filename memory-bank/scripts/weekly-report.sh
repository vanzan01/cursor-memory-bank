#!/bin/bash

# Weekly Report Generator for Memory Bank 2.0.0
# Usage: ./weekly-report.sh [YYYY-W##]

set -e

# Get target week (default: current week)
if [ -z "$1" ]; then
    YEAR=$(date +%Y)
    WEEK=$(date +%W)
    TARGET_WEEK="${YEAR}-W$(printf "%02d" $WEEK)"
else
    TARGET_WEEK="$1"
fi

REPORT_FILE="memory-bank/reports/weekly/${TARGET_WEEK}-weekly-report.md"

echo "📊 Generating Weekly Report for $TARGET_WEEK"

# Ensure reports directory exists
mkdir -p "memory-bank/reports/weekly"

# Calculate week date range
YEAR=$(echo $TARGET_WEEK | cut -d'-' -f1)
WEEK_NUM=$(echo $TARGET_WEEK | cut -d'W' -f2)

# Get Monday of the week
if command -v gdate >/dev/null 2>&1; then
    # macOS with GNU coreutils
    MONDAY=$(gdate -d "${YEAR}-01-01 +$(( (WEEK_NUM - 1) * 7 )) days -$(date -d "${YEAR}-01-01" +%w) days +1 day" +%Y-%m-%d)
    SUNDAY=$(gdate -d "$MONDAY +6 days" +%Y-%m-%d)
else
    # Linux date
    MONDAY=$(date -d "${YEAR}-01-01 +$(( (WEEK_NUM - 1) * 7 )) days -$(date -d "${YEAR}-01-01" +%w) days +1 day" +%Y-%m-%d 2>/dev/null || echo "${YEAR}-01-01")
    SUNDAY=$(date -d "$MONDAY +6 days" +%Y-%m-%d 2>/dev/null || echo "${YEAR}-01-07")
fi

# Generate report
cat > "$REPORT_FILE" << EOF
# Weekly Report - $TARGET_WEEK

**Generated**: $(date '+%Y-%m-%d %H:%M:%S')
**Period**: $MONDAY to $SUNDAY
**Week**: $TARGET_WEEK

## 📊 Weekly Summary

### Tasks Completed This Week
$(for day in $(seq 0 6); do
    if command -v gdate >/dev/null 2>&1; then
        current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
    else
        current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
    fi
    find memory-bank/tasks/done -name "${current_date}-*.md" 2>/dev/null
done | while read file; do
    if [ -f "$file" ]; then
        title=$(grep "^title:" "$file" | sed 's/title: //')
        priority=$(grep "^priority:" "$file" | sed 's/priority: //')
        category=$(grep "^category:" "$file" | sed 's/category: //')
        date=$(basename "$file" | cut -d'-' -f1-3)
        echo "- [$date] [$priority] [$category] $title"
        echo "  - File: [\$(basename "$file")]($file)"
    fi
done)

### Weekly Productivity Metrics
- **Total Tasks Completed**: $(for day in $(seq 0 6); do
    if command -v gdate >/dev/null 2>&1; then
        current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
    else
        current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
    fi
    find memory-bank/tasks/done -name "${current_date}-*.md" 2>/dev/null
done | wc -l)

- **Tasks Created This Week**: $(for day in $(seq 0 6); do
    if command -v gdate >/dev/null 2>&1; then
        current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
    else
        current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
    fi
    find memory-bank/tasks -name "${current_date}-*.md" 2>/dev/null
done | wc -l)

- **Average Tasks per Day**: $(echo "scale=1; $(for day in $(seq 0 6); do
    if command -v gdate >/dev/null 2>&1; then
        current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
    else
        current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
    fi
    find memory-bank/tasks/done -name "${current_date}-*.md" 2>/dev/null
done | wc -l) / 7" | bc 2>/dev/null || echo "N/A")

### Daily Breakdown
$(for day in $(seq 0 6); do
    if command -v gdate >/dev/null 2>&1; then
        current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
        day_name=$(gdate -d "$current_date" +%A)
    else
        current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
        day_name=$(date -d "$current_date" +%A 2>/dev/null || echo "Day")
    fi
    completed=$(find memory-bank/tasks/done -name "${current_date}-*.md" 2>/dev/null | wc -l)
    created=$(find memory-bank/tasks -name "${current_date}-*.md" 2>/dev/null | wc -l)
    echo "- **$day_name ($current_date)**: $completed completed, $created created"
done)

## 📈 Weekly Trends

### Priority Distribution (Completed)
$(for priority in CRITICAL HIGH MEDIUM LOW; do
    count=$(for day in $(seq 0 6); do
        if command -v gdate >/dev/null 2>&1; then
            current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
        else
            current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
        fi
        find memory-bank/tasks/done -name "${current_date}-*${priority}*.md" 2>/dev/null
    done | wc -l)
    echo "- **$priority**: $count tasks"
done)

### Category Distribution (Completed)
$(for category in FEATURE BUGFIX ENHANCEMENT RESEARCH ADMIN; do
    count=$(for day in $(seq 0 6); do
        if command -v gdate >/dev/null 2>&1; then
            current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
        else
            current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
        fi
        find memory-bank/tasks/done -name "${current_date}-*${category}*.md" 2>/dev/null
    done | wc -l)
    echo "- **$category**: $count tasks"
done)

## 🎯 Weekly Achievements

### Major Milestones
$(for day in $(seq 0 6); do
    if command -v gdate >/dev/null 2>&1; then
        current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
    else
        current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
    fi
    find memory-bank/tasks/done -name "${current_date}-*CRITICAL*.md" 2>/dev/null
done | while read file; do
    if [ -f "$file" ]; then
        title=$(grep "^title:" "$file" | sed 's/title: //')
        date=$(basename "$file" | cut -d'-' -f1-3)
        echo "- **$date**: $title"
    fi
done)

### Key Features Delivered
$(for day in $(seq 0 6); do
    if command -v gdate >/dev/null 2>&1; then
        current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
    else
        current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
    fi
    find memory-bank/tasks/done -name "${current_date}-*FEATURE*.md" 2>/dev/null
done | while read file; do
    if [ -f "$file" ]; then
        title=$(grep "^title:" "$file" | sed 's/title: //')
        date=$(basename "$file" | cut -d'-' -f1-3)
        echo "- **$date**: $title"
    fi
done)

## 🔄 Context Analysis

### Most Active Contexts This Week
$(find memory-bank/contexts -name "*.md" -exec grep -l "Context created\|Context updated" {} \; 2>/dev/null | while read file; do
    updates=$(grep -c "Context created\|Context updated" "$file" 2>/dev/null || echo "0")
    if [ "$updates" -gt 0 ]; then
        echo "$updates $(basename "$file")"
    fi
done | sort -nr | head -5 | while read count file; do
    echo "- **$file**: $count updates"
done)

### Context Switch Frequency
$(for day in $(seq 0 6); do
    if command -v gdate >/dev/null 2>&1; then
        current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
    else
        current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
    fi
    switches=$(grep -r "Context created\|Context updated" memory-bank/contexts/ 2>/dev/null | grep "$current_date" | wc -l || echo "0")
    echo "- **$current_date**: $switches context switches"
done)

## 📊 Performance Analysis

### Completion Rate by Priority
$(for priority in CRITICAL HIGH MEDIUM LOW; do
    total=$(find memory-bank/tasks -name "*${priority}*.md" 2>/dev/null | wc -l)
    completed=$(find memory-bank/tasks/done -name "*${priority}*.md" 2>/dev/null | wc -l)
    if [ "$total" -gt 0 ]; then
        rate=$(echo "scale=1; $completed * 100 / $total" | bc 2>/dev/null || echo "0")
        echo "- **$priority**: ${rate}% ($completed/$total)"
    else
        echo "- **$priority**: No tasks"
    fi
done)

### Weekly Velocity Trend
- **Tasks Completed**: $(for day in $(seq 0 6); do
    if command -v gdate >/dev/null 2>&1; then
        current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
    else
        current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
    fi
    find memory-bank/tasks/done -name "${current_date}-*.md" 2>/dev/null
done | wc -l) tasks this week

## 🎯 Next Week Planning

### Carry-over Tasks
$(find memory-bank/tasks/in_progress -name "*.md" 2>/dev/null | while read file; do
    if [ -f "$file" ]; then
        title=$(grep "^title:" "$file" | sed 's/title: //')
        priority=$(grep "^priority:" "$file" | sed 's/priority: //')
        category=$(grep "^category:" "$file" | sed 's/category: //')
        echo "- [$priority] [$category] $title"
    fi
done)

### High Priority Backlog
$(find memory-bank/tasks/todo/critical memory-bank/tasks/todo/high -name "*.md" 2>/dev/null | head -10 | while read file; do
    if [ -f "$file" ]; then
        title=$(grep "^title:" "$file" | sed 's/title: //')
        priority=$(grep "^priority:" "$file" | sed 's/priority: //')
        category=$(grep "^category:" "$file" | sed 's/category: //')
        echo "- [$priority] [$category] $title"
    fi
done)

## 📝 Weekly Insights

### What Worked Well
- [Add manual observations about successful patterns]

### Areas for Improvement
- [Add manual observations about inefficiencies]

### Process Optimizations
- [Add manual insights about workflow improvements]

## 🔗 Related Reports

### Daily Reports This Week
$(for day in $(seq 0 6); do
    if command -v gdate >/dev/null 2>&1; then
        current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
    else
        current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
    fi
    report_file="memory-bank/reports/daily/daily-report-${current_date}.md"
    if [ -f "$report_file" ]; then
        echo "- [Daily Report - $current_date]($report_file)"
    fi
done)

---
*Report generated by Memory Bank 2.0.0 Weekly Report System*
*Next week: $(if command -v gdate >/dev/null 2>&1; then
    next_week_num=$((WEEK_NUM + 1))
    if [ $next_week_num -gt 52 ]; then
        echo "$((YEAR + 1))-W01"
    else
        echo "${YEAR}-W$(printf "%02d" $next_week_num)"
    fi
else
    echo "Next week"
fi)*
EOF

echo "✅ Weekly report generated: $REPORT_FILE"

# Optional: Display summary
echo ""
echo "📊 WEEKLY SUMMARY for $TARGET_WEEK ($MONDAY to $SUNDAY):"
echo "   Total Completed: $(for day in $(seq 0 6); do
    if command -v gdate >/dev/null 2>&1; then
        current_date=$(gdate -d "$MONDAY +$day days" +%Y-%m-%d)
    else
        current_date=$(date -d "$MONDAY +$day days" +%Y-%m-%d 2>/dev/null || echo "$MONDAY")
    fi
    find memory-bank/tasks/done -name "${current_date}-*.md" 2>/dev/null
done | wc -l) tasks"