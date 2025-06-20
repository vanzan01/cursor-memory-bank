# Cursor Memory Bank

> **TL;DR:** Comprehensive development workflow system with intelligent task management, context switching, and automated reporting.

## 🚀 What's New in Latest Release

### Task Management Revolution (2025-06-20)
- **New Task Structure**: YYYY-MM-DD format with priority-based organization
- **Context Management**: Multi-context switching with WIP limits
- **Automated Reporting**: Daily/weekly/monthly reports with metrics
- **Legacy Migration**: Automatic migration from old tasks.md format
- **Enhanced Folder Structure**: Organized by priority and status

### Key Features
- ✅ **Automated Task Organization**: Priority-based folder structure
- 🔄 **Context Switching**: Seamless switching between multiple tasks
- 📊 **Comprehensive Reporting**: Daily, weekly, and monthly insights
- 🔍 **Master Index**: Centralized navigation and search
- 🛡️ **Safe Migration**: Automatic legacy format migration
- 📈 **Trend Analysis**: Performance metrics and productivity insights

## 📁 New File Structure

```
memory-bank/
├── tasks/
│   ├── todo/
│   │   ├── critical/     # System-blocking issues
│   │   ├── high/         # Feature-blocking tasks
│   │   ├── medium/       # Enhancements
│   │   └── low/          # Nice-to-have items
│   ├── in_progress/
│   │   ├── active/       # Currently working on
│   │   ├── blocked/      # Waiting for dependencies
│   │   └── review/       # Ready for review
│   └── done/
│       ├── 2025-06/      # Completed this month
│       ├── 2025-05/      # Previous months
│       └── ...
├── contexts/
│   ├── active/           # Current work contexts
│   ├── suspended/        # Paused contexts
│   └── archived/         # Completed contexts
├── reports/
│   ├── daily/            # Daily task summaries
│   ├── weekly/           # Weekly progress reports
│   └── monthly/          # Monthly trend analysis
├── templates/            # Task and context templates
├── indexes/              # Master index and navigation
└── scripts/              # Automation scripts
```

## 📋 Task File Format

Each task follows the `YYYY-MM-DD-PRIORITY-CATEGORY-task-name.md` format:

```markdown
# Task: Implement User Authentication

**Created**: 2025-06-20
**Priority**: HIGH
**Category**: FEATURE
**Status**: TODO
**Estimated Time**: 4 hours

## 📋 Task Metadata
- **ID**: 2025-06-20-HIGH-FEATURE-implement-user-authentication
- **Dependencies**: []
- **Blocking**: [user-dashboard, admin-panel]
- **Context**: authentication-system

## 🎯 Objectives
- [ ] Design authentication flow
- [ ] Implement login/logout
- [ ] Add password reset
- [ ] Create user sessions

## 📊 Progress Tracking
- **Completion**: 0%
- **Time Spent**: 0h
- **Sessions**: 0
```

## 🔄 Context Management

Work contexts help manage focus and enable seamless task switching:

```markdown
# Context: Authentication System

**Created**: 2025-06-20
**Status**: ACTIVE
**WIP Limit**: 3 tasks
**Focus Session**: 25 minutes

## 🎯 Current Focus
Working on user authentication implementation

## 📋 Active Tasks
1. 2025-06-20-HIGH-FEATURE-implement-user-authentication
2. 2025-06-20-MEDIUM-FEATURE-add-password-validation

## 🧠 Mental State
- Understanding OAuth 2.0 flow
- Researching JWT best practices
- Planning database schema changes
```

## 📊 Reporting System

### Daily Reports
```bash
./memory-bank/scripts/daily-report.sh
```

### Weekly Reports
```bash
./memory-bank/scripts/weekly-report.sh
```

### View Reports
```bash
# Today's report
cat memory-bank/reports/daily/daily-report-$(date +%Y-%m-%d).md

# This week's report
cat memory-bank/reports/weekly/weekly-report-$(date +%Y-W%V).md
```

## 🔧 Quick Start

### 1. Automatic Migration
If you have an existing `memory-bank/tasks.md`, it will be automatically migrated:

```bash
# Migration happens automatically in VAN mode
# Or run manually:
./memory-bank/scripts/migrate-from-legacy.sh
```

### 2. Create New Task
```bash
# Use the task template
cp memory-bank/templates/task-template.md memory-bank/tasks/todo/high/2025-06-20-HIGH-FEATURE-my-new-task.md
```

### 3. Start Working
```bash
# Generate daily report to see current status
./memory-bank/scripts/daily-report.sh

# View master index for navigation
cat memory-bank/indexes/master-index.md
```

### 4. Context Switching
```bash
# Create new context
cp memory-bank/templates/context-template.md memory-bank/contexts/active/my-context.md

# Suspend current context
mv memory-bank/contexts/active/current-context.md memory-bank/contexts/suspended/
```

## 🎯 Memory Bank Modes

### VAN Mode
- Automatic legacy migration
- System analysis and validation
- Task status overview
- Context loading

### PLAN Mode
- Strategic planning with web research
- Component analysis
- Implementation roadmaps

### CREATIVE Mode
- Architectural decision making
- Design pattern selection
- Multiple option analysis

### IMPLEMENT Mode
- Code implementation
- Progress tracking
- Context management

### REFLECT Mode
- Automated report generation
- Performance analysis
- Lessons learned documentation

### ARCHIVE Mode
- Task archival by date
- Context preservation
- Knowledge extraction

## 📈 Productivity Features

### WIP Limits
- Maximum 3-5 active tasks per context
- Automatic warnings for overload
- Focus session management

### Automated Metrics
- Task completion rates
- Time estimation accuracy
- Context switching frequency
- Productivity trends

### Smart Navigation
- Master index with statistics
- Quick search and filters
- Priority-based organization
- Date-based sorting

## 🛡️ Safety Features

### Backup System
- Automatic git commits
- Legacy format preservation
- Rollback capabilities

### Migration Safety
- Non-destructive migration
- Validation and error handling
- Progress tracking
- Detailed logging

## 🔗 Integration

### Git Workflow
- Feature branch development
- Automated commits
- Merge to main after ARCHIVE

### IDE Integration
- Cursor IDE custom modes
- Template-based creation
- Automated workflows

### Web Search Integration
- Research during PLAN phase
- Error resolution in IMPLEMENT
- Best practice discovery

---

**Last Updated**: 2025-06-20
**Version**: 2.0.0 - Task Management Revolution
