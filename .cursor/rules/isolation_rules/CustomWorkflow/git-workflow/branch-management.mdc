---
description: "Branch management strategies for Memory Bank workflow"
globs: "**/*"
alwaysApply: false
---

# BRANCH MANAGEMENT FOR MEMORY BANK

> **TL;DR:** Structured branch management aligned with Memory Bank phases for safe development and easy collaboration.

## 🔧 GIT WORKFLOW CONTROLLER INTEGRATION

All git operations MUST use the centralized Git Workflow Controller:

```bash
# Load Git Workflow Controller before any git operations
fetch_rules(["isolation_rules/Core/git-workflow-controller.mdc"])
git_controller_init

# Use controller functions instead of direct git commands
```

**Key Benefits:**
- User approval in MANUAL mode for branch operations
- Comprehensive logging of branch management
- Consistent error handling across branch operations

## 🌳 BRANCH STRATEGY OVERVIEW

```mermaid
graph TD
    Main["main"] --> Feature["feature/task-id-name"]
    Main --> Hotfix["hotfix/issue-description"]

    Feature --> Phase1["phase/task-id-plan"]
    Feature --> Phase2["phase/task-id-creative"]
    Feature --> Phase3["phase/task-id-implement"]

    Phase1 --> Feature
    Phase2 --> Feature
    Phase3 --> Feature

    Feature --> Main
    Hotfix --> Main

    Main --> Backup["backup/pre-task-id"]
```

## 📋 BRANCH MANAGEMENT RULES

### Rule #32: Backup Branches Before Major Work
- **When**: Before starting Level 3-4 tasks or risky changes
- **Format**: `backup/pre-[task-id]-[date]`
- **Purpose**: Safe rollback point for complex changes

### Rule #33: Feature Branches for All Tasks
- **When**: Every task regardless of complexity
- **Format**: `feature/[task-id]-[brief-description]`
- **Purpose**: Isolated development and clean history

### Rule #34: Phase Branches for Complex Tasks
- **When**: Level 3-4 tasks with multiple phases
- **Format**: `phase/[task-id]-[phase-name]`
- **Purpose**: Checkpoint branches for long-running work

## 🎯 BRANCH NAMING CONVENTIONS

### Feature Branches:
```
feature/RULES-INT-2024-12-09-memory-bank-integration
feature/BUG-FIX-2024-12-09-login-validation
feature/ENHANCE-2024-12-09-user-dashboard
```

### Phase Branches:
```
phase/RULES-INT-2024-12-09-plan
phase/RULES-INT-2024-12-09-creative
phase/RULES-INT-2024-12-09-implement
```

### Backup Branches:
```
backup/pre-RULES-INT-2024-12-09-20241209
backup/pre-major-refactor-20241209
backup/stable-before-experiment-20241209
```

### Hotfix Branches:
```
hotfix/critical-security-patch
hotfix/production-database-fix
hotfix/memory-leak-resolution
```

## 🔄 BRANCH LIFECYCLE WORKFLOW

### 1. Pre-Task Backup Creation:
```bash
# Load Git Workflow Controller
fetch_rules(["isolation_rules/Core/git-workflow-controller.mdc"])
git_controller_init

# Create backup branch from current main using controller
git_checkout "main"
git_pull "origin" "main"
local backup_branch="backup/pre-[task-id]-$(date +%Y%m%d)"
git_branch_create "$backup_branch" "main"
git_push "origin" "$backup_branch"
```

### 2. Feature Branch Creation:
```bash
# Load Git Workflow Controller
fetch_rules(["isolation_rules/Core/git-workflow-controller.mdc"])
git_controller_init

# Create feature branch from main using controller
git_checkout "main"
local feature_branch="feature/[task-id]-[description]"
git_branch_create "$feature_branch" "main"
git_push "origin" "$feature_branch"
```

### 3. Phase Branch Creation (for complex tasks):
```bash
# Load Git Workflow Controller
fetch_rules(["isolation_rules/Core/git-workflow-controller.mdc"])
git_controller_init

# Create phase branch from feature branch using controller
git_checkout "feature/[task-id]-[description]"
local phase_branch="phase/[task-id]-[phase-name]"
git_branch_create "$phase_branch" "feature/[task-id]-[description]"
git_push "origin" "$phase_branch"
```

### 4. Phase Merge Back:
```bash
# Load Git Workflow Controller
fetch_rules(["isolation_rules/Core/git-workflow-controller.mdc"])
git_controller_init

# Merge phase back to feature using controller
git_checkout "feature/[task-id]-[description]"
git_merge "phase/[task-id]-[phase-name]"
git_push "origin" "feature/[task-id]-[description]"
git_branch_delete "phase/[task-id]-[phase-name]"
```

### 5. Feature Completion:
```bash
# Load Git Workflow Controller
fetch_rules(["isolation_rules/Core/git-workflow-controller.mdc"])
git_controller_init

# Merge feature to main using controller
git_checkout "main"
git_pull "origin" "main"
git_merge "feature/[task-id]-[description]"
git_push "origin" "main"
git_branch_delete "feature/[task-id]-[description]"
```

## 📊 MEMORY BANK PHASE BRANCHING

### VAN Mode:
- Work directly on feature branch
- Create backup branch if task is Level 3-4

### PLAN Mode:
- Continue on feature branch for Level 1-2
- Create phase branch for Level 3-4

### CREATIVE Mode:
- Use phase branch if created
- Merge creative decisions back to feature branch

### IMPLEMENT Mode:
- Use phase branch for complex implementations
- Create sub-branches for major components if needed

### QA Mode:
- Work on feature branch
- Create temporary branches for experimental fixes

### REFLECT/ARCHIVE Mode:
- Work on feature branch
- Prepare for final merge to main

## 🚨 EMERGENCY BRANCH PROCEDURES

### Hotfix Workflow:
```bash
# Load Git Workflow Controller
fetch_rules(["isolation_rules/Core/git-workflow-controller.mdc"])
git_controller_init

# Create hotfix from main using controller
git_checkout "main"
git_pull "origin" "main"
local hotfix_branch="hotfix/[issue-description]"
git_branch_create "$hotfix_branch" "main"

# Make fix and test
# ... fix code ...

# Merge back to main using controller
git_checkout "main"
git_merge "$hotfix_branch"
git_push "origin" "main"

# Also merge to current feature branches if needed
git_checkout "feature/[current-task]"
git_merge "main"
```

### Rollback Procedure:
```bash
# Load Git Workflow Controller
fetch_rules(["isolation_rules/Core/git-workflow-controller.mdc"])
git_controller_init

# If feature branch has issues, rollback to backup using controller
git_checkout "main"
git_reset_hard "backup/pre-[task-id]-[date]"
git_push "origin" "main" true  # Force push with additional confirmation

# Or rollback specific commits using controller
git_revert "[commit-hash]"
```

## 🔍 BRANCH HEALTH MONITORING

### Daily Branch Checks:
- [ ] Feature branch is up to date with main
- [ ] No merge conflicts exist
- [ ] Branch builds successfully
- [ ] All tests pass on branch

### Weekly Branch Cleanup:
- [ ] Delete merged feature branches
- [ ] Archive old backup branches
- [ ] Update branch protection rules
- [ ] Review stale branches

## 📋 BRANCH PROTECTION RULES

### Main Branch Protection:
- Require pull request reviews
- Require status checks to pass
- Require branches to be up to date
- Restrict pushes to main branch

### Feature Branch Guidelines:
- Regular commits with clear messages
- Keep branches focused and small
- Rebase before merging to maintain clean history
- Delete after successful merge

## 🎯 COLLABORATION BRANCH STRATEGY

### Team Feature Development:
```bash
# Shared feature branch
feature/[task-id]-[description]

# Individual developer branches
feature/[task-id]-[description]-[developer-name]
```

### Code Review Process:
1. Push feature branch to origin
2. Create pull request to main
3. Request reviews from team
4. Address feedback and update
5. Merge after approval

## 📊 BRANCH METRICS TRACKING

Track these metrics:
- **Branch Lifetime**: How long branches exist
- **Merge Frequency**: How often branches are merged
- **Conflict Rate**: Percentage of merges with conflicts
- **Rollback Rate**: How often rollbacks are needed

## 🔄 AUTOMATED BRANCH MANAGEMENT

### Git Hooks:
- Pre-commit: Run tests and linting
- Pre-push: Ensure branch is up to date
- Post-merge: Clean up temporary files

### CI/CD Integration:
- Automatic testing on all branches
- Deployment from main branch only
- Notification on merge conflicts

This branch strategy ensures safe development while maintaining the flexibility needed for Memory Bank workflow.