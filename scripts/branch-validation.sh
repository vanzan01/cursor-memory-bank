#!/bin/bash

# Branch Validation Script for Implementation Stage
# This script helps validate the current branch before starting implementation

set -e

echo "🔍 BRANCH VALIDATION FOR IMPLEMENTATION"
echo "========================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_status $RED "❌ Error: Not in a git repository"
    exit 1
fi

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)
print_status $BLUE "📍 Current branch: $CURRENT_BRANCH"

# Check if working directory is clean
if ! git diff-index --quiet HEAD --; then
    print_status $YELLOW "⚠️  Warning: Working directory has uncommitted changes"
    echo "   Consider committing or stashing changes before proceeding"
    echo ""
fi

# Check recent commits to understand branch purpose
print_status $BLUE "📋 Recent commits on current branch:"
git log --oneline -5

echo ""

# Check if branch might be related to merged PRs
print_status $BLUE "🔍 Checking for merged PR indicators..."

# Look for merge commits
MERGE_COMMITS=$(git log --oneline --graph --all | grep -i "merge\|pull" | head -5)
if [ ! -z "$MERGE_COMMITS" ]; then
    print_status $YELLOW "⚠️  Found potential merge commits:"
    echo "$MERGE_COMMITS"
    echo ""
fi

# Check if current branch name appears in recent commits
BRANCH_IN_COMMITS=$(git log --oneline --all | grep -i "$CURRENT_BRANCH" | head -3)
if [ ! -z "$BRANCH_IN_COMMITS" ]; then
    print_status $YELLOW "⚠️  Current branch name found in recent commits:"
    echo "$BRANCH_IN_COMMITS"
    echo ""
fi

# Check what files have been modified in current branch
print_status $BLUE "📁 Files modified in current branch:"
MODIFIED_FILES=$(git diff main --name-only 2>/dev/null || git diff origin/main --name-only 2>/dev/null || echo "No main branch found")
if [ "$MODIFIED_FILES" != "No main branch found" ]; then
    echo "$MODIFIED_FILES" | head -10
    if [ $(echo "$MODIFIED_FILES" | wc -l) -gt 10 ]; then
        echo "... and $(($(echo "$MODIFIED_FILES" | wc -l) - 10)) more files"
    fi
else
    echo "No main branch found for comparison"
fi

echo ""

# Provide recommendations
print_status $BLUE "💡 BRANCH VALIDATION RECOMMENDATIONS:"
echo ""

# Check if branch name follows conventions
if [[ $CURRENT_BRANCH =~ ^(feature|bugfix|enhancement)/ ]]; then
    print_status $GREEN "✅ Branch name follows naming conventions"
else
    print_status $YELLOW "⚠️  Consider renaming branch to follow conventions:"
    echo "   - feature/[domain]-[specific-feature]"
    echo "   - bugfix/[issue-description]"
    echo "   - enhancement/[component]-[improvement]"
fi

echo ""

# Check if branch is up to date with main
if git fetch origin main >/dev/null 2>&1; then
    BEHIND_MAIN=$(git rev-list --count main..HEAD 2>/dev/null || echo "0")
    if [ "$BEHIND_MAIN" != "0" ]; then
        print_status $YELLOW "⚠️  Current branch is $BEHIND_MAIN commits behind main"
        echo "   Consider: git pull origin main"
    else
        print_status $GREEN "✅ Branch is up to date with main"
    fi
else
    print_status $YELLOW "⚠️  Could not fetch from origin/main"
fi

echo ""

print_status $BLUE "📋 MANUAL VERIFICATION REQUIRED:"
echo "1. Check GitHub/GitLab for merged PRs with similar branch names"
echo "2. Verify if current task aligns with branch domain"
echo "3. Determine if new branch is needed for different domain/task"
echo ""

print_status $GREEN "✅ Branch validation complete!"
echo ""
echo "Next steps:"
echo "- If branch is merged: git checkout main && git pull && git checkout -b feature/[new-name]"
echo "- If different domain: git checkout -b feature/[new-domain-name]"
echo "- If same domain: Continue with current branch"
echo ""
echo "Remember to document your branch decision in tasks.md" 