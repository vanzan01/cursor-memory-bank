#!/bin/bash
echo "🚀 Starting migration to encapsulated task structure..."

# Переместить существующие файлы задач
for task_file in memory-bank/tasks/{todo,in_progress}/*/*.md; do
  if [ -f "$task_file" ]; then
    # Создать новую директорию задачи
    task_name=$(basename "$task_file" .md)
    task_dir="memory-bank/tasks/$(dirname "$task_file")/${task_name}"
    mkdir -p "$task_dir/creative" "$task_dir/reports" "$task_dir/release"

    # Переместить файл задачи
    mv "$task_file" "$task_dir/_task.md"

    # Создать пустые файлы-заглушки
    touch "$task_dir/_context.md"
    touch "$task_dir/_reflection.md"
  fi
done

# Обработать завершенные задачи
# ... (аналогично для папки done) ...

# Очистить старые папки контекста, если они есть
rm -rf memory-bank/contexts/

echo "✅ Migration complete!"