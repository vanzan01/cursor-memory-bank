#!/bin/bash
# UPDATE_DATE - Команда обновления даты в Memory Bank
# Использование: ./update-date.sh [--force] [--sync-all] [--backup] [--verify]

set -e  # Остановить выполнение при ошибке

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Функция логирования
log() {
    echo -e "${BLUE}[$(date +%H:%M:%S)]${NC} $1"
}

success() {
    echo -e "${GREEN}✅${NC} $1"
}

warning() {
    echo -e "${YELLOW}⚠️${NC} $1"
}

error() {
    echo -e "${RED}❌${NC} $1"
}

# Проверка прав доступа
check_permissions() {
    if [ ! -w "memory-bank/system/" ]; then
        error "Нет прав записи в memory-bank/system/"
        return 1
    fi

    if [ ! -w "memory-bank/" ]; then
        error "Нет прав записи в memory-bank/"
        return 1
    fi

    return 0
}

# Создание backup
create_date_backup() {
    local backup_dir="memory-bank/backup/dates"
    local timestamp=$(date +%Y%m%d-%H%M%S)

    mkdir -p "$backup_dir"

    if [ -f "memory-bank/system/current-date.txt" ]; then
        cp "memory-bank/system/current-date.txt" "$backup_dir/current-date-$timestamp.txt"
        success "Backup создан: $backup_dir/current-date-$timestamp.txt"
    fi
}

# Обновление ID задач
update_task_ids() {
    local old_date="$1"
    local new_date="$2"

    log "Обновление ID задач..."

    # Найти и обновить ID задач в tasks.md
    if [ -f "memory-bank/tasks.md" ]; then
        # Создать backup перед изменением
        cp "memory-bank/tasks.md" "memory-bank/tasks.md.bak.$(date +%Y%m%d-%H%M%S)"

        # Обновить активные задачи
        sed -i.tmp "s/TASK-.*-$old_date/TASK-UPDATED-$new_date/g" "memory-bank/tasks.md"
        sed -i.tmp "s/RULES-INT-$old_date/RULES-INT-$new_date/g" "memory-bank/tasks.md"
        sed -i.tmp "s/CREATIVE-.*-$old_date/CREATIVE-UPDATED-$new_date/g" "memory-bank/tasks.md"

        rm "memory-bank/tasks.md.tmp" 2>/dev/null || true
        success "ID задач обновлены"
    fi
}

# Синхронизация документов
sync_documents_with_date() {
    local old_date="$1"
    local new_date="$2"

    log "Синхронизация документов: $old_date → $new_date"

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
                rm "$file.tmp" 2>/dev/null || true

                success "Обновлен: $file"
            fi
        done

        # Обновить ID задач
        update_task_ids "$old_date" "$new_date"
    fi
}

# Верификация консистентности
verify_date_consistency() {
    log "Верификация консистентности дат..."

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
            local old_dates=$(grep -o "2024-12-09\|2024-11-[0-9][0-9]\|2024-10-[0-9][0-9]" "$file" 2>/dev/null | wc -l)

            if [ "$old_dates" -gt 0 ]; then
                warning "Найдены устаревшие даты в $file: $old_dates вхождений"
                ((errors++))
            else
                success "$file: Даты актуальны"
            fi
        fi
    done

    # Проверить соответствие текущей дате
    log "Текущая дата системы: $current_date"
    log "Реальная дата: $(date +%Y-%m-%d)"

    if [ "$current_date" = "$(date +%Y-%m-%d)" ]; then
        success "Дата в системе соответствует реальной"
    else
        warning "Дата в системе не соответствует реальной"
        ((errors++))
    fi

    if [ $errors -eq 0 ]; then
        success "Верификация пройдена успешно"
        return 0
    else
        error "Обнаружено $errors ошибок"
        return 1
    fi
}

# Логирование операций
log_date_update() {
    local operation="$1"
    local old_date="$2"
    local new_date="$3"
    local timestamp=$(date +%Y-%m-%d\ %H:%M:%S)

    mkdir -p memory-bank/logs
    echo "$timestamp | $operation | $old_date → $new_date" >> memory-bank/logs/date-updates.log
}

# Основная функция обновления даты
update_date() {
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
            --help|-h)
                echo "UPDATE_DATE - Команда обновления даты в Memory Bank"
                echo ""
                echo "Использование: $0 [ОПЦИИ]"
                echo ""
                echo "ОПЦИИ:"
                echo "  --force      Принудительная синхронизация даже если дата не изменилась"
                echo "  --sync-all   Синхронизировать все документы с новой датой"
                echo "  --backup     Создать backup перед обновлением"
                echo "  --verify     Выполнить верификацию консистентности дат"
                echo "  --help, -h   Показать эту справку"
                echo ""
                echo "Примеры:"
                echo "  $0                           # Простое обновление даты"
                echo "  $0 --sync-all --backup      # Полное обновление с backup"
                echo "  $0 --force --verify         # Принудительное обновление с проверкой"
                exit 0
                ;;
            *)
                error "Неизвестный параметр: $1"
                echo "Используйте --help для справки"
                exit 1
                ;;
        esac
    done

    echo "🔄 === ОБНОВЛЕНИЕ ДАТЫ MEMORY BANK ==="
    log "Время начала: $(date +%H:%M:%S)"
    log "Параметры: force=$force, sync-all=$sync_all, backup=$backup, verify=$verify"

    # Проверить права доступа
    if ! check_permissions; then
        exit 1
    fi

    # 1. Создать backup если требуется
    if [ "$backup" = true ]; then
        create_date_backup
    fi

    # 2. Получить текущую дату
    local new_date=$(date +%Y-%m-%d)
    local old_date=""

    # 3. Проверить существование файла даты
    if [ -f "memory-bank/system/current-date.txt" ]; then
        old_date=$(cat memory-bank/system/current-date.txt | tr -d '\n')
        log "Текущая дата в системе: $old_date"
    else
        warning "Файл даты не найден, создаю новый"
        mkdir -p memory-bank/system
    fi

    # 4. Обновить файл даты
    echo "$new_date" > memory-bank/system/current-date.txt
    success "Дата обновлена: $old_date → $new_date"

    # 5. Логировать операцию
    log_date_update "UPDATE" "$old_date" "$new_date"

    # 6. Синхронизация документов
    if [ "$sync_all" = true ] || [ "$force" = true ] || [ "$old_date" != "$new_date" ]; then
        sync_documents_with_date "$old_date" "$new_date"
    else
        log "Дата не изменилась, синхронизация не требуется"
    fi

    # 7. Верификация
    if [ "$verify" = true ]; then
        verify_date_consistency
    fi

    success "Обновление даты завершено успешно"
    log "Время завершения: $(date +%H:%M:%S)"
}

# Проверить, что скрипт запущен из корня проекта
if [ ! -d "memory-bank" ]; then
    error "Скрипт должен быть запущен из корня проекта (где находится папка memory-bank)"
    exit 1
fi

# Запустить основную функцию с переданными параметрами
update_date "$@"