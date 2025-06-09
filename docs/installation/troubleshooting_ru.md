# Руководство по устранению неполадок

> **Комплексные решения распространенных проблем Cursor Memory Bank**

Это руководство предоставляет детальные решения наиболее распространенных проблем, с которыми вы можете столкнуться при использовании Cursor Memory Bank, организованные по категориям с пошаговыми инструкциями по решению.

## 🚨 Быстрый диагностический чек-лист

Перед углублением в конкретные проблемы выполните эту быструю диагностику:

```bash
# 1. Проверка базовой установки
ls -la memory-bank/
ls -la .cursor/

# 2. Проверка прав доступа к файлам
find memory-bank/ -type f -name "*.md" | head -5
find .cursor/ -type f -name "*.mdc" | head -5

# 3. Тест интеграции с Cursor
grep -r "Memory Bank" memory-bank/ | wc -l
```

**Ожидаемые результаты:**
- ✅ Обе директории существуют и доступны
- ✅ Файлы доступны для чтения и записи
- ✅ Контент Memory Bank найден в файлах

## 🔧 Проблемы установки

### Проблема 1: Ошибка клонирования репозитория

**Симптомы:**
```
fatal: repository 'https://github.com/...' not found
Permission denied (publickey)
```

**Решения:**

#### Для проблем с HTTPS клонированием:
```bash
# Используйте HTTPS вместо SSH
git clone https://github.com/your-username/cursor-memory-bank.git

# Если все еще не работает, проверьте интернет-соединение
ping github.com

# Попробуйте с подробным выводом
git clone --verbose https://github.com/your-username/cursor-memory-bank.git
```

#### Для проблем с SSH ключами:
```bash
# Проверьте SSH ключ
ssh -T git@github.com

# Создайте новый SSH ключ при необходимости
ssh-keygen -t ed25519 -C "your_email@example.com"

# Добавьте в SSH агент
ssh-add ~/.ssh/id_ed25519
```

#### Альтернатива: Скачивание ZIP
```bash
# Если git clone продолжает не работать
curl -L https://github.com/your-username/cursor-memory-bank/archive/main.zip -o memory-bank.zip
unzip memory-bank.zip
mv cursor-memory-bank-main cursor-memory-bank
```

### Проблема 2: Отсутствующие директории после установки

**Симптомы:**
```
ls: cannot access 'memory-bank/': No such file or directory
ls: cannot access '.cursor/': No such file or directory
```

**Решения:**

#### Проверка текущей директории:
```bash
# Убедитесь, что вы в правильном месте
pwd
ls -la

# Поищите директорию проекта
find . -name "memory-bank" -type d 2>/dev/null
find . -name ".cursor" -type d 2>/dev/null
```

#### Переход в правильную директорию:
```bash
# Если вы нашли директории в другом месте
cd path/to/cursor-memory-bank

# Проверьте структуру
ls -la memory-bank/
ls -la .cursor/
```

#### Пересоздание отсутствующих директорий:
```bash
# Если директории действительно отсутствуют, пересоздайте их
mkdir -p memory-bank
mkdir -p .cursor/rules

# Скачайте отсутствующие файлы
curl -L https://raw.githubusercontent.com/your-username/cursor-memory-bank/main/memory-bank/tasks.md -o memory-bank/tasks.md
```

### Проблема 3: Ошибки отказа в доступе

**Симптомы:**
```
Permission denied: memory-bank/tasks.md
chmod: cannot access '.cursor/': Permission denied
```

**Решения:**

#### Для macOS/Linux:
```bash
# Исправление владельца
sudo chown -R $USER:$USER .

# Исправление прав доступа
chmod -R 755 .cursor/
chmod -R 644 memory-bank/*.md

# Проверка прав доступа
ls -la memory-bank/
ls -la .cursor/
```

#### Для Windows:
```powershell
# Запустите PowerShell от имени администратора
# Возьмите владение файлами
takeown /f . /r /d y

# Предоставьте полный контроль
icacls . /grant %USERNAME%:F /t
```

## 🎯 Проблемы интеграции с Cursor IDE

### Проблема 4: Cursor не распознает Memory Bank

**Симптомы:**
- AI-ассистент не предлагает рабочие процессы Memory Bank
- Нет ответа при вводе "VAN", "PLAN" и т.д.
- Правила, похоже, не загружаются

**Решения:**

#### Шаг 1: Проверка установки Cursor
```bash
# Проверьте версию Cursor
cursor --version

# Обновите при необходимости (скачайте с cursor.sh)
```

#### Шаг 2: Проверка метода открытия проекта
```bash
# Откройте проект правильно
cd cursor-memory-bank
cursor .

# Альтернатива: Используйте GUI
# File → Open Folder → Выберите директорию cursor-memory-bank
```

#### Шаг 3: Проверка директории правил
```bash
# Проверьте существование правил
find .cursor -name "*.mdc" | head -10

# Проверьте содержимое правил
head -20 .cursor/rules/isolation_rules/main.mdc
```

#### Шаг 4: Перезапуск Cursor
1. Полностью закройте Cursor
2. Откройте проект заново
3. Дождитесь полной инициализации
4. Протестируйте, введя "VAN" в любом файле

### Проблема 5: Режимы Memory Bank не работают

**Симптомы:**
- Ввод названий режимов (VAN, PLAN и т.д.) не дает эффекта
- Управляемые рабочие процессы не появляются
- AI не следует паттернам Memory Bank

**Решения:**

#### Проверка загрузки правил:
```bash
# Проверьте доступность файлов правил
ls -la .cursor/rules/isolation_rules/

# Проверьте синтаксические ошибки в правилах
grep -n "ERROR\|error" .cursor/rules/isolation_rules/*.mdc
```

#### Тест отдельных компонентов:
```bash
# Проверьте, читает ли Cursor директорию .cursor
echo "Test rule" > .cursor/test.md
# Откройте в Cursor и посмотрите, распознается ли

# Удалите тестовый файл
rm .cursor/test.md
```

#### Сброс конфигурации Cursor:
1. Закройте Cursor
2. Очистите кэш Cursor (расположение зависит от ОС):
   - **macOS**: `~/Library/Application Support/Cursor`
   - **Windows**: `%APPDATA%\Cursor`
   - **Linux**: `~/.config/Cursor`
3. Откройте проект заново

## 📁 Проблемы файловой системы

### Проблема 6: Файлы Memory Bank не обновляются

**Симптомы:**
- `tasks.md` не отражает изменения
- Отслеживание прогресса кажется замороженным
- Ручные правки не сохраняются

**Решения:**

#### Проверка блокировки файлов:
```bash
# Проверьте, заблокированы ли файлы (macOS/Linux)
lsof memory-bank/tasks.md

# Для Windows проверьте свойства файла на статус "только для чтения"
```

#### Проверка целостности файлов:
```bash
# Проверьте кодировку файла
file memory-bank/tasks.md

# Убедитесь, что файл не поврежден
head -10 memory-bank/tasks.md
tail -10 memory-bank/tasks.md
```

#### Принудительное обновление файла:
```bash
# Создайте резервную копию
cp memory-bank/tasks.md memory-bank/tasks.md.backup

# Протестируйте доступ на запись
echo "# Test" >> memory-bank/tasks.md

# Восстановите при необходимости
mv memory-bank/tasks.md.backup memory-bank/tasks.md
```

## 🌐 Платформо-специфичные проблемы

### Проблемы Windows

#### Проблема 7: Политика выполнения PowerShell

**Симптомы:**
```
execution of scripts is disabled on this system
```

**Решение:**
```powershell
# Установите политику выполнения для текущего пользователя
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Проверьте изменение
Get-ExecutionPolicy -List
```

### Проблемы macOS

#### Проблема 8: Gatekeeper блокирует Cursor

**Симптомы:**
```
"Cursor" cannot be opened because the developer cannot be verified
```

**Решение:**
1. Системные настройки → Безопасность и конфиденциальность
2. Нажмите "Все равно открыть" для Cursor
3. Или временно отключите Gatekeeper:
```bash
sudo spctl --master-disable
# Включите заново после установки:
sudo spctl --master-enable
```

### Проблемы Linux

#### Проблема 9: Отсутствующие зависимости

**Симптомы:**
```
command not found: cursor
git: command not found
```

**Решения:**

#### Для Ubuntu/Debian:
```bash
# Обновите список пакетов
sudo apt update

# Установите основные инструменты
sudo apt install git curl wget

# Установите Cursor (скачайте с cursor.sh)
wget https://download.cursor.sh/linux/appImage/x64
chmod +x cursor-*.AppImage
sudo mv cursor-*.AppImage /usr/local/bin/cursor
```

## 📞 Получение дополнительной помощи

### Ресурсы сообщества

1. **GitHub Issues**: [Сообщайте об ошибках и проблемах](https://github.com/your-username/cursor-memory-bank/issues)
2. **Обсуждения**: [Задавайте вопросы и делитесь решениями](https://github.com/your-username/cursor-memory-bank/discussions)
3. **Документация**: [Полное руководство пользователя](../user-guide/getting-started_ru.md)

### Создание эффективных отчетов об ошибках

Включите эту информацию:

```markdown
## Шаблон отчета об ошибке

**Окружение:**
- ОС: [Windows/macOS/Linux + версия]
- Версия Cursor: [номер версии]
- Версия Memory Bank: [хэш коммита или релиз]

**Описание проблемы:**
[Четкое описание проблемы]

**Шаги для воспроизведения:**
1. [Первый шаг]
2. [Второй шаг]
3. [Третий шаг]

**Ожидаемое поведение:**
[Что должно происходить]

**Фактическое поведение:**
[Что происходит на самом деле]

**Дополнительный контекст:**
[Любая другая релевантная информация]
```

## ✅ Чек-лист предотвращения

Чтобы избежать распространенных проблем:

```
□ Поддерживайте Cursor IDE обновленным до последней версии
□ Регулярно создавайте резервные копии директории memory-bank/
□ Следите за дисковым пространством и правами доступа к файлам
□ Тестируйте функциональность Memory Bank после обновлений системы
□ Поддерживайте разумно короткий путь к директории проекта
□ Избегайте специальных символов в именах файлов
□ Регулярно очищайте временные файлы
□ Следите за использованием системных ресурсов
□ Поддерживайте git репозиторий в синхронизации
□ Документируйте любые пользовательские модификации
```

## 🎯 Быстрая справка

### Команды экстренного восстановления

```bash
# Сброс Memory Bank к чистому состоянию
git checkout HEAD -- memory-bank/

# Восстановление из резервной копии
cp -r memory-bank-backup memory-bank

# Переустановка с нуля
rm -rf cursor-memory-bank
git clone https://github.com/your-username/cursor-memory-bank.git
```

### Команды проверки

```bash
# Быстрая проверка работоспособности
ls memory-bank/ && ls .cursor/ && echo "✅ Структура OK"

# Тест доступа к файлам
echo "test" >> memory-bank/tasks.md && echo "✅ Запись OK"

# Проверка интеграции с Cursor
cursor --version && echo "✅ Cursor OK"
```

---

**Все еще есть проблемы?** Не стесняйтесь [создать issue](https://github.com/your-username/cursor-memory-bank/issues) с вашим диагностическим выводом. Сообщество здесь, чтобы помочь!