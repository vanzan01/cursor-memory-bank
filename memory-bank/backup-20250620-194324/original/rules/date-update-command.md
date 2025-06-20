# КОМАНДА ОБНОВЛЕНИЯ ДАТЫ В MEMORY BANK

> **TL;DR:** Автоматическая команда `UPDATE_DATE` для обновления текущей даты в файле `memory-bank/system/current-date.txt` и синхронизации всех связанных документов.

## 🎯 КОМАНДА: UPDATE_DATE

### Основная функция:
```bash
UPDATE_DATE
```

### Расширенная функция с параметрами:
```bash
UPDATE_DATE [--force] [--sync-all] [--backup] [--verify]
```

## 🔧 РЕАЛИЗАЦИЯ КОМАНДЫ

### Базовая команда UPDATE_DATE:
```bash
#!/bin/bash
# Команда UPDATE_DATE для Memory Bank

update_date() {
    echo "🔄 === ОБНОВЛЕНИЕ ДАТЫ MEMORY BANK ==="
    echo "Время начала: $(date +%H:%M:%S)"

    # 1. Получить текущую дату
    local new_date=$(date +%Y-%m-%d)
    local old_date=""

    # 2. Проверить существование файла даты
    if [ -f "memory-bank/system/current-date.txt" ]; then
        old_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')
        echo "📅 Текущая дата в системе: $old_date"
    else
        echo "⚠️ Файл даты не найден, создаю новый"
        mkdir -p memory-bank/system
    fi

    # 3. Обновить файл даты
    echo "$new_date" > memory-bank/system/current-date.txt
    echo "✅ Дата обновлена: $old_date → $new_date"

    # 4. Проверить изменения
    if [ "$old_date" != "$new_date" ]; then
        echo "🔄 Дата изменилась, требуется синхронизация документов"
        return 0  # Дата изменилась
    else
        echo "ℹ️ Дата не изменилась, синхронизация не требуется"
        return 1  # Дата не изменилась
    fi
}

# Вызов команды
update_date
```

### Расширенная команда с параметрами:
```bash
#!/bin/bash
# Расширенная команда UPDATE_DATE

update_date_extended() {
    local force=false
    local sync_all=false
    local backup=false
    local verify=false

    # Парсинг параметров
    while [[ $# -gt 0 ]]; do
        case $1 in
            --force)
                force=true
                shift
                ;;
            --sync-all)
                sync_all=true
                shift
                ;;
            --backup)
                backup=true
                shift
                ;;
            --verify)
                verify=true
                shift
                ;;
            *)
                echo "Неизвестный параметр: $1"
                echo "Использование: UPDATE_DATE [--force] [--sync-all] [--backup] [--verify]"
                return 1
                ;;
        esac
    done

    echo "🔄 === РАСШИРЕННОЕ ОБНОВЛЕНИЕ ДАТЫ ==="
    echo "Параметры: force=$force, sync-all=$sync_all, backup=$backup, verify=$verify"

    # 1. Создать backup если требуется
    if [ "$backup" = true ]; then
        create_date_backup
    fi

    # 2. Обновить дату
    local new_date=$(date +%Y-%m-%d)
    local old_date=""

    if [ -f "memory-bank/system/current-date.txt" ]; then
        old_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')
    fi

    echo "$new_date" > memory-bank/system/current-date.txt
    echo "✅ Дата обновлена: $old_date → $new_date"

    # 3. Синхронизация документов
    if [ "$sync_all" = true ] || [ "$force" = true ] || [ "$old_date" != "$new_date" ]; then
        sync_documents_with_date "$old_date" "$new_date"
    fi

    # 4. Верификация
    if [ "$verify" = true ]; then
        verify_date_consistency
    fi

    echo "🎉 Обновление даты завершено успешно"
}
```

## 📋 ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ

### Создание backup:
```bash
create_date_backup() {
    local backup_dir="memory-bank/backup/dates"
    local timestamp=$(date +%Y%m%d-%H%M%S)

    mkdir -p "$backup_dir"

    if [ -f "memory-bank/system/current-date.txt" ]; then
        cp "memory-bank/system/current-date.txt" "$backup_dir/current-date-$timestamp.txt"
        echo "💾 Backup создан: $backup_dir/current-date-$timestamp.txt"
    fi
}
```

### Синхронизация документов:
```bash
sync_documents_with_date() {
    local old_date="$1"
    local new_date="$2"

    echo "🔄 Синхронизация документов: $old_date → $new_date"

    if [ -n "$old_date" ] && [ "$old_date" != "$new_date" ]; then
        # Список критических файлов для обновления
        local critical_files=(
            "memory-bank/tasks.md"
            "memory-bank/activeContext.md"
            "memory-bank/progress.md"
        )

        for file in "${critical_files[@]}"; do
            if [ -f "$file" ]; then
                # Создать backup перед изменением
                cp "$file" "$file.bak.$(date +%Y%m%d-%H%M%S)"

                # Заменить даты
                sed -i.tmp "s/$old_date/$new_date/g" "$file"
                rm "$file.tmp"

                echo "✅ Обновлен: $file"
            fi
        done

        # Обновить ID задач
        update_task_ids "$old_date" "$new_date"
    fi
}
```

### Обновление ID задач:
```bash
update_task_ids() {
    local old_date="$1"
    local new_date="$2"

    echo "🔄 Обновление ID задач..."

    # Найти и обновить ID задач в tasks.md
    if [ -f "memory-bank/tasks.md" ]; then
        # Обновить активные задачи
        sed -i.tmp "s/TASK-.*-$old_date/TASK-UPDATED-$new_date/g" "memory-bank/tasks.md"
        sed -i.tmp "s/RULES-INT-$old_date/RULES-INT-$new_date/g" "memory-bank/tasks.md"
        sed -i.tmp "s/CREATIVE-.*-$old_date/CREATIVE-UPDATED-$new_date/g" "memory-bank/tasks.md"

        rm "memory-bank/tasks.md.tmp"
        echo "✅ ID задач обновлены"
    fi
}
```

### Верификация консистентности:
```bash
verify_date_consistency() {
    echo "🔍 Верификация консистентности дат..."

    local current_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')
    local errors=0

    # Проверить критические файлы
    local files_to_check=(
        "memory-bank/tasks.md"
        "memory-bank/activeContext.md"
        "memory-bank/progress.md"
    )

    for file in "${files_to_check[@]}"; do
        if [ -f "$file" ]; then
            # Поиск старых дат (примеры)
            local old_dates=$(grep -o "2024-12-09\|2024-11-[0-9][0-9]\|2024-10-[0-9][0-9]" "$file" | wc -l)

            if [ "$old_dates" -gt 0 ]; then
                echo "⚠️ Найдены устаревшие даты в $file: $old_dates вхождений"
                ((errors++))
            else
                echo "✅ $file: Даты актуальны"
            fi
        fi
    done

    # Проверить соответствие текущей дате
    echo "📅 Текущая дата системы: $current_date"
    echo "📅 Реальная дата: $(date +%Y-%m-%d)"

    if [ "$current_date" = "$(date +%Y-%m-%d)" ]; then
        echo "✅ Дата в системе соответствует реальной"
    else
        echo "⚠️ Дата в системе не соответствует реальной"
        ((errors++))
    fi

    if [ $errors -eq 0 ]; then
        echo "🎉 Верификация пройдена успешно"
        return 0
    else
        echo "❌ Обнаружено $errors ошибок"
        return 1
    fi
}
```

## 🎯 ПРИМЕРЫ ИСПОЛЬЗОВАНИЯ

### Базовое обновление:
```bash
# Простое обновление даты
UPDATE_DATE

# Результат:
# 🔄 === ОБНОВЛЕНИЕ ДАТЫ MEMORY BANK ===
# 📅 Текущая дата в системе: 2025-06-10
# ✅ Дата обновлена: 2025-06-10 → 2025-06-11
```

### Полное обновление с синхронизацией:
```bash
# Обновление с синхронизацией всех документов
UPDATE_DATE --sync-all --backup --verify

# Результат:
# 🔄 === РАСШИРЕННОЕ ОБНОВЛЕНИЕ ДАТЫ ===
# 💾 Backup создан: memory-bank/backup/dates/current-date-20250611-143022.txt
# ✅ Дата обновлена: 2025-06-10 → 2025-06-11
# 🔄 Синхронизация документов: 2025-06-10 → 2025-06-11
# ✅ Обновлен: memory-bank/tasks.md
# ✅ Обновлен: memory-bank/activeContext.md
# ✅ ID задач обновлены
# 🔍 Верификация консистентности дат...
# ✅ Верификация пройдена успешно
```

### Принудительная синхронизация:
```bash
# Принудительная синхронизация даже если дата не изменилась
UPDATE_DATE --force --verify
```

## 🔄 ИНТЕГРАЦИЯ С MEMORY BANK КОМАНДАМИ

### Автоматический вызов в командах:
```bash
# В начале каждой команды VAN/PLAN/CREATIVE/IMPLEMENT/REFLECT/QA
van_mode() {
    # Автоматически обновить дату
    UPDATE_DATE

    # Продолжить с VAN режимом
    # ... остальная логика VAN ...
}

plan_mode() {
    # Автоматически обновить дату с верификацией
    UPDATE_DATE --verify

    # Продолжить с PLAN режимом
    # ... остальная логика PLAN ...
}
```

### Интеграция с git workflow:
```bash
# Перед коммитом обновить дату
pre_commit_hook() {
    UPDATE_DATE --sync-all --backup

    # Добавить обновленные файлы в коммит
    git add memory-bank/system/current-date.txt
    git add memory-bank/tasks.md
    git add memory-bank/activeContext.md
    git add memory-bank/progress.md
}
```

## 📊 МОНИТОРИНГ И ЛОГИРОВАНИЕ

### Логирование операций:
```bash
log_date_update() {
    local operation="$1"
    local old_date="$2"
    local new_date="$3"
    local timestamp=$(date +%Y-%m-%d\ %H:%M:%S)

    echo "$timestamp | $operation | $old_date → $new_date" >> memory-bank/logs/date-updates.log
}
```

### Статистика обновлений:
```bash
date_update_stats() {
    echo "📊 Статистика обновлений дат:"

    if [ -f "memory-bank/logs/date-updates.log" ]; then
        echo "Всего обновлений: $(wc -l < memory-bank/logs/date-updates.log)"
        echo "Последнее обновление: $(tail -1 memory-bank/logs/date-updates.log)"
    else
        echo "Лог файл не найден"
    fi
}
```

## 🚨 ОБРАБОТКА ОШИБОК

### Проверка прав доступа:
```bash
check_permissions() {
    if [ ! -w "memory-bank/system/" ]; then
        echo "❌ Нет прав записи в memory-bank/system/"
        return 1
    fi

    if [ ! -w "memory-bank/" ]; then
        echo "❌ Нет прав записи в memory-bank/"
        return 1
    fi

    return 0
}
```

### Восстановление из backup:
```bash
restore_from_backup() {
    local backup_file="$1"

    if [ -f "$backup_file" ]; then
        cp "$backup_file" "memory-bank/system/current-date.txt"
        echo "✅ Восстановлено из backup: $backup_file"
    else
        echo "❌ Backup файл не найден: $backup_file"
        return 1
    fi
}
```

## 📋 АЛИАСЫ И СОКРАЩЕНИЯ

### Удобные алиасы:
```bash
# Короткие команды
alias ud="UPDATE_DATE"
alias uds="UPDATE_DATE --sync-all"
alias udv="UPDATE_DATE --verify"
alias udf="UPDATE_DATE --force --sync-all --backup --verify"

# Проверка даты
alias check_date="cat memory-bank/system/current-date.txt"
alias real_date="date +%Y-%m-%d"
```

Эта команда обеспечивает полный контроль над системой дат в Memory Bank с автоматизацией, безопасностью и мониторингом.