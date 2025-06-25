---
description: Command execution guidelines for isolation-focused Memory Bank
globs: command-execution.mdc
alwaysApply: false
---

# COMMAND EXECUTION SYSTEM

> **TL;DR:** This system provides guidelines for efficient command execution, balancing clarity and token optimization through appropriate command chaining, with proper documentation of commands and results.

## 🔍 COMMAND EFFICIENCY WORKFLOW

```mermaid
graph TD
    Start["Command<br>Planning"] --> Analyze["Analyze Command<br>Requirements"]
    Analyze --> Balance["Balance Clarity<br>vs. Efficiency"]
    Balance --> Complexity{"Command<br>Complexity?"}
    
    Complexity -->|"Simple"| Single["Execute<br>Single Command"]
    Complexity -->|"Moderate"| Chain["Use Efficient<br>Command Chaining"]
    Complexity -->|"Complex"| Group["Group Into<br>Logical Steps"]
    
    Single & Chain & Group --> Verify["Verify<br>Results"]
    Verify --> Document["Document<br>Command & Result"]
    Document --> Next["Next<br>Command"]
```

## 📋 COMMAND CHAINING GUIDELINES

```mermaid
graph TD
    Command["Command<br>Execution"] --> ChainApprop{"Is Chaining<br>Appropriate?"}
    
    ChainApprop -->|"Yes"| ChainTypes["Chain<br>Types"]
    ChainApprop -->|"No"| SingleCmd["Use Single<br>Commands"]
    
    ChainTypes --> Sequential["Sequential Operations<br>cmd1 && cmd2"]
    ChainTypes --> Conditional["Conditional Operations<br>cmd1 || cmd2"]
    ChainTypes --> Piping["Piping<br>cmd1 | cmd2"]
    ChainTypes --> Grouping["Command Grouping<br>(cmd1; cmd2)"]
    
    Sequential & Conditional & Piping & Grouping --> Doc["Document<br>Commands & Results"]
```

## 🚦 DIRECTORY VERIFICATION WORKFLOW

```mermaid
graph TD
    Command["Command<br>Execution"] --> DirCheck["Check Current<br>Directory"]
    DirCheck --> ProjectRoot{"In Project<br>Root?"}
    
    ProjectRoot -->|"Yes"| Execute["Execute<br>Command"]
    ProjectRoot -->|"No"| Locate["Locate<br>Project Root"]
    
    Locate --> Found{"Project Root<br>Found?"}
    Found -->|"Yes"| Navigate["Navigate to<br>Project Root"]
    Found -->|"No"| Error["Error: Cannot<br>Find Project Root"]
    
    Navigate --> Execute
    Execute --> Verify["Verify<br>Results"]
```

## 📋 DIRECTORY VERIFICATION CHECKLIST

Before executing any npm or build command:

| Step | Windows (PowerShell) | Unix/Linux/Mac | Purpose |
|------|----------------------|----------------|---------|
| **Check package.json** | `Test-Path package.json` | `ls package.json` | Verify current directory is project root |
| **Check for parent directory** | `Test-Path "*/package.json"` | `find . -maxdepth 2 -name package.json` | Find potential project directories |
| **Navigate to project root** | `cd [project-dir]` | `cd [project-dir]` | Move to correct directory before executing commands |

## 📋 REACT-SPECIFIC COMMAND GUIDELINES

For React applications, follow these strict guidelines:

| Command | Correct Usage | Incorrect Usage | Notes |
|---------|---------------|----------------|-------|
| **npm start** | `cd [project-root] && npm start` | `npm start` (from parent dir) | Must execute from directory with package.json |
| **npm run build** | `cd [project-root] && npm run build` | `cd [parent-dir] && npm run build` | Must execute from directory with package.json |
| **npm install** | `cd [project-root] && npm install [pkg]` | `npm install [pkg]` (wrong dir) | Dependencies installed to nearest package.json |
| **npm create** | `npm create vite@latest my-app -- --template react` | Manually configuring webpack | Use standard tools for project creation |

## 🔄 COMMAND CHAINING PATTERNS

Effective command chaining patterns include:

| Pattern | Format | Examples | Use Case |
|---------|--------|----------|----------|
| **Sequential** | `cmd1 && cmd2` | `mkdir dir && cd dir` | Commands that should run in sequence, second only if first succeeds |
| **Conditional** | `cmd1 || cmd2` | `test -f file.txt || touch file.txt` | Fallback commands, second only if first fails |
| **Piping** | `cmd1 \| cmd2` | `grep "pattern" file.txt \| wc -l` | Pass output of first command as input to second |
| **Background** | `cmd &` | `npm start &` | Run command in background |
| **Grouping** | `(cmd1; cmd2)` | `(echo "Start"; npm test; echo "End")` | Group commands to run as a unit |

## 📋 COMMAND DOCUMENTATION TEMPLATE

```
## Command Execution: [Purpose]

### Command
```
[actual command or chain]
```

### Result
```
[command output]
```

### Effect
[Brief description of what changed in the system]

### Next Steps
[What needs to be done next]
```

## 🔍 PLATFORM-SPECIFIC CONSIDERATIONS

```mermaid
graph TD
    Platform["Platform<br>Detection"] --> Windows["Windows<br>Commands"]
    Platform --> Unix["Unix/Linux/Mac<br>Commands"]
    
    Windows --> WinAdapt["Windows Command<br>Adaptations"]
    Unix --> UnixAdapt["Unix Command<br>Adaptations"]
    
    WinAdapt --> WinChain["Windows Chaining:<br>Commands separated by &"]
    UnixAdapt --> UnixChain["Unix Chaining:<br>Commands separated by ;"]
    
    WinChain & UnixChain --> Execute["Execute<br>Platform-Specific<br>Commands"]
```

## 📋 COMMAND EFFICIENCY EXAMPLES

Examples of efficient command usage:

| Inefficient | Efficient | Explanation |
|-------------|-----------|-------------|
| `mkdir dir`<br>`cd dir`<br>`npm init -y` | `mkdir dir && cd dir && npm init -y` | Combines related sequential operations |
| `ls`<br>`grep "\.js$"` | `ls \| grep "\.js$"` | Pipes output of first command to second |
| `test -f file.txt`<br>`if not exists, touch file.txt` | `test -f file.txt \|\| touch file.txt` | Creates file only if it doesn't exist |
| `mkdir dir1`<br>`mkdir dir2`<br>`mkdir dir3` | `mkdir dir1 dir2 dir3` | Uses command's built-in multiple argument capability |
| `npm install pkg1`<br>`npm install pkg2` | `npm install pkg1 pkg2` | Installs multiple packages in one command |

## 📋 REACT PROJECT INITIALIZATION STANDARDS

Always use these standard approaches for React project creation:

| Approach | Command | Benefits | Avoids |
|----------|---------|----------|--------|
| **Create React App** | `npx create-react-app my-app` | Preconfigured webpack & babel | Manual configuration errors |
| **Create React App w/TypeScript** | `npx create-react-app my-app --template typescript` | Type safety + preconfigured | Inconsistent module systems |
| **Vite** | `npm create vite@latest my-app -- --template react` | Faster build times | Complex webpack setups |
| **Next.js** | `npx create-next-app@latest my-app` | SSR support | Module system conflicts |

## ⚠️ ERROR HANDLING WORKFLOW

```mermaid
sequenceDiagram
    participant User
    participant AI
    participant System
    
    AI->>System: Execute Command
    System->>AI: Return Result
    
    alt Success
        AI->>AI: Verify Expected Result
        AI->>User: Report Success
    else Error
        AI->>AI: Analyze Error Message
        AI->>AI: Identify Likely Cause
        AI->>User: Explain Error & Cause
        AI->>User: Suggest Corrective Action
        User->>AI: Approve Correction
        AI->>System: Execute Corrected Command
    end
```

## 📋 COMMAND RESULT VERIFICATION

After command execution, verify:

```mermaid
graph TD
    Execute["Execute<br>Command"] --> Check{"Check<br>Result"}
    
    Check -->|"Success"| Verify["Verify Expected<br>Outcome"]
    Check -->|"Error"| Analyze["Analyze<br>Error"]
    
    Verify -->|"Expected"| Document["Document<br>Success"]
    Verify -->|"Unexpected"| Investigate["Investigate<br>Unexpected Result"]
    
    Analyze --> Diagnose["Diagnose<br>Error Cause"]
    Diagnose --> Correct["Propose<br>Correction"]
    
    Document & Investigate & Correct --> Next["Next Step<br>in Process"]
```

## 📝 COMMAND EXECUTION CHECKLIST

```
✓ COMMAND EXECUTION CHECKLIST
- Command purpose clearly identified? [YES/NO]
- Appropriate balance of clarity vs. efficiency? [YES/NO]
- Platform-specific considerations addressed? [YES/NO]
- Command documented with results? [YES/NO]
- Outcome verified against expectations? [YES/NO]
- Errors properly handled (if any)? [YES/NO/NA]
- For npm/build commands: Executed from project root? [YES/NO/NA]
- For React projects: Using standard tooling? [YES/NO/NA]

→ If all YES: Command execution complete
→ If any NO: Address missing elements
```

## 🚨 COMMAND EXECUTION WARNINGS

Avoid these common command issues:

```mermaid
graph TD
    Warning["Command<br>Warnings"] --> W1["Excessive<br>Verbosity"]
    Warning --> W2["Insufficient<br>Error Handling"]
    Warning --> W3["Unnecessary<br>Complexity"]
    Warning --> W4["Destructive<br>Operations Without<br>Confirmation"]
    Warning --> W5["Wrong Directory<br>Execution"]
    
    W1 --> S1["Use flags to reduce<br>unnecessary output"]
    W2 --> S2["Include error handling<br>in command chains"]
    W3 --> S3["Prefer built-in<br>command capabilities"]
    W4 --> S4["Show confirmation<br>before destructive actions"]
    W5 --> S5["Verify directory before<br>npm/build commands"]
``` 