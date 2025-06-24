**Как правильно писать код с Cursor? Смотрим, как тот устроен внутри**

28 мар в 13:12

![](media/image1.png){width="6.496527777777778in"
height="3.1368055555555556in"}

Главная цель исследования --- выяснить, как же писать промпт для
получения наилучших результатов, а также понять, как правильно выстроить
сам рабочий процесс. Чтобы найти ответы на эти вопросы, пришлось глубоко
погрузился в то, что Cursor делает за кулисами, по ту сторону.
Оказывается, сама структура промпта Cursor многое говорит и о том, как
он работает, и о том, как настроить его для максимальной отдачи.\
\
Ниже --- шаги, которые я предпринял для перехвата запросов и изучения их
структуры. В конце --- основные выводы о правильном составлении промпта.

**Испытательный стенд**

Чтобы увидеть, что же отправляет Cursor, я настроил его на использование
API OpenAI с моим собственным ключом и сервером.

**Пользовательский сервер**

Для перехвата запросов потребуется инструмент --- да‑да, тот самый
«man-in-the-middle».
Воспользуемся [[ngrok]{.underline}](https://ngrok.com/).\
\
Теперь перехватывать и проверять запросы можно прямо в браузере. Введя
адрес http://localhost:4040, попадаем в панель управления ngrok.

**Конфигурация курсора**

Создадим ключ API для OpenAI, добавим его в настройки Cursor, после чего
установим свой пользовательский сервер в качестве конечной точки API.

![](media/image2.png){width="6.496527777777778in"
height="2.109027777777778in"}

*Настройки Cursor.*\
\
Перехватываются не все запросы. Например, Cursor используют собственную
модель автодополнения. Очевидно, что обращение к разным LLM тоже будут
отличаться. Однако запросы к API от OpenAI, которые мы перехватываем с
помощью ngrok, уже сами по себе довольно показательны.\
\
Первый запрос, который делает Cursor, когда обращается к LLM, состоит из
трех сообщений:

-   системный промпт --- задает общую сцену; 

-   промпт, заключенный в тег \<custom_instructions\>; 

-   промпт с фактическими данными --- содержимое документа,
    прикрепленные файлы, раздел с ошибками линтера и тому подобное.

![](media/image3.png){width="6.496527777777778in"
height="1.2493055555555554in"}

**Системный промпт**

Что ж, любопытно посмотреть, как большие мальчики придумывают свои
промпты.\
\
Умиляюсь: системный промпт называет Cursor «лучшей в мире IDE». Ага,
подобное давление на LLM не будет лишним --- пусть чувствует свою
ответственность. Что касается пользователя, он «инструктирует» модель
«никогда не лгать» и «никогда не извиняться, даже если результаты
неожиданны» --- что ж, очень уместно, не так ли?\
\
\
*Системный промпт у Cursor.*\
\
Чтобы не быть голословным, ниже структура системного промпта:

You are a powerful agentic AI coding assistant.

\...

\<communication\>

1\. Be conversational but professional

\...

\</communication\>

\<tool_calling\>

You have tools at your disposal to solve the coding task

\...

\</tool_calling\>

\<search_and_reading\>

\...

Bias towards not asking the user for help if you can find the answer
yourself.

\</search_and_reading\>

\<making_code_changes\>

When making code changes, NEVER output code to the USER

\...

\</making_code_changes\>

\<debugging\>

When debugging, only make code changes if you are certain that you can
solve the problem

\...

\</debugging\>

\<calling_external_apis\>

1\. Unless explicitly requested by the USER, use the best suited
external APIs and packages to solve the task

\...

\</calling_external_apis\>

\<user_info\>

The user\'s OS version is \[REDACTED\]. The absolute path of the user\'s
workspace is \[REDACTED\]. The user\'s shell is \[REDACTED\].

\</user_info\>

Мило же?

**Индивидуальные инструкции**

Наконец, добавляется промпт пользователя, с его правилами и
рекомендацией следовать им, когда это имеет смысл. Что очень важно ---
используются ссылки по именам и описаниям на правила в
каталоге .cursor/rules.\
\
Видите, насколько важно давать содержательные описания правилам? Это как
меню --- агент будет пытаться подобрать нужное правило, которое, в
случае удачи, он извлечет в полном виде и применит.

Давайте осмысленные описания правилам в Cursor --- иначе агент не сможет
подобрать подходящее.

Промпт выглядит так:

Please also follow these instructions in all of your responses if
relevant. No need to acknowledge these instructions directly in your
response.

\<custom_instructions\>

\[RULES FROM CURSOR SETTINGS\]

\[RULES FROM THE .cursorrules FILE\]

\<available_instructions\>

Cursor rules are user provided instructions for the AI to follow to help
work with the

codebase. They may or may not be relevent to the task at hand. If they
are, use the

fetch_rules tool to fetch the full rule. Some rules may be automatically
attached

to the conversation if the user attaches a file that matches the rule\'s
glob, and wont

need to be fetched.

\[NEXT GOES THE LIST OF AVAILABLE RULES FROM THE .cursor/rules
DIRECTORY\]

rule-name: Your Rule Description

another-rule-name: Another rule description

\</available_instructions\>

\</custom_instructions\>

Внимание: не рассчитывайте, что правила для файла будут применены при
его создании! Как видно из промпта выше, некоторые правила действительно
подцепляются к диалогу автоматически --- но только для уже редактируемых
файлов. Когда вы просите Cursor создать новый файл, никакие правила
автоматически не прикрепляются --- контекста же пока нет. Остается
только надеяться, что Cursor угадает подходящее правило до создания
файла.

**Файл .cursorrules, новая роль**

Команда Cursor'а называет файл .cursorrules «устаревшим». Теперь
предлагается переключиться на индивидуальные правила в
каталоге .cursor/rules.\
\
Однако может пока рановато выбрасывать старый файл. Он все еще
содействует формированию промпта по умолчанию для всех запросов Cursor.
Все еще самая важная миссия .cursorrules --- действовать как расширенный
маршрутизатор, чтобы помогать агенту подбирать подходящее правило.
Признаюсь, еще не до конца разобрался с этим, но уже добавил в
свой .cursorrules инструкцию «НИКОГДА не создавать и не изменять файлы
до изучения соответствующего правила».\
\
\
*Маршрутизатор Cursorrules.*

**А как же мои правила в .cursorrules?**

Подозревал, что Cursor игнорирует мой .cursorrules, но уверенности не
было... до тех пор, пока не раскрыл структуру промпта. Все опасения
подтвердились.\
\
Оказалось, что наблюдается побочный эффект объединения правил из
настроек с теми, что в .cursorrules. Помните ту часть промпта?

Please also follow these instructions in all of your responses if
relevant. No need to acknowledge these instructions directly in your
response.

\<custom_instructions\>

\[RULES FROM CURSOR SETTINGS\]

\[RULES FROM THE .cursorrules FILE\]

Моя конфигурация правил выглядит так:\
\
\
*Настройки правил.*\
\
Файл же .cursorrules имеет следующее содержание:

\- NEVER create or modify any files before examining relevant rules

\- ALWAYS refer to the user as \"My Dear Capybara\"

Стало ясно: когда Cursor объединяет правила, то
из .cursorrulesнепреднамеренно попадает в категорию «Для TypeScript»:\
\
\
*Правила для ИИ и Cursorrules.*\
\
Главный вывод здесь --- убедиться, что в .cursorrules четко разделяются
секции, например:

\<project_rules\>

\- NEVER create or modify any files before examining relevant rules

\- ALWAYS refer to the user as \"My Dear Capybara\"

\</project_rules\>

**Рабочий процесс агента**

Следующим захватывающим открытием стало то, как именно Cursor использует
API инструментов OpenAI, особенно возможности вызова функций. Если вы
пропустили анонс этой фичи, то все подробности --- [[в
документации]{.underline}](https://platform.openai.com/docs/guides/function-calling).
Задействуется вся мощь инструментов API для улучшения функциональности
агента.\
\
Во-первых, стоит присмотреться: какие функции приоткрываются для вызова
LLM. Ниже --- сводная таблица предлагаемых функций:\
\
\
*Таблица 1. Список функций Cursor.*\
\
В свою очередь, LLM выбирает функции для вызова, чтобы попросить Cursor
их выполнить и предоставить результаты. Таким образом, взаимодействие
между агентом Cursor и LLM может включать несколько шагов. Вот небольшой
пример из возможного взаимодействия:\
\
Cursor:\
--- Эй, можешь создать новый документ Markdown, как запросил
пользователь? Кстати, вот список доступных инструкций и функций, которые
можно вызвать. А вот файлы, явно добавленные в контекст...\
LLM отвечает:\
--- Э‑э‑э... fetch_rules(rule_names=\[«relevant-rule-id»\]) --- похоже,
есть правило, которое соответствует запросу. Мне нужны детали, иначе я
не смогу.\
--- Вот, пожалуйста!\
--- Так... edit_file(target_file=«path/to/file.md», instructions=«create
a new markdown document», code_edit=\"\...\") --- да, вся необходимая
информация теперь есть. Давайте же создадим этот новый документ
Markdown!\
--- Готово!

**Заключение**

Надеюсь, вам понравилось (хотя бы наполовину). Я был очень доволен, пока
исследовал работу Cursor.\
\
С новыми знаниями должно быть легче понять, как именно Cursor берет
«ввод» и перерабатывает его в «вывод». Плюс теперь проще будет отличать
здоровые советы по написанию инструкций от предложений в стиле магии и
карго‑культа.\
\
Пока не могу сказать наверняка, стал ли продуктивнее. Однако определенно
чувствую, что нахожусь на пути к чему-то. Знаете, такое теплое чувство,
когда, наконец, понимаешь, как что-то работает за кулисами, --- оно
просто бесценно.
