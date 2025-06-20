# ИНТЕГРАЦИОННЫЕ ФУНКЦИИ УПРАВЛЕНИЯ ДАТАМИ

> **TL;DR:** Функции интеграции системы управления датами с режимами Memory Bank для автоматического обновления и консистентности временных меток.

## 🎯 ЦЕЛЬ ИНТЕГРАЦИИ

Обеспечить автоматическое управление датами во всех режимах Memory Bank через:
- Автоматическое обновление дат при входе в режимы
- Проверку консистентности временных меток
- Синхронизацию ID задач с текущей датой
- Backup и восстановление при необходимости

---

## 🔧 БАЗОВЫЕ ИНТЕГРАЦИОННЫЕ ФУНКЦИИ

### Функция проверки и обновления даты:
```bash
#!/bin/bash
# Базовая функция интеграции дат для Memory Bank режимов

ensure_date_consistency() {
    local mode_name="$1"
    local sync_level="$2"  # basic, full, verify

    echo "🔄 Проверка консистентности дат для режима: $mode_name"

    # Проверить существование файла даты
    if [ ! -f "memory-bank/system/current-date.txt" ]; then
        echo "⚠️ Файл даты не найден, создаю..."
        mkdir -p memory-bank/system
        date +%Y-%m-%d > memory-bank/system/current-date.txt
    fi

    # Получить текущую дату
    local system_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')
    local real_date=$(date +%Y-%m-%d)

    # Проверить актуальность даты
    if [ "$system_date" != "$real_date" ]; then
        echo "📅 Дата устарела: $system_date → $real_date"

        case "$sync_level" in
            "basic")
                ./memory-bank/scripts/update-date.sh
                ;;
            "full")
                ./memory-bank/scripts/update-date.sh --sync-all --backup
                ;;
            "verify")
                ./memory-bank/scripts/update-date.sh --sync-all --backup --verify
                ;;
            *)
                ./memory-bank/scripts/update-date.sh --verify
                ;;
        esac
    else
        echo "✅ Дата актуальна: $system_date"

        # Дополнительная верификация если требуется
        if [ "$sync_level" = "verify" ]; then
            ./memory-bank/scripts/update-date.sh --verify
        fi
    fi
}

# Функция логирования режимов
log_mode_entry() {
    local mode_name="$1"
    local timestamp=$(date +%Y-%m-%d\ %H:%M:%S)

    mkdir -p memory-bank/logs
    echo "$timestamp | MODE_ENTRY | $mode_name" >> memory-bank/logs/mode-transitions.log
}
```

### Функция обновления ID задач:
```bash
update_task_ids_with_current_date() {
    local current_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')

    echo "🔄 Обновление ID задач с текущей датой: $current_date"

    if [ -f "memory-bank/tasks.md" ]; then
        # Создать backup перед изменением
        cp "memory-bank/tasks.md" "memory-bank/tasks.md.bak.$(date +%Y%m%d-%H%M%S)"

        # Обновить ID новых задач
        sed -i.tmp "s/TASK-NEW-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/TASK-NEW-$current_date/g" "memory-bank/tasks.md"
        sed -i.tmp "s/PLAN-NEW-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/PLAN-NEW-$current_date/g" "memory-bank/tasks.md"
        sed -i.tmp "s/CREATIVE-NEW-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/CREATIVE-NEW-$current_date/g" "memory-bank/tasks.md"

        rm "memory-bank/tasks.md.tmp" 2>/dev/null || true
        echo "✅ ID задач обновлены"
    fi
}
```

---

## 🎯 ИНТЕГРАЦИЯ ПО РЕЖИМАМ

### VAN РЕЖИМ - Инициализация и проверка
```bash
van_mode_date_integration() {
    echo "🚀 VAN режим: Интеграция управления датами"

    # Логировать вход в режим
    log_mode_entry "VAN"

    # Проверить и обновить дату с верификацией
    ensure_date_consistency "VAN" "verify"

    # Проверить жестко закодированные даты
    local hardcoded_dates=$(grep -r "2024-12-09" memory-bank/ 2>/dev/null | wc -l)
    if [ "$hardcoded_dates" -gt 0 ]; then
        echo "⚠️ Обнаружено $hardcoded_dates жестко закодированных дат"
        echo "🔧 Запускаю автоматическое исправление..."
        ./memory-bank/scripts/update-date.sh --force --sync-all
    fi

    # Проверить консистентность системы
    if [ -f "memory-bank/scripts/update-date.sh" ]; then
        chmod +x memory-bank/scripts/update-date.sh
        echo "✅ Скрипт UPDATE_DATE готов к использованию"
    else
        echo "❌ Скрипт UPDATE_DATE не найден"
        return 1
    fi

    echo "✅ VAN режим: Интеграция дат завершена"
}
```

### PLAN РЕЖИМ - Планирование с датами
```bash
plan_mode_date_integration() {
    echo "📋 PLAN режим: Интеграция управления датами"

    # Логировать вход в режим
    log_mode_entry "PLAN"

    # Обновить дату с полной синхронизацией
    ensure_date_consistency "PLAN" "full"

    # Обновить ID задач с текущей датой
    update_task_ids_with_current_date

    # Создать временные метки для планирования
    local current_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')
    local planning_timestamp=$(date +%Y-%m-%d\ %H:%M:%S)

    # Добавить временную метку в activeContext.md
    if [ -f "memory-bank/activeContext.md" ]; then
        echo "" >> memory-bank/activeContext.md
        echo "**Планирование начато**: $planning_timestamp" >> memory-bank/activeContext.md
    fi

    echo "✅ PLAN режим: Интеграция дат завершена"
}
```

### CREATIVE РЕЖИМ - Творческие решения с временными метками
```bash
creative_mode_date_integration() {
    echo "🎨 CREATIVE режим: Интеграция управления датами"

    # Логировать вход в режим
    log_mode_entry "CREATIVE"

    # Обновить дату с backup
    ensure_date_consistency "CREATIVE" "full"

    # Создать временные метки для творческих решений
    local current_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')
    local creative_timestamp=$(date +%Y-%m-%d\ %H:%M:%S)

    # Создать файл творческой сессии если не существует
    local creative_file="memory-bank/creative/creative-session-$current_date.md"
    if [ ! -f "$creative_file" ]; then
        mkdir -p memory-bank/creative
        cat > "$creative_file" << EOF
# Творческая сессия: $current_date

**Дата начала**: $creative_timestamp
**Статус**: В процессе

## Принятые решения

## Рассмотренные варианты

## Временные метки решений
EOF
        echo "✅ Создан файл творческой сессии: $creative_file"
    fi

    echo "✅ CREATIVE режим: Интеграция дат завершена"
}
```

### IMPLEMENT РЕЖИМ - Реализация с git интеграцией
```bash
implement_mode_date_integration() {
    echo "⚙️ IMPLEMENT режим: Интеграция управления датами"

    # Логировать вход в режим
    log_mode_entry "IMPLEMENT"

    # Обновить дату с backup (важно для реализации)
    ensure_date_consistency "IMPLEMENT" "full"

    # Настроить git интеграцию
    setup_git_date_integration

    # Создать временные метки для реализации
    local current_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')
    local implement_timestamp=$(date +%Y-%m-%d\ %H:%M:%S)

    # Обновить progress.md с временными метками
    if [ -f "memory-bank/progress.md" ]; then
        echo "" >> memory-bank/progress.md
        echo "### Реализация начата: $implement_timestamp" >> memory-bank/progress.md
    fi

    echo "✅ IMPLEMENT режим: Интеграция дат завершена"
}

# Функция настройки git интеграции
setup_git_date_integration() {
    local current_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')

    # Создать pre-commit hook если не существует
    if [ ! -f ".git/hooks/pre-commit" ]; then
        mkdir -p .git/hooks
        cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Pre-commit hook для автоматического обновления дат

# Обновить дату перед коммитом
if [ -f "memory-bank/scripts/update-date.sh" ]; then
    ./memory-bank/scripts/update-date.sh --sync-all --backup

    # Добавить обновленные файлы в коммит
    git add memory-bank/system/current-date.txt
    git add memory-bank/tasks.md
    git add memory-bank/activeContext.md
    git add memory-bank/progress.md
fi
EOF
        chmod +x .git/hooks/pre-commit
        echo "✅ Создан pre-commit hook для автоматического обновления дат"
    fi
}
```

### QA РЕЖИМ - Тестирование с временными метками
```bash
qa_mode_date_integration() {
    echo "🔍 QA режим: Интеграция управления датами"

    # Логировать вход в режим
    log_mode_entry "QA"

    # Обновить дату с полной верификацией
    ensure_date_consistency "QA" "verify"

    # Создать отчет QA с временными метками
    local current_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')
    local qa_timestamp=$(date +%Y-%m-%d\ %H:%M:%S)

    local qa_report="memory-bank/development/qa-report-$current_date.md"
    if [ ! -f "$qa_report" ]; then
        mkdir -p memory-bank/development
        cat > "$qa_report" << EOF
# QA Отчет: $current_date

**Дата начала тестирования**: $qa_timestamp
**Статус**: В процессе

## Проверки дат
- [ ] Консистентность временных меток
- [ ] Отсутствие жестко закодированных дат
- [ ] Корректность ID задач

## Результаты тестирования

## Обнаруженные проблемы
EOF
        echo "✅ Создан QA отчет: $qa_report"
    fi

    # Запустить проверку дат
    ./memory-bank/scripts/update-date.sh --verify

    echo "✅ QA режим: Интеграция дат завершена"
}
```

### REFLECT РЕЖИМ - Рефлексия с архивированием дат
```bash
reflect_mode_date_integration() {
    echo "🤔 REFLECT режим: Интеграция управления датами"

    # Логировать вход в режим
    log_mode_entry "REFLECT"

    # Обновить дату
    ensure_date_consistency "REFLECT" "basic"

    # Создать файл рефлексии с временными метками
    local current_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')
    local reflect_timestamp=$(date +%Y-%m-%d\ %H:%M:%S)

    local reflection_file="memory-bank/reflection/reflection-$current_date.md"
    if [ ! -f "$reflection_file" ]; then
        mkdir -p memory-bank/reflection
        cat > "$reflection_file" << EOF
# Рефлексия: $current_date

**Дата рефлексии**: $reflect_timestamp
**Статус**: В процессе

## Что прошло хорошо

## Проблемы и вызовы

## Уроки, извлеченные из управления датами
- Использование централизованной системы дат
- Автоматическое обновление временных меток
- Консистентность ID задач

## Рекомендации для будущих проектов
EOF
        echo "✅ Создан файл рефлексии: $reflection_file"
    fi

    echo "✅ REFLECT режим: Интеграция дат завершена"
}
```

### ARCHIVE РЕЖИМ - Архивирование с финальными временными метками
```bash
archive_mode_date_integration() {
    echo "📦 ARCHIVE режим: Интеграция управления датами"

    # Логировать вход в режим
    log_mode_entry "ARCHIVE"

    # Финальное обновление даты
    ensure_date_consistency "ARCHIVE" "verify"

    # Создать финальный архив с временными метками
    local current_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')
    local archive_timestamp=$(date +%Y-%m-%d\ %H:%M:%S)

    # Создать структуру архива
    local archive_dir="memory-bank/archive/$current_date"
    mkdir -p "$archive_dir"

    # Создать итоговый отчет по датам
    cat > "$archive_dir/date-management-report.md" << EOF
# Отчет по управлению датами: $current_date

**Дата архивирования**: $archive_timestamp

## Статистика использования дат
$(cat memory-bank/logs/date-updates.log 2>/dev/null | tail -10 || echo "Логи не найдены")

## Финальная проверка консистентности
$(./memory-bank/scripts/update-date.sh --verify 2>&1 || echo "Проверка не выполнена")

## Архивированные файлы с датами
- tasks.md
- activeContext.md
- progress.md
- systemPatterns.md

## Рекомендации для следующего цикла
- Продолжить использование UPDATE_DATE команды
- Регулярно проверять консистентность дат
- Мониторить логи обновлений
EOF

    echo "✅ ARCHIVE режим: Интеграция дат завершена"
    echo "📁 Архив создан в: $archive_dir"
}
```

---

## 🔄 УНИВЕРСАЛЬНАЯ ФУНКЦИЯ ИНТЕГРАЦИИ

### Главная функция интеграции:
```bash
integrate_date_management() {
    local mode="$1"

    echo "🔄 === ИНТЕГРАЦИЯ УПРАВЛЕНИЯ ДАТАМИ ==="
    echo "Режим: $mode"
    echo "Время: $(date +%H:%M:%S)"

    case "$mode" in
        "VAN")
            van_mode_date_integration
            ;;
        "PLAN")
            plan_mode_date_integration
            ;;
        "CREATIVE")
            creative_mode_date_integration
            ;;
        "IMPLEMENT")
            implement_mode_date_integration
            ;;
        "QA")
            qa_mode_date_integration
            ;;
        "REFLECT")
            reflect_mode_date_integration
            ;;
        "ARCHIVE")
            archive_mode_date_integration
            ;;
        *)
            echo "❌ Неизвестный режим: $mode"
            echo "Доступные режимы: VAN, PLAN, CREATIVE, IMPLEMENT, QA, REFLECT, ARCHIVE"
            return 1
            ;;
    esac

    echo "✅ === ИНТЕГРАЦИЯ ЗАВЕРШЕНА ==="
}
```

---

## 📊 МОНИТОРИНГ И СТАТИСТИКА

### Функция статистики интеграции:
```bash
date_integration_stats() {
    echo "📊 === СТАТИСТИКА ИНТЕГРАЦИИ ДАТ ==="

    # Статистика переходов между режимами
    if [ -f "memory-bank/logs/mode-transitions.log" ]; then
        echo "Переходы между режимами сегодня:"
        grep "$(date +%Y-%m-%d)" memory-bank/logs/mode-transitions.log | wc -l

        echo "Последние 5 переходов:"
        tail -5 memory-bank/logs/mode-transitions.log
    fi

    # Статистика обновлений дат
    if [ -f "memory-bank/logs/date-updates.log" ]; then
        echo "Обновления дат сегодня:"
        grep "$(date +%Y-%m-%d)" memory-bank/logs/date-updates.log | wc -l

        echo "Последние обновления:"
        tail -3 memory-bank/logs/date-updates.log
    fi

    # Текущее состояние
    echo "Текущая дата системы: $(cat memory-bank/system/current-date.txt 2>/dev/null || echo 'Не найдена')"
    echo "Реальная дата: $(date +%Y-%m-%d)"

    echo "✅ === СТАТИСТИКА ЗАВЕРШЕНА ==="
}
```

Эти интеграционные функции обеспечивают полную автоматизацию управления датами во всех режимах Memory Bank.