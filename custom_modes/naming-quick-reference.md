# Naming Conventions Quick Reference

## 🚨 Critical Rules (Always Follow)

### ❌ NEVER DO
- Single-letter variables (`c`, `u`, `d`)
- Abbreviations (`usr`, `cfg`, `sys`)
- Hungarian notation (`strName`, `iCount`)
- Type prefixes (`IUserService`, `BaseTruck`)
- "Utils" or "Helpers" modules

### ✅ ALWAYS DO
- Descriptive names (`userCount`, `isAuthenticated`)
- Include units when helpful (`delaySeconds`, `maxRetries`)
- Use types for semantics (`TimeSpan` instead of `durationSeconds`)
- Let structure drive naming

## Language-Specific Patterns

### JavaScript/TypeScript
```javascript
// Variables/functions: camelCase
const userName = "john";
const getUserData = () => { };

// Classes/interfaces: PascalCase
class UserService { }
interface UserData { }

// Constants: UPPER_SNAKE_CASE
const MAX_RETRY_ATTEMPTS = 3;
```

### Python
```python
# Variables/functions: snake_case
user_name = "john"
def get_user_data():
    pass

# Classes: PascalCase
class UserService:
    pass

# Constants: UPPER_SNAKE_CASE
MAX_RETRY_ATTEMPTS = 3
```

### Java/C#
```java
// Variables/methods: camelCase
String userName = "john";
public void getUserData() { }

// Classes/interfaces: PascalCase
public class UserService { }
public interface UserData { }

// Constants: UPPER_SNAKE_CASE
public static final int MAX_RETRY_ATTEMPTS = 3;
```

## File & Database Naming

### Files
```javascript
// ✅ Good
userService.js
userAuthentication.js
emailValidator.js

// ❌ Bad
user_service.js
userSvc.js
emailVal.js
```

### Database
```sql
-- ✅ Good
users
user_profiles
email_address
created_at

-- ❌ Bad
tbl_users
userProfiles
emailAddr
createDate
```

### SQL Queries
```sql
-- ✅ Good - Descriptive aliases
SELECT u.name, o.order_date
FROM users AS u
JOIN orders AS o ON u.id = o.user_id;

-- ❌ Bad - Single letter aliases
SELECT q.name, q2.date
FROM users AS q
JOIN orders AS q2 ON q.id = q2.user_id;

-- ❌ Bad - Acronym aliases
SELECT bneob.blah_blah
FROM bad_naming_example_orders_table AS bneob;
```

## Quick Checklist
- [ ] No single letters (except loops)
- [ ] No abbreviations
- [ ] No Hungarian notation
- [ ] No type prefixes
- [ ] No "Utils" modules
- [ ] Names are descriptive
- [ ] Units included when helpful

**Full guide:** `memory-bank/naming-conventions.md` 