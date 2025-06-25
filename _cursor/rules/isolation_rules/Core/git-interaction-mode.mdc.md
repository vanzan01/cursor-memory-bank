# Git Interaction Mode Integration

## OVERVIEW

This module provides specialized interaction mode management for Git Workflow Controller. It handles the integration between user preferences and git operations, ensuring that the system respects user control settings.

**Core Principle**: User control over git operations through configurable interaction modes.

## INTERACTION MODE SYSTEM

### Mode Definitions

```bash
# Interaction mode constants
readonly GIT_MODE_MANUAL="manual"
readonly GIT_MODE_AUTO="auto"
readonly GIT_MODE_DEFAULT="manual"
readonly GIT_MODE_FILE="memory-bank/system/interaction-mode.txt"
readonly GIT_CONFIG_FILE="memory-bank/system/git-config.txt"
```

### Core Functions

```bash
# Initialize interaction mode system
initialize_git_interaction_mode() {
    echo "🔧 Initializing Git Interaction Mode system..."

    # Create system directory if not exists
    mkdir -p "memory-bank/system"
    mkdir -p "memory-bank/system/logs/git"

    # Initialize interaction mode file
    if [[ ! -f "$GIT_MODE_FILE" ]]; then
        echo "$GIT_MODE_DEFAULT" > "$GIT_MODE_FILE"
        echo "📝 Created interaction mode file with default: $GIT_MODE_DEFAULT"
    fi

    # Initialize git config file
    initialize_git_config

    # Validate current mode
    validate_interaction_mode_file

    echo "✅ Git Interaction Mode system initialized"
    return 0
}

# Initialize git configuration file
initialize_git_config() {
    if [[ ! -f "$GIT_CONFIG_FILE" ]]; then
        cat > "$GIT_CONFIG_FILE" << EOF
# Git Workflow Controller Configuration
GIT_CONTROLLER_ENABLED=true
GIT_INTERACTION_MODE=$GIT_MODE_DEFAULT
GIT_LOG_LEVEL=info
GIT_TIMEOUT=30
GIT_RETRY_COUNT=3
GIT_FORCE_CONFIRMATION=true
GIT_AUTO_STASH=false
EOF
        echo "📝 Created git configuration file"
    fi
}

# Validate interaction mode file
validate_interaction_mode_file() {
    if [[ ! -f "$GIT_MODE_FILE" ]]; then
        echo "⚠️ Interaction mode file not found, creating default"
        echo "$GIT_MODE_DEFAULT" > "$GIT_MODE_FILE"
        return 1
    fi

    local current_mode=$(cat "$GIT_MODE_FILE" 2>/dev/null | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')

    case "$current_mode" in
        "$GIT_MODE_MANUAL"|"$GIT_MODE_AUTO")
            echo "✅ Valid interaction mode: $current_mode"
            return 0
            ;;
        *)
            echo "⚠️ Invalid interaction mode '$current_mode', resetting to default"
            echo "$GIT_MODE_DEFAULT" > "$GIT_MODE_FILE"
            return 1
            ;;
    esac
}

# Get current interaction mode with validation
get_git_interaction_mode() {
    local mode_file="$GIT_MODE_FILE"

    if [[ -f "$mode_file" ]]; then
        local mode=$(cat "$mode_file" 2>/dev/null | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')
        case "$mode" in
            "$GIT_MODE_MANUAL"|"$GIT_MODE_AUTO")
                echo "$mode"
                return 0
                ;;
            *)
                echo "⚠️ Invalid mode '$mode' in file, using default" >&2
                echo "$GIT_MODE_DEFAULT"
                return 1
                ;;
        esac
    else
        echo "⚠️ Mode file not found, using default" >&2
        echo "$GIT_MODE_DEFAULT"
        return 1
    fi
}

# Set interaction mode with validation
set_git_interaction_mode() {
    local new_mode="$1"
    local mode_file="$GIT_MODE_FILE"

    # Validate input
    if [[ -z "$new_mode" ]]; then
        echo "❌ ERROR: Mode parameter is required"
        echo "Valid modes: $GIT_MODE_MANUAL, $GIT_MODE_AUTO"
        return 1
    fi

    # Normalize mode
    new_mode=$(echo "$new_mode" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')

    case "$new_mode" in
        "$GIT_MODE_MANUAL")
            echo "$GIT_MODE_MANUAL" > "$mode_file"
            echo "✅ Interaction mode set to MANUAL"
            echo "🔐 Git operations will require user approval"
            log_mode_change "$GIT_MODE_MANUAL"
            return 0
            ;;
        "$GIT_MODE_AUTO")
            echo "$GIT_MODE_AUTO" > "$mode_file"
            echo "✅ Interaction mode set to AUTO"
            echo "🤖 Git operations will execute automatically"
            log_mode_change "$GIT_MODE_AUTO"
            return 0
            ;;
        *)
            echo "❌ ERROR: Invalid interaction mode '$new_mode'"
            echo "Valid modes: $GIT_MODE_MANUAL, $GIT_MODE_AUTO"
            return 1
            ;;
    esac
}

# Toggle interaction mode
toggle_git_interaction_mode() {
    local current_mode=$(get_git_interaction_mode)

    case "$current_mode" in
        "$GIT_MODE_MANUAL")
            set_git_interaction_mode "$GIT_MODE_AUTO"
            ;;
        "$GIT_MODE_AUTO")
            set_git_interaction_mode "$GIT_MODE_MANUAL"
            ;;
        *)
            echo "⚠️ Unknown current mode '$current_mode', setting to default"
            set_git_interaction_mode "$GIT_MODE_DEFAULT"
            ;;
    esac
}

# Display current interaction mode status
show_git_interaction_mode() {
    local current_mode=$(get_git_interaction_mode)

    echo "📊 Git Interaction Mode Status"
    echo "═══════════════════════════════════"
    echo "Current mode: $current_mode"
    echo ""

    case "$current_mode" in
        "$GIT_MODE_MANUAL")
            echo "🔐 MANUAL MODE ACTIVE"
            echo "• User approval required for each git operation"
            echo "• Operations can be cancelled by user"
            echo "• Timeout: 30 seconds for user response"
            echo "• Force operations require additional confirmation"
            ;;
        "$GIT_MODE_AUTO")
            echo "🤖 AUTO MODE ACTIVE"
            echo "• Git operations execute automatically"
            echo "• All operations are logged for audit"
            echo "• Force operations still require confirmation"
            echo "• User can switch back to MANUAL anytime"
            ;;
    esac

    echo ""
    echo "📁 Configuration file: $GIT_MODE_FILE"
    echo "🔄 To change mode: set_git_interaction_mode [manual|auto]"
    echo "🔄 To toggle mode: toggle_git_interaction_mode"
}
```

### User Interaction Functions

```bash
# Advanced user prompt with better UX
prompt_git_user_approval() {
    local operation="$1"
    local details="$2"
    local timeout="${3:-30}"
    local allow_mode_switch="${4:-true}"

    echo ""
    echo "🔐 GIT OPERATION APPROVAL REQUIRED"
    echo "═══════════════════════════════════"
    echo "Operation: $operation"
    echo "Details: $details"
    echo ""
    echo "Current mode: MANUAL"
    echo "Timeout: $timeout seconds"
    echo ""
    echo "Available options:"
    echo "  y/yes    - Approve and execute this operation"
    echo "  n/no     - Cancel this operation"

    if [[ "$allow_mode_switch" == "true" ]]; then
        echo "  a/auto   - Switch to AUTO mode and execute"
        echo "  s/switch - Switch to AUTO mode (don't execute now)"
    fi

    echo "  i/info   - Show more information about this operation"
    echo ""

    local response
    while true; do
        read -t "$timeout" -p "Your choice (y/n/a/s/i): " response
        local read_status=$?

        if [[ $read_status -ne 0 ]]; then
            echo ""
            echo "⏰ Timeout reached ($timeout seconds)"
            echo "Operation cancelled for safety (MANUAL mode default)"
            return 1
        fi

        case "$response" in
            "y"|"yes"|"Y"|"YES")
                echo "✅ Operation approved by user"
                return 0
                ;;
            "n"|"no"|"N"|"NO"|"")
                echo "❌ Operation cancelled by user"
                return 1
                ;;
            "a"|"auto"|"A"|"AUTO")
                if [[ "$allow_mode_switch" == "true" ]]; then
                    echo "🔄 Switching to AUTO mode and executing operation..."
                    set_git_interaction_mode "auto"
                    return 0
                else
                    echo "❌ Mode switching not allowed for this operation"
                    continue
                fi
                ;;
            "s"|"switch"|"S"|"SWITCH")
                if [[ "$allow_mode_switch" == "true" ]]; then
                    echo "🔄 Switching to AUTO mode (operation not executed)"
                    set_git_interaction_mode "auto"
                    return 1
                else
                    echo "❌ Mode switching not allowed for this operation"
                    continue
                fi
                ;;
            "i"|"info"|"I"|"INFO")
                show_operation_info "$operation" "$details"
                echo ""
                echo "Please make your choice:"
                continue
                ;;
            *)
                echo "❌ Invalid response '$response'"
                echo "Please enter: y/n/a/s/i"
                continue
                ;;
        esac
    done
}

# Show detailed operation information
show_operation_info() {
    local operation="$1"
    local details="$2"

    echo ""
    echo "ℹ️ OPERATION INFORMATION"
    echo "═══════════════════════════"
    echo "Operation: $operation"
    echo "Details: $details"
    echo ""

    case "$operation" in
        "git commit")
            echo "📝 Git Commit Information:"
            echo "• Creates a new commit with your changes"
            echo "• Changes are saved to local repository"
            echo "• No remote changes are made"
            echo "• Safe operation - can be undone"
            ;;
        "git push")
            echo "📤 Git Push Information:"
            echo "• Uploads local commits to remote repository"
            echo "• Makes changes visible to other developers"
            echo "• Cannot be easily undone"
            echo "• Requires network connection"
            ;;
        "git pull")
            echo "📥 Git Pull Information:"
            echo "• Downloads changes from remote repository"
            echo "• Merges remote changes with local changes"
            echo "• May cause merge conflicts"
            echo "• Requires network connection"
            ;;
        "git stash")
            echo "📦 Git Stash Information:"
            echo "• Temporarily saves uncommitted changes"
            echo "• Cleans working directory"
            echo "• Changes can be restored later"
            echo "• Safe operation - reversible"
            ;;
        "git branch create")
            echo "🌿 Git Branch Creation Information:"
            echo "• Creates a new branch for development"
            echo "• Switches to the new branch"
            echo "• Safe operation - no data loss"
            echo "• Allows parallel development"
            ;;
        *)
            echo "• This is a git operation that will modify your repository"
            echo "• Please review the details carefully"
            echo "• You can cancel if unsure"
            ;;
    esac

    echo ""
    echo "🔒 Security: All operations are logged for audit"
    echo "🔄 You can always switch interaction modes later"
}

# Check if operation requires special handling
requires_special_confirmation() {
    local operation="$1"
    local details="$2"

    # Force push operations always require special confirmation
    if [[ "$operation" == "git push" && "$details" == *"FORCE"* ]]; then
        return 0
    fi

    # Operations that modify remote history
    if [[ "$operation" == "git push" && "$details" == *"--force"* ]]; then
        return 0
    fi

    return 1
}

# Handle special confirmation for dangerous operations
handle_special_confirmation() {
    local operation="$1"
    local details="$2"

    echo ""
    echo "🚨 DANGEROUS OPERATION DETECTED"
    echo "═══════════════════════════════════"
    echo "Operation: $operation"
    echo "Details: $details"
    echo ""
    echo "⚠️ WARNING: This operation can cause data loss!"
    echo "⚠️ WARNING: This operation can overwrite remote history!"
    echo ""
    echo "This operation requires additional confirmation regardless of interaction mode."
    echo ""

    local confirm
    read -p "Type 'CONFIRM' to proceed with this dangerous operation: " confirm

    if [[ "$confirm" == "CONFIRM" ]]; then
        echo "✅ Dangerous operation confirmed"
        return 0
    else
        echo "❌ Dangerous operation cancelled (confirmation failed)"
        return 1
    fi
}
```

### Logging and Monitoring

```bash
# Log mode changes
log_mode_change() {
    local new_mode="$1"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    local log_file="memory-bank/system/logs/git/interaction-mode.log"

    mkdir -p "$(dirname "$log_file")"

    local log_entry="[$timestamp] Mode changed to: $new_mode"
    echo "$log_entry" >> "$log_file"

    # Also log to main git log
    echo "$log_entry" >> "memory-bank/system/logs/git/git-operations.log"
}

# Get interaction mode statistics
get_interaction_mode_stats() {
    local log_file="memory-bank/system/logs/git/git-operations.log"

    if [[ ! -f "$log_file" ]]; then
        echo "📊 No interaction mode statistics available"
        return 1
    fi

    echo "📊 Git Interaction Mode Statistics"
    echo "═══════════════════════════════════"

    local total_ops=$(grep -c "^\[" "$log_file" 2>/dev/null || echo "0")
    local manual_ops=$(grep -c "\[manual\]" "$log_file" 2>/dev/null || echo "0")
    local auto_ops=$(grep -c "\[auto\]" "$log_file" 2>/dev/null || echo "0")
    local cancelled_ops=$(grep -c "cancelled" "$log_file" 2>/dev/null || echo "0")

    echo "Total operations: $total_ops"
    echo "Manual mode operations: $manual_ops"
    echo "Auto mode operations: $auto_ops"
    echo "Cancelled operations: $cancelled_ops"

    if [[ $total_ops -gt 0 ]]; then
        local manual_percent=$((manual_ops * 100 / total_ops))
        local auto_percent=$((auto_ops * 100 / total_ops))
        local cancel_percent=$((cancelled_ops * 100 / total_ops))

        echo ""
        echo "Usage patterns:"
        echo "• Manual mode: $manual_percent%"
        echo "• Auto mode: $auto_percent%"
        echo "• Cancellation rate: $cancel_percent%"
    fi
}

# Monitor mode usage
monitor_interaction_mode() {
    echo "🔍 Monitoring Git Interaction Mode usage..."
    echo "Press Ctrl+C to stop monitoring"
    echo ""

    local log_file="memory-bank/system/logs/git/git-operations.log"

    if [[ -f "$log_file" ]]; then
        tail -f "$log_file" | while read -r line; do
            if [[ "$line" == *"Mode changed"* ]]; then
                echo "🔄 $line"
            elif [[ "$line" == *"cancelled"* ]]; then
                echo "❌ $line"
            elif [[ "$line" == *"success"* ]]; then
                echo "✅ $line"
            fi
        done
    else
        echo "⚠️ No log file found, waiting for operations..."
        while true; do
            sleep 1
            if [[ -f "$log_file" ]]; then
                echo "📝 Log file created, starting monitoring..."
                monitor_interaction_mode
                break
            fi
        done
    fi
}
```

## INTEGRATION WITH GIT WORKFLOW CONTROLLER

```bash
# Enhanced check for user approval (replaces basic version)
enhanced_check_user_approval() {
    local operation="$1"
    local details="$2"
    local current_mode=$(get_git_interaction_mode)

    # Check for special operations that always require confirmation
    if requires_special_confirmation "$operation" "$details"; then
        if ! handle_special_confirmation "$operation" "$details"; then
            return 1
        fi
    fi

    case "$current_mode" in
        "$GIT_MODE_MANUAL")
            prompt_git_user_approval "$operation" "$details"
            return $?
            ;;
        "$GIT_MODE_AUTO")
            echo "🤖 AUTO mode: Executing git operation automatically"
            echo "Operation: $operation"
            echo "Details: $details"
            return 0
            ;;
        *)
            echo "⚠️ Unknown interaction mode '$current_mode', defaulting to MANUAL"
            prompt_git_user_approval "$operation" "$details"
            return $?
            ;;
    esac
}
```

## USAGE EXAMPLES

```bash
# Initialize the system
initialize_git_interaction_mode

# Check current mode
show_git_interaction_mode

# Change modes
set_git_interaction_mode "auto"
set_git_interaction_mode "manual"

# Toggle mode
toggle_git_interaction_mode

# Monitor usage
get_interaction_mode_stats
monitor_interaction_mode

# Integration with git operations
if enhanced_check_user_approval "git commit" "Add new feature"; then
    # Execute git operation
    echo "Proceeding with git operation"
fi
```

## CONFIGURATION

The system uses two main configuration files:

1. **Interaction Mode File**: `memory-bank/system/interaction-mode.txt`
   - Contains current mode: "manual" or "auto"
   - Default: "manual"

2. **Git Configuration File**: `memory-bank/system/git-config.txt`
   - Contains various git workflow settings
   - Includes timeout, retry count, etc.

---

**Status**: Interaction mode integration complete
**Features**: Enhanced UX, special confirmations, comprehensive logging
**Security**: Safe defaults, dangerous operation protection