#!/bin/bash

# Commit and Push Automation Script
# This script automates the commit and push process with proper message generation

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

# Function to check if there are changes to commit
check_for_changes() {
    if git diff-index --quiet HEAD --; then
        print_status $YELLOW "⚠️  No changes to commit"
        echo "   Working directory is clean"
        return 1
    fi
    return 0
}

# Function to show what will be committed
show_changes() {
    print_status $BLUE "📋 Changes to be committed:"
    echo ""
    git status --short
    echo ""
    
    print_status $BLUE "📄 Detailed changes:"
    echo ""
    git diff --stat
    echo ""
}

# Function to generate commit message based on changes
generate_commit_message() {
    local files_changed=$(git diff --name-only --cached 2>/dev/null || git diff --name-only)
    local commit_type="feat"
    local message=""
    
    # If no files changed, provide a default message
    if [ -z "$files_changed" ]; then
        echo "feat: Add new feature"
        return
    fi
    
    # Analyze changes to determine commit type
    if echo "$files_changed" | grep -q "\.md$"; then
        commit_type="docs"
        message="docs: Update documentation"
    elif echo "$files_changed" | grep -q "test\|spec"; then
        commit_type="test"
        message="test: Add tests"
    elif echo "$files_changed" | grep -q "\.sh$"; then
        commit_type="feat"
        message="feat: Add script"
    elif echo "$files_changed" | grep -q "\.json$\|\.yaml$\|\.yml$"; then
        commit_type="config"
        message="config: Update configuration"
    else
        commit_type="feat"
        message="feat: Add feature"
    fi
    
    # Get the most modified file for better message
    local main_file=$(echo "$files_changed" | head -1 | sed 's/.*\///' | sed 's/\.[^.]*$//')
    if [ ! -z "$main_file" ]; then
        message="${commit_type}: Update ${main_file}"
    fi
    
    # Ensure we always have a message
    if [ -z "$message" ]; then
        message="feat: Add new feature"
    fi
    
    echo "$message"
}

# Function to create detailed commit message
create_detailed_commit_message() {
    local short_message=$1
    local files_changed=$(git diff --name-only --cached 2>/dev/null || git diff --name-only)
    
    cat << EOF
$short_message

Files changed:
$(echo "$files_changed" | sed 's/^/- /')

$(git diff --stat)
EOF
}

# Function to validate commit message
validate_commit_message() {
    local message=$1
    
    if [ -z "$message" ]; then
        print_status $RED "❌ Error: Commit message cannot be empty"
        return 1
    fi
    
    if [ ${#message} -lt 10 ]; then
        print_status $YELLOW "⚠️  Warning: Commit message seems too short"
    fi
    
    return 0
}

# Function to commit changes
commit_changes() {
    local message=$1
    local use_editor=$2
    
    if [ "$use_editor" = "true" ]; then
        print_status $BLUE "📝 Opening editor for commit message..."
        git commit
    else
        print_status $BLUE "📝 Committing with message: $message"
        git commit -m "$message"
    fi
}

# Function to push changes
push_changes() {
    local branch_name=$(git branch --show-current)
    local remote="origin"
    
    print_status $BLUE "🚀 Pushing to remote..."
    
    # Check if remote exists
    if ! git remote get-url "$remote" >/dev/null 2>&1; then
        print_status $YELLOW "⚠️  No remote 'origin' found"
        echo "   You may need to add a remote: git remote add origin <url>"
        return 1
    fi
    
    # Push to remote
    if git push "$remote" "$branch_name"; then
        print_status $GREEN "✅ Successfully pushed to $remote/$branch_name"
        return 0
    else
        print_status $RED "❌ Failed to push to remote"
        echo "   You may need to set upstream: git push -u origin $branch_name"
        return 1
    fi
}

# Function to show push instructions
show_push_instructions() {
    local branch_name=$(git branch --show-current)
    
    cat << EOF

🚀 **Ready to Push!**

📋 **Branch Details:**
- Current branch: \`$branch_name\`
- Remote: origin

🔗 **Push Commands:**
\`\`\`bash
# First time push (sets upstream)
git push -u origin $branch_name

# Subsequent pushes
git push origin $branch_name
\`\`\`

💡 **Pro Tips:**
- Use \`git push -u origin $branch_name\` for first push
- Use \`git push\` for subsequent pushes (if upstream is set)
- Use \`git push --force-with-lease\` if you need to force push safely

📝 **Next Steps:**
1. Push to remote: \`git push origin $branch_name\`
2. Create Pull Request on GitHub/GitLab
3. Request review from team members

Happy coding! 🎉
EOF
}

# Main script
main() {
    print_section "📝 COMMIT AND PUSH WORKFLOW"
    
    # Check if we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        print_status $RED "❌ Error: Not in a git repository"
        exit 1
    fi
    
    # Get current branch
    CURRENT_BRANCH=$(git branch --show-current)
    print_status $BLUE "📍 Current branch: $CURRENT_BRANCH"
    
    # Check for changes
    if ! check_for_changes; then
        print_status $YELLOW "💡 No changes to commit. Make some changes first!"
        exit 0
    fi
    
    # Show changes
    show_changes
    
    # Ask user what they want to do
    print_status $CYAN "🎯 What would you like to do?"
    echo "1. Commit with auto-generated message"
    echo "2. Commit with custom message"
    echo "3. Open editor for commit message"
    echo "4. Just show push instructions"
    echo ""
    
    read -p "Enter choice (1-4): " choice
    
    case $choice in
        "1")
            # Auto-generate commit message
            commit_message=$(generate_commit_message)
            print_status $BLUE "📝 Generated commit message: $commit_message"
            
            if validate_commit_message "$commit_message"; then
                commit_changes "$commit_message" "false"
            fi
            ;;
        "2")
            # Custom commit message
            print_status $CYAN "📝 Enter your commit message:"
            read -p "Commit message: " commit_message
            
            if validate_commit_message "$commit_message"; then
                commit_changes "$commit_message" "false"
            fi
            ;;
        "3")
            # Open editor
            commit_changes "" "true"
            ;;
        "4")
            # Just show push instructions
            show_push_instructions
            exit 0
            ;;
        *)
            print_status $RED "❌ Invalid choice"
            exit 1
            ;;
    esac
    
    # Check if commit was successful
    if [ $? -eq 0 ]; then
        print_status $GREEN "✅ Changes committed successfully!"
        
        # Show commit details
        print_status $BLUE "📋 Latest commit:"
        git log --oneline -1
        
        # Ask if user wants to push
        echo ""
        print_status $CYAN "🚀 Would you like to push to remote? (y/n):"
        read -p "Push? " push_choice
        
        case $push_choice in
            "y"|"Y"|"yes"|"Yes")
                if push_changes; then
                    print_status $GREEN "🎉 Successfully pushed to remote!"
                    echo ""
                    print_status $BLUE "📝 Next steps:"
                    echo "1. Create Pull Request on GitHub/GitLab"
                    echo "2. Request review from team members"
                    echo "3. Merge when approved"
                fi
                ;;
            *)
                show_push_instructions
                ;;
        esac
    else
        print_status $RED "❌ Failed to commit changes"
        exit 1
    fi
}

# Run main function
main "$@" 