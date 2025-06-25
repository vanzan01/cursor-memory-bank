# PSEUDOCODE Language Specification

This document defines the syntax and common constructs of the PSEUDOCODE language used for abstracting platform-specific operations and logic within the Memory Bank system.

## 1. Core Principles
-   **Platform Agnostic**: PSEUDOCODE should not contain references to specific programming languages, frameworks, or operating systems.
-   **Clarity and Readability**: Operations should be described in a clear, human-readable manner.
-   **Consistency**: Adhere to the defined syntax for all commands and structures.

## 2. Basic Syntax
-   All PSEUDOCODE blocks start with `PSEUDOCODE` keyword.
-   Commands are typically expressed as `CALL PSEUDOCODE:FUNCTION_NAME(parameter: value, ...)`.
-   Variables are declared using `DECLARE variable_name = value`.
-   Comments start with `//`.

## 3. Data Types
-   **BOOLEAN**: `TRUE`, `FALSE`
-   **NUMBER**: Integers and floating-point numbers.
-   **STRING**: Text enclosed in double quotes (e.g., `"hello"`).
-   **LIST**: Ordered collection of items (e.g., `[item1, item2]`).
-   **NULL**: Represents the absence of a value.
-   **OBJECT**: Key-value pairs (e.g., `{ key: value }`).

## 4. Variables and Assignment
```
PSEUDOCODE
DECLARE my_variable = "initial value"
DECLARE count = 0
DECLARE is_active = TRUE
```

## 5. Function Definition and Calls
Functions can be defined with parameters and a body.
`CALL` is used to execute a function.

```
PSEUDOCODE
CALL PSEUDOCODE:DEFINE_FUNCTION(name: "my_function", parameters: ["param1", "param2"], body: () => {
  // Function body
  CALL PSEUDOCODE:LOG_MESSAGE(message: PSEUDOCODE:GET_VARIABLE(name: "param1"))
})

CALL PSEUDOCODE:my_function(param1: "Hello", param2: 123)
```

## 6. Control Flow
### IF-THEN-ELSE
```
PSEUDOCODE
IF condition THEN
  // code if true
ELSE IF another_condition THEN
  // code if another_condition is true
ELSE
  // code if false
END IF
```

### LOOPS
#### FOR_EACH_ITEM
```
PSEUDOCODE
FOR_EACH_ITEM(item: "element", collection: my_list) DO
  // process element
END_FOR_EACH
```

#### WHILE_LOOP
```
PSEUDOCODE
CALL PSEUDOCODE:WHILE_LOOP(condition: some_condition, body: () => {
  // loop body
})
```

## 7. Operators
-   **Logical**: `AND_OPERATOR`, `NOT_OPERATOR`
-   **Comparison**: `IS_EQUAL`, `IS_NOT_EQUAL`, `GREATER_THAN`, `LESS_THAN`
-   **Mathematical**: `ADD_NUMBERS`, `SUBTRACT_NUMBERS`, `MULTIPLY_NUMBERS`, `CALCULATE_PERCENTAGE`, `CALCULATE_TIME_DIFFERENCE`

## 8. Common Modules and Functions

PSEUDOCODE functions are often grouped into logical modules.

### System Module (`PSEUDOCODE.System`)
-   `PSEUDOCODE.System.LOG_MESSAGE(message: string)`: Logs a message.
-   `PSEUDOCODE.System.LOG_ERROR(message: string)`: Logs an error message.
-   `PSEUDOCODE.System.LOG_WARNING(message: string)`: Logs a warning message.
-   `PSEUDOCODE.System.LOG_ALERT(message: string)`: Logs an alert message.
-   `PSEUDOCODE.System.LOG_HEADER(message: string)`: Logs a header message.
-   `PSEUDOCODE.System.EXIT(exit_code: number)`: Exits the system with a given code.
-   `PSEUDOCODE.System.SLEEP(seconds: number)`: Pauses execution for a specified duration.
-   `PSEUDOCODE.System.GET_VARIABLE(name: string)`: Retrieves the value of a variable.
-   `PSEUDOCODE.System.DEFINE_FUNCTION(name: string, parameters: LIST, body: FUNCTION)`: Defines a new function.
-   `PSEUDOCODE.System.CALL_FUNCTION(function_name: string)`: Calls a previously defined function.
-   `PSEUDOCODE.System.RUN_SCRIPT(script_name: string)`: Executes an external script.
-   `PSEUDOCODE.System.GET_LAST_COMMAND_EXIT_CODE()`: Retrieves the exit code of the last executed command.
-   `PSEUDOCODE.System.RUN_COMMAND(command: string)`: Executes a general system command.
-   `PSEUDOCODE.System.RUN_COMMAND_WITH_TIMEOUT(command: string, timeout_duration: NUMBER)`: Executes a command with a specified timeout duration. Returns an object with `exitCode`.
-   `PSEUDOCODE.System.RUN_COMMAND_IN_BACKGROUND(command: string)`: Executes a command in the background. Returns an object with `pid`.
-   `PSEUDOCODE.System.CHECK_URL_AVAILABILITY(url: string)`: Checks if a given URL is available. Returns `TRUE` or `FALSE`.
-   `PSEUDOCODE.System.KILL_PROCESS(pid: NUMBER)`: Kills a process given its PID.
-   `PSEUDOCODE.System.EXECUTE_COMMAND_AND_LOG(command: string, output_file: string)`: Executes a command and logs its output.
-   `PSEUDOCODE.System.GET_USER_PROMPT()`: Retrieves the user's last prompt or input.
-   `PSEUDOCODE.System.GET_ACTIVE_TASK_CONTEXT_PATH()`: Retrieves the path to the active task's context file.
-   `PSEUDOCODE.System.GET_OS_TYPE()`: Returns the operating system type (e.g., "Windows", "Linux", "macOS").
-   `PSEUDOCODE.System.GET_PROJECT_NAME()`: Retrieves the name of the current project.
-   `PSEUDOCODE.System.DISPLAY_REPORT(report_content: string)`: Displays a formatted report to the user.
-   `PSEUDOCODE.System.DISPLAY_FIX_INSTRUCTIONS(instructions: LIST)`: Displays a list of fix instructions to the user.
-   `PSEUDOCODE.System.PROMPT_USER(question: string)`: Prompts the user with a question and returns their response.
-   `PSEUDOCODE.System.PROMPT_ARCHIVE()`: Prompts the user to archive.
-   `PSEUDOCODE.System.GET_ACTIVE_TASK_NAME()`: Retrieves the name of the currently active task.
-   `PSEUDOCODE.System.GET_ACTIVE_TASK_ID()`: Retrieves the ID of the currently active task.
-   `PSEUDOCODE.System.RETURN(value: any)`: Returns a value from the current function.
-   `PSEUDOCODE.System.LOAD_TASKS()`: Loads a list of all tasks in the system. Returns a `LIST` of task objects.
-   `PSEUDOCODE.System.GET_ACTIVE_TASK()`: Retrieves the currently active task object. Returns an `OBJECT` representing the active task, or `NULL` if no task is active.

### File System Module (`PSEUDOCODE.File`)
-   `PSEUDOCODE.File.READ_FILE(path: string)`: Reads the content of a file.
-   `PSEUDOCODE.File.WRITE_TO_FILE(path: string, content: string)`: Writes content to a file.
-   `PSEUDOCODE.File.APPEND_TO_FILE(path: string, content: string)`: Appends content to a file.
-   `PSEUDOCODE.File.CREATE_DIRECTORY(path: string, recursive: BOOLEAN)`: Creates a directory.
-   `PSEUDOCODE.File.COPY_FILE(source_path: string, destination_path: string)`: Copies a file.
-   `PSEUDOCODE.File.MOVE_FILE(source: string, destination: string)`: Moves a file.
-   `PSEUDOCODE.File.FILE_EXISTS(path: string)`: Checks if a file exists.
-   `PSEUDOCODE.File.IS_DIRECTORY(path: string)`: Checks if a path points to an existing directory.
-   `PSEUDOCODE.File.IS_FILE_READABLE(path: string)`: Checks if a file is readable.
-   `PSEUDOCODE.File.DELETE_OLD_FILES(directory: string, pattern: string, days: number)`: Deletes files older than a specified number of days.
-   `PSEUDOCODE.File.LIST_FILES_SORTED_BY_MODIFIED_TIME(directory: string, limit: number)`: Lists files sorted by modification time.
-   `PSEUDOCODE.File.LIST_FILES_BY_PATTERN(directory: string, pattern: string)`: Lists files in a directory matching a glob pattern.
-   `PSEUDOCODE.File.GET_BASENAME(path: string)`: Returns the base name of a path.
-   `PSEUDOCODE.File.COUNT_PATTERN_IN_FILE(path: string, pattern: string)`: Counts occurrences of a pattern in a file.
-   `PSEUDOCODE.File.SEARCH_FILE(path: string, pattern: string, limit: number)`: Searches a file for a pattern.
-   `PSEUDOCODE.File.READ_LAST_LINES(path: string, num_lines: number)`: Reads the last N lines of a file.
-   `PSEUDOCODE.File.REPLACE_LINE(file_path: string, line_number: number, new_content: string)`: Replaces a specific line in a file.
-   `PSEUDOCODE.File.INSERT_LINE(file_path: string, line_number: number, content: string)`: Inserts a line into a file.
-   `PSEUDOCODE.File.UPDATE_MARKDOWN_SECTION(file_path: string, section: string, key: string, value: string)`: Updates a markdown section.
-   `PSEUDOCODE.File.APPEND_TO_END_OF_FILE(file_path: string, content: string)`: Appends content to the end of a file.
-   `PSEUDOCODE.File.READ(path: string)`: Reads the entire content of a file.
-   `PSEUDOCODE.File.EXTRACT_LINES_BETWEEN_PATTERNS(text: string, start_pattern: string, end_pattern: string)`: Extracts lines between two patterns.
-   `PSEUDOCODE.File.IS_FILE_EMPTY(path: string)`: Checks if a file is empty.
-   `PSEUDOCODE.File.COUNT_LINES(path: string)`: Counts the number of lines in a file.
-   `PSEUDOCODE.File.SEARCH_FILE_FOR_PATTERN(path: string, pattern: string)`: Searches a file for a pattern and returns the count of matches.
-   `PSEUDOCODE.File.DIRECTORY_EXISTS(path: string)`: Checks if a directory exists at the given path.
-   `PSEUDOCODE.File.CREATE_FILE(path: string, content: string)`: Creates a file with the specified content. If content is empty, an empty file is created.
-   `PSEUDOCODE.File.EXTRACT_SECTION_CONTENT(file_content: string, section_name: string)`: Extracts content from a named section within a file's content.
-   `PSEUDOCODE.File.REPLACE_SECTION(file_content: string, section_name: string, new_content: string)`: Replaces the content of a named section within a file's content.
-   `PSEUDOCODE.File.PREPEND_TO_SECTION(file_content: string, section_name: string, content_to_prepend: string)`: Prepends content to a named section within a file's content.
-   `PSEUDOCODE.File.CREATE_FILES_BATCH(paths: LIST)`: Creates multiple files at the specified paths.
-   `PSEUDOCODE.File.CREATE_DIRECTORIES_BATCH(paths: LIST)`: Creates multiple directories at the specified paths, recursively if needed.
-   `PSEUDOCODE.File.SET_CONTENT(path: string, content: string)`: Sets the content of a file.
-   `PSEUDOCODE.File.LIST_FILES(directory: string, recursive: BOOLEAN, filter_by_modified_time_days: number)`: Lists files in a directory, optionally recursively and filtered by modification time.
-   `PSEUDOCODE.File.SEARCH_FILE_CONTENT(path: string, pattern: string, options: OBJECT)`: Searches for a pattern within the content of a file with given options (e.g., case_sensitive, regex).
-   `PSEUDOCODE.File.UPDATE_FILE(target: string)`: Updates the content of a specified file.
-   `PSEUDOCODE.File.CHECK_FILE_HAS_CONTENT(path: string)`: Checks if a file at the given path has content.
-   `PSEUDOCODE.File.CHECK_REFLECTION_COMPLETE(path: string)`: Checks if the reflection in a file is complete.
-   `PSEUDOCODE.File.CHECK_FILE_EXISTS(path: string)`: Checks if a file exists at the given path.
-   `PSEUDOCODE.File.MOVE_DIRECTORY(source_path: string, destination_path: string)`: Moves a directory from source to destination.
-   `PSEUDOCODE.File.GET_ARCHIVE_DOCUMENT_PATH()`: Returns the path to the archive document.
-   `PSEUDOCODE.File.GET_ARCHIVE_TARGET_DIRECTORY()`: Returns the target directory for archived tasks.
-   `PSEUDOCODE.File.GET_REFLECTION_DOCUMENT_PATH()`: Returns the path to the reflection document.
-   `PSEUDOCODE.File.GET_ACTIVE_CONTEXT_PATH()`: Returns the path to the active context file.
-   `PSEUDOCODE.File.VERIFY_FILES_CREATED(file_list: LIST)`: Verifies that specified files have been created.
-   `PSEUDOCODE.File.FIX_FILE_PATHS(file_list: LIST)`: Fixes paths or recreates files in a given list.
-   `PSEUDOCODE.File.GET_ACTIVE_TASK_FILE_PATH(file_name: string)`: Returns the full path to a file within the active task directory.
-   `PSEUDOCODE.File.GET_LAST_MODIFIED_TIMESTAMP(path: string)`: Returns the last modification timestamp of a file.
-   `PSEUDOCODE.File.DOCUMENT_FILE_PATHS(file_paths: LIST, document_path: string)`: Documents a list of file paths in a specified document.
-   `PSEUDOCODE.File.GET_SCRIPT_PATH(script_name: string)`: Returns the full path to a dynamically generated script within the `memory-bank/scripts/` directory.
-   `PSEUDOCODE.File.GET_TASK_ARTIFACT_PATH(file_name: string)`: Returns the full path to a task artifact file.
-   `PSEUDOCODE.File.ENSURE_DIRECTORY_EXISTS(path: string)`: Ensures that a directory exists.
-   `PSEUDOCODE.File.PARENT_OF(path: string)`: Returns the parent directory of a given path.
-   `PSEUDOCODE.File.SET_ACTIVE_TASK_FILE_PATH(file_name: string)`: Sets the active task file path.
-   `PSEUDOCODE.File.RECHECK_FILE_EXISTS_AFTER_CORRECTION()`: Rechecks file existence after path correction.

### String Module (`PSEUDOCODE.String`)
-   `PSEUDOCODE.String.CONCATENATE(string1: string, string2: string, ...)`: Concatenates strings.
-   `PSEUDOCODE.String.CONCATENATE_STRINGS(string1: string, string2: string, ...)`: Concatenates strings.
-   `PSEUDOCODE.String.TRIM_STRING(string: string)`: Removes leading/trailing whitespace.
-   `PSEUDOCODE.String.SPLIT_STRING_BY_NEWLINE(text: string)`: Splits a multiline string into a list of strings, based on newline characters.
-   `PSEUDOCODE.String.EXTRACT_SUBSTRING_AFTER_PATTERN(string: string, pattern: string)`: Extracts substring after a pattern.
-   `PSEUDOCODE.String.REPLACE_STRING(text: string, old_substring: string, new_substring: string)`: Replaces all occurrences of a substring.
-   `PSEUDOCODE.String.TO_LOWER_CASE(text: string)`: Converts a string to its lowercase equivalent.
-   `PSEUDOCODE.String.SPLIT_STRING(text: string, delimiter: string)`: Splits a string into a list of substrings using a specified delimiter.
-   `PSEUDOCODE.String.MULTILINE_STRING(content: string)`: Defines a multiline string.
-   `PSEUDOCODE.String.FORMAT(string: string, ...args)`: Formats a string with arguments.
-   `PSEUDOCODE.String.INCLUDES_ANY(text: string, patterns: LIST)`: Checks if a string contains any of the provided patterns.
-   `PSEUDOCODE.String.CREATE_REGEX(pattern: string, flags: string)`: Creates a regex pattern.
-   `PSEUDOCODE.String.REPLACE_REGEX(text: string, pattern: string, replacement: string)`: Replaces all occurrences of a pattern in a string using regex.
-   `PSEUDOCODE.String.CONTAINS_ANY_CASE(text: string, patterns: LIST)`: Checks if a string contains any of the provided patterns, case-insensitively.
-   `PSEUDOCODE.String.COUNT_OCCURRENCES_OF_PATTERN(text: string, pattern: string, case_sensitive: BOOLEAN)`: Counts the number of times a pattern appears in a string.
-   `PSEUDOCODE.String.IS_STRING(value: ANY)`: Checks if the given value is a string.
-   `PSEUDOCODE.String.EXTRACT_DATE_FROM_DATETIME(datetime: string)`: Extracts date from a datetime string.

### Git Module (`PSEUDOCODE.Git`)
-   `PSEUDOCODE.Git.GIT_COMMAND(action: string, ...parameters)`: Executes a Git command.
-   `PSEUDOCODE.Git.GIT_BRANCH_EXISTS(branch_name: string)`: Checks if a Git branch exists.
-   `PSEUDOCODE.Git.GIT_LOG_CONTAINS(keyword: string, limit: number)`: Checks Git log for a keyword.
-   `PSEUDOCODE.Git.GIT_GET_LAST_COMMIT_TIMESTAMP(keyword: string)`: Gets timestamp of last commit with a keyword.
-   `PSEUDOCODE.Git.GET_UNCOMMITTED_FILE_COUNT()`: Gets the count of uncommitted files.

### Date/Time Module (`PSEUDOCODE.DateTime`)
-   `PSEUDOCODE.DateTime.GET_CURRENT_DATE_TIME()`: Gets current date and time.
-   `PSEUDOCODE.DateTime.GET_CURRENT_DATE(format: string)`: Gets current date with specific format.
-   `PSEUDOCODE.DateTime.GET_CURRENT_TIMESTAMP()`: Gets current timestamp.
-   `PSEUDOCODE.DateTime.DATE_TIME_GET_CURRENT_TIMESTAMP()`: Gets current timestamp.
-   `PSEUDOCODE.DateTime.DATE_TIME_FORMAT_TIMESTAMP(timestamp: number)`: Formats timestamp to string.
-   `PSEUDOCODE.DateTime.GET_FORMATTED_DATE_TIME(format: string)`: Gets formatted date and time.
-   `PSEUDOCODE.DateTime.CALCULATE_TIME_DIFFERENCE(start: number, end: number)`: Calculates time difference.

### Math Module (`PSEUDOCODE.Math`)
-   `PSEUDOCODE.Math.ADD_NUMBERS(value1: number, value2: number, ...)`: Adds numbers.
-   `PSEUDOCODE.Math.SUBTRACT_NUMBERS(value1: number, value2: number)`: Subtracts numbers.
-   `PSEUDOCODE.Math.MULTIPLY_NUMBERS(value1: number, value2: number)`: Multiplies numbers.
-   `PSEUDOCODE.Math.TO_NUMBER(value: any)`: Converts a value to a number.
-   `PSEUDOCODE.Math.CALCULATE_PERCENTAGE(numerator: number, denominator: number, decimal_places: number)`: Calculates percentage (e.g., `CALCULATE_PERCENTAGE(50, 100, 2)` returns `50.00`).
-   `PSEUDOCODE.Math.TO_FIXED(value: NUMBER, decimal_places: NUMBER)`: Formats a number to a specified number of decimal places.
-   `PSEUDOCODE.Math.GREATER_THAN(value1: number, value2: number)`: Checks if value1 is greater than value2.
-   `PSEUDOCODE.List.SLICE_LIST(list: LIST, start: NUMBER, end: NUMBER)`: Returns a new list containing elements from start (inclusive) to end (exclusive).

### List/Collection Module (`PSEUDOCODE.List`)
-   `PSEUDOCODE.List.ADD_TO_LIST(list_name: LIST, item: any)`: Adds an item to a list.
-   `PSEUDOCODE.List.MERGE(target_list: LIST, source_list: LIST)`: Merges all elements from `source_list` into `target_list`.
-   `PSEUDOCODE.List.SLICE_LIST(list_name: LIST, start: number, end: number)`: Slices a list.
-   `PSEUDOCODE.List.SORT_LIST(list_name: LIST, key: number, reverse: BOOLEAN)`: Sorts a list.
-   `PSEUDOCODE.List.CONTAINS_ELEMENT(collection: LIST, element: any)`: Checks if a collection contains an element.
-   `PSEUDOCODE.List.IS_NOT_EMPTY(value: any)`: Checks if a value is not empty.
-   `PSEUDOCODE.List.FOR_EACH_ITEM(item: string, collection: LIST, body: FUNCTION)`: Iterates over each item in a collection.
-   `PSEUDOCODE.List.KEYS(object: OBJECT)`: Returns a list of keys from an object.
-   `PSEUDOCODE.List.GET_VALUE(object: OBJECT, key: string)`: Retrieves the value associated with a key from an object.
-   `PSEUDOCODE.List.SET_VALUE(object: OBJECT, key: string, value: any)`: Sets the value associated with a key in an object.
-   `PSEUDOCODE.List.GET_LENGTH(list: LIST)`: Returns the number of elements in a list.
-   `PSEUDOCODE.List.GET_FIRST_ELEMENT(list: LIST)`: Returns the first element of a list.
-   `PSEUDOCODE.List.FILTER(collection: LIST, predicate: FUNCTION)`: Filters elements from a collection based on a given predicate function.
-   `PSEUDOCODE.List.IS_LIST(value: ANY)`: Checks if the given value is a list.
-   `PSEUDOCODE.List.ALL_TRUE(boolean_list: LIST)`: Returns TRUE if all boolean values in the list are TRUE, otherwise FALSE.
-   `PSEUDOCODE.List.MAP(collection: LIST, transform_function: FUNCTION)`: Applies a transform function to each element in a collection and returns a new list of the results.
-   `PSEUDOCODE.List.SLICE_LIST(list: LIST, start: NUMBER, end: NUMBER)`: Returns a new list containing elements from start (inclusive) to end (exclusive).

### Testing Module (`PSEUDOCODE.Test`)
-   `PSEUDOCODE.Test.RUN_TEST(type: string, test_name: string, callback: FUNCTION)`: Runs a test.
-   `PSEUDOCODE.Test.ASSERT_LESS_THAN(actual: number, expected: number)`: Asserts actual is less than expected.
-   `PSEUDOCODE.Test.ENABLE_MOCKING_SYSTEM(framework: string)`: Enables mocking system.
-   `PSEUDOCODE.Test.ENABLE_SNAPSHOT_TESTING(framework: string)`: Enables snapshot testing.
-   `PSEUDOCODE.Test.MOCK_MODULE(path: string, function: string, result: OBJECT)`: Mocks a module function.
-   `PSEUDOCODE.Test.RENDER_COMPONENT()`: Renders a component.
-   `PSEUDOCODE.Test.ASSERT_MATCH_SNAPSHOT(value: any)`: Asserts value matches snapshot.
-   `PSEUDOCODE.Test.DEFINE_TEST_CASE(name: string, body: FUNCTION)`: Defines a test case.
-   `PSEUDOCODE.Test.EXECUTE_OPERATION(type: string)`: Executes a generic operation.
-   `PSEUDOCODE.Test.RUN_TESTS(type: string, framework: string, directory: string)`: Runs tests.
-   `PSEUDOCODE.Test.RUN_BENCHMARKS(type: string, features: string)`: Runs benchmarks.
-   `PSEUDOCODE.Test.ANALYZE_TEST_RESULTS(criteria: string)`: Analyzes test results.
-   `PSEUDOCODE.Test.GENERATE_REPORT(type: string)`: Generates a report.
-   `PSEUDOCODE.Test.RUN_UNIT_TEST(test_file: string, test_case: string)`: Runs a unit test.
-   `PSEUDOCODE.Test.RUN_SMOKE_TESTS()`: Runs smoke tests.
-   `PSEUDOCODE.Test.RUN_INTEGRATION_TEST(test_file: string, test_case: string)`: Runs integration tests.
-   `PSEUDOCODE.Test.RUN_E2E_TEST(test_file: string)`: Runs end-to-end tests.
-   `PSEUDOCODE.Test.RUN_QA_CHECKS(context: OBJECT)`: Runs a suite of QA checks based on the provided context.
-   `PSEUDOCODE.Test.TEST_FIX(fix_id: string)`: Tests a specific fix.
-   `PSEUDOCODE.Test.VALIDATE_NO_REGRESSION()`: Validates that no regressions have been introduced.
-   `PSEUDOCODE.Test.TEST_CHANGES(changes_details: string)`: Tests implemented changes.
-   `PSEUDOCODE.Test.CHECK_COVERAGE(coverage_type: string)`: Checks code coverage.
-   `PSEUDOCODE.Test.TEST_PHASE(phase_number: number)`: Tests a specific build phase.
-   `PSEUDOCODE.Test.CHECK_COVERAGE_AND_PERFORMANCE(coverage_type: string, performance_metric: string)`: Checks code coverage and performance metrics.

### Workflow Module (`PSEUDOCODE.Mode`)
-   `PSEUDOCODE.Mode.SUGGEST_TRANSITION(mode: string)`: Suggests a mode transition.
-   `PSEUDOCODE.Mode.GET_CURRENT_MODE()`: Gets the current mode.
-   `PSEUDOCODE.Mode.CONTINUE_CURRENT_PHASE_WORK()`: Indicates that the current phase of work can proceed.
-   `PSEUDOCODE.Mode.RETURN_TO_MODE(mode: string)`: Returns the system to a specified operational mode.
-   `PSEUDOCODE.Mode.TRANSITION_TO_MODE(mode: string)`: Transitions the system to a specified operational mode.
-   `PSEUDOCODE.Mode.SWITCH_TO_MODEL(target_model: STRING)`: Switches the active AI model to the specified model.

### Search/Analysis Module (`PSEUDOCODE.Search`)
-   `PSEUDOCODE.Search.SEARCH_ARCHIVE(query: string, filters: OBJECT)`: Searches the archive.
-   `PSEUDOCODE.Search.COUNT_PATTERN(text: string, pattern: string)`: Counts patterns in text.
-   `PSEUDOCODE.Search.MATCH_REGEX(text: string, pattern: string)`: Matches regex in text.
-   `PSEUDOCODE.Search.EXTRACT_AFTER_PATTERN(text: string, pattern: string)`: Extracts text after a pattern.

### Environment Module (`PSEUDOCODE.Environment`)
-   `PSEUDOCODE.Environment.ENVIRONMENT_CHECK(runtime: string, status: string)`: Checks environment status.

### Custom Workflow Functions (to be defined/abstracted)
-   `EXTRACT_AND_COUNT_TEST_GROUPS`
-   `EXTRACT_AND_COUNT_TEST_GROUPS_TOP5`
-   `GET_MOST_COMMON_PATTERN`
-   `EXTRACT_VALUE_FROM_LOG`
-   `GET_MEMORY_USAGE`
-   `GET_MEMORY_METRIC`
-   `PERFORM_OPERATION`
-   `CHECK_ALL_TRUE`
-   `CREATE_ARCHIVE`
-   `EXTRACT_ARCHIVE`
-   `GET_PATTERN_CONTEXT`
-   `GET_IMPLEMENTATION_SUCCESS_RATE`
-   `ASSESS_COMPLEXITY_MATCH`
-   `GET_CONTEXT_COMPLEXITY`
-   `GET_PATTERN_COMPLEXITY`
-   `GET_PATTERN_TITLE`
-   `GET_WARNING_DESCRIPTION`
-   `TRIM_STRING` (already in String module, but seen as standalone)
-   `READ_LAST_LINES` (already in File module, but seen as standalone)
-   `TAIL`
-   `EQUALS`
-   `WRITE_LINE` (similar to LOG_MESSAGE)
-   `IS_GREATER_THAN` (similar to GREATER_THAN)
-   `EXTRACT_TASK_DEPENDENCIES`
-   `CALCULATE_HASH`
-   `IS_NOT_EMPTY` (already in List module, but seen as standalone)
-   `PSEUDOCODE.Task.GET_TASK_STATUS()`: Retrieves the completion status of the current task.
-   `PSEUDOCODE.Task.GET_SUBTASK_STATUS()`: Retrieves the completion status of subtasks within the current task.
-   `PSEUDOCODE.Task.REVIEW_ENHANCEMENT()`: Reviews an enhancement task.
-   `PSEUDOCODE.Task.REVIEW_IMPLEMENTATION_AND_CREATIVE_PHASES()`: Reviews the implementation and creative phases of a task.
-   `PSEUDOCODE.Task.MARK_COMPLETE(task_id: string)`: Marks a task as complete.
-   `PSEUDOCODE.Task.NOTIFY_USER_TASK_COMPLETE(task_id: string, archive_path: string)`: Notifies the user that a task is complete and provides the archive path.

### Quality Module (`PSEUDOCODE.Quality`)
-   `PSEUDOCODE.Quality.ASSESS_QUALITY()`: Performs a quality assessment.

### Refactoring Module (`PSEUDOCODE.Refactoring`)
-   `PSEUDOCODE.Refactoring.DETERMINE_REFACTORING_NEEDED()`: Determines if refactoring is needed based on quality metrics.
-   `PSEUDOCODE.Refactoring.ANALYZE_PATTERNS()`: Analyzes code for refactoring patterns.
-   `PSEUDOCODE.Refactoring.PERFORM_GRADUAL_REFACTORING()`: Executes gradual refactoring steps.
-   `PSEUDOCODE.Refactoring.ENSURE_LEGACY_SUPPORT()`: Ensures compatibility with legacy systems during refactoring.
-   `PSEUDOCODE.Refactoring.CHECK_BACKWARD_COMPATIBILITY()`: Checks for backward compatibility after refactoring.

### Documentation Module (`PSEUDOCODE.Documentation`)
-   `PSEUDOCODE.Documentation.GENERATE_REPORT(data: OBJECT)`: Generates a formatted report from provided data.
-   `PSEUDOCODE.Documentation.DOCUMENT_WHAT_WENT_WELL()`: Documents successful aspects of an implementation.
-   `PSEUDOCODE.Documentation.DOCUMENT_CHALLENGES()`: Documents challenges encountered during an implementation.
-   `PSEUDOCODE.Documentation.DOCUMENT_LESSONS_LEARNED()`: Documents key insights gained from an experience.
-   `PSEUDOCODE.Documentation.GENERATE_USAGE_EXAMPLES()`: Generates practical usage examples.
-   `PSEUDOCODE.Documentation.DOCUMENT_ARCHITECTURE()`: Documents the system architecture.
-   `PSEUDOCODE.Documentation.DOCUMENT_DATA_MODEL()`: Documents the data model.
-   `PSEUDOCODE.Documentation.RECORD_DECISION_ADR()`: Records a design decision using the Architecture Decision Record (ADR) format.
-   `PSEUDOCODE.Documentation.VERSION_CREATIVE_DOCUMENT()`: Assigns a version number to a creative document.
-   `PSEUDOCODE.Diagram.CREATE_ARCHITECTURE_DIAGRAM()`: Creates an architecture diagram.
-   `PSEUDOCODE.Documentation.READ_REFERENCE_DOCUMENTS(path: string)`: Reads reference documents from a specified path.
-   `PSEUDOCODE.Documentation.DOCUMENT_PHASE(phase_name: string, content: string)`: Documents a specific phase of work.
-   `PSEUDOCODE.Documentation.DOCUMENT_DEPENDENCIES(dependencies: LIST)`: Documents dependencies of components.
-   `PSEUDOCODE.Documentation.UPDATE_TASK_AND_DEBUG_TRACES(task_id: string, debug_traces: string)`: Updates the task document with debug traces.
-   `PSEUDOCODE.Documentation.UPDATE_TASK_AND_TEST_REPORTS(task_id: string, test_reports: string)`: Updates the task document with test reports.
-   `PSEUDOCODE.Documentation.UPDATE_TASK_AND_ALL_REPORTS(task_id: string, reports: OBJECT)`: Updates the task document with all generated reports.
-   `PSEUDOCODE.Documentation.UPDATE_TASK_STATUS(task_id: string, status: string)`: Updates the status of a task in its document.
-   `PSEUDOCODE.Documentation.GENERATE_BUILD_REPORT(component_feature: string, approach_description: string, directory_structure: string, code_changes: string, verification_steps: string, commands_executed: string, testing_results: string, status: string)`: Generates a build report.
-   `PSEUDOCODE.Documentation.SAVE_REPORT(report_content: string, target_directory: string)`: Saves a generated report to a target directory.

### Report Module (`PSEUDOCODE.Report`)
-   `PSEUDOCODE.Report.GENERATE_ADVANCED_REPORTS()`: Generates advanced reports for comprehensive analysis.
-   `PSEUDOCODE.Report.GENERATE_CREATIVE_ANALYSIS_REPORT()`: Generates a report specifically for creative analysis.

### Statistics Module (`PSEUDOCODE.Statistics`)
-   `PSEUDOCODE.Statistics.TRACK_AND_REPORT_STATISTICS()`: Tracks and reports various statistics.

### Review Module (`PSEUDOCODE.Review`)
-   `PSEUDOCODE.Review.REVIEW_ORIGINAL_REQUIREMENTS()`: Reviews the original task requirements.
-   `PSEUDOCODE.Review.COMPARE_AGAINST_PLAN()`: Compares the implementation against the original plan.
-   `PSEUDOCODE.Review.ASSESS_ACTUAL_IMPLEMENTATION()`: Assesses the actual implementation.
-   `PSEUDOCODE.Review.REVIEW_CREATIVE_PHASE_DECISIONS()`: Reviews decisions made during the creative phase.
-   `PSEUDOCODE.Review.IDENTIFY_DEVIATIONS_FROM_PLAN()`: Identifies any deviations from the plan.
-   `PSEUDOCODE.Review.EVALUATE_RESULTS()`: Evaluates the results of the implementation.
-   `PSEUDOCODE.Review.REVIEW_PLAN_AND_CREATIVE_DECISIONS()`: Reviews the plan and creative decisions.

### Reference Module (`PSEUDOCODE.Reference`)
-   `PSEUDOCODE.Reference.READ_RELEVANT_REFERENCES()`: Reads all relevant references for a task.
-   `PSEUDOCODE.Reference.VERIFY_REFERENCE_UNIQUENESS()`: Verifies the uniqueness of all references.
-   `PSEUDOCODE.Reference.CHECK_REFERENCE_INTEGRITY()`: Checks the integrity of all references.
-   `PSEUDOCODE.Reference.VALIDATE_AGAINST_SOURCE_MATERIAL()`: Validates references against source material.
-   `PSEUDOCODE.Reference.REPORT_DISCREPANCIES()`: Reports any discrepancies found in references.

### Task Module (`PSEUDOCODE.Task`)
-   `PSEUDOCODE.Task.VERIFY_PLAN_COMPLETE_AND_CREATIVE_PHASES_IDENTIFIED()`: Verifies if the plan is complete and creative phases are identified.
-   `PSEUDOCODE.Task.IDENTIFY_CREATIVE_PHASES_REQUIRED()`: Identifies the creative phases required for a task.
-   `PSEUDOCODE.Task.DETERMINE_COMPLEXITY_LEVEL()`: Determines the complexity level of the current task.

### Plan Module (`PSEUDOCODE.Plan`)
-   `PSEUDOCODE.Plan.GET_PLAN_STATUS()`: Retrieves the status of the current plan.

### Creative Module (`PSEUDOCODE.Creative`)
-   `PSEUDOCODE.Creative.ENTER_UI_UX_PHASE()`: Enters the UI/UX creative phase.
-   `PSEUDOCODE.Creative.ENTER_ARCHITECTURE_PHASE()`: Enters the architecture creative phase.
-   `PSEUDOCODE.Creative.ENTER_DATA_MODEL_PHASE()`: Enters the data model creative phase.
-   `PSEUDOCODE.Creative.ENTER_ALGORITHM_PHASE()`: Enters the algorithm creative phase.
-   `PSEUDOCODE.Creative.DEFINE_UI_UX_PROBLEM()`: Defines the UI/UX problem.
-   `PSEUDOCODE.Creative.RESEARCH_UI_PATTERNS()`: Researches UI patterns.
-   `PSEUDOCODE.Creative.EXPLORE_UI_OPTIONS()`: Explores UI options.
-   `PSEUDOCODE.Creative.EVALUATE_USER_EXPERIENCE()`: Evaluates user experience.
-   `PSEUDOCODE.Creative.MAKE_DESIGN_DECISION()`: Makes a design decision.
-   `PSEUDOCODE.Creative.DEFINE_ARCHITECTURE_CHALLENGE()`: Defines an architecture challenge.
-   `PSEUDOCODE.Creative.EXPLORE_ARCHITECTURE_OPTIONS()`: Explores architecture options.
-   `PSEUDOCODE.Creative.ANALYZE_ARCHITECTURAL_TRADEOFFS()`: Analyzes architectural tradeoffs.
-   `PSEUDOCODE.Creative.MAKE_ARCHITECTURE_DECISION()`: Makes an architecture decision.
-   `PSEUDOCODE.Creative.ARE_CREATIVE_PHASE_DOCUMENTS_COMPLETE()`: Checks if creative phase documents are complete.
-   `PSEUDOCODE.Creative.CAPTURE_CREATIVE_RESULTS(phase_name: string, results: OBJECT)`: Captures and documents the results of a creative phase.
-   `PSEUDOCODE.Creative.ARE_CREATIVE_PHASES_REQUIRED()`: Checks if creative phases are required for the task.

### Data Model Module (`PSEUDOCODE.DataModel`)
-   `PSEUDOCODE.DataModel.DEFINE_DATA_REQUIREMENTS()`: Defines data requirements for a data model.
-   `PSEUDOCODE.DataModel.DESIGN_DATA_STRUCTURE()`: Designs the structure of a data model.
-   `PSEUDOCODE.DataModel.DEFINE_RELATIONSHIPS()`: Defines relationships within a data model.
-   `PSEUDOCODE.DataModel.DESIGN_VALIDATION()`: Designs validation rules for a data model.

### Algorithm Module (`PSEUDOCODE.Algorithm`)
-   `PSEUDOCODE.Algorithm.DEFINE_PROBLEM()`: Defines an algorithm problem.
-   `PSEUDOCODE.Algorithm.EXPLORE_APPROACHES()`: Explores different approaches for an algorithm.
-   `PSEUDOCODE.Algorithm.EVALUATE_COMPLEXITY()`: Evaluates the time and space complexity of an algorithm.
-   `PSEUDOCODE.Algorithm.MAKE_DECISION()`: Makes a decision on the algorithm to be used.
-   `PSEUDOCODE.Documentation.DOCUMENT_ALGORITHM()`: Documents an algorithm.

### Diagram Module (`PSEUDOCODE.Diagram`)
-   `PSEUDOCODE.Diagram.CREATE_ARCHITECTURE_DIAGRAM()`: Creates an architecture diagram.

### Archive Module (`PSEUDOCODE.Archive`)
-   `PSEUDOCODE.Archive.CREATE_PARTIAL_ARCHIVE(archive_type: string)`: Creates a partial archive for the current task.
-   `PSEUDOCODE.Archive.PERFORM_ARCHIVING_LEVEL(level: number)`: Performs archiving based on the specified level.
-   `PSEUDOCODE.Archive.CREATE_SUMMARY(summary_content: string)`: Creates a summary for the archive document.
-   `PSEUDOCODE.Archive.DOCUMENT_CHANGES(changes_content: string)`: Documents changes within the archive document.
-   `PSEUDOCODE.Archive.CREATE_DOCUMENT_HEADER(task_name: string)`: Creates the header for the archive document.
-   `PSEUDOCODE.Archive.ADD_METADATA(metadata: OBJECT)`: Adds metadata to the archive document.
-   `PSEUDOCODE.Archive.ADD_SUMMARY(summary_content: string)`: Adds a summary to the archive document.
-   `PSEUDOCODE.Archive.ADD_REQUIREMENTS(requirements: LIST)`: Adds requirements to the archive document.
-   `PSEUDOCODE.Archive.ADD_IMPLEMENTATION_DETAILS(details: string)`: Adds implementation details to the archive document.
-   `PSEUDOCODE.Archive.ADD_TESTING_DETAILS(details: string)`: Adds testing details to the archive document.
-   `PSEUDOCODE.Archive.ADD_LESSONS_LEARNED(lessons: LIST)`: Adds lessons learned to the archive document.
-   `PSEUDOCODE.Archive.ADD_REFERENCES(references: LIST)`: Adds references to the archive document.
-   `PSEUDOCODE.Archive.DOCUMENT_IMPLEMENTATION(implementation_content: string)`: Documents the implementation details in the archive.
-   `PSEUDOCODE.Archive.LINK_CREATIVE_PHASE_DOCS(docs_list: LIST)`: Links creative phase documents in the archive.
-   `PSEUDOCODE.Archive.DOCUMENT_CODE_CHANGES(code_changes: string)`: Documents code changes in the archive.
-   `PSEUDOCODE.Archive.DOCUMENT_TESTING(testing_details: string)`: Documents testing details in the archive.
-   `PSEUDOCODE.Archive.SUMMARIZE_LESSONS_LEARNED(lessons_content: string)`: Summarizes lessons learned in the archive.
-   `PSEUDOCODE.Archive.ARCHIVE_MIGRATION_FILE(file_path: string, destination_path: string)`: Archives a migration file.
-   `PSEUDOCODE.Archive.MOVE_TASK_DIRECTORY_TO_DONE(directory_path: string)`: Moves the active task directory to the 'done' folder.
-   `PSEUDOCODE.Archive.ARE_CREATIVE_DOCS_ARCHIVED()`: Checks if creative phase documents are archived.

### Migration Module (`PSEUDOCODE.Migration`)
// ... existing code ...

## 9. Neutralizing Bun-Specific References
-   Replace `

### Object Module (`PSEUDOCODE.Object`)
-   `PSEUDOCODE.Object.GET_PROPERTY(object: OBJECT, property_name: STRING)`: Retrieves the value of a specified property from an object.
-   `PSEUDOCODE.Object.CREATE(key: string, value: any)`: Creates a new object with an initial key-value pair.

### Rule Module (`PSEUDOCODE.Rule`)
-   `PSEUDOCODE.Rule.FETCH_RULES(rule_path: string)`: Fetches rules from a specified path.

### Directory Module (`PSEUDOCODE.Directory`)
-   `PSEUDOCODE.Directory.SET_ACTIVE_TASK_PATH(path: string)`: Sets the active task directory path.
-   `PSEUDOCODE.Directory.GET_ACTIVE_TASK_PATH()`: Retrieves the path to the active task directory.
-   `PSEUDOCODE.Directory.CREATE_STRUCTURE(structure_definition: string)`: Creates a directory structure.
-   `PSEUDOCODE.Directory.VERIFY_STRUCTURE(structure_definition: string)`: Verifies if a directory structure exists.
-   `PSEUDOCODE.Directory.DOCUMENT_STRUCTURE(structure_details: string)`: Documents a directory structure.
-   `PSEUDOCODE.Directory.FIX_STRUCTURE(structure_definition: string)`: Fixes a directory structure.

### Quality Module (`PSEUDOCODE.Quality`)
-   `PSEUDOCODE.File.CHECK_PATH_RESOLUTION_ISSUES()`: Checks for path resolution issues. Returns `TRUE` or `FALSE`.
-   `PSEUDOCODE.File.RECHECK_FILE_EXISTS_AFTER_CORRECTION()`: Rechecks file existence after path correction.

### Implementation Module (`PSEUDOCODE.Implementation`)
-   `PSEUDOCODE.Implementation.PERFORM_LEVEL_1_PROCESS()`: Performs Level 1 implementation process.
-   `PSEUDOCODE.Implementation.PERFORM_LEVEL_2_PROCESS()`: Performs Level 2 implementation process.
-   `PSEUDOCODE.Implementation.PERFORM_LEVEL_3_4_PROCESS()`: Performs Level 3-4 implementation process.
-   `PSEUDOCODE.Implementation.BUILD_PHASE()`: Executes a build phase.
-   `PSEUDOCODE.Implementation.BUILD_PHASE_1()`: Executes build phase 1.

### BugFix Module (`PSEUDOCODE.BugFix`)
-   `PSEUDOCODE.BugFix.REVIEW_BUG_REPORT()`: Reviews a bug report.

### Debug Module (`PSEUDOCODE.Debug`)
-   `PSEUDOCODE.Debug.COLLECT_TRACE()`: Collects debug traces.

### Code Module (`PSEUDOCODE.Code`)
-   `PSEUDOCODE.Code.EXAMINE_CODE(code_area: string)`: Examines relevant code areas.
-   `PSEUDOCODE.Code.IMPLEMENT_FIX(fix_details: string)`: Implements a targeted fix.
-   `PSEUDOCODE.Code.IMPLEMENT_CHANGES(changes_details: string)`: Implements changes.

### Progress Module (`PSEUDOCODE.Progress`)
-   `PSEUDOCODE.Progress.TRACK_RULE_COMPLIANCE()`: Tracks rule compliance.

### Build Module (`PSEUDOCODE.Build`)
-   `PSEUDOCODE.Build.REVIEW_BUILD_PLAN()`: Reviews the build plan.
-   `PSEUDOCODE.Build.EXECUTE_PHASE(phase_name: string)`: Executes a build phase.
-   `PSEUDOCODE.Build.VERIFY_COMPLETE()`: Verifies if the build is complete.

### Phase Module (`PSEUDOCODE.Phase`)
-   `PSEUDOCODE.Phase.CHECK_NEXT_PHASE()`: Checks if there is a next phase.

### Integration Module (`PSEUDOCODE.Integration`)
-   `PSEUDOCODE.Integration.PLAN_INTEGRATION()`: Plans integration.
-   `PSEUDOCODE.Integration.PERFORM_TESTING()`: Performs integration testing.

### Design Module (`PSEUDOCODE.Design`)
-   `PSEUDOCODE.Design.VALIDATE_ISOLATED_DESIGN()`: Validates isolated design.

### Performance Module (`PSEUDOCODE.Performance`)
-   `PSEUDOCODE.Performance.ANALYZE_PERFORMANCE()`: Analyzes performance.

### Command Module (`PSEUDOCODE.Command`)
-   `PSEUDOCODE.Command.EXECUTE()`: Executes a command.
-   `PSEUDOCODE.Command.DOCUMENT_RESULTS()`: Documents command results.

### Context Module (`PSEUDOCODE.Context`)
-   `PSEUDOCODE.Context.CHECK_ACTIVE()`: Checks if a context exists and is active.

### Validation Module (`PSEUDOCODE.Validation`)
-   `PSEUDOCODE.Validation.ANALYZE_SOLUTION(solution: string)`: Analyzes an existing solution, identifying key components, advantages, disadvantages, and valuable aspects to preserve.
-   `PSEUDOCODE.Validation.JUSTIFY_CHANGE(old_solution: string, new_solution: string, reason: string)`: Justifies changes by comparing old and new solutions, identifying preserved and removed elements with explanations.
-   `PSEUDOCODE.Validation.VALIDATE_SOLUTION(new_solution: string, requirements: string)`: Validates a new solution against requirements, identifies improvements, potential risks, and provides implementation recommendations.
-   `PSEUDOCODE.Validation.IDENTIFY_COMPONENTS(solution: string)`: Identifies key components of a solution.
-   `PSEUDOCODE.Validation.IDENTIFY_ADVANTAGES(solution: string)`: Identifies advantages of a solution.
-   `PSEUDOCODE.Validation.IDENTIFY_DISADVANTAGES(solution: string)`: Identifies disadvantages and limitations of a solution.
-   `PSEUDOCODE.Validation.IDENTIFY_VALUABLE_ASPECTS(solution: string)`: Identifies valuable aspects to preserve from a solution.
-   `PSEUDOCODE.Validation.COMPARE_SOLUTIONS(old_solution: string, new_solution: string)`: Performs a comparative analysis of old and new solutions.
-   `PSEUDOCODE.Validation.IDENTIFY_PRESERVED_ELEMENTS(old_solution: string, new_solution: string)`: Identifies elements preserved from an old solution in a new one.
-   `PSEUDOCODE.Validation.JUSTIFY_REMOVALS(old_solution: string, new_solution: string)`: Justifies elements removed from an old solution.
-   `PSEUDOCODE.Validation.CHECK_COMPLIANCE(solution: string, requirements: string)`: Checks a solution's compliance with requirements.
-   `PSEUDOCODE.Validation.IDENTIFY_IMPROVEMENTS(solution: string)`: Identifies improvements in a new solution.
-   `PSEUDOCODE.Validation.IDENTIFY_POTENTIAL_RISKS(solution: string)`: Identifies potential risks in a new solution.
-   `PSEUDOCODE.Validation.PROVIDE_RECOMMENDATIONS(solution: string)`: Provides implementation recommendations for a new solution.