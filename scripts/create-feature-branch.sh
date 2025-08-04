#!/bin/bash

# Feature Branch Creation and Management Script
# This script automates the workflow of creating a feature branch, making changes, and generating proper commit messages

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to print section headers
print_section() {
    echo ""
    print_status $PURPLE "=========================================="
    print_status $PURPLE "$1"
    print_status $PURPLE "=========================================="
    echo ""
}

# Function to validate input
validate_input() {
    local input=$1
    local field_name=$2
    
    if [ -z "$input" ]; then
        print_status $RED "❌ Error: $field_name cannot be empty"
        exit 1
    fi
    
    # Check for valid characters (alphanumeric, hyphens, underscores)
    if [[ ! "$input" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        print_status $RED "❌ Error: $field_name contains invalid characters. Use only letters, numbers, hyphens, and underscores."
        exit 1
    fi
}

# Function to generate commit message
generate_commit_message() {
    local feature_type=$1
    local feature_name=$2
    local description=$3
    
    # Validate inputs
    if [ -z "$feature_type" ] || [ -z "$feature_name" ]; then
        echo "feat: Add new feature"
        return
    fi
    
    # Convert feature name to title case for commit message
    local title_case=$(echo "$feature_name" | sed 's/-/ /g' | sed 's/_/ /g' | sed 's/\b\w/\U&/g')
    
    # Ensure title_case is not empty
    if [ -z "$title_case" ]; then
        title_case="new feature"
    fi
    
    # Generate commit message based on type
    case $feature_type in
        "feature")
            echo "feat: Add $title_case"
            ;;
        "bugfix")
            echo "fix: Fix $title_case"
            ;;
        "enhancement")
            echo "enhance: Improve $title_case"
            ;;
        "docs")
            echo "docs: Update $title_case"
            ;;
        "refactor")
            echo "refactor: Refactor $title_case"
            ;;
        *)
            echo "feat: Add $title_case"
            ;;
    esac
}

# Function to generate detailed commit message
generate_detailed_commit_message() {
    local feature_type=$1
    local feature_name=$2
    local description=$3
    local files_changed=$4
    
    local short_message=$(generate_commit_message "$feature_type" "$feature_name" "$description")
    
    cat << EOF
$short_message

- Add comprehensive $feature_type functionality for $feature_name
- Update implementation workflow to include $feature_name validation
- Add automated scripts and documentation for $feature_name management
- Update README with $feature_name features and benefits

Files changed:
$files_changed

This addresses the common problem of $description and ensures
proper $feature_name organization. The system now automatically
validates $feature_name before implementation and provides clear
guidance for $feature_name management decisions.
EOF
}

# Function to generate push message
generate_push_message() {
    local branch_name=$1
    local feature_type=$2
    local feature_name=$3
    
    cat << EOF

🚀 **Branch Created Successfully!**

📋 **Branch Details:**
- Branch: \`$branch_name\`
- Type: $feature_type
- Feature: $feature_name

📝 **Next Steps:**
1. Make your changes to the codebase
2. Stage your changes: \`git add .\`
3. Commit with generated message or your own: \`git commit -m "your message"\`
4. Push to remote: \`git push origin $branch_name\`
5. Create Pull Request on GitHub/GitLab

💡 **Pro Tips:**
- Use \`git status\` to check your changes
- Use \`git diff --staged\` to review staged changes
- Use \`git log --oneline\` to see commit history

🔗 **Quick Push Command:**
\`\`\`bash
git push origin $branch_name
\`\`\`

📋 **Generated Commit Message:**
\`\`\`
$(generate_commit_message "$feature_type" "$feature_name" "")
\`\`\`

Happy coding! 🎉
EOF
}

# Main script
main() {
    print_section "🌿 FEATURE BRANCH CREATION WORKFLOW"
    
    # Check if we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        print_status $RED "❌ Error: Not in a git repository"
        exit 1
    fi
    
    # Check if working directory is clean
    if ! git diff-index --quiet HEAD --; then
        print_status $YELLOW "⚠️  Warning: Working directory has uncommitted changes"
        echo "   Consider committing or stashing changes before creating new branch"
        echo ""
    fi
    
    # Get current branch
    CURRENT_BRANCH=$(git branch --show-current)
    print_status $BLUE "📍 Current branch: $CURRENT_BRANCH"
    
    # Ensure we're on main or a base branch
    if [[ "$CURRENT_BRANCH" != "main" && "$CURRENT_BRANCH" != "master" ]]; then
        print_status $YELLOW "⚠️  Warning: Not on main branch. Consider switching to main first."
        echo ""
    fi
    
    # Get feature type
    print_status $CYAN "🎯 Select feature type:"
    echo "1. feature - New functionality"
    echo "2. bugfix - Bug fixes"
    echo "3. enhancement - Improvements"
    echo "4. docs - Documentation"
    echo "5. refactor - Code refactoring"
    echo ""
    
    read -p "Enter feature type (1-5) or type name: " feature_type_input
    
    case $feature_type_input in
        "1"|"feature")
            feature_type="feature"
            ;;
        "2"|"bugfix")
            feature_type="bugfix"
            ;;
        "3"|"enhancement")
            feature_type="enhancement"
            ;;
        "4"|"docs")
            feature_type="docs"
            ;;
        "5"|"refactor")
            feature_type="refactor"
            ;;
        *)
            feature_type="$feature_type_input"
            ;;
    esac
    
    validate_input "$feature_type" "Feature type"
    
    # Get feature name
    print_status $CYAN "📝 Enter feature name (e.g., user-authentication, payment-processing):"
    read -p "Feature name: " feature_name
    
    validate_input "$feature_name" "Feature name"
    
    # Get description
    print_status $CYAN "📄 Enter brief description of what this feature does:"
    read -p "Description: " description
    
    validate_input "$description" "Description"
    
    # Generate branch name
    branch_name="$feature_type/$feature_name"
    
    print_section "🔍 VALIDATION"
    
    # Validate branch name
    print_status $BLUE "🔍 Validating branch name: $branch_name"
    
    # Check if branch already exists
    if git show-ref --verify --quiet refs/heads/"$branch_name"; then
        print_status $RED "❌ Error: Branch '$branch_name' already exists"
        echo "   Please choose a different feature name or delete the existing branch"
        exit 1
    fi
    
    print_status $GREEN "✅ Branch name is valid and available"
    
    print_section "🌿 CREATING BRANCH"
    
    # Create and switch to new branch
    print_status $BLUE "🔄 Creating branch: $branch_name"
    git checkout -b "$branch_name"
    
    if [ $? -eq 0 ]; then
        print_status $GREEN "✅ Successfully created and switched to branch: $branch_name"
    else
        print_status $RED "❌ Error: Failed to create branch"
        exit 1
    fi
    
    print_section "📋 WORKFLOW SETUP"
    
    # Show current status
    print_status $BLUE "📍 Current branch: $(git branch --show-current)"
    print_status $BLUE "📁 Working directory status:"
    git status --short
    
    print_section "💡 NEXT STEPS"
    
    # Generate and display push message
    push_message=$(generate_push_message "$branch_name" "$feature_type" "$feature_name")
    echo "$push_message"
    
    # Save commit message to file for easy access
    commit_message=$(generate_commit_message "$feature_type" "$feature_name" "$description")
    echo "$commit_message" > .commit-message.txt
    
    print_status $GREEN "💾 Commit message saved to .commit-message.txt"
    print_status $BLUE "📝 You can use it with: git commit -F .commit-message.txt"
    
    print_section "🎯 QUICK COMMANDS"
    
    echo "📋 Useful commands for your workflow:"
    echo ""
    echo "  # Check status"
    echo "  git status"
    echo ""
    echo "  # Stage all changes"
    echo "  git add ."
    echo ""
    echo "  # Commit with generated message"
    echo "  git commit -F .commit-message.txt"
    echo ""
    echo "  # Push to remote"
    echo "  git push origin $branch_name"
    echo ""
    echo "  # View commit history"
    echo "  git log --oneline -5"
    echo ""
    
    print_status $GREEN "🎉 Feature branch '$branch_name' is ready for development!"
}

# Run main function
main "$@" 