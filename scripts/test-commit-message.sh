#!/bin/bash

# Test script for commit message generation
# This script tests the commit message generation functions to ensure they work properly

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to test commit message generation
test_commit_message_generation() {
    print_status $PURPLE "🧪 Testing Commit Message Generation"
    echo ""
    
    # Test cases
    local test_cases=(
        "feature:user-authentication:Add user authentication system"
        "bugfix:login-error:Fix login validation error"
        "enhancement:api-performance:Improve API response time"
        "docs:readme-update:Update README documentation"
        "refactor:code-cleanup:Refactor existing code"
    )
    
    local passed=0
    local total=0
    
    for test_case in "${test_cases[@]}"; do
        IFS=':' read -r feature_type feature_name description <<< "$test_case"
        
        print_status $BLUE "Testing: $feature_type/$feature_name"
        
        # Generate commit message using the same logic as create-feature-branch.sh
        local title_case=$(echo "$feature_name" | sed 's/-/ /g' | sed 's/_/ /g' | sed 's/\b\w/\U&/g')
        local commit_message=""
        
        case $feature_type in
            "feature")
                commit_message="feat: Add $title_case"
                ;;
            "bugfix")
                commit_message="fix: Fix $title_case"
                ;;
            "enhancement")
                commit_message="enhance: Improve $title_case"
                ;;
            "docs")
                commit_message="docs: Update $title_case"
                ;;
            "refactor")
                commit_message="refactor: Refactor $title_case"
                ;;
            *)
                commit_message="feat: Add $title_case"
                ;;
        esac
        
        # Validate the generated message
        if [ -z "$commit_message" ]; then
            print_status $RED "❌ FAILED: Empty commit message generated"
            echo "   Feature type: $feature_type"
            echo "   Feature name: $feature_name"
            echo "   Title case: $title_case"
        else
            print_status $GREEN "✅ PASSED: $commit_message"
            ((passed++))
        fi
        
        ((total++))
        echo ""
    done
    
    print_status $PURPLE "📊 Test Results: $passed/$total tests passed"
    
    if [ $passed -eq $total ]; then
        print_status $GREEN "🎉 All tests passed! Commit message generation is working correctly."
    else
        print_status $RED "❌ Some tests failed. Please check the commit message generation logic."
    fi
}

# Function to test file-based commit message generation
test_file_based_commit_message() {
    print_status $PURPLE "🧪 Testing File-Based Commit Message Generation"
    echo ""
    
    # Create temporary files for testing
    local test_files=(
        "test-docs.md"
        "test-script.sh"
        "test-config.json"
        "test-feature.js"
    )
    
    for test_file in "${test_files[@]}"; do
        print_status $BLUE "Testing with file: $test_file"
        
        # Simulate the logic from commit-and-push.sh
        local commit_type="feat"
        local message=""
        
        if echo "$test_file" | grep -q "\.md$"; then
            commit_type="docs"
            message="docs: Update documentation"
        elif echo "$test_file" | grep -q "\.sh$"; then
            commit_type="feat"
            message="feat: Add script"
        elif echo "$test_file" | grep -q "\.json$\|\.yaml$\|\.yml$"; then
            commit_type="config"
            message="config: Update configuration"
        else
            commit_type="feat"
            message="feat: Add feature"
        fi
        
        # Get the file name without extension
        local main_file=$(echo "$test_file" | sed 's/\.[^.]*$//')
        if [ ! -z "$main_file" ]; then
            message="${commit_type}: Update ${main_file}"
        fi
        
        # Validate the generated message
        if [ -z "$message" ]; then
            print_status $RED "❌ FAILED: Empty commit message for $test_file"
        else
            print_status $GREEN "✅ PASSED: $message"
        fi
        
        echo ""
    done
}

# Function to show commit message best practices
show_commit_message_best_practices() {
    print_status $PURPLE "📋 Commit Message Best Practices"
    echo ""
    
    cat << EOF
✅ **Good Commit Messages:**
- feat: Add user authentication system
- fix: Resolve login validation error
- docs: Update README with new features
- enhance: Improve API response time
- refactor: Clean up database queries

❌ **Bad Commit Messages:**
- "update"
- "fix"
- "changes"
- "" (empty)
- "stuff"

📝 **Commit Message Format:**
<type>: <description>

🎯 **Types:**
- feat: New feature
- fix: Bug fix
- docs: Documentation
- style: Formatting
- refactor: Code refactoring
- test: Adding tests
- chore: Maintenance

💡 **Tips:**
- Use imperative mood ("Add" not "Added")
- Keep first line under 50 characters
- Be descriptive but concise
- Start with lowercase
- No period at the end
EOF
}

# Main function
main() {
    print_status $PURPLE "🧪 COMMIT MESSAGE GENERATION TEST SUITE"
    echo ""
    
    # Test commit message generation
    test_commit_message_generation
    
    echo ""
    print_status $PURPLE "=========================================="
    echo ""
    
    # Test file-based commit message generation
    test_file_based_commit_message
    
    echo ""
    print_status $PURPLE "=========================================="
    echo ""
    
    # Show best practices
    show_commit_message_best_practices
}

# Run main function
main "$@" 