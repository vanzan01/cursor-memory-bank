---
description: "Централизованная система управления датой и временем. Обеспечивает корректное получение и установку системной даты."
globs: "**/**"
alwaysApply: true
---

# DATETIME MANAGER SYSTEM

> **TL;DR:** Этот модуль является единым источником правды для всех операций с датой и временем. Он гарантирует, что система всегда работает с актуальной, полученной через командную строку датой.

## ⚙️ Основные функции

### 1. Установка и верификация системной даты

Эта функция должна вызываться в САМОМ НАЧАЛЕ любого режима (`VAN`, `UNIVERSAL`, `STEP_BY_STEP` и т.д.).

```bash
# Псевдокод для ИИ-ассистента

function initialize_system_date() {
  # 1. Получаем текущую дату и время из командной строки
  local current_datetime=$(date +"%Y-%m-%d %H:%M:%S")
  local current_date=$(echo "$current_datetime" | cut -d' ' -f1)

  # 2. Указываем путь к файлу
  local date_file="memory-bank/system/current-date.txt"

  # 3. Создаем директорию, если она не существует
  mkdir -p "$(dirname "$date_file")"

  # 4. Записываем актуальную дату в файл
  echo "$current_date" > "$date_file"

  # 5. Выводим подтверждение
  echo "✅ System date initialized to: $current_date"
}
```

### 2. Функции для получения даты и времени

Эти функции должны использоваться во всех остальных правилах вместо прямого вызова `date`.

```bash
# Получить только дату (YYYY-MM-DD)
function get_current_date() {
  cat memory-bank/system/current-date.txt
}

# Получить полное время (YYYY-MM-DD HH:MM:SS)
function get_current_datetime() {
  date +"%Y-%m-%d %H:%M:%S"
}
```

## ✅ Интеграция

Все файлы инструкций (`custom_modes/*.md`) должны начинаться с вызова `initialize_system_date()`.