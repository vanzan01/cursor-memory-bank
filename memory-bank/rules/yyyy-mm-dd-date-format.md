# YYYY-MM-DD DATE FORMAT ENFORCEMENT SYSTEM

## MANDATORY DATE FORMAT RULE

**CRITICAL REQUIREMENT**: All files containing dates MUST use YYYY-MM-DD format at the beginning of the filename.

### ✅ CORRECT FORMAT EXAMPLES
```
2025-06-20-HIGH-FEATURE-user-authentication.md
2025-06-20-task-context.md
2025-06-20-daily-report.md
2025-W25-weekly-report.md
2025-06-monthly-report.md
```

### ❌ INCORRECT FORMATS (FORBIDDEN)
```
20-06-2025-task.md          # Wrong order
06-20-2025-task.md          # US format
task-2025-06-20.md          # Date not at beginning
20250620-task.md            # No separators
2025_06_20-task.md          # Wrong separators
```

## ENFORCEMENT RULES

### File Creation Rules
1. **Task Files**: `YYYY-MM-DD-PRIORITY-CATEGORY-task-name.md`
2. **Context Files**: `YYYY-MM-DD-task-context.md`
3. **Report Files**: `YYYY-MM-DD-report-type.md` or `YYYY-W##-weekly-report.md`
4. **Archive Files**: Must be organized in `YYYY-MM/` folders

### Validation Patterns
```regex
# Task Files
^(\d{4}-\d{2}-\d{2})-(CRITICAL|HIGH|MEDIUM|LOW)-(FEATURE|BUGFIX|ENHANCEMENT|RESEARCH|ADMIN)-[a-z0-9-]+\.md$

# Context Files
^(\d{4}-\d{2}-\d{2})-[a-z0-9-]+-context\.md$

# Daily Reports
^(\d{4}-\d{2}-\d{2})-daily-report\.md$

# Weekly Reports
^(\d{4}-W\d{2})-weekly-report\.md$

# Monthly Reports
^(\d{4}-\d{2})-monthly-report\.md$
```

## BENEFITS OF YYYY-MM-DD FORMAT

### 1. **Chronological Sorting**
- Files automatically sort chronologically in any file manager
- No special sorting algorithms needed
- Works across all operating systems

### 2. **Visual Navigation**
- Immediate date recognition
- Easy to find files by date range
- Clear temporal organization

### 3. **Cross-Platform Compatibility**
- ISO 8601 standard compliance
- Works on Windows, macOS, Linux
- Database and API friendly

### 4. **Future-Proof**
- Scales from 1000-9999 years
- No Y2K-style problems
- Internationally recognized standard

## MIGRATION REQUIREMENTS

### Legacy File Handling
When encountering files with incorrect date formats:

1. **Automatic Conversion**: VAN mode MUST convert during migration
2. **Backup Original**: Keep backup with original naming
3. **Update References**: Update all internal links
4. **Validate Conversion**: Ensure no data loss

### Conversion Examples
```bash
# Before Migration
task-user-auth-20-06-2025.md
daily_report_06_20_2025.md
context-shopping-cart-2025.06.20.md

# After Migration
2025-06-20-HIGH-FEATURE-user-auth.md
2025-06-20-daily-report.md
2025-06-20-shopping-cart-context.md
```

## ENFORCEMENT MECHANISMS

### Pre-Creation Validation
```bash
# Before creating any file, validate name format
validate_filename() {
    local filename="$1"
    if [[ ! "$filename" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}- ]]; then
        echo "ERROR: Filename must start with YYYY-MM-DD format"
        return 1
    fi
    return 0
}
```

### Post-Creation Verification
```bash
# Scan for non-compliant files
find memory-bank/ -name "*.md" | grep -v "^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-"
```

### Automated Correction
```bash
# Auto-correct during VAN migration
rename_to_date_format() {
    local old_file="$1"
    local date_part="$2"  # YYYY-MM-DD
    local new_name="${date_part}-$(basename "$old_file")"
    mv "$old_file" "$new_name"
}
```

## INTEGRATION WITH MODES

### VAN Mode
- **MUST** scan for date format violations
- **MUST** convert all non-compliant files
- **MUST** generate conversion report

### PLAN Mode
- **MUST** create all new files with YYYY-MM-DD format
- **MUST** validate format before file creation
- **MUST** reject non-compliant naming

### CREATIVE Mode
- **MUST** follow date format for all design documents
- **MUST** organize deliverables chronologically
- **MUST** maintain date consistency across artifacts

### IMPLEMENT Mode
- **MUST** use date format for all implementation files
- **MUST** organize code changes by date
- **MUST** maintain chronological development history

### REFLECT Mode
- **MUST** generate reports with YYYY-MM-DD format
- **MUST** organize reflection documents chronologically
- **MUST** link to dated task and context files

### ARCHIVE Mode
- **MUST** organize archives in YYYY-MM folders
- **MUST** maintain date format consistency
- **MUST** enable chronological retrieval

## ERROR HANDLING

### Common Date Format Errors
1. **Wrong Order**: DD-MM-YYYY or MM-DD-YYYY
2. **Missing Separators**: YYYYMMDD
3. **Wrong Separators**: YYYY_MM_DD or YYYY.MM.DD
4. **Date Not First**: filename-YYYY-MM-DD.md

### Error Recovery
```bash
# Detect and fix common errors
fix_date_format() {
    local file="$1"

    # Extract date patterns and convert
    if [[ "$file" =~ ([0-9]{2})-([0-9]{2})-([0-9]{4}) ]]; then
        # DD-MM-YYYY or MM-DD-YYYY detected
        local day="${BASH_REMATCH[1]}"
        local month="${BASH_REMATCH[2]}"
        local year="${BASH_REMATCH[3]}"

        # Convert to YYYY-MM-DD
        local new_date="${year}-${month}-${day}"
        # ... conversion logic
    fi
}
```

## COMPLIANCE VERIFICATION

### Daily Checks
```bash
# Verify all files follow YYYY-MM-DD format
check_date_compliance() {
    find memory-bank/ -name "*.md" | while read file; do
        if [[ ! "$(basename "$file")" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}- ]]; then
            echo "NON-COMPLIANT: $file"
        fi
    done
}
```

### Weekly Validation
```bash
# Generate compliance report
generate_compliance_report() {
    local total_files=$(find memory-bank/ -name "*.md" | wc -l)
    local compliant_files=$(find memory-bank/ -name "*.md" | grep -c "^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-")
    local compliance_rate=$((compliant_files * 100 / total_files))

    echo "Date Format Compliance: ${compliance_rate}% (${compliant_files}/${total_files})"
}
```

## CRITICAL SUCCESS FACTORS

1. **Zero Tolerance**: No exceptions to YYYY-MM-DD format
2. **Automatic Enforcement**: Built into all modes and scripts
3. **Migration Safety**: Preserve data during format conversion
4. **User Education**: Clear documentation and examples
5. **Tool Integration**: IDE and script support for format

This rule ensures consistent, sortable, and future-proof date handling across the entire Memory Bank system.