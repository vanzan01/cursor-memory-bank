# ДЕТАЛЬНЫЙ ПЛАН УЛУЧШЕНИЯ ПРАВИЛ MEMORY BANK

**Дата создания**: 2025-06-20
**Сложность**: Level 4 (Complex System)
**Методология**: changing_the_rules.md Cursor workaround

---

## 🎯 ОБЗОР ЗАДАЧИ

### Цель
Комплексная модификация правил Memory Bank для добавления новых функций безопасности, интеллектуального управления контекстом, автоматизации процессов и оптимизации пользовательского опыта.

### Ключевые требования
1. **Углубленная валидация выводов** с обоснованием изменений
2. **Timeout защита** для всех команд и тестов
3. **Фоновое выполнение** серверных команд
4. **Контроль рабочих директорий** в VAN и PLAN режимах
5. **Автоматическое управление датами** в VAN режиме
6. **Команда ПРОДОЛЖАЙ** с восстановлением контекста
7. **Интеллектуальное переключение моделей**
8. **Анализ структуры проекта** и выбор инструментов
9. **Ограничение MANUAL режима** только для CREATIVE

---

## 📋 ДЕТАЛЬНЫЙ ПЛАН РЕАЛИЗАЦИИ

### 🔄 Phase 1: Анализ и подготовка

#### 1.1 Анализ текущего состояния правил
```bash
# Команды для анализа
find .cursor/rules -name "*.mdc" | wc -l
grep -r "timeout" .cursor/rules/ --include="*.mdc" | wc -l
grep -r "working.directory\|pwd\|cwd" .cursor/rules/ --include="*.mdc"
grep -r "gemini\|sonnet\|claude" .cursor/rules/ --include="*.mdc"
```

**Ожидаемые проблемы:**
- Отсутствие timeout в командах тестирования
- Нет проверки рабочих директорий
- Отсутствует система переключения моделей
- Нет обработки команды ПРОДОЛЖАЙ

#### 1.2 Создание backup и подготовка среды
```bash
# Создание backup ветки
git checkout -b "rules-enhancement-backup-$(date +%Y%m%d)"
git push origin "rules-enhancement-backup-$(date +%Y%m%d)"

# Подготовка Cursor workaround
mv .cursor _cursor
find _cursor -name "*.mdc" -exec sh -c 'mv "$1" "$1.md"' _ {} \;
```

### 🔧 Phase 2: Основные системные улучшения

#### 2.1 Система углубленной валидации выводов

**Файл**: `_cursor/rules/isolation_rules/Core/deep-validation-system.mdc.md`

**Содержание:**
```yaml
---
description: "Система углубленной валидации выводов с анализом предыдущих решений"
globs: "**/Level3/**", "**/Level4/**", "**/CREATIVE/**"
alwaysApply: true
---

# СИСТЕМА УГЛУБЛЕННОЙ ВАЛИДАЦИИ

## Принципы валидации
1. **Анализ предыдущих выводов**: Перед заменой любого решения
2. **Обоснование изменений**: Четкие причины для удаления положений
3. **Сравнительный анализ**: Старое vs новое решение
4. **Документирование**: Фиксация всех изменений и причин

## Алгоритм валидации
### Шаг 1: Анализ существующего решения
- Извлечь ключевые компоненты текущего решения
- Оценить эффективность и качество
- Выявить слабые места и ограничения

### Шаг 2: Сравнение с новым решением
- Создать сравнительную таблицу
- Выделить преимущества и недостатки
- Оценить риски изменений

### Шаг 3: Обоснование замены
- Документировать причины изменений
- Указать конкретные улучшения
- Обосновать удаление элементов

### Шаг 4: Валидация изменений
- Проверить совместимость с системой
- Оценить влияние на другие компоненты
- Подтвердить улучшение качества
```

#### 2.2 Система timeout для команд и тестов

**Файл**: `_cursor/rules/isolation_rules/CustomWorkflow/testing/timeout-protection.mdc.md`

**Содержание:**
```yaml
---
description: "Обязательное использование timeout для всех команд и тестов"
globs: "**/testing/**", "**/implementation/**"
alwaysApply: true
---

# СИСТЕМА TIMEOUT ЗАЩИТЫ

## Обязательные timeout правила

### Для тестирования
```bash
# ✅ Правильно - с timeout
timeout 30s bun test
timeout 60s npm test
timeout 120s yarn test

# ❌ Неправильно - без timeout
bun test
npm test
```

### Для CLI команд
```bash
# ✅ Правильно - с timeout
timeout 10s curl http://localhost:3000/health
timeout 30s git clone <repo>
timeout 60s docker build .

# ❌ Неправильно - без timeout
curl http://localhost:3000/health
git clone <repo>
```

### Для серверных команд
```bash
# ✅ Правильно - в фоне с timeout
timeout 300s bun run dev &
SERVER_PID=$!

# Тестирование сервера
sleep 5  # Ждем запуска
timeout 10s curl http://localhost:3000/health

# Остановка сервера
kill $SERVER_PID
```

## Стандартные timeout значения
- **Быстрые команды**: 10-30 секунд
- **Тесты**: 30-120 секунд
- **Сборка**: 120-300 секунд
- **Серверы**: 300+ секунд
```

#### 2.3 Система фонового выполнения серверных команд

**Файл**: `_cursor/rules/isolation_rules/CustomWorkflow/testing/background-server-execution.mdc.md`

**Содержание:**
```yaml
---
description: "Правила фонового выполнения серверных команд для предотвращения блокировки"
globs: "**/testing/**", "**/implementation/**"
alwaysApply: true
---

# СИСТЕМА ФОНОВОГО ВЫПОЛНЕНИЯ СЕРВЕРОВ

## Обязательные правила

### 1. Серверы всегда в фоне
```bash
# ✅ Правильно
bun run dev &
SERVER_PID=$!

# ❌ Неправильно - блокирует выполнение
bun run dev
```

### 2. Проверка готовности сервера
```bash
# Ожидание запуска сервера
wait_for_server() {
  local url="$1"
  local max_attempts=30
  local attempt=0

  while [ $attempt -lt $max_attempts ]; do
    if timeout 5s curl -s "$url" > /dev/null 2>&1; then
      echo "Server is ready at $url"
      return 0
    fi
    sleep 1
    ((attempt++))
  done

  echo "Server failed to start within $max_attempts seconds"
  return 1
}

# Использование
bun run dev &
SERVER_PID=$!
wait_for_server "http://localhost:3000/health"
```

### 3. Обязательная очистка процессов
```bash
# Функция очистки
cleanup_server() {
  if [ ! -z "$SERVER_PID" ]; then
    kill $SERVER_PID 2>/dev/null
    wait $SERVER_PID 2>/dev/null
    echo "Server stopped"
  fi
}

# Установка trap для автоматической очистки
trap cleanup_server EXIT
```
```

### 🏗️ Phase 3: Контекстные улучшения

#### 3.1 Система контроля рабочих директорий

**Файл**: `_cursor/rules/isolation_rules/Core/working-directory-control.mdc.md`

**Содержание:**
```yaml
---
description: "Система контроля и проверки рабочих директорий в VAN и PLAN режимах"
globs: "**/VAN/**", "**/PLAN/**"
alwaysApply: true
---

# СИСТЕМА КОНТРОЛЯ РАБОЧИХ ДИРЕКТОРИЙ

## VAN режим - проверка рабочей директории

### Обязательные проверки при инициализации
```bash
# 1. Проверка текущей директории
echo "🔍 Текущая рабочая директория: $(pwd)"

# 2. Проверка наличия ключевых файлов проекта
check_project_root() {
  local indicators=("package.json" "bun.lockb" "tsconfig.json" ".git" "README.md")
  local found=0

  for indicator in "${indicators[@]}"; do
    if [ -f "$indicator" ] || [ -d "$indicator" ]; then
      echo "✅ Найден: $indicator"
      ((found++))
    fi
  done

  if [ $found -ge 2 ]; then
    echo "✅ Рабочая директория корректна"
    return 0
  else
    echo "❌ Возможно, вы не в корне проекта"
    echo "📁 Текущая директория: $(pwd)"
    echo "📋 Найдено индикаторов проекта: $found"
    return 1
  fi
}
```

### Контекст приложения должен включать
```yaml
working_directory:
  current: "$(pwd)"
  project_root: "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
  relative_path: "$(realpath --relative-to=$(git rev-parse --show-toplevel 2>/dev/null || pwd) .)"

project_structure:
  package_manager: "$(detect_package_manager)"
  framework: "$(detect_framework)"
  language: "$(detect_primary_language)"
```

## PLAN режим - уточнение директорий

### Обязательные вопросы о директориях
1. **Корень проекта**: "Подтвердите корневую директорию проекта: $(pwd)"
2. **Целевые директории**: "В каких директориях будут изменения?"
3. **Относительные пути**: "Все пути указаны относительно корня проекта?"

### Валидация путей
```bash
validate_project_paths() {
  local project_root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

  echo "📁 Корень проекта: $project_root"
  echo "📋 Структура проекта:"

  # Показать основные директории
  find "$project_root" -maxdepth 2 -type d | head -20

  # Запросить подтверждение
  echo "❓ Все указанные пути корректны относительно $project_root? (y/n)"
}
```
```

#### 3.2 Система автоматического управления датами

**Файл**: `_cursor/rules/isolation_rules/Core/automatic-date-management.mdc.md`

**Содержание:**
```yaml
---
description: "Автоматическое управление датами в VAN режиме"
globs: "**/VAN/**"
alwaysApply: true
---

# СИСТЕМА АВТОМАТИЧЕСКОГО УПРАВЛЕНИЯ ДАТАМИ

## VAN режим - автоматическая проверка дат

### Обязательная проверка при инициализации
```bash
# 1. Получение текущей даты
CURRENT_DATE=$(date +%Y-%m-%d)
echo "📅 Текущая дата: $CURRENT_DATE"

# 2. Проверка системного файла даты
SYSTEM_DATE_FILE="memory-bank/system/current-date.txt"

if [ -f "$SYSTEM_DATE_FILE" ]; then
  STORED_DATE=$(cat "$SYSTEM_DATE_FILE" | tr -d '\n')
  echo "💾 Сохраненная дата: $STORED_DATE"

  if [ "$CURRENT_DATE" != "$STORED_DATE" ]; then
    echo "⚠️ Дата изменилась: $STORED_DATE → $CURRENT_DATE"
    echo "🔄 Обновляю системную дату..."
    echo "$CURRENT_DATE" > "$SYSTEM_DATE_FILE"
    echo "✅ Дата обновлена в $SYSTEM_DATE_FILE"
  else
    echo "✅ Дата актуальна"
  fi
else
  echo "📝 Создаю файл системной даты..."
  mkdir -p "memory-bank/system"
  echo "$CURRENT_DATE" > "$SYSTEM_DATE_FILE"
  echo "✅ Создан $SYSTEM_DATE_FILE с датой $CURRENT_DATE"
fi
```

### Функции управления датами
```bash
# Получение актуальной даты
get_current_date() {
  date +%Y-%m-%d
}

# Обновление системной даты
update_system_date() {
  local current_date=$(get_current_date)
  local date_file="memory-bank/system/current-date.txt"

  mkdir -p "$(dirname "$date_file")"
  echo "$current_date" > "$date_file"
  echo "✅ Системная дата обновлена: $current_date"
}

# Валидация дат в файлах
validate_dates_in_files() {
  local current_date=$(get_current_date)

  echo "🔍 Поиск устаревших дат в файлах..."

  # Поиск захардкоженных дат
  find memory-bank -name "*.md" -exec grep -l "2025-06-[0-9][0-9]" {} \; | while read file; do
    echo "⚠️ Найдены потенциально устаревшие даты в: $file"
  done
}
```
```

### 🤖 Phase 4: Система команды ПРОДОЛЖАЙ

**Файл**: `_cursor/rules/isolation_rules/Core/continue-command-handler.mdc.md`

**Содержание:**
```yaml
---
description: "Интеллектуальное восстановление контекста по команде ПРОДОЛЖАЙ"
globs: "**/VAN/**", "**/**"
alwaysApply: true
---

# СИСТЕМА ОБРАБОТКИ КОМАНДЫ ПРОДОЛЖАЙ

## Алгоритм обработки команды ПРОДОЛЖАЙ

### 1. Анализ контекста чата
```bash
# Проверка истории чата
analyze_chat_context() {
  echo "🔍 Анализ контекста чата..."

  # Если чат пустой или минимальный
  local chat_messages_count=$(get_chat_messages_count)

  if [ "$chat_messages_count" -lt 3 ]; then
    echo "📭 Чат пустой или содержит минимум сообщений"
    echo "🔄 Необходимо восстановление контекста"
    return 1
  else
    echo "💬 Чат содержит $chat_messages_count сообщений"
    echo "✅ Контекст доступен в истории чата"
    return 0
  fi
}
```

### 2. Анализ текущих задач
```bash
# Проверка активных задач
analyze_current_tasks() {
  local tasks_file="memory-bank/tasks.md"

  if [ ! -f "$tasks_file" ]; then
    echo "❌ Файл задач не найден: $tasks_file"
    return 1
  fi

  echo "📋 Анализ текущих задач..."

  # Извлечение активной задачи
  local active_task=$(grep "АКТИВНАЯ ЗАДАЧА:" "$tasks_file" | head -1)
  local current_mode=$(grep "Текущий режим:" "$tasks_file" | head -1)

  if [ -n "$active_task" ]; then
    echo "🎯 $active_task"
    echo "🔧 $current_mode"

    # Проверка статуса задач
    local in_progress_tasks=$(grep -c "IN_PROGRESS\|PLANNED" "$tasks_file")
    local completed_tasks=$(grep -c "ЗАВЕРШЕНА\|COMPLETED" "$tasks_file")

    echo "📊 Активных задач: $in_progress_tasks"
    echo "✅ Завершенных задач: $completed_tasks"

    return 0
  else
    echo "❌ Активная задача не найдена"
    return 1
  fi
}
```

### 3. Восстановление контекста
```bash
# Полное восстановление контекста
restore_context() {
  echo "🔄 ВОССТАНОВЛЕНИЕ КОНТЕКСТА ПО КОМАНДЕ ПРОДОЛЖАЙ"
  echo "=================================================="

  # 1. Анализ рабочей директории
  echo "📁 Рабочая директория: $(pwd)"

  # 2. Проверка git статуса
  if git rev-parse --git-dir > /dev/null 2>&1; then
    echo "🌿 Git ветка: $(git branch --show-current)"
    echo "📝 Последний коммит: $(git log -1 --oneline)"

    local uncommitted=$(git status --porcelain | wc -l)
    if [ "$uncommitted" -gt 0 ]; then
      echo "⚠️ Несохраненных изменений: $uncommitted"
    fi
  fi

  # 3. Анализ задач
  if analyze_current_tasks; then
    echo ""
    echo "🎯 РЕКОМЕНДУЕМЫЕ ДЕЙСТВИЯ:"
    suggest_next_actions
  else
    echo ""
    echo "❓ ВЫБОР РЕЖИМА РАБОТЫ:"
    present_mode_selection
  fi
}
```

### 4. Предложение режимов работы
```bash
# Интерактивный выбор режима
present_mode_selection() {
  echo "Выберите режим работы:"
  echo ""
  echo "🔍 [1] VAN - Анализ и инициализация новой задачи"
  echo "📋 [2] PLAN - Планирование реализации"
  echo "🎨 [3] CREATIVE - Архитектурные решения"
  echo "⚙️ [4] IMPLEMENT - Реализация кода"
  echo "🤔 [5] REFLECT - Анализ результатов"
  echo "📚 [6] ARCHIVE - Архивирование знаний"
  echo ""
  echo "❓ Введите номер режима (1-6) или опишите задачу:"
}

# Анализ предпочтительного режима
suggest_mode_based_on_context() {
  local project_files=$(find . -maxdepth 2 -type f | wc -l)
  local git_status=$(git status --porcelain 2>/dev/null | wc -l)

  if [ "$project_files" -lt 10 ]; then
    echo "💡 Рекомендуется: VAN режим (новый проект)"
  elif [ "$git_status" -gt 5 ]; then
    echo "💡 Рекомендуется: REFLECT режим (много изменений)"
  else
    echo "💡 Рекомендуется: PLAN режим (продолжение работы)"
  fi
}
```
```

### ⚙️ Phase 5: Система переключения моделей

**Файл**: `_cursor/rules/isolation_rules/Core/intelligent-model-switching.mdc.md`

**Содержание:**
```yaml
---
description: "Интеллектуальное переключение моделей ИИ в зависимости от режима Memory Bank"
globs: "**/**"
alwaysApply: true
---

# СИСТЕМА ИНТЕЛЛЕКТУАЛЬНОГО ПЕРЕКЛЮЧЕНИЯ МОДЕЛЕЙ

## Правила выбора моделей по режимам

### Бесплатные модели для рутинных задач
**Режимы**: VAN, REFLECT
**Модель**: gemini-2.0-flash-exp, gemini-1.5-flash
**Причина**: Анализ и рефлексия не требуют максимальной креативности

```yaml
van_mode:
  preferred_models:
    - "gemini-2.0-flash-exp"
    - "gemini-1.5-flash"
    - "claude-3-haiku"
  reasoning: "Анализ структуры проекта и инициализация задач"

reflect_mode:
  preferred_models:
    - "gemini-2.0-flash-exp"
    - "gemini-1.5-flash"
  reasoning: "Анализ результатов и документирование опыта"
```

### Умные модели для сложных задач
**Режимы**: PLAN, CREATIVE
**Модель**: claude-3.5-sonnet, gpt-4
**Причина**: Требуется глубокое планирование и креативные решения

```yaml
plan_mode:
  preferred_models:
    - "claude-3.5-sonnet"
    - "gpt-4-turbo"
  reasoning: "Сложное планирование требует глубокого анализа"

creative_mode:
  preferred_models:
    - "claude-3.5-sonnet"
    - "gpt-4-turbo"
  reasoning: "Архитектурные решения требуют максимальной креативности"
```

### Сбалансированные модели для реализации
**Режимы**: IMPLEMENT, ARCHIVE
**Модель**: claude-3.5-sonnet, gemini-1.5-pro
**Причина**: Баланс между качеством кода и стоимостью

```yaml
implement_mode:
  preferred_models:
    - "claude-3.5-sonnet"
    - "gemini-1.5-pro"
  reasoning: "Качественная реализация с оптимальной стоимостью"

archive_mode:
  preferred_models:
    - "gemini-1.5-pro"
    - "claude-3-sonnet"
  reasoning: "Структурирование знаний и документация"
```

## Автоматическое переключение

### Детекция режима и выбор модели
```bash
# Функция определения оптимальной модели
get_optimal_model() {
  local current_mode="$1"
  local task_complexity="$2"

  case "$current_mode" in
    "VAN"|"REFLECT")
      echo "gemini-2.0-flash-exp"
      ;;
    "PLAN"|"CREATIVE")
      if [ "$task_complexity" = "Level4" ]; then
        echo "claude-3.5-sonnet"
      else
        echo "gpt-4-turbo"
      fi
      ;;
    "IMPLEMENT")
      echo "claude-3.5-sonnet"
      ;;
    "ARCHIVE")
      echo "gemini-1.5-pro"
      ;;
    *)
      echo "claude-3.5-sonnet"  # По умолчанию
      ;;
  esac
}
```

### Рекомендации пользователю
```bash
# Функция рекомендации модели
recommend_model() {
  local mode="$1"
  local current_model="$2"
  local optimal_model=$(get_optimal_model "$mode")

  if [ "$current_model" != "$optimal_model" ]; then
    echo "💡 РЕКОМЕНДАЦИЯ МОДЕЛИ:"
    echo "   Текущий режим: $mode"
    echo "   Текущая модель: $current_model"
    echo "   Рекомендуемая: $optimal_model"
    echo "   Причина: $(get_model_reasoning "$mode")"
    echo ""
    echo "🔄 Переключить модель? (Это поможет оптимизировать качество и стоимость)"
  fi
}
```
```

### 📊 Phase 6: Анализ проекта и инструментов

**Файл**: `_cursor/rules/isolation_rules/Core/project-analysis-system.mdc.md`

**Содержание:**
```yaml
---
description: "Автоматический анализ структуры проекта и выбор инструментов разработки"
globs: "**/VAN/**", "**/PLAN/**"
alwaysApply: true
---

# СИСТЕМА АНАЛИЗА ПРОЕКТА И ИНСТРУМЕНТОВ

## Автоматический анализ структуры проекта

### 1. Определение типа проекта
```bash
# Функция анализа проекта
analyze_project_structure() {
  echo "🔍 АНАЛИЗ СТРУКТУРЫ ПРОЕКТА"
  echo "=========================="

  local project_root="$(pwd)"
  echo "📁 Корневая директория: $project_root"

  # Определение языка программирования
  detect_primary_language

  # Определение фреймворка
  detect_framework

  # Определение пакетного менеджера
  detect_package_manager

  # Определение среды выполнения
  detect_runtime_environment

  # Анализ структуры директорий
  analyze_directory_structure

  # Определение инструментов тестирования
  detect_testing_tools
}
```

### 2. Определение языка программирования
```bash
detect_primary_language() {
  echo ""
  echo "🔤 ОПРЕДЕЛЕНИЕ ЯЗЫКА ПРОГРАММИРОВАНИЯ:"

  local languages=()

  # TypeScript/JavaScript
  if [ -f "tsconfig.json" ] || [ -f "package.json" ]; then
    if [ -f "tsconfig.json" ]; then
      languages+=("TypeScript")
    else
      languages+=("JavaScript")
    fi
  fi

  # Python
  if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
    languages+=("Python")
  fi

  # Rust
  if [ -f "Cargo.toml" ]; then
    languages+=("Rust")
  fi

  # Go
  if [ -f "go.mod" ]; then
    languages+=("Go")
  fi

  # Java
  if [ -f "pom.xml" ] || [ -f "build.gradle" ]; then
    languages+=("Java")
  fi

  if [ ${#languages[@]} -eq 0 ]; then
    echo "❓ Язык не определен автоматически"
    ask_language_preference
  else
    echo "✅ Обнаружены языки: ${languages[*]}"
    PRIMARY_LANGUAGE="${languages[0]}"
  fi
}
```

### 3. Определение среды выполнения
```bash
detect_runtime_environment() {
  echo ""
  echo "⚙️ ОПРЕДЕЛЕНИЕ СРЕДЫ ВЫПОЛНЕНИЯ:"

  local runtime=""

  # Bun
  if [ -f "bun.lockb" ] || command -v bun >/dev/null 2>&1; then
    runtime="bun"
    BUN_VERSION=$(bun --version 2>/dev/null || echo "не установлен")
    echo "🟡 Bun: $BUN_VERSION"
  fi

  # Node.js
  if [ -f "package-lock.json" ] || [ -f "yarn.lock" ] || command -v node >/dev/null 2>&1; then
    if [ -z "$runtime" ]; then runtime="node"; fi
    NODE_VERSION=$(node --version 2>/dev/null || echo "не установлен")
    echo "🟢 Node.js: $NODE_VERSION"
  fi

  # Deno
  if [ -f "deno.json" ] || [ -f "deno.jsonc" ] || command -v deno >/dev/null 2>&1; then
    if [ -z "$runtime" ]; then runtime="deno"; fi
    DENO_VERSION=$(deno --version 2>/dev/null | head -1 || echo "не установлен")
    echo "🦕 Deno: $DENO_VERSION"
  fi

  if [ -z "$runtime" ]; then
    echo "❓ Среда выполнения не определена"
    ask_runtime_preference
  else
    echo "✅ Основная среда: $runtime"
    RUNTIME_ENVIRONMENT="$runtime"
  fi
}
```

### 4. Интерактивные вопросы
```bash
# Вопросы пользователю при неопределенности
ask_language_preference() {
  echo ""
  echo "❓ ВЫБОР ЯЗЫКА ПРОГРАММИРОВАНИЯ:"
  echo "   [1] TypeScript"
  echo "   [2] JavaScript"
  echo "   [3] Python"
  echo "   [4] Rust"
  echo "   [5] Go"
  echo "   [6] Java"
  echo "   [7] Другой (укажите)"
  echo ""
  echo "🤖 Рекомендация: TypeScript (современный, типобезопасный)"
  echo "❓ Какой язык вы предпочитаете? (1-7):"
}

ask_runtime_preference() {
  echo ""
  echo "❓ ВЫБОР СРЕДЫ ВЫПОЛНЕНИЯ:"
  echo "   [1] Bun (быстрый, современный)"
  echo "   [2] Node.js (стабильный, популярный)"
  echo "   [3] Deno (безопасный, встроенный TypeScript)"
  echo ""
  echo "🤖 Рекомендация: Bun (лучшая производительность)"
  echo "❓ Какую среду предпочитаете? (1-3):"
}

ask_testing_framework() {
  echo ""
  echo "❓ ВЫБОР ФРЕЙМВОРКА ТЕСТИРОВАНИЯ:"

  if [ "$RUNTIME_ENVIRONMENT" = "bun" ]; then
    echo "   [1] Bun Test (встроенный, быстрый)"
    echo "   [2] Jest (популярный, много функций)"
    echo "   [3] Vitest (быстрый, совместим с Vite)"
    echo ""
    echo "🤖 Рекомендация: Bun Test (оптимально для Bun)"
  elif [ "$RUNTIME_ENVIRONMENT" = "node" ]; then
    echo "   [1] Jest (популярный, стабильный)"
    echo "   [2] Vitest (быстрый, современный)"
    echo "   [3] Mocha + Chai (гибкий)"
    echo ""
    echo "🤖 Рекомендация: Jest (проверенное решение)"
  elif [ "$RUNTIME_ENVIRONMENT" = "deno" ]; then
    echo "   [1] Deno Test (встроенный)"
    echo "   [2] Jest (через совместимость)"
    echo ""
    echo "🤖 Рекомендация: Deno Test (нативная поддержка)"
  fi

  echo "❓ Какой фреймворк тестирования предпочитаете?"
}
```

### 5. Сохранение контекста проекта
```bash
# Сохранение анализа в системный контекст
save_project_context() {
  local context_file="memory-bank/projectContext.md"

  cat > "$context_file" << EOF
# КОНТЕКСТ ПРОЕКТА

**Дата анализа**: $(date +%Y-%m-%d)
**Рабочая директория**: $(pwd)

## Технический стек
- **Язык**: $PRIMARY_LANGUAGE
- **Среда выполнения**: $RUNTIME_ENVIRONMENT
- **Пакетный менеджер**: $PACKAGE_MANAGER
- **Фреймворк**: $FRAMEWORK
- **Тестирование**: $TESTING_FRAMEWORK

## Структура проекта
$(tree -L 2 2>/dev/null || find . -maxdepth 2 -type d)

## Зависимости
$(if [ -f "package.json" ]; then echo "### Package.json:"; cat package.json | jq '.dependencies // {}, .devDependencies // {}' 2>/dev/null || echo "Не удалось прочитать"; fi)

## Конфигурация
- TypeScript: $([ -f "tsconfig.json" ] && echo "✅" || echo "❌")
- ESLint: $([ -f ".eslintrc.*" ] && echo "✅" || echo "❌")
- Prettier: $([ -f ".prettierrc*" ] && echo "✅" || echo "❌")
- Git: $([ -d ".git" ] && echo "✅" || echo "❌")

## Рекомендации системы
Проект готов для разработки с использованием выбранного стека.
Система уважает ваш выбор инструментов.
EOF

  echo "✅ Контекст проекта сохранен в $context_file"
}
```
```

### 🎛️ Phase 7: Ограничение MANUAL режима

**Файл**: `_cursor/rules/isolation_rules/Core/manual-mode-restriction.mdc.md`

**Содержание:**
```yaml
---
description: "Ограничение MANUAL режима взаимодействия только для CREATIVE фазы"
globs: "**/CREATIVE/**", "**/interaction/**"
alwaysApply: true
---

# ОГРАНИЧЕНИЕ MANUAL РЕЖИМА

## Правила использования MANUAL режима

### MANUAL режим только для CREATIVE
```yaml
interaction_modes:
  VAN:
    mode: "AUTO"
    reasoning: "Анализ и инициализация - стандартные процедуры"

  PLAN:
    mode: "AUTO"
    reasoning: "Планирование с уточняющими вопросами, но без выбора вариантов"

  CREATIVE:
    mode: "MANUAL"
    reasoning: "Архитектурные решения требуют пользовательского выбора"

  IMPLEMENT:
    mode: "AUTO"
    reasoning: "Реализация по готовому плану"

  REFLECT:
    mode: "AUTO"
    reasoning: "Анализ результатов - стандартная процедура"

  ARCHIVE:
    mode: "AUTO"
    reasoning: "Архивирование по установленным правилам"
```

### Логика переключения режимов
```bash
# Функция определения режима взаимодействия
determine_interaction_mode() {
  local memory_bank_mode="$1"
  local task_complexity="$2"

  case "$memory_bank_mode" in
    "CREATIVE")
      echo "MANUAL"
      echo "🎨 Режим CREATIVE: требуется выбор архитектурного решения"
      ;;
    "PLAN")
      echo "AUTO"
      echo "📋 Режим PLAN: уточняющие вопросы, но автоматическое планирование"
      ;;
    "VAN"|"IMPLEMENT"|"REFLECT"|"ARCHIVE")
      echo "AUTO"
      echo "⚙️ Режим $memory_bank_mode: автоматическое выполнение"
      ;;
    *)
      echo "AUTO"
      echo "🔧 Неизвестный режим: используется AUTO по умолчанию"
      ;;
  esac
}
```

### CREATIVE режим - презентация вариантов
```bash
# Презентация архитектурных вариантов в CREATIVE режиме
present_creative_options() {
  local problem_description="$1"

  echo "🎨 CREATIVE РЕЖИМ: ВЫБОР АРХИТЕКТУРНОГО РЕШЕНИЯ"
  echo "================================================"
  echo ""
  echo "📋 Проблема: $problem_description"
  echo ""
  echo "🔍 Проанализированы следующие варианты решения:"
  echo ""

  # Вариант 1
  echo "🏗️ ВАРИАНТ 1: [Название решения]"
  echo "   📈 Преимущества:"
  echo "   - [Преимущество 1]"
  echo "   - [Преимущество 2]"
  echo "   📉 Недостатки:"
  echo "   - [Недостаток 1]"
  echo "   ⚖️ Оценка: [X]/10"
  echo ""

  # Вариант 2
  echo "🔧 ВАРИАНТ 2: [Название решения]"
  echo "   📈 Преимущества:"
  echo "   - [Преимущество 1]"
  echo "   - [Преимущество 2]"
  echo "   📉 Недостатки:"
  echo "   - [Недостаток 1]"
  echo "   ⚖️ Оценка: [X]/10"
  echo ""

  # Рекомендация
  echo "🤖 РЕКОМЕНДАЦИЯ СИСТЕМЫ: Вариант [N]"
  echo "   💡 Обоснование: [Причина рекомендации]"
  echo ""
  echo "❓ Какой вариант вы выбираете? (1, 2, или опишите свой)"
}
```

### Уважение к выбору пользователя
```bash
# Система уважения выбора пользователя
respect_user_choice() {
  local user_choice="$1"
  local system_recommendation="$2"

  if [ "$user_choice" != "$system_recommendation" ]; then
    echo "✅ ВЫБОР ПОЛЬЗОВАТЕЛЯ ПРИНЯТ"
    echo "   👤 Ваш выбор: $user_choice"
    echo "   🤖 Рекомендация системы была: $system_recommendation"
    echo "   💭 Система уважает ваше решение и адаптируется к нему"
    echo ""
    echo "📝 Документирую ваш выбор для будущих решений..."
  else
    echo "✅ ВЫБОР СОВПАДАЕТ С РЕКОМЕНДАЦИЕЙ"
    echo "   🎯 Отличный выбор! Система и пользователь согласны."
  fi

  # Сохранение выбора для обучения системы
  save_user_preference "$user_choice" "$system_recommendation"
}
```
```

---

## 🔧 ТЕХНИЧЕСКИЕ ДЕТАЛИ РЕАЛИЗАЦИИ

### Применение Cursor Workaround
```bash
# Последовательность применения изменений
apply_rules_enhancement() {
  echo "🔄 ПРИМЕНЕНИЕ УЛУЧШЕНИЙ ПРАВИЛ MEMORY BANK"
  echo "=========================================="

  # 1. Создание backup
  git checkout -b "rules-enhancement-backup-$(date +%Y%m%d)"

  # 2. Cursor workaround
  mv .cursor _cursor
  find _cursor -name "*.mdc" -exec sh -c 'mv "$1" "$1.md"' _ {} \;

  # 3. Применение всех изменений (через edit_file)
  apply_all_rule_modifications

  # 4. Восстановление структуры
  find _cursor -name "*.mdc.md" -exec sh -c 'mv "$1" "${1%.md}"' _ {} \;
  mv _cursor .cursor

  # 5. Валидация
  validate_all_rules

  # 6. Коммит изменений
  git add .
  git commit -m "feat: comprehensive Memory Bank rules enhancement

- Added deep validation system for outputs
- Implemented timeout protection for commands and tests
- Added background server execution rules
- Enhanced working directory control
- Automated date management system
- Intelligent CONTINUE command handling
- Smart model switching by mode
- Project structure analysis system
- Restricted MANUAL mode to CREATIVE only

Methodology: changing_the_rules.md Cursor workaround"
}
```

### Валидация изменений
```bash
# Комплексная валидация всех правил
validate_all_rules() {
  echo "✅ ВАЛИДАЦИЯ УЛУЧШЕННЫХ ПРАВИЛ"
  echo "=============================="

  # 1. Проверка синтаксиса .mdc файлов
  find .cursor/rules -name "*.mdc" | while read file; do
    if ! head -10 "$file" | grep -q "^---"; then
      echo "❌ Отсутствует заголовок в: $file"
    fi
  done

  # 2. Проверка глобов
  find .cursor/rules -name "*.mdc" -exec grep -l "globs:" {} \; | wc -l

  # 3. Проверка ссылок между файлами
  find .cursor/rules -name "*.mdc" -exec grep -l "changing_the_rules.md" {} \;

  # 4. Проверка новых функций
  grep -r "timeout" .cursor/rules/ --include="*.mdc" | wc -l
  grep -r "ПРОДОЛЖАЙ" .cursor/rules/ --include="*.mdc" | wc -l
  grep -r "gemini\|sonnet" .cursor/rules/ --include="*.mdc" | wc -l

  echo "✅ Валидация завершена"
}
```

---

## 📊 ОЖИДАЕМЫЕ РЕЗУЛЬТАТЫ

### Количественные показатели
- **Новых правил**: 8 основных системных правил
- **Улучшенных файлов**: ~15 существующих правил
- **Новых функций**: 9 ключевых улучшений
- **Время реализации**: 3-4 часа

### Качественные улучшения
1. **Безопасность**: Timeout защита предотвращает зависания
2. **Надежность**: Фоновое выполнение серверов
3. **Контекстность**: Автоматический контроль директорий и дат
4. **Интеллектуальность**: Умное переключение моделей
5. **Пользовательский опыт**: Команда ПРОДОЛЖАЙ и анализ проекта
6. **Целевое взаимодействие**: MANUAL режим только где нужно

### Метрики успеха
- [ ] Все тесты используют timeout
- [ ] Серверы запускаются в фоне
- [ ] VAN автоматически обновляет даты
- [ ] ПЛАН уточняет директории
- [ ] ПРОДОЛЖАЙ восстанавливает контекст
- [ ] Модели переключаются оптимально
- [ ] Проект анализируется автоматически
- [ ] MANUAL работает только в CREATIVE

---

## 🎯 ЗАКЛЮЧЕНИЕ

Этот план представляет комплексное улучшение системы Memory Bank, которое значительно повысит надежность, безопасность и удобство использования. Все изменения будут применены с использованием проверенной методологии changing_the_rules.md и тщательно протестированы.

Система станет более интеллектуальной, автоматизированной и дружелюбной к пользователю, сохраняя при этом гибкость и уважение к выбору разработчика.