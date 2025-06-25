# Git Workflow Controller

## OVERVIEW

This is the **centralized Git operations controller** for Memory Bank 2.0.0 system. It provides unified interface for all git operations with built-in interaction-mode awareness, comprehensive logging, and error handling.

**Core Principle**: Every git operation MUST go through this controller to ensure user control and system consistency.

## CORE FUNCTIONS

### Initialization and Validation

```bash
# Initialize git controller
git_controller_init() {
    echo "🔧 Initializing Git Workflow Controller..."

    # Check if git is available
    if ! command -v git &> /dev/null; then
        echo "❌ ERROR: Git is not installed or not in PATH"
        echo "Please install git to use git operations"
        return 1
    fi

    # Check if we're in a git repository
    if ! git rev-parse --git-dir &> /dev/null; then
        echo "⚠️ WARNING: Not in a git repository"
        echo "Some git operations may not be available"
    fi

    # Initialize interaction mode if not exists
    initialize_interaction_mode

    # Create git log directory
    mkdir -p memory-bank/system/logs/git

    echo "✅ Git Workflow Controller initialized successfully"
    return 0
}

# Validate git environment
git_controller_validate_environment() {
    local issues=0

    echo "🔍 Validating git environment..."

    # Check git installation
    if ! command -v git &> /dev/null; then
        echo "❌ Git not found in PATH"
        ((issues++))
    else
        echo "✅ Git found: $(git --version)"
    fi

    # Check repository status
    if git rev-parse --git-dir &> /dev/null; then
        echo "✅ Git repository detected"
        echo "📍 Repository root: $(git rev-parse --show-toplevel)"
    else
        echo "⚠️ Not in a git repository"
    fi

    # Check interaction mode file
    if [[ -f "memory-bank/system/interaction-mode.txt" ]]; then
        local mode=$(cat memory-bank/system/interaction-mode.txt 2>/dev/null || echo "unknown")
        echo "✅ Interaction mode: $mode"
    else
        echo "⚠️ Interaction mode file not found, will create with default MANUAL"
    fi

    return $issues
}

# Check if we're in a git repository
git_controller_check_repository() {
    if ! git rev-parse --git-dir &> /dev/null; then
        echo "❌ ERROR: Not in a git repository"
        echo "Please run this command from within a git repository"
        return 1
    fi
    return 0
}
```

### Interaction Mode Management

```bash
# Get current interaction mode
get_interaction_mode() {
    local mode_file="memory-bank/system/interaction-mode.txt"

    if [[ -f "$mode_file" ]]; then
        local mode=$(cat "$mode_file" 2>/dev/null | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')
        case "$mode" in
            "auto"|"manual")
                echo "$mode"
                ;;
            *)
                echo "manual"  # Default fallback
                ;;
        esac
    else
        echo "manual"  # Default fallback
    fi
}

# Set interaction mode
set_interaction_mode() {
    local mode="$1"
    local mode_file="memory-bank/system/interaction-mode.txt"

    case "$mode" in
        "auto"|"AUTO")
            echo "auto" > "$mode_file"
            echo "✅ Interaction mode set to AUTO"
            ;;
        "manual"|"MANUAL")
            echo "manual" > "$mode_file"
            echo "✅ Interaction mode set to MANUAL"
            ;;
        *)
            echo "❌ ERROR: Invalid interaction mode '$mode'"
            echo "Valid modes: auto, manual"
            return 1
            ;;
    esac
}

# Initialize interaction mode with default
initialize_interaction_mode() {
    local mode_file="memory-bank/system/interaction-mode.txt"

    if [[ ! -f "$mode_file" ]]; then
        mkdir -p "$(dirname "$mode_file")"
        echo "manual" > "$mode_file"
        echo "📝 Created default interaction mode: MANUAL"
    fi
}

# Prompt user for approval in MANUAL mode
prompt_user_approval() {
    local operation="$1"
    local details="$2"
    local timeout=30

    echo ""
    echo "🔐 GIT OPERATION APPROVAL REQUIRED"
    echo "═══════════════════════════════════"
    echo "Operation: $operation"
    echo "Details: $details"
    echo ""
    echo "Current interaction mode: MANUAL"
    echo ""
    echo "Do you want to proceed with this git operation?"
    echo "Options:"
    echo "  y/yes - Approve and execute"
    echo "  n/no  - Cancel operation"
    echo "  a/auto - Switch to AUTO mode and execute"
    echo ""

    local response
    read -t $timeout -p "Your choice (y/n/a): " response
    local read_status=$?

    if [[ $read_status -ne 0 ]]; then
        echo ""
        echo "⏰ Timeout reached ($timeout seconds). Operation cancelled for safety."
        return 1
    fi

    case "$response" in
        "y"|"yes"|"Y"|"YES")
            echo "✅ Operation approved by user"
            return 0
            ;;
        "a"|"auto"|"A"|"AUTO")
            echo "🔄 Switching to AUTO mode..."
            set_interaction_mode "auto"
            echo "✅ Operation approved and mode switched to AUTO"
            return 0
            ;;
        "n"|"no"|"N"|"NO"|"")
            echo "❌ Operation cancelled by user"
            return 1
            ;;
        *)
            echo "❌ Invalid response '$response'. Operation cancelled for safety."
            return 1
            ;;
    esac
}

# Check if user approval is needed and get it
check_user_approval() {
    local operation="$1"
    local details="$2"
    local current_mode=$(get_interaction_mode)

    case "$current_mode" in
        "manual")
            prompt_user_approval "$operation" "$details"
            return $?
            ;;
        "auto")
            echo "🤖 AUTO mode: Executing git operation automatically"
            return 0
            ;;
        *)
            echo "⚠️ Unknown interaction mode '$current_mode', defaulting to MANUAL"
            prompt_user_approval "$operation" "$details"
            return $?
            ;;
    esac
}
```

### Git Operations

```bash
# Git commit with interaction-mode awareness
git_commit() {
    local message="$1"
    local files="$2"
    local interactive="${3:-false}"

    # Validate inputs
    if [[ -z "$message" ]]; then
        echo "❌ ERROR: Commit message is required"
        return 1
    fi

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    # Prepare operation details
    local details="Message: '$message'"
    if [[ -n "$files" ]]; then
        details="$details, Files: $files"
    fi

    # Check user approval
    if ! check_user_approval "git commit" "$details"; then
        log_git_operation "commit" "$message" "cancelled" "$(get_interaction_mode)"
        return 1
    fi

    # Execute git commit
    echo "📝 Executing git commit..."

    local git_cmd="git commit -m \"$message\""
    if [[ -n "$files" ]]; then
        git_cmd="git add $files && $git_cmd"
    fi

    if eval "$git_cmd"; then
        echo "✅ Git commit successful"
        log_git_operation "commit" "$message" "success" "$(get_interaction_mode)"
        return 0
    else
        echo "❌ Git commit failed"
        log_git_operation "commit" "$message" "failed" "$(get_interaction_mode)"
        return 1
    fi
}

# Git push with interaction-mode awareness
git_push() {
    local remote="${1:-origin}"
    local branch="${2:-$(git branch --show-current 2>/dev/null)}"
    local force="${3:-false}"

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    # Validate branch
    if [[ -z "$branch" ]]; then
        echo "❌ ERROR: Cannot determine current branch"
        return 1
    fi

    # Prepare operation details
    local details="Remote: $remote, Branch: $branch"
    if [[ "$force" == "true" ]]; then
        details="$details (FORCE PUSH - DANGEROUS)"
    fi

    # Check user approval (always prompt for force push)
    if [[ "$force" == "true" ]] || ! check_user_approval "git push" "$details"; then
        if [[ "$force" == "true" ]]; then
            echo "🚨 FORCE PUSH DETECTED - Additional confirmation required"
            echo "This operation can overwrite remote history and cause data loss!"
            read -p "Type 'FORCE' to confirm force push: " confirm
            if [[ "$confirm" != "FORCE" ]]; then
                echo "❌ Force push cancelled"
                log_git_operation "push" "$remote/$branch" "cancelled_force" "$(get_interaction_mode)"
                return 1
            fi
        else
            log_git_operation "push" "$remote/$branch" "cancelled" "$(get_interaction_mode)"
            return 1
        fi
    fi

    # Execute git push
    echo "📤 Executing git push..."

    local git_cmd="git push $remote $branch"
    if [[ "$force" == "true" ]]; then
        git_cmd="git push --force-with-lease $remote $branch"
    fi

    if eval "$git_cmd"; then
        echo "✅ Git push successful"
        log_git_operation "push" "$remote/$branch" "success" "$(get_interaction_mode)"
        return 0
    else
        echo "❌ Git push failed"
        log_git_operation "push" "$remote/$branch" "failed" "$(get_interaction_mode)"
        return 1
    fi
}

# Git pull with interaction-mode awareness
git_pull() {
    local remote="${1:-origin}"
    local branch="${2:-$(git branch --show-current 2>/dev/null)}"

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    # Validate branch
    if [[ -z "$branch" ]]; then
        echo "❌ ERROR: Cannot determine current branch"
        return 1
    fi

    # Prepare operation details
    local details="Remote: $remote, Branch: $branch"

    # Check user approval
    if ! check_user_approval "git pull" "$details"; then
        log_git_operation "pull" "$remote/$branch" "cancelled" "$(get_interaction_mode)"
        return 1
    fi

    # Execute git pull
    echo "📥 Executing git pull..."

    if git pull "$remote" "$branch"; then
        echo "✅ Git pull successful"
        log_git_operation "pull" "$remote/$branch" "success" "$(get_interaction_mode)"
        return 0
    else
        echo "❌ Git pull failed (possible conflicts)"
        echo "💡 Use 'git status' to check for merge conflicts"
        log_git_operation "pull" "$remote/$branch" "failed" "$(get_interaction_mode)"
        return 1
    fi
}

# Git stash with interaction-mode awareness
git_stash() {
    local message="${1:-Auto-stash by Git Workflow Controller}"
    local include_untracked="${2:-false}"

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    # Prepare operation details
    local details="Message: '$message'"
    if [[ "$include_untracked" == "true" ]]; then
        details="$details (including untracked files)"
    fi

    # Check user approval
    if ! check_user_approval "git stash" "$details"; then
        log_git_operation "stash" "$message" "cancelled" "$(get_interaction_mode)"
        return 1
    fi

    # Execute git stash
    echo "📦 Executing git stash..."

    local git_cmd="git stash push -m \"$message\""
    if [[ "$include_untracked" == "true" ]]; then
        git_cmd="git stash push -u -m \"$message\""
    fi

    if eval "$git_cmd"; then
        echo "✅ Git stash successful"
        log_git_operation "stash" "$message" "success" "$(get_interaction_mode)"
        return 0
    else
        echo "❌ Git stash failed"
        log_git_operation "stash" "$message" "failed" "$(get_interaction_mode)"
        return 1
    fi
}

# Git status (read-only, no approval needed)
git_status() {
    local porcelain="${1:-false}"

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    echo "📊 Git repository status:"

    if [[ "$porcelain" == "true" ]]; then
        git status --porcelain
    else
        git status
    fi

    return $?
}

# Git branch create with interaction-mode awareness
git_branch_create() {
    local name="$1"
    local from_branch="${2:-main}"

    # Validate inputs
    if [[ -z "$name" ]]; then
        echo "❌ ERROR: Branch name is required"
        return 1
    fi

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    # Prepare operation details
    local details="New branch: '$name' from '$from_branch'"

    # Check user approval
    if ! check_user_approval "git branch create" "$details"; then
        log_git_operation "branch_create" "$name" "cancelled" "$(get_interaction_mode)"
        return 1
    fi

    # Execute git branch creation
    echo "🌿 Creating new branch..."

    if git checkout -b "$name" "$from_branch"; then
        echo "✅ Branch '$name' created and checked out"
        log_git_operation "branch_create" "$name" "success" "$(get_interaction_mode)"
        return 0
    else
        echo "❌ Branch creation failed"
        log_git_operation "branch_create" "$name" "failed" "$(get_interaction_mode)"
        return 1
    fi
}

# Git checkout with interaction-mode awareness
git_checkout() {
    local branch="$1"

    # Validate inputs
    if [[ -z "$branch" ]]; then
        echo "❌ ERROR: Branch name is required"
        return 1
    fi

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    # Prepare operation details
    local details="Checkout to branch: '$branch'"

    # Check user approval
    if ! check_user_approval "git checkout" "$details"; then
        log_git_operation "checkout" "$branch" "cancelled" "$(get_interaction_mode)"
        return 1
    fi

    # Execute git checkout
    echo "🔄 Checking out branch..."

    if git checkout "$branch"; then
        echo "✅ Checked out to branch '$branch'"
        log_git_operation "checkout" "$branch" "success" "$(get_interaction_mode)"
        return 0
    else
        echo "❌ Checkout failed"
        log_git_operation "checkout" "$branch" "failed" "$(get_interaction_mode)"
        return 1
    fi
}

# Git reset hard with interaction-mode awareness
git_reset_hard() {
    local target="$1"

    # Validate inputs
    if [[ -z "$target" ]]; then
        echo "❌ ERROR: Reset target is required"
        return 1
    fi

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    # Prepare operation details
    local details="DANGEROUS: Hard reset to '$target' (will lose uncommitted changes)"

    # Force confirmation for dangerous operation
    echo "⚠️ WARNING: This is a DANGEROUS operation!"
    echo "This will permanently delete all uncommitted changes."

    # Check user approval with extra confirmation
    if ! check_user_approval "git reset --hard" "$details"; then
        log_git_operation "reset_hard" "$target" "cancelled" "$(get_interaction_mode)"
        return 1
    fi

    # Additional confirmation for safety
    echo "🚨 FINAL CONFIRMATION: Are you absolutely sure?"
    read -p "Type 'YES' to confirm hard reset: " confirmation
    if [[ "$confirmation" != "YES" ]]; then
        echo "❌ Hard reset cancelled"
        log_git_operation "reset_hard" "$target" "cancelled_final" "$(get_interaction_mode)"
        return 1
    fi

    # Execute git reset
    echo "💥 Executing hard reset..."

    if git reset --hard "$target"; then
        echo "✅ Hard reset to '$target' completed"
        log_git_operation "reset_hard" "$target" "success" "$(get_interaction_mode)"
        return 0
    else
        echo "❌ Hard reset failed"
        log_git_operation "reset_hard" "$target" "failed" "$(get_interaction_mode)"
        return 1
    fi
}

# Git tag create with interaction-mode awareness
git_tag_create() {
    local tag_name="$1"
    local message="$2"

    # Validate inputs
    if [[ -z "$tag_name" ]]; then
        echo "❌ ERROR: Tag name is required"
        return 1
    fi

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    # Prepare operation details
    local details="Create tag: '$tag_name'"
    if [[ -n "$message" ]]; then
        details="$details with message: '$message'"
    fi

    # Check user approval
    if ! check_user_approval "git tag create" "$details"; then
        log_git_operation "tag_create" "$tag_name" "cancelled" "$(get_interaction_mode)"
        return 1
    fi

    # Execute git tag
    echo "🏷️ Creating tag..."

    local git_cmd="git tag"
    if [[ -n "$message" ]]; then
        git_cmd="git tag -a '$tag_name' -m '$message'"
    else
        git_cmd="git tag '$tag_name'"
    fi

    if eval "$git_cmd"; then
        echo "✅ Tag '$tag_name' created"
        log_git_operation "tag_create" "$tag_name" "success" "$(get_interaction_mode)"
        return 0
    else
        echo "❌ Tag creation failed"
        log_git_operation "tag_create" "$tag_name" "failed" "$(get_interaction_mode)"
        return 1
    fi
}

# Git diff with interaction-mode awareness (read-only)
git_diff() {
    local file1="${1:-}"
    local file2="${2:-}"

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    echo "📋 Git diff:"

    if [[ -n "$file1" && -n "$file2" ]]; then
        git diff "$file1" "$file2"
    elif [[ -n "$file1" ]]; then
        git diff "$file1"
    else
        git diff
    fi

    return $?
}

# Git branch list (read-only)
git_branch_list() {
    local remote="${1:-false}"

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    echo "🌿 Git branches:"

    if [[ "$remote" == "true" ]]; then
        git branch -r
    else
        git branch
    fi

    return $?
}

# Git remote list (read-only)
git_remote_list() {
    local remote_name="${1:-}"

    # Check repository
    if ! git_controller_check_repository; then
        return 1
    fi

    echo "🌐 Git remotes:"

    if [[ -n "$remote_name" ]]; then
        git ls-remote "$remote_name"
    else
        git remote -v
    fi

    return $?
}

# Git log check for specific pattern
git_log_check() {
    local pattern="${1:-}"
    local count="${2:-5}"

    if ! validate_git_environment; then
        return 1
    fi

    log_git_operation "git_log_check" "Checking log for pattern: $pattern (last $count commits)"

    git log --oneline -"$count" | grep "$pattern"
}

# Git log last backup timestamp
git_log_last_backup() {
    if ! validate_git_environment; then
        return 1
    fi

    log_git_operation "git_log_last_backup" "Getting last backup timestamp"

    git log --grep="AUTO-BACKUP" --format="%ct" -1
}

# Git merge with interaction-mode awareness
git_merge() {
    local branch="${1:-}"
    local strategy="${2:-}"

    if [[ -z "$branch" ]]; then
        echo "❌ ERROR: Branch name is required for git_merge"
        return 1
    fi

    if ! validate_git_environment; then
        return 1
    fi

    local details="Merge branch '$branch' into current branch"
    if [[ -n "$strategy" ]]; then
        details="$details using strategy '$strategy'"
    fi

    log_git_operation "git_merge" "$details"

    # Check interaction mode
    if ! check_user_approval "git merge" "$details"; then
        echo "❌ Git merge cancelled by user"
        return 1
    fi

    # Execute git merge
    echo "🔀 Executing git merge..."
    local git_cmd="git merge $branch"
    if [[ -n "$strategy" ]]; then
        git_cmd="git merge -s $strategy $branch"
    fi

    if eval "$git_cmd"; then
        echo "✅ Git merge successful"
        log_git_operation "git_merge" "SUCCESS: Merged $branch"
        return 0
    else
        echo "❌ Git merge failed (possible conflicts)"
        echo "💡 Use 'git status' to check for merge conflicts"
        log_git_operation "git_merge" "FAILED: Merge conflicts or error"
        return 1
    fi
}

# Git branch delete with interaction-mode awareness
git_branch_delete() {
    local branch="${1:-}"
    local force="${2:-false}"

    if [[ -z "$branch" ]]; then
        echo "❌ ERROR: Branch name is required for git_branch_delete"
        return 1
    fi

    if ! validate_git_environment; then
        return 1
    fi

    local details="Delete branch '$branch'"
    if [[ "$force" == "true" ]]; then
        details="$details (FORCE DELETE)"
    fi

    log_git_operation "git_branch_delete" "$details"

    # Check interaction mode
    if ! check_user_approval "git branch delete" "$details"; then
        echo "❌ Git branch delete cancelled by user"
        return 1
    fi

    # Execute git branch delete
    echo "🗑️ Executing git branch delete..."
    local git_cmd="git branch -d $branch"
    if [[ "$force" == "true" ]]; then
        git_cmd="git branch -D $branch"
    fi

    if eval "$git_cmd"; then
        echo "✅ Git branch delete successful"
        log_git_operation "git_branch_delete" "SUCCESS: Deleted $branch"
        return 0
    else
        echo "❌ Git branch delete failed"
        log_git_operation "git_branch_delete" "FAILED: Could not delete $branch"
        return 1
    fi
}

# Git revert with interaction-mode awareness
git_revert() {
    local commit="${1:-}"
    local no_edit="${2:-false}"

    if [[ -z "$commit" ]]; then
        echo "❌ ERROR: Commit hash is required for git_revert"
        return 1
    fi

    if ! validate_git_environment; then
        return 1
    fi

    local details="Revert commit '$commit'"
    if [[ "$no_edit" == "true" ]]; then
        details="$details (no edit)"
    fi

    log_git_operation "git_revert" "$details"

    # Check interaction mode
    if ! check_user_approval "git revert" "$details"; then
        echo "❌ Git revert cancelled by user"
        return 1
    fi

    # Execute git revert
    echo "↩️ Executing git revert..."
    local git_cmd="git revert $commit"
    if [[ "$no_edit" == "true" ]]; then
        git_cmd="git revert --no-edit $commit"
    fi

    if eval "$git_cmd"; then
        echo "✅ Git revert successful"
        log_git_operation "git_revert" "SUCCESS: Reverted $commit"
        return 0
    else
        echo "❌ Git revert failed"
        log_git_operation "git_revert" "FAILED: Could not revert $commit"
        return 1
    fi
}

# Git show (read-only)
git_show() {
    local commit="${1:-HEAD}"
    local options="${2:-}"

    if ! validate_git_environment; then
        return 1
    fi

    log_git_operation "git_show" "Showing commit: $commit $options"

    echo "📋 Git show:"
    if [[ -n "$options" ]]; then
        git show "$commit" $options
    else
        git show "$commit"
    fi

    return $?
}

# Git tag list (read-only)
git_tag_list() {
    local pattern="${1:-}"

    if ! validate_git_environment; then
        return 1
    fi

    log_git_operation "git_tag_list" "Listing tags${pattern:+ matching $pattern}"

    echo "🏷️ Git tags:"
    if [[ -n "$pattern" ]]; then
        git tag | grep "$pattern"
    else
        git tag
    fi

    return $?
}

# Git fsck check (read-only)
git_fsck_check() {
    local target="${1:-}"

    if ! validate_git_environment; then
        return 1
    fi

    log_git_operation "git_fsck_check" "Checking integrity${target:+ for $target}"

    echo "🔍 Git fsck check:"
    if [[ -n "$target" ]]; then
        git fsck --connectivity-only "$target"
    else
        git fsck --connectivity-only
    fi

    return $?
}

# Git log (read-only)
git_log() {
    local options="${1:-}"
    local count="${2:-10}"

    if ! validate_git_environment; then
        return 1
    fi

    log_git_operation "git_log" "Getting log with options: $options"

    echo "📜 Git log:"
    if [[ -n "$options" ]]; then
        git log $options
    else
        git log --oneline -n "$count"
    fi

    return $?
}

```