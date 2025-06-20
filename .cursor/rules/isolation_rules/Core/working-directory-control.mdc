---
description: "Система контроля рабочих директорий с проверкой в VAN режиме и уточнением в PLAN режиме"
globs: "**/**"
alwaysApply: true
---

# WORKING DIRECTORY CONTROL SYSTEM

> **TL;DR:** Система контроля рабочих директорий обеспечивает автоматическую проверку текущей директории в VAN режиме и требует уточнения всех путей от корня проекта в PLAN режиме.

## 📁 ПРИНЦИПЫ КОНТРОЛЯ ДИРЕКТОРИЙ

### Основные требования
**VAN режим - автоматическая проверка**
- Проверка текущей рабочей директории при входе в VAN
- Автоматическое определение корня проекта
- Валидация структуры проекта
- Предупреждения о неправильном расположении

**PLAN режим - обязательное уточнение**
- Все пути должны быть указаны от корня проекта
- Явное указание рабочих директорий для команд
- Валидация существования указанных путей
- Предотвращение ошибок относительных путей

## 🔍 VAN РЕЖИМ: ПРОВЕРКА ДИРЕКТОРИЙ

### Автоматическая проверка при входе
```bash
# Проверка рабочей директории в VAN режиме
van_check_working_directory() {
  echo "📁 ПРОВЕРКА РАБОЧЕЙ ДИРЕКТОРИИ В VAN РЕЖИМЕ"
  echo "==========================================="

  local current_dir=$(pwd)
  echo "📍 Текущая директория: $current_dir"

  # Определение корня проекта
  local project_root=$(find_project_root "$current_dir")

  if [ -n "$project_root" ]; then
    echo "✅ Корень проекта найден: $project_root"

    # Проверка соответствия
    if [ "$current_dir" = "$project_root" ]; then
      echo "✅ Находимся в корне проекта"
    else
      echo "⚠️ Находимся не в корне проекта"
      echo "📋 Рекомендация: cd $project_root"

      # Предложение перехода
      read -p "Перейти в корень проекта? (Y/n): " -n 1 -r
      echo
      if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        cd "$project_root"
        echo "✅ Переход выполнен: $(pwd)"
      fi
    fi

    # Анализ структуры проекта
    analyze_project_structure "$project_root"

  else
    echo "❌ Корень проекта не найден"
    echo "🔍 Поиск признаков проекта..."
    search_project_indicators "$current_dir"
  fi
}
```

### Определение корня проекта
```bash
# Поиск корня проекта по различным признакам
find_project_root() {
  local start_dir="$1"
  local current_dir="$start_dir"

  # Признаки корня проекта
  local project_indicators=(
    "package.json"
    "composer.json"
    "Cargo.toml"
    "go.mod"
    "requirements.txt"
    "setup.py"
    "pom.xml"
    "build.gradle"
    ".git"
    ".gitignore"
    "README.md"
    "Makefile"
    "Dockerfile"
  )

  # Поиск вверх по дереву директорий
  while [ "$current_dir" != "/" ]; do
    for indicator in "${project_indicators[@]}"; do
      if [ -e "$current_dir/$indicator" ]; then
        echo "$current_dir"
        return 0
      fi
    done
    current_dir=$(dirname "$current_dir")
  done

  # Корень не найден
  return 1
}
```

### Анализ структуры проекта
```bash
# Анализ структуры проекта для VAN режима
analyze_project_structure() {
  local project_root="$1"

  echo "📊 АНАЛИЗ СТРУКТУРЫ ПРОЕКТА"
  echo "=========================="

  cd "$project_root" || return 1

  # Определение типа проекта
  local project_type=$(detect_project_type "$project_root")
  echo "🏷️ Тип проекта: $project_type"

  # Анализ ключевых директорий
  echo "📁 Ключевые директории:"
  check_directory_exists "src" "Исходный код"
  check_directory_exists "lib" "Библиотеки"
  check_directory_exists "test" "Тесты"
  check_directory_exists "tests" "Тесты (альтернативное название)"
  check_directory_exists "docs" "Документация"
  check_directory_exists "build" "Сборка"
  check_directory_exists "dist" "Дистрибутив"
  check_directory_exists "node_modules" "Зависимости Node.js"
  check_directory_exists "vendor" "Зависимости PHP"
  check_directory_exists ".git" "Git репозиторий"

  # Анализ конфигурационных файлов
  echo "⚙️ Конфигурационные файлы:"
  check_file_exists "package.json" "Node.js конфигурация"
  check_file_exists "composer.json" "PHP конфигурация"
  check_file_exists "requirements.txt" "Python зависимости"
  check_file_exists "Cargo.toml" "Rust конфигурация"
  check_file_exists "go.mod" "Go модуль"
  check_file_exists "Makefile" "Makefile"
  check_file_exists "Dockerfile" "Docker конфигурация"

  # Рекомендации по структуре
  provide_structure_recommendations "$project_type"
}

# Определение типа проекта
detect_project_type() {
  local project_root="$1"

  if [ -f "$project_root/package.json" ]; then
    echo "Node.js/JavaScript"
  elif [ -f "$project_root/composer.json" ]; then
    echo "PHP"
  elif [ -f "$project_root/requirements.txt" ] || [ -f "$project_root/setup.py" ]; then
    echo "Python"
  elif [ -f "$project_root/Cargo.toml" ]; then
    echo "Rust"
  elif [ -f "$project_root/go.mod" ]; then
    echo "Go"
  elif [ -f "$project_root/pom.xml" ]; then
    echo "Java (Maven)"
  elif [ -f "$project_root/build.gradle" ]; then
    echo "Java (Gradle)"
  else
    echo "Неопределенный"
  fi
}
```

## 📋 PLAN РЕЖИМ: УТОЧНЕНИЕ ПУТЕЙ

### Обязательное указание путей от корня
```bash
# Валидация путей в PLAN режиме
plan_validate_paths() {
  local plan_content="$1"

  echo "📋 ВАЛИДАЦИЯ ПУТЕЙ В PLAN РЕЖИМЕ"
  echo "==============================="

  # Поиск относительных путей
  local relative_paths=$(echo "$plan_content" | grep -E "\./|\.\./|[^/][^:]*/" | grep -v "http://\|https://")

  if [ -n "$relative_paths" ]; then
    echo "⚠️ НАЙДЕНЫ ОТНОСИТЕЛЬНЫЕ ПУТИ:"
    echo "$relative_paths"
    echo ""
    echo "🔧 ТРЕБУЕТСЯ УТОЧНЕНИЕ:"
    echo "Все пути должны быть указаны от корня проекта"
    echo "Например: src/components/Button.js вместо ./Button.js"

    return 1
  fi

  # Валидация абсолютных путей проекта
  validate_project_paths "$plan_content"
}

# Валидация путей проекта
validate_project_paths() {
  local plan_content="$1"
  local project_root=$(pwd)

  echo "🔍 Проверка существования указанных путей:"

  # Извлечение путей из плана
  local paths=$(echo "$plan_content" | grep -oE "[a-zA-Z0-9_/-]+\.(js|ts|py|php|go|rs|java|css|html|md|json|yaml|yml|xml)" | sort -u)

  local missing_paths=()
  local existing_paths=()

  for path in $paths; do
    if [ -e "$project_root/$path" ]; then
      existing_paths+=("$path")
    else
      missing_paths+=("$path")
    fi
  done

  # Отчет о существующих путях
  if [ ${#existing_paths[@]} -gt 0 ]; then
    echo "✅ Существующие файлы:"
    for path in "${existing_paths[@]}"; do
      echo "   $path"
    done
  fi

  # Отчет о несуществующих путях
  if [ ${#missing_paths[@]} -gt 0 ]; then
    echo "❌ Файлы для создания:"
    for path in "${missing_paths[@]}"; do
      echo "   $path"
    done
  fi

  echo ""
  echo "📊 Статистика: ${#existing_paths[@]} существующих, ${#missing_paths[@]} для создания"
}
```

### Интерактивное уточнение директорий
```bash
# Интерактивное уточнение рабочих директорий
clarify_working_directories() {
  echo "📁 УТОЧНЕНИЕ РАБОЧИХ ДИРЕКТОРИЙ"
  echo "==============================="

  local project_root=$(pwd)
  echo "📍 Корень проекта: $project_root"

  # Основные рабочие директории
  echo "🔧 Укажите основные рабочие директории:"

  # Директория исходного кода
  local src_dir
  read -p "📁 Директория исходного кода [src]: " src_dir
  src_dir=${src_dir:-src}
  validate_and_create_directory "$src_dir" "исходного кода"

  # Директория тестов
  local test_dir
  read -p "🧪 Директория тестов [test]: " test_dir
  test_dir=${test_dir:-test}
  validate_and_create_directory "$test_dir" "тестов"

  # Директория сборки
  local build_dir
  read -p "🔨 Директория сборки [build]: " build_dir
  build_dir=${build_dir:-build}
  validate_and_create_directory "$build_dir" "сборки"

  # Директория документации
  local docs_dir
  read -p "📚 Директория документации [docs]: " docs_dir
  docs_dir=${docs_dir:-docs}
  validate_and_create_directory "$docs_dir" "документации"

  # Сохранение конфигурации
  save_directory_config "$src_dir" "$test_dir" "$build_dir" "$docs_dir"
}

# Валидация и создание директории
validate_and_create_directory() {
  local dir_path="$1"
  local dir_purpose="$2"

  if [ -d "$dir_path" ]; then
    echo "✅ Директория $dir_purpose существует: $dir_path"
  else
    echo "❌ Директория $dir_purpose не существует: $dir_path"
    read -p "Создать директорию? (Y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
      mkdir -p "$dir_path"
      echo "✅ Директория создана: $dir_path"
    fi
  fi
}
```

## 🔧 УТИЛИТЫ УПРАВЛЕНИЯ ДИРЕКТОРИЯМИ

### Навигация по проекту
```bash
# Быстрая навигация по ключевым директориям проекта
project_navigation() {
  local command="$1"
  local project_root=$(find_project_root "$(pwd)")

  if [ -z "$project_root" ]; then
    echo "❌ Корень проекта не найден"
    return 1
  fi

  case "$command" in
    "root"|"r")
      cd "$project_root"
      echo "📁 Переход в корень проекта: $(pwd)"
      ;;
    "src"|"s")
      cd "$project_root/src" 2>/dev/null || cd "$project_root"
      echo "📁 Переход в директорию исходного кода: $(pwd)"
      ;;
    "test"|"t")
      cd "$project_root/test" 2>/dev/null || cd "$project_root/tests" 2>/dev/null || cd "$project_root"
      echo "📁 Переход в директорию тестов: $(pwd)"
      ;;
    "docs"|"d")
      cd "$project_root/docs" 2>/dev/null || cd "$project_root"
      echo "📁 Переход в директорию документации: $(pwd)"
      ;;
    "build"|"b")
      cd "$project_root/build" 2>/dev/null || cd "$project_root/dist" 2>/dev/null || cd "$project_root"
      echo "📁 Переход в директорию сборки: $(pwd)"
      ;;
    *)
      echo "📁 Доступные команды навигации:"
      echo "   root|r  - корень проекта"
      echo "   src|s   - исходный код"
      echo "   test|t  - тесты"
      echo "   docs|d  - документация"
      echo "   build|b - сборка"
      ;;
  esac
}

# Алиасы для быстрой навигации
alias proot='project_navigation root'
alias psrc='project_navigation src'
alias ptest='project_navigation test'
alias pdocs='project_navigation docs'
alias pbuild='project_navigation build'
```

### Проверка целостности путей
```bash
# Проверка целостности всех путей в проекте
check_project_path_integrity() {
  local project_root="$1"

  echo "🔍 ПРОВЕРКА ЦЕЛОСТНОСТИ ПУТЕЙ ПРОЕКТА"
  echo "===================================="

  cd "$project_root" || return 1

  # Поиск битых символических ссылок
  echo "🔗 Проверка символических ссылок:"
  local broken_links=$(find . -type l ! -exec test -e {} \; -print 2>/dev/null)
  if [ -n "$broken_links" ]; then
    echo "❌ Битые символические ссылки:"
    echo "$broken_links"
  else
    echo "✅ Все символические ссылки корректны"
  fi

  # Поиск файлов с проблемными именами
  echo "📝 Проверка имен файлов:"
  local problematic_files=$(find . -name "* *" -o -name "*\t*" -o -name "*\n*" 2>/dev/null)
  if [ -n "$problematic_files" ]; then
    echo "⚠️ Файлы с проблемными именами (пробелы, табы):"
    echo "$problematic_files"
  else
    echo "✅ Все имена файлов корректны"
  fi

  # Проверка прав доступа
  echo "🔒 Проверка прав доступа:"
  local unreadable_files=$(find . ! -readable -type f 2>/dev/null | head -10)
  if [ -n "$unreadable_files" ]; then
    echo "❌ Нечитаемые файлы:"
    echo "$unreadable_files"
  else
    echo "✅ Все файлы доступны для чтения"
  fi
}
```

## 📊 ОТЧЕТЫ И СТАТИСТИКА

### Отчет о структуре директорий
```bash
# Генерация отчета о структуре директорий
generate_directory_report() {
  local project_root="$1"
  local output_file="${2:-directory_report.md}"

  echo "📊 Генерация отчета о структуре директорий"

  cat > "$output_file" << EOF
# Отчет о структуре директорий

**Дата создания**: $(date)
**Корень проекта**: $project_root

## Структура проекта

\`\`\`
$(tree -L 3 "$project_root" 2>/dev/null || find "$project_root" -type d | head -20)
\`\`\`

## Статистика

EOF

  # Статистика по типам файлов
  echo "### Статистика по типам файлов" >> "$output_file"
  echo "" >> "$output_file"
  find "$project_root" -type f | sed 's/.*\.//' | sort | uniq -c | sort -nr | head -10 | while read count ext; do
    echo "- **.$ext**: $count файлов" >> "$output_file"
  done

  # Размеры директорий
  echo "" >> "$output_file"
  echo "### Размеры основных директорий" >> "$output_file"
  echo "" >> "$output_file"
  du -sh "$project_root"/* 2>/dev/null | sort -hr | head -10 | while read size dir; do
    echo "- **$(basename "$dir")**: $size" >> "$output_file"
  done

  echo "✅ Отчет сохранен: $output_file"
}
```

## 🚨 ПРЕДУПРЕЖДЕНИЯ И ОШИБКИ

### Система предупреждений
```bash
# Проверка потенциальных проблем с директориями
check_directory_issues() {
  local project_root="$1"

  echo "⚠️ ПРОВЕРКА ПОТЕНЦИАЛЬНЫХ ПРОБЛЕМ"
  echo "================================="

  # Проверка глубины вложенности
  local max_depth=$(find "$project_root" -type d -exec sh -c 'echo "${1//[^\/]}" | wc -c' _ {} \; | sort -n | tail -1)
  if [ "$max_depth" -gt 10 ]; then
    echo "⚠️ Слишком глубокая вложенность директорий: $max_depth уровней"
    echo "🔧 Рекомендация: Упростите структуру проекта"
  fi

  # Проверка количества файлов в директориях
  find "$project_root" -type d -exec sh -c 'count=$(ls -1 "$1" 2>/dev/null | wc -l); if [ $count -gt 100 ]; then echo "⚠️ Слишком много файлов в $1: $count"; fi' _ {} \;

  # Проверка дублирующихся имен
  local duplicate_names=$(find "$project_root" -type f -exec basename {} \; | sort | uniq -d)
  if [ -n "$duplicate_names" ]; then
    echo "⚠️ Дублирующиеся имена файлов:"
    echo "$duplicate_names"
  fi
}
```

Эта система контроля директорий обеспечивает правильную организацию работы с файловой системой в разных режимах Memory Bank, предотвращая ошибки и улучшая навигацию по проекту.