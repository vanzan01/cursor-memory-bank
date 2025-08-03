# Code Naming Conventions

## Overview

This document defines the naming conventions that must be followed in all code written for this project. These conventions prioritize clarity, readability, and maintainability over brevity.

## 🔴 Bad Naming Practices to Avoid

### Single-letter Variable Names
**Problem:** Single-letter names lack context and meaning.
```javascript
// ❌ Bad
const c = getCount();
const u = getUser();
const d = new Date();

// ✅ Good
const userCount = getCount();
const currentUser = getUser();
const currentDate = new Date();
```

### Abbreviations
**Problem:** Abbreviations save little time but significantly reduce readability.
```javascript
// ❌ Bad
const usr = getUser();
const cfg = getConfig();
const sys = getSystem();

// ✅ Good
const user = getUser();
const config = getConfig();
const system = getSystem();
```

### Hungarian Notation (Type Prefixes)
**Problem:** Including types in variable names is unnecessary in modern typed languages.
```javascript
// ❌ Bad
const strName = "John";
const iCount = 42;
const bIsActive = true;

// ✅ Good
const name = "John";
const count = 42;
const isActive = true;
```

### Type Prefixes in Class Names
**Problem:** Prefixes like `I` for interfaces or `Base` for base classes don't help users understand the class.
```javascript
// ❌ Bad
interface IUserService { }
class BaseTruck { }
class AbstractCar { }

// ✅ Good
interface UserService { }
class Truck { }
class Car { }
```

### "Utils" or "Helpers" Modules
**Problem:** These become dumping grounds for unclear code organization.
```javascript
// ❌ Bad
// utils.js - contains random functions
export function formatDate() { }
export function validateEmail() { }
export function calculateTax() { }

// ✅ Good
// dateFormatter.js
export function formatDate() { }

// emailValidator.js
export function validateEmail() { }

// taxCalculator.js
export function calculateTax() { }
```

## ✅ Good Naming Practices to Follow

### Descriptive Variable Names
**Principle:** Make names self-explanatory and prefer clarity over brevity.
```javascript
// ✅ Good
const userCount = getActiveUsers().length;
const isAuthenticated = checkAuthStatus();
const hasPermission = user.canAccess(resource);
```

### Include Units in Names (When Helpful)
**Principle:** Include units in names when the type system doesn't make it clear.
```javascript
// ✅ Good
const delaySeconds = 30;
const maxRetries = 3;
const timeoutMilliseconds = 5000;
const priceDollars = 29.99;
```

### Use Types to Express Semantics
**Principle:** Leverage the type system instead of relying on naming alone.
```javascript
// ✅ Good - Using proper types
const duration = TimeSpan.fromSeconds(30);
const price = Money.fromDollars(29.99);
const email = EmailAddress.fromString("user@example.com");

// Instead of:
// const durationSeconds = 30;
// const priceDollars = 29.99;
// const emailString = "user@example.com";
```

### Let Structure Drive Naming
**Principle:** If naming something is difficult, it may indicate a structural problem.
```javascript
// ❌ Bad - Hard to name because structure is unclear
const data = processUserInput(input);

// ✅ Good - Clear structure leads to clear naming
const validatedUserData = validateUserInput(input);
const processedUserData = processValidatedData(validatedUserData);
```

## Language-Specific Guidelines

### JavaScript/TypeScript
```javascript
// Variables and functions: camelCase
const userName = "john";
const getUserData = () => { };

// Classes and interfaces: PascalCase
class UserService { }
interface UserData { }

// Constants: UPPER_SNAKE_CASE
const MAX_RETRY_ATTEMPTS = 3;
const API_BASE_URL = "https://api.example.com";

// Private members: underscore prefix (if needed)
class User {
  private _internalData = {};
  private _processData() { }
}
```

### Python
```python
# Variables and functions: snake_case
user_name = "john"
def get_user_data():
    pass

# Classes: PascalCase
class UserService:
    pass

# Constants: UPPER_SNAKE_CASE
MAX_RETRY_ATTEMPTS = 3
API_BASE_URL = "https://api.example.com"

# Private members: underscore prefix
class User:
    def __init__(self):
        self._internal_data = {}
    
    def _process_data(self):
        pass
```

### Java/C#
```java
// Variables and methods: camelCase
String userName = "john";
public void getUserData() { }

// Classes and interfaces: PascalCase
public class UserService { }
public interface UserData { }

// Constants: UPPER_SNAKE_CASE
public static final int MAX_RETRY_ATTEMPTS = 3;
public static final String API_BASE_URL = "https://api.example.com";

// Private members: camelCase (no prefix needed)
private String internalData;
private void processData() { }
```

## File and Directory Naming

### Files
```javascript
// ✅ Good
userService.js
userAuthentication.js
emailValidator.js
dateFormatter.js

// ❌ Bad
user_service.js
userSvc.js
emailVal.js
dateFmt.js
```

### Directories
```javascript
// ✅ Good
user-management/
authentication/
email-services/
date-utilities/

// ❌ Bad
user_mgmt/
auth/
email_svc/
date_utils/
```

## Database Naming

### Tables
```sql
-- ✅ Good
users
user_profiles
order_items
product_categories

-- ❌ Bad
tbl_users
userProfiles
orderItems
prod_cats
```

### Columns
```sql
-- ✅ Good
user_id
email_address
created_at
is_active

-- ❌ Bad
uid
emailAddr
createDate
active
```

### SQL Query Aliases
```sql
-- ✅ Good - Descriptive table aliases
SELECT u.name, u.email, o.order_date
FROM users AS u
JOIN orders AS o ON u.id = o.user_id
WHERE u.is_active = true;

-- ✅ Good - Descriptive column aliases
SELECT 
    u.name AS user_name,
    o.order_date AS purchase_date,
    COUNT(oi.id) AS total_items
FROM users AS u
JOIN orders AS o ON u.id = o.user_id
JOIN order_items AS oi ON o.id = oi.order_id
GROUP BY u.id, u.name, o.order_date;

-- ❌ Bad - Single letter aliases
SELECT q.name, q.email, q.order_date
FROM users AS q
JOIN orders AS q2 ON q.id = q2.user_id;

-- ❌ Bad - Acronym aliases
SELECT bneob.blah_blah
FROM bad_naming_example_orders_table AS bneob;

-- ❌ Bad - First letter acronyms
SELECT u.name, o.date, oi.price
FROM users AS u
JOIN orders AS o ON u.id = o.user_id
JOIN order_items AS oi ON o.id = oi.order_id;
```

### SQL Query Structure
```sql
-- ✅ Good - Clear, readable structure
SELECT 
    users.name AS customer_name,
    orders.order_date AS purchase_date,
    order_items.quantity,
    products.name AS product_name
FROM users
JOIN orders ON users.id = orders.user_id
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id
WHERE users.is_active = true
  AND orders.order_date >= '2024-01-01'
ORDER BY orders.order_date DESC;

-- ❌ Bad - Poor structure and naming
SELECT u.n, o.d, oi.q, p.n AS pn
FROM users u
JOIN orders o ON u.id = o.uid
JOIN order_items oi ON o.id = oi.oid
JOIN products p ON oi.pid = p.id
WHERE u.a = 1 AND o.d >= '2024-01-01'
ORDER BY o.d DESC;
```

## API Endpoints

```javascript
// ✅ Good
GET /api/users
POST /api/users
PUT /api/users/{id}
DELETE /api/users/{id}

// ❌ Bad
GET /api/getUsers
POST /api/createUser
PUT /api/updateUser/{id}
DELETE /api/removeUser/{id}
```

## Testing

```javascript
// ✅ Good
describe('UserService', () => {
  it('should create user with valid data', () => { });
  it('should reject user with invalid email', () => { });
  it('should update user profile successfully', () => { });
});

// ❌ Bad
describe('UserService', () => {
  it('should work', () => { });
  it('test1', () => { });
  it('should do stuff', () => { });
});
```

## Review Checklist

Before committing any code, ensure:

- [ ] All variables have descriptive, non-abbreviated names
- [ ] No single-letter variables (except in mathematical contexts like loops)
- [ ] No Hungarian notation or type prefixes
- [ ] No "Utils" or "Helpers" modules without clear justification
- [ ] Class and function names clearly describe their purpose
- [ ] Names include units where helpful for clarity
- [ ] File and directory names follow conventions
- [ ] Database names follow conventions
- [ ] API endpoints follow RESTful naming
- [ ] Test names are descriptive and follow patterns

## Enforcement

These naming conventions are **mandatory** and should be enforced during:
- Code reviews
- Implementation phase
- Automated linting (where possible)
- Documentation updates

Violations should be caught and corrected before code is merged or deployed. 