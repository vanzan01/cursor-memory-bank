# Branch Management Guide for Implementation Stage

This guide explains the new branch management rules that have been integrated into the implementation workflow to prevent working on merged branches and ensure proper branch organization.

## 🎯 Problem Solved

**Common Issue:** You often find yourself working on a branch that has already been merged via a pull request, or working on a branch that's meant for a different domain/task than what you're currently implementing.

**Solution:** Automated branch validation before starting any code implementation.

## 📋 New Implementation Workflow

The implementation stage now includes a mandatory branch validation step:

```mermaid
graph TD
    Start["🚀 START IMPLEMENTATION"] --> ReadDocs["📚 Read Reference Documents"]
    ReadDocs --> BranchValidation["🔍 BRANCH VALIDATION"]
    BranchValidation --> ValidationComplete{"✅ Branch<br>Validated?"}
    
    ValidationComplete -->|"No"| FixBranch["🔧 Fix Branch Issues<br>Switch/Create New Branch"]
    FixBranch --> BranchValidation
    
    ValidationComplete -->|"Yes"| ContinueImplementation["⚒️ Continue with<br>Implementation"]
    
    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style BranchValidation fill:#ffa64d,stroke:#cc7a30,color:white
    style ValidationComplete fill:#d94dbb,stroke:#a3378a,color:white
    style FixBranch fill:#ff5555,stroke:#cc0000,color:white
    style ContinueImplementation fill:#4dbb5f,stroke:#36873f,color:white
```

## 🔍 Branch Validation Process

### Step 1: Check Current Branch Status
- Verify current branch name and status
- Check if branch has been merged via pull request
- Review recent commits to understand branch purpose

### Step 2: Validate Against Merged PRs
- Check if current branch name appears in merged PRs
- Look for patterns indicating completed features
- Verify branch hasn't already been merged

### Step 3: Domain/Task Alignment Check
- Verify current branch is appropriate for the task
- Check if code relates to current branch domain
- Determine if new branch is needed for different domain

## 🛠️ How to Use

### Automated Validation (Recommended)
```bash
# Run the branch validation script
./scripts/branch-validation.sh
```

### Manual Validation
```bash
# Check current branch
git branch --show-current

# Check status
git status

# Check recent commits
git log --oneline -5

# Check for merge commits
git log --oneline --graph --all | grep -i "merge\|pull"

# Check modified files
git diff main --name-only
```

## 🔄 Branch Management Scenarios

### Scenario 1: Branch Already Merged
**Indicators:**
- Branch name matches recently merged pull request
- Recent commits show "Merge pull request" messages
- Branch has been inactive for extended period

**Action:**
```bash
git checkout main
git pull origin main
git checkout -b feature/[new-feature-name]
```

### Scenario 2: Different Domain/Task
**Indicators:**
- Current branch focuses on different user stories
- Modified files are unrelated to current task
- Branch name doesn't match current task domain

**Action:**
```bash
git checkout -b feature/[new-domain-name]
```

### Scenario 3: Same Domain/Task
**Indicators:**
- Current branch is appropriate for the task
- Modified files relate to current task
- Branch name matches current task domain

**Action:**
```bash
git pull origin main
# Continue with current branch
```

## 📝 Branch Naming Conventions

### Feature Branches
```
feature/[domain]-[specific-feature]
Examples:
- feature/user-authentication
- feature/payment-processing
- feature/admin-dashboard
```

### Bug Fix Branches
```
bugfix/[issue-description]
Examples:
- bugfix/login-validation-error
- bugfix/database-connection-timeout
- bugfix/ui-responsive-layout
```

### Enhancement Branches
```
enhancement/[component]-[improvement]
Examples:
- enhancement/api-performance-optimization
- enhancement/ui-accessibility-improvements
- enhancement-database-query-optimization
```

## 🔍 Domain Validation Rules

### What Constitutes a Different Domain?
- **Different user-facing features** (e.g., authentication vs. payment processing)
- **Different system components** (e.g., frontend UI vs. backend API)
- **Different data models** (e.g., user management vs. product catalog)
- **Different technical concerns** (e.g., performance optimization vs. security features)

### What Constitutes the Same Domain?
- **Related features within the same component** (e.g., different aspects of user authentication)
- **Incremental improvements to existing functionality**
- **Bug fixes within the same feature area**
- **Refactoring within the same codebase area**

## 📊 Documentation Requirements

After completing branch validation, update `tasks.md` with:

```
## Branch Management
- [x] Current branch validated
- [x] Merged PR status checked
- [x] Domain alignment verified
- [x] Branch decision: [Continue/New Branch/Switch to Main]
- [x] Final branch: [branch-name]
```

## ⚠️ Warning Signs

### Merged PR Indicators
- Branch name matches recently merged pull request
- Recent commits show "Merge pull request" messages
- Branch has been inactive for extended period
- Commit history shows completed feature implementation

### Domain Mismatch Indicators
- Current branch focuses on different user stories
- Modified files are unrelated to current task
- Commit messages describe different functionality
- Branch name doesn't match current task domain

## 🎯 Key Benefits

1. **Prevents Wasted Effort:** Avoid working on already-merged branches
2. **Maintains Clean History:** Proper branch organization
3. **Improves Collaboration:** Clear separation of concerns
4. **Reduces Conflicts:** Proper branch management prevents merge conflicts
5. **Enhances Workflow:** Systematic approach to branch validation

## 🔧 Integration with Existing Workflow

The branch management rules are now integrated into:

- **Implementation Mode Map:** Updated to include branch validation step
- **Custom Implementation Instructions:** Added branch validation as Step 1.5
- **Core Rules:** New `Core/branch-management.mdc` rule file
- **Automation:** `scripts/branch-validation.sh` script for automated validation

## 📚 Related Files

- `.cursor/rules/isolation_rules/Core/branch-management.mdc` - Core branch management rules
- `.cursor/rules/isolation_rules/visual-maps/implement-mode-map.mdc` - Updated implementation workflow
- `custom_modes/implement_instructions.md` - Updated implementation instructions
- `scripts/branch-validation.sh` - Automated validation script

## 🚀 Getting Started

1. **Before any implementation:** Run `./scripts/branch-validation.sh`
2. **Review the output:** Check for warnings and recommendations
3. **Take action:** Switch branches if needed
4. **Document decision:** Update `tasks.md` with branch validation results
5. **Proceed with implementation:** Continue with normal implementation workflow

This branch management system ensures you're always working on the correct branch and prevents conflicts with already-merged work. 