# ИНСТРУКЦИЯ ПО ИСПОЛЬЗОВАНИЮ UPDATE_DATE

## 🚀 БЫСТРЫЙ СТАРТ

### 1. Сделать скрипт исполняемым:
```bash
chmod +x memory-bank/scripts/update-date.sh
```

### 2. Базовое использование:
```bash
# Простое обновление даты
./memory-bank/scripts/update-date.sh

# Полное обновление с backup и проверкой
./memory-bank/scripts/update-date.sh --sync-all --backup --verify

# Справка
./memory-bank/scripts/update-date.sh --help
```

## 📋 ОСНОВНЫЕ КОМАНДЫ

### Ежедневное использование:
```bash
# Утром перед работой
./memory-bank/scripts/update-date.sh --sync-all --backup --verify
```

### Проверка системы:
```bash
# Проверить консистентность дат
./memory-bank/scripts/update-date.sh --verify
```

### Принудительное обновление:
```bash
# Если нужно обновить даже без изменений
./memory-bank/scripts/update-date.sh --force --sync-all
```

## 🔧 АЛИАСЫ ДЛЯ УДОБСТВА

Добавьте в ваш `.bashrc` или `.zshrc`:
```bash
# UPDATE_DATE алиасы
alias ud="./memory-bank/scripts/update-date.sh"
alias uds="./memory-bank/scripts/update-date.sh --sync-all"
alias udv="./memory-bank/scripts/update-date.sh --verify"
alias udf="./memory-bank/scripts/update-date.sh --force --sync-all --backup --verify"

# Проверка даты
alias check_date="cat memory-bank/system/current-date.txt"
alias real_date="date +%Y-%m-%d"
```

После добавления алиасов:
```bash
source ~/.bashrc  # или ~/.zshrc

# Теперь можно использовать короткие команды:
ud          # Простое обновление
uds         # С синхронизацией
udv         # С проверкой
udf         # Полное обновление
```

## 📊 МОНИТОРИНГ

### Проверить логи:
```bash
cat memory-bank/logs/date-updates.log
```

### Проверить backup:
```bash
ls -la memory-bank/backup/dates/
```

### Проверить текущую дату:
```bash
cat memory-bank/system/current-date.txt
```

## 🚨 РЕШЕНИЕ ПРОБЛЕМ

### Если нет прав доступа:
```bash
chmod +x memory-bank/scripts/update-date.sh
chmod -R 755 memory-bank/
```

### Если скрипт не найден:
```bash
# Убедитесь, что запускаете из корня проекта
pwd  # Должно показать путь к cursor-memory-bank
ls memory-bank/  # Должно показать папки system, scripts и т.д.
```

### Если ошибки в датах:
```bash
# Принудительная проверка и исправление
./memory-bank/scripts/update-date.sh --force --sync-all --verify
```

## ✅ ГОТОВО!

Команда UPDATE_DATE готова к использованию. Рекомендуется запускать `udf` (полное обновление) каждое утро перед началом работы.