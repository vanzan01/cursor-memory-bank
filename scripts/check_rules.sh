#!/bin/bash
RULES_DIR="_cursor/rules"
EXIT_CODE=0

find "$RULES_DIR" -name "*.mdc.md" | while read file; do
    # Проверка наличия description
    if ! grep -q "^description:" "$file"; then
        echo "❌ [ERROR] Missing 'description' in: $file"
        EXIT_CODE=1
    fi

    # Проверка, что description не пустое
    if grep -q "^description: *$" "$file"; then
        echo "⚠️ [WARN] Empty 'description' in: $file"
    fi

    # Проверка наличия globs или alwaysApply
    has_globs=$(grep -c "^globs:" "$file")
    has_always=$(grep -c "^alwaysApply: true" "$file")
    if [ "$has_globs" -eq 0 ] && [ "$has_always" -eq 0 ]; then
        echo "❌ [ERROR] Rule is not global and has no 'globs': $file"
        EXIT_CODE=1
    fi

    # Проверка на наличие нестандартных полей
    # Эта проверка более сложная, но можно искать известные некорректные поля
    if grep -q -E "^(title|date|type|scope|status|auditor|tags|related_tasks|created|updated|priority|category|context_file):" "$file"; then
        echo "❌ [ERROR] Non-standard frontmatter fields found in: $file"
        EXIT_CODE=1
    fi
done

exit $EXIT_CODE