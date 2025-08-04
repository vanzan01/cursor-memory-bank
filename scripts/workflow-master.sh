#!/bin/bash

# Master Workflow Script
# This script provides a complete workflow from branch creation to push

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

# Function to show main menu
show_main_menu() {
    print_section "🚀 MASTER WORKFLOW MENU"
    
    echo "🎯 Choose your workflow:"
    echo ""
    echo "1. 🌿 Create new feature branch"
    echo "2. 📝 Commit and push changes"
    echo "3. 🔍 Validate current branch"
    echo "4. 🚀 Complete workflow (create → develop → commit → push)"
    echo "5. 📋 Show current status"
    echo "6. ❓ Help and documentation"
    echo "7. 🚪 Exit"
    echo ""
}

# Function to run branch creation
run_branch_creation() {
    print_status $BLUE "🌿 Running branch creation workflow..."
    if [ -f "./scripts/create-feature-branch.sh" ]; then
        ./scripts/create-feature-branch.sh
    else
        print_status $RED "❌ Error: create-feature-branch.sh not found"
        echo "   Please ensure the script exists in the scripts/ directory"
    fi
}

# Function to run commit and push
run_commit_push() {
    print_status $BLUE "📝 Running commit and push workflow..."
    if [ -f "./scripts/commit-and-push.sh" ]; then
        ./scripts/commit-and-push.sh
    else
        print_status $RED "❌ Error: commit-and-push.sh not found"
        echo "   Please ensure the script exists in the scripts/ directory"
    fi
}

# Function to run branch validation
run_branch_validation() {
    print_status $BLUE "🔍 Running branch validation..."
    if [ -f "./scripts/branch-validation.sh" ]; then
        ./scripts/branch-validation.sh
    else
        print_status $RED "❌ Error: branch-validation.sh not found"
        echo "   Please ensure the script exists in the scripts/ directory"
    fi
}

# Function to show current status
show_current_status() {
    print_section "📋 CURRENT STATUS"
    
    # Check if we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        print_status $RED "❌ Not in a git repository"
        return
    fi
    
    # Show current branch
    local current_branch=$(git branch --show-current)
    print_status $BLUE "📍 Current branch: $current_branch"
    
    # Show status
    print_status $BLUE "📁 Working directory status:"
    git status --short
    
    # Show recent commits
    print_status $BLUE "📋 Recent commits:"
    git log --oneline -5
    
    # Show remote status
    if git remote get-url origin >/dev/null 2>&1; then
        print_status $BLUE "🌐 Remote: origin"
        local remote_url=$(git remote get-url origin)
        echo "   URL: $remote_url"
    else
        print_status $YELLOW "⚠️  No remote 'origin' configured"
    fi
}

# Function to run complete workflow
run_complete_workflow() {
    print_section "🚀 COMPLETE WORKFLOW"
    
    print_status $CYAN "This will guide you through the complete development workflow:"
    echo "1. Create a new feature branch"
    echo "2. Make your changes"
    echo "3. Commit and push your changes"
    echo ""
    
    read -p "Continue with complete workflow? (y/n): " choice
    
    case $choice in
        "y"|"Y"|"yes"|"Yes")
            # Step 1: Create branch
            print_section "🌿 STEP 1: CREATE BRANCH"
            run_branch_creation
            
            # Step 2: Development phase
            print_section "⚒️ STEP 2: DEVELOPMENT PHASE"
            print_status $BLUE "💡 Now make your changes to the codebase..."
            echo ""
            print_status $CYAN "When you're ready to commit, press Enter to continue..."
            read -p "Press Enter when ready to commit..."
            
            # Step 3: Commit and push
            print_section "📝 STEP 3: COMMIT AND PUSH"
            run_commit_push
            
            print_section "🎉 WORKFLOW COMPLETE!"
            print_status $GREEN "✅ Your feature has been created, developed, and pushed!"
            echo ""
            print_status $BLUE "📝 Next steps:"
            echo "1. Create Pull Request on GitHub/GitLab"
            echo "2. Request review from team members"
            echo "3. Merge when approved"
            ;;
        *)
            print_status $YELLOW "Workflow cancelled"
            ;;
    esac
}

# Function to show help
show_help() {
    print_section "❓ HELP AND DOCUMENTATION"
    
    cat << EOF
🎯 **Master Workflow Script**

This script provides a complete development workflow from branch creation to push.

📋 **Available Workflows:**

1. 🌿 **Create new feature branch**
   - Interactive branch creation
   - Automatic naming conventions
   - Validation and setup

2. 📝 **Commit and push changes**
   - Auto-generated commit messages
   - Change validation
   - Push to remote

3. 🔍 **Validate current branch**
   - Check for merged PRs
   - Domain alignment validation
   - Branch naming conventions

4. 🚀 **Complete workflow**
   - End-to-end development process
   - Guided step-by-step workflow

5. 📋 **Show current status**
   - Current branch info
   - Working directory status
   - Recent commits

💡 **Pro Tips:**
- Always validate your branch before starting development
- Use meaningful commit messages
- Follow branch naming conventions
- Push regularly to avoid conflicts

🔗 **Quick Commands:**
\`\`\`bash
# Create feature branch
./scripts/create-feature-branch.sh

# Commit and push
./scripts/commit-and-push.sh

# Validate branch
./scripts/branch-validation.sh
\`\`\`

📚 **Documentation:**
- BRANCH_MANAGEMENT_GUIDE.md - Complete branch management guide
- README.md - Project overview and setup instructions

Happy coding! 🎉
EOF
}

# Function to check script dependencies
check_dependencies() {
    local missing_scripts=()
    
    if [ ! -f "./scripts/create-feature-branch.sh" ]; then
        missing_scripts+=("create-feature-branch.sh")
    fi
    
    if [ ! -f "./scripts/commit-and-push.sh" ]; then
        missing_scripts+=("commit-and-push.sh")
    fi
    
    if [ ! -f "./scripts/branch-validation.sh" ]; then
        missing_scripts+=("branch-validation.sh")
    fi
    
    if [ ${#missing_scripts[@]} -gt 0 ]; then
        print_status $YELLOW "⚠️  Warning: Some script dependencies are missing:"
        for script in "${missing_scripts[@]}"; do
            echo "   - $script"
        done
        echo ""
        print_status $BLUE "💡 Make sure all scripts are in the scripts/ directory"
    fi
}

# Main function
main() {
    # Check if we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        print_status $RED "❌ Error: Not in a git repository"
        echo "   Please run this script from within a git repository"
        exit 1
    fi
    
    # Check dependencies
    check_dependencies
    
    # Main loop
    while true; do
        show_main_menu
        
        read -p "Enter your choice (1-7): " choice
        
        case $choice in
            "1")
                run_branch_creation
                ;;
            "2")
                run_commit_push
                ;;
            "3")
                run_branch_validation
                ;;
            "4")
                run_complete_workflow
                ;;
            "5")
                show_current_status
                ;;
            "6")
                show_help
                ;;
            "7")
                print_status $GREEN "👋 Goodbye! Happy coding!"
                exit 0
                ;;
            *)
                print_status $RED "❌ Invalid choice. Please enter 1-7."
                ;;
        esac
        
        echo ""
        print_status $CYAN "Press Enter to continue..."
        read -p ""
    done
}

# Run main function
main "$@" 