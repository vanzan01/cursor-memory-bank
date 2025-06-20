---
description: "Система timeout защиты для предотвращения зависания команд и тестов"
globs: "**/**"
alwaysApply: true
---

# TIMEOUT PROTECTION SYSTEM

> **TL;DR:** Система timeout защиты обеспечивает обязательное использование timeout для всех команд и тестов, предотвращая зависание системы и обеспечивая надежность выполнения операций.

## ⏱️ ПРИНЦИПЫ TIMEOUT ЗАЩИТЫ

### Основные требования
**Обязательный timeout**
- Все CLI команды должны иметь timeout ограничения
- Тесты должны завершаться в разумное время
- Серверные команды должны иметь startup timeout
- Длительные операции должны иметь прогресс индикаторы

**Градация timeout значений**
- Быстрые команды: 30 секунд
- Средние операции: 2-5 минут
- Сборка проектов: 10-15 минут
- Тесты: 5-30 минут (зависит от сложности)
- Серверы: 60 секунд на запуск

## 🛡️ TIMEOUT СТРАТЕГИИ

### Команды с timeout
```bash
# Использование timeout для команд
safe_command_execution() {
  local command="$1"
  local timeout_duration="$2"
  local description="$3"

  echo "⏱️ Выполнение команды с timeout $timeout_duration: $description"

  if timeout "$timeout_duration" bash -c "$command"; then
    echo "✅ Команда выполнена успешно"
    return 0
  else
    local exit_code=$?
    if [ $exit_code -eq 124 ]; then
      echo "⏰ TIMEOUT: Команда превысила лимит времени $timeout_duration"
      echo "🔧 Рекомендация: Увеличьте timeout или оптимизируйте команду"
    else
      echo "❌ Команда завершилась с ошибкой (код: $exit_code)"
    fi
    return $exit_code
  fi
}
```

### Тесты с timeout
```bash
# Запуск тестов с обязательным timeout
run_tests_with_timeout() {
  local test_command="$1"
  local test_timeout="${2:-300}"  # 5 минут по умолчанию

  echo "🧪 Запуск тестов с timeout $test_timeout секунд"

  # Для npm/yarn тестов
  if echo "$test_command" | grep -q "npm\|yarn\|bun"; then
    timeout "$test_timeout" $test_command
  # Для других тестовых фреймворков
  else
    timeout "$test_timeout" bash -c "$test_command"
  fi

  local result=$?
  case $result in
    0)
      echo "✅ Все тесты прошли успешно"
      ;;
    124)
      echo "⏰ TIMEOUT: Тесты превысили лимит времени"
      echo "🔧 Возможные причины:"
      echo "   - Медленные тесты требуют оптимизации"
      echo "   - Зависшие процессы или ресурсы"
      echo "   - Недостаточный timeout для сложных тестов"
      ;;
    *)
      echo "❌ Тесты завершились с ошибкой (код: $result)"
      ;;
  esac

  return $result
}
```

### Серверные команды с timeout
```bash
# Запуск серверов с timeout на старт
start_server_with_timeout() {
  local server_command="$1"
  local startup_timeout="${2:-60}"  # 60 секунд на запуск
  local health_check_url="${3:-http://localhost:3000}"

  echo "🚀 Запуск сервера с timeout $startup_timeout секунд"

  # Запуск сервера в фоне
  $server_command &
  local server_pid=$!

  echo "📋 PID сервера: $server_pid"

  # Ожидание готовности сервера с timeout
  local elapsed=0
  local check_interval=2

  while [ $elapsed -lt $startup_timeout ]; do
    if curl -s "$health_check_url" >/dev/null 2>&1; then
      echo "✅ Сервер запущен и готов к работе"
      echo "🌐 URL: $health_check_url"
      echo "🔧 PID: $server_pid"
      return 0
    fi

    sleep $check_interval
    elapsed=$((elapsed + check_interval))
    echo "⏳ Ожидание готовности сервера... ($elapsed/$startup_timeout сек)"
  done

  echo "⏰ TIMEOUT: Сервер не запустился в течение $startup_timeout секунд"
  echo "🛑 Остановка процесса сервера (PID: $server_pid)"
  kill $server_pid 2>/dev/null
  return 124
}
```

## 📋 TIMEOUT КОНФИГУРАЦИИ

### Стандартные timeout значения
```bash
# Конфигурация timeout для различных типов операций
declare -A TIMEOUT_CONFIG=(
  # Быстрые команды
  ["git_status"]="10"
  ["file_operations"]="30"
  ["npm_install_single"]="120"

  # Средние операции
  ["npm_install_full"]="300"
  ["build_small"]="300"
  ["test_unit"]="180"

  # Длительные операции
  ["build_large"]="900"
  ["test_integration"]="600"
  ["test_e2e"]="1800"

  # Серверные операции
  ["server_startup"]="60"
  ["server_health_check"]="30"
  ["database_migration"]="300"
)

# Получение timeout для операции
get_timeout_for_operation() {
  local operation="$1"
  local default_timeout="${2:-120}"

  echo "${TIMEOUT_CONFIG[$operation]:-$default_timeout}"
}
```

### Адаптивные timeout
```bash
# Адаптивный timeout на основе размера проекта
calculate_adaptive_timeout() {
  local operation_type="$1"
  local project_size="$2"  # small, medium, large

  local base_timeout
  case "$operation_type" in
    "build")
      case "$project_size" in
        "small") base_timeout=180 ;;
        "medium") base_timeout=300 ;;
        "large") base_timeout=600 ;;
      esac
      ;;
    "test")
      case "$project_size" in
        "small") base_timeout=120 ;;
        "medium") base_timeout=300 ;;
        "large") base_timeout=900 ;;
      esac
      ;;
    *)
      base_timeout=120
      ;;
  esac

  echo "$base_timeout"
}
```

## 🔄 ОБРАБОТКА TIMEOUT СИТУАЦИЙ

### Стратегии восстановления
```bash
# Обработка timeout с попытками восстановления
handle_timeout_with_retry() {
  local command="$1"
  local timeout_duration="$2"
  local max_retries="${3:-3}"
  local retry_delay="${4:-5}"

  local attempt=1

  while [ $attempt -le $max_retries ]; do
    echo "🔄 Попытка $attempt из $max_retries"

    if timeout "$timeout_duration" bash -c "$command"; then
      echo "✅ Команда выполнена успешно на попытке $attempt"
      return 0
    fi

    local exit_code=$?
    if [ $exit_code -eq 124 ]; then
      echo "⏰ TIMEOUT на попытке $attempt"
      if [ $attempt -lt $max_retries ]; then
        echo "⏳ Ожидание $retry_delay секунд перед повтором..."
        sleep $retry_delay
      fi
    else
      echo "❌ Команда завершилась с ошибкой (код: $exit_code)"
      return $exit_code
    fi

    attempt=$((attempt + 1))
  done

  echo "🚫 Все попытки исчерпаны. Команда не может быть выполнена."
  return 124
}
```

### Cleanup при timeout
```bash
# Очистка ресурсов при timeout
cleanup_on_timeout() {
  local process_name="$1"
  local cleanup_commands="$2"

  echo "🧹 Выполнение cleanup после timeout для: $process_name"

  # Остановка связанных процессов
  pkill -f "$process_name" 2>/dev/null || true

  # Выполнение дополнительных команд очистки
  if [ -n "$cleanup_commands" ]; then
    echo "🔧 Выполнение дополнительных команд очистки"
    eval "$cleanup_commands"
  fi

  # Очистка временных файлов
  find /tmp -name "*${process_name}*" -mtime -1 -delete 2>/dev/null || true

  echo "✅ Cleanup завершен"
}
```

## 📊 МОНИТОРИНГ TIMEOUT

### Статистика timeout
```bash
# Отслеживание статистики timeout
track_timeout_stats() {
  local operation="$1"
  local duration="$2"
  local status="$3"  # success, timeout, error

  local stats_file="/tmp/timeout_stats.log"
  local timestamp=$(date +"%Y-%m-%d %H:%M:%S")

  echo "$timestamp,$operation,$duration,$status" >> "$stats_file"

  # Анализ последних 100 операций
  if [ "$(wc -l < "$stats_file")" -gt 100 ]; then
    tail -100 "$stats_file" > "${stats_file}.tmp"
    mv "${stats_file}.tmp" "$stats_file"
  fi
}

# Анализ timeout статистики
analyze_timeout_stats() {
  local stats_file="/tmp/timeout_stats.log"

  if [ ! -f "$stats_file" ]; then
    echo "📊 Нет данных о timeout статистике"
    return
  fi

  echo "📊 АНАЛИЗ TIMEOUT СТАТИСТИКИ:"
  echo "============================="

  local total_ops=$(wc -l < "$stats_file")
  local timeout_ops=$(grep ",timeout$" "$stats_file" | wc -l)
  local success_ops=$(grep ",success$" "$stats_file" | wc -l)

  echo "📈 Всего операций: $total_ops"
  echo "✅ Успешных: $success_ops ($(( success_ops * 100 / total_ops ))%)"
  echo "⏰ Timeout: $timeout_ops ($(( timeout_ops * 100 / total_ops ))%)"

  if [ $timeout_ops -gt 0 ]; then
    echo "🔍 Операции с частыми timeout:"
    cut -d',' -f2 "$stats_file" | grep -E "$(grep ",timeout$" "$stats_file" | cut -d',' -f2)" | sort | uniq -c | sort -nr | head -5
  fi
}
```

## 🎯 РЕКОМЕНДАЦИИ ПО TIMEOUT

### Выбор оптимального timeout
```bash
# Рекомендации по timeout для операций
recommend_timeout() {
  local operation_type="$1"
  local context="$2"

  echo "💡 РЕКОМЕНДАЦИИ ПО TIMEOUT для $operation_type:"
  echo "=============================================="

  case "$operation_type" in
    "npm_install")
      echo "📦 npm install:"
      echo "   - Одиночный пакет: 60-120 сек"
      echo "   - Полная установка: 300-600 сек"
      echo "   - С нативными зависимостями: 600-900 сек"
      ;;
    "build")
      echo "🔨 Сборка проекта:"
      echo "   - Простой проект: 120-300 сек"
      echo "   - Средний проект: 300-600 сек"
      echo "   - Сложный проект: 600-1200 сек"
      ;;
    "test")
      echo "🧪 Тестирование:"
      echo "   - Unit тесты: 60-300 сек"
      echo "   - Integration тесты: 300-900 сек"
      echo "   - E2E тесты: 900-1800 сек"
      ;;
    *)
      echo "⚙️ Общие рекомендации:"
      echo "   - Быстрые команды: 30-60 сек"
      echo "   - Средние операции: 120-300 сек"
      echo "   - Длительные операции: 600+ сек"
      ;;
  esac

  echo ""
  echo "🔧 Факторы для учета:"
  echo "   - Размер проекта и количество зависимостей"
  echo "   - Производительность системы"
  echo "   - Сетевое соединение (для загрузок)"
  echo "   - Сложность операций"
}
```

## 🚨 КРИТИЧЕСКИЕ СИТУАЦИИ

### Экстренные меры при timeout
```bash
# Экстренные действия при критических timeout
emergency_timeout_response() {
  local operation="$1"
  local severity="$2"  # low, medium, high, critical

  echo "🚨 ЭКСТРЕННАЯ СИТУАЦИЯ: Timeout в операции $operation"
  echo "🎯 Уровень критичности: $severity"

  case "$severity" in
    "critical")
      echo "🔴 КРИТИЧЕСКИЙ TIMEOUT - Немедленные действия:"
      echo "   1. Остановка всех связанных процессов"
      echo "   2. Сохранение логов для анализа"
      echo "   3. Уведомление администратора"
      echo "   4. Переход в безопасный режим"

      # Остановка критических процессов
      pkill -f "$operation" 2>/dev/null || true

      # Сохранение состояния системы
      ps aux > "/tmp/emergency_ps_$(date +%Y%m%d_%H%M%S).log"
      ;;
    "high")
      echo "🟠 ВЫСОКИЙ TIMEOUT - Действия по восстановлению:"
      echo "   1. Анализ использования ресурсов"
      echo "   2. Попытка мягкого перезапуска"
      echo "   3. Документирование инцидента"
      ;;
    *)
      echo "🟡 СТАНДАРТНЫЙ TIMEOUT - Обычные действия:"
      echo "   1. Логирование события"
      echo "   2. Попытка повтора с увеличенным timeout"
      echo "   3. Анализ причин"
      ;;
  esac
}
```

Эта система timeout защиты обеспечивает надежность и предсказуемость выполнения всех операций в Memory Bank системе, предотвращая зависания и обеспечивая контролируемое завершение длительных процессов.