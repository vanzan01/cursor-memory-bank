Bun ships with a fast, built-in, Jest-compatible test runner. Tests are executed with the Bun runtime, and support the following features.

- TypeScript and JSX
- Lifecycle hooks
- Snapshot testing
- UI & DOM testing
- Watch mode with `--watch`
- Script pre-loading with `--preload`

{% callout %}
Bun aims for compatibility with Jest, but not everything is implemented. To track compatibility, see [this tracking issue](https://github.com/oven-sh/bun/issues/1825).
{% /callout %}

## Run tests

```bash
$ bun test
```

Tests are written in JavaScript or TypeScript with a Jest-like API. Refer to [Writing tests](https://bun.sh/docs/test/writing) for full documentation.

```ts#math.test.ts
import { expect, test } from "bun:test";

test("2 + 2", () => {
  expect(2 + 2).toBe(4);
});
```

The runner recursively searches the working directory for files that match the following patterns:

- `*.test.{js|jsx|ts|tsx}`
- `*_test.{js|jsx|ts|tsx}`
- `*.spec.{js|jsx|ts|tsx}`
- `*_spec.{js|jsx|ts|tsx}`

You can filter the set of _test files_ to run by passing additional positional arguments to `bun test`. Any test file with a path that matches one of the filters will run. Commonly, these filters will be file or directory names; glob patterns are not yet supported.

```bash
$ bun test <filter> <filter> ...
```

To filter by _test name_, use the `-t`/`--test-name-pattern` flag.

```sh
# run all tests or test suites with "addition" in the name
$ bun test --test-name-pattern addition
```

To run a specific file in the test runner, make sure the path starts with `./` or `/` to distinguish it from a filter name.

```bash
$ bun test ./test/specific-file.test.ts
```

The test runner runs all tests in a single process. It loads all `--preload` scripts (see [Lifecycle](https://bun.sh/docs/test/lifecycle) for details), then runs all tests. If a test fails, the test runner will exit with a non-zero exit code.

## CI/CD integration

`bun test` supports a variety of CI/CD integrations.

### GitHub Actions

`bun test` automatically detects if it's running inside GitHub Actions and will emit GitHub Actions annotations to the console directly.

No configuration is needed, other than installing `bun` in the workflow and running `bun test`.

#### How to install `bun` in a GitHub Actions workflow

To use `bun test` in a GitHub Actions workflow, add the following step:

```yaml
jobs:
  build:
    name: build-app
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Install bun
        uses: oven-sh/setup-bun@v2
      - name: Install dependencies # (assuming your project has dependencies)
        run: bun install # You can use npm/yarn/pnpm instead if you prefer
      - name: Run tests
        run: bun test
```

From there, you'll get GitHub Actions annotations.

### JUnit XML reports (GitLab, etc.)

To use `bun test` with a JUnit XML reporter, you can use the `--reporter=junit` in combination with `--reporter-outfile`.

```sh
$ bun test --reporter=junit --reporter-outfile=./bun.xml
```

This will continue to output to stdout/stderr as usual, and also write a JUnit
XML report to the given path at the very end of the test run.

JUnit XML is a popular format for reporting test results in CI/CD pipelines.

## Timeouts

Use the `--timeout` flag to specify a _per-test_ timeout in milliseconds. If a test times out, it will be marked as failed. The default value is `5000`.

```bash
# default value is 5000
$ bun test --timeout 20
```

## Rerun tests

Use the `--rerun-each` flag to run each test multiple times. This is useful for detecting flaky or non-deterministic test failures.

```sh
$ bun test --rerun-each 100
```

## Bail out with `--bail`

Use the `--bail` flag to abort the test run early after a pre-determined number of test failures. By default Bun will run all tests and report all failures, but sometimes in CI environments it's preferable to terminate earlier to reduce CPU usage.

```sh
# bail after 1 failure
$ bun test --bail

# bail after 10 failure
$ bun test --bail=10
```

## Watch mode

Similar to `bun run`, you can pass the `--watch` flag to `bun test` to watch for changes and re-run tests.

```bash
$ bun test --watch
```

## Lifecycle hooks

Bun supports the following lifecycle hooks:

| Hook         | Description                 |
| ------------ | --------------------------- |
| `beforeAll`  | Runs once before all tests. |
| `beforeEach` | Runs before each test.      |
| `afterEach`  | Runs after each test.       |
| `afterAll`   | Runs once after all tests.  |

These hooks can be defined inside test files, or in a separate file that is preloaded with the `--preload` flag.

```ts
$ bun test --preload ./setup.ts
```

See [Test > Lifecycle](https://bun.sh/docs/test/lifecycle) for complete documentation.

## Mocks

Create mock functions with the `mock` function. Mocks are automatically reset between tests.

```ts
import { test, expect, mock } from "bun:test";
const random = mock(() => Math.random());

test("random", () => {
  const val = random();
  expect(val).toBeGreaterThan(0);
  expect(random).toHaveBeenCalled();
  expect(random).toHaveBeenCalledTimes(1);
});
```

Alternatively, you can use `jest.fn()`, it behaves identically.

```ts-diff
- import { test, expect, mock } from "bun:test";
+ import { test, expect, jest } from "bun:test";

- const random = mock(() => Math.random());
+ const random = jest.fn(() => Math.random());
```

See [Test > Mocks](https://bun.sh/docs/test/mocks) for complete documentation.

## Snapshot testing

Snapshots are supported by `bun test`.

```ts
// example usage of toMatchSnapshot
import { test, expect } from "bun:test";

test("snapshot", () => {
  expect({ a: 1 }).toMatchSnapshot();
});
```

To update snapshots, use the `--update-snapshots` flag.

```sh
$ bun test --update-snapshots
```

See [Test > Snapshots](https://bun.sh/docs/test/snapshots) for complete documentation.

## UI & DOM testing

Bun is compatible with popular UI testing libraries:

- [HappyDOM](https://github.com/capricorn86/happy-dom)
- [DOM Testing Library](https://testing-library.com/docs/dom-testing-library/intro/)
- [React Testing Library](https://testing-library.com/docs/react-testing-library/intro)

See [Test > DOM Testing](https://bun.sh/docs/test/dom) for complete documentation.

## Performance

Bun's test runner is fast.

{% image src="/images/buntest.jpeg" caption="Running 266 React SSR tests faster than Jest can print its version number." /%}

<!--
Consider the following directory structure:

```
.
├── a.test.ts
├── b.test.ts
├── c.test.ts
└── foo
    ├── a.test.ts
    └── b.test.ts
```

To run both `a.test.ts` files:

```
$ bun test a
```

To run all tests in the `foo` directory:

```
$ bun test foo
```

Any test file in the directory with an _absolute path_ that contains one of the targets will run. Glob patterns are not yet supported. -->

{% bunCLIUsage command="test" /%}


Define tests with a Jest-like API imported from the built-in `bun:test` module. Long term, Bun aims for complete Jest compatibility; at the moment, a [limited set](#matchers) of `expect` matchers are supported.

## Basic usage

To define a simple test:

```ts#math.test.ts
import { expect, test } from "bun:test";

test("2 + 2", () => {
  expect(2 + 2).toBe(4);
});
```

{% details summary="Jest-style globals" %}
As in Jest, you can use `describe`, `test`, `expect`, and other functions without importing them. Unlike Jest, they are not injected into the global scope. Instead, the Bun transpiler will automatically inject an import from `bun:test` internally.

```ts
typeof globalThis.describe; // "undefined"
typeof describe; // "function"
```

This transpiler integration only occurs during `bun test`, and only for test files & preloaded scripts. In practice there's no significant difference to the end user.
{% /details %}

Tests can be grouped into suites with `describe`.

```ts#math.test.ts
import { expect, test, describe } from "bun:test";

describe("arithmetic", () => {
  test("2 + 2", () => {
    expect(2 + 2).toBe(4);
  });

  test("2 * 2", () => {
    expect(2 * 2).toBe(4);
  });
});
```

Tests can be `async`.

```ts
import { expect, test } from "bun:test";

test("2 * 2", async () => {
  const result = await Promise.resolve(2 * 2);
  expect(result).toEqual(4);
});
```

Alternatively, use the `done` callback to signal completion. If you include the `done` callback as a parameter in your test definition, you _must_ call it or the test will hang.

```ts
import { expect, test } from "bun:test";

test("2 * 2", done => {
  Promise.resolve(2 * 2).then(result => {
    expect(result).toEqual(4);
    done();
  });
});
```

## Timeouts

Optionally specify a per-test timeout in milliseconds by passing a number as the third argument to `test`.

```ts
import { test } from "bun:test";

test("wat", async () => {
  const data = await slowOperation();
  expect(data).toBe(42);
}, 500); // test must run in <500ms
```

In `bun:test`, test timeouts throw an uncatchable exception to force the test to stop running and fail. We also kill any child processes that were spawned in the test to avoid leaving behind zombie processes lurking in the background.

The default timeout for each test is 5000ms (5 seconds) if not overridden by this timeout option or `jest.setDefaultTimeout()`.

### 🧟 Zombie process killer

When a test times out and processes spawned in the test via `Bun.spawn`, `Bun.spawnSync`, or `node:child_process` are not killed, they will be automatically killed and a message will be logged to the console. This prevents zombie processes from lingering in the background after timed-out tests.

## `test.skip`

Skip individual tests with `test.skip`. These tests will not be run.

```ts
import { expect, test } from "bun:test";

test.skip("wat", () => {
  // TODO: fix this
  expect(0.1 + 0.2).toEqual(0.3);
});
```

## `test.todo`

Mark a test as a todo with `test.todo`. These tests will not be run.

```ts
import { expect, test } from "bun:test";

test.todo("fix this", () => {
  myTestFunction();
});
```

To run todo tests and find any which are passing, use `bun test --todo`.

```sh
$ bun test --todo
my.test.ts:
✗ unimplemented feature
  ^ this test is marked as todo but passes. Remove `.todo` or check that test is correct.

 0 pass
 1 fail
 1 expect() calls
```

With this flag, failing todo tests will not cause an error, but todo tests which pass will be marked as failing so you can remove the todo mark or
fix the test.

## `test.only`

To run a particular test or suite of tests use `test.only()` or `describe.only()`.

```ts
import { test, describe } from "bun:test";

test("test #1", () => {
  // does not run
});

test.only("test #2", () => {
  // runs
});

describe.only("only", () => {
  test("test #3", () => {
    // runs
  });
});
```

The following command will only execute tests #2 and #3.

```sh
$ bun test --only
```

The following command will only execute tests #1, #2 and #3.

```sh
$ bun test
```

## `test.if`

To run a test conditionally, use `test.if()`. The test will run if the condition is truthy. This is particularly useful for tests that should only run on specific architectures or operating systems.

```ts
test.if(Math.random() > 0.5)("runs half the time", () => {
  // ...
});

const macOS = process.arch === "darwin";
test.if(macOS)("runs on macOS", () => {
  // runs if macOS
});
```

## `test.skipIf`

To instead skip a test based on some condition, use `test.skipIf()` or `describe.skipIf()`.

```ts
const macOS = process.arch === "darwin";

test.skipIf(macOS)("runs on non-macOS", () => {
  // runs if *not* macOS
});
```

## `test.todoIf`

If instead you want to mark the test as TODO, use `test.todoIf()` or `describe.todoIf()`. Carefully choosing `skipIf` or `todoIf` can show a difference between, for example, intent of "invalid for this target" and "planned but not implemented yet."

```ts
const macOS = process.arch === "darwin";

// TODO: we've only implemented this for Linux so far.
test.todoIf(macOS)("runs on posix", () => {
  // runs if *not* macOS
});
```

## `test.failing`

Use `test.failing()` when you know a test is currently failing but you want to track it and be notified when it starts passing. This inverts the test result:

- A failing test marked with `.failing()` will pass
- A passing test marked with `.failing()` will fail (with a message indicating it's now passing and should be fixed)

```ts
// This will pass because the test is failing as expected
test.failing("math is broken", () => {
  expect(0.1 + 0.2).toBe(0.3); // fails due to floating point precision
});

// This will fail with a message that the test is now passing
test.failing("fixed bug", () => {
  expect(1 + 1).toBe(2); // passes, but we expected it to fail
});
```

This is useful for tracking known bugs that you plan to fix later, or for implementing test-driven development.

## Conditional Tests for Describe Blocks

The conditional modifiers `.if()`, `.skipIf()`, and `.todoIf()` can also be applied to `describe` blocks, affecting all tests within the suite:

```ts
const isMacOS = process.platform === "darwin";

// Only runs the entire suite on macOS
describe.if(isMacOS)("macOS-specific features", () => {
  test("feature A", () => {
    // only runs on macOS
  });

  test("feature B", () => {
    // only runs on macOS
  });
});

// Skips the entire suite on Windows
describe.skipIf(process.platform === "win32")("Unix features", () => {
  test("feature C", () => {
    // skipped on Windows
  });
});

// Marks the entire suite as TODO on Linux
describe.todoIf(process.platform === "linux")("Upcoming Linux support", () => {
  test("feature D", () => {
    // marked as TODO on Linux
  });
});
```

## `test.each` and `describe.each`

To run the same test with multiple sets of data, use `test.each`. This creates a parametrized test that runs once for each test case provided.

```ts
const cases = [
  [1, 2, 3],
  [3, 4, 7],
];

test.each(cases)("%p + %p should be %p", (a, b, expected) => {
  expect(a + b).toBe(expected);
});
```

You can also use `describe.each` to create a parametrized suite that runs once for each test case:

```ts
describe.each([
  [1, 2, 3],
  [3, 4, 7],
])("add(%i, %i)", (a, b, expected) => {
  test(`returns ${expected}`, () => {
    expect(a + b).toBe(expected);
  });

  test(`sum is greater than each value`, () => {
    expect(a + b).toBeGreaterThan(a);
    expect(a + b).toBeGreaterThan(b);
  });
});
```

### Argument Passing

How arguments are passed to your test function depends on the structure of your test cases:

- If a table row is an array (like `[1, 2, 3]`), each element is passed as an individual argument
- If a row is not an array (like an object), it's passed as a single argument

```ts
// Array items passed as individual arguments
test.each([
  [1, 2, 3],
  [4, 5, 9],
])("add(%i, %i) = %i", (a, b, expected) => {
  expect(a + b).toBe(expected);
});

// Object items passed as a single argument
test.each([
  { a: 1, b: 2, expected: 3 },
  { a: 4, b: 5, expected: 9 },
])("add($a, $b) = $expected", data => {
  expect(data.a + data.b).toBe(data.expected);
});
```

### Format Specifiers

There are a number of options available for formatting the test title:

{% table %}

---

- `%p`
- [`pretty-format`](https://www.npmjs.com/package/pretty-format)

---

- `%s`
- String

---

- `%d`
- Number

---

- `%i`
- Integer

---

- `%f`
- Floating point

---

- `%j`
- JSON

---

- `%o`
- Object

---

- `%#`
- Index of the test case

---

- `%%`
- Single percent sign (`%`)

{% /table %}

#### Examples

```ts
// Basic specifiers
test.each([
  ["hello", 123],
  ["world", 456],
])("string: %s, number: %i", (str, num) => {
  // "string: hello, number: 123"
  // "string: world, number: 456"
});

// %p for pretty-format output
test.each([
  [{ name: "Alice" }, { a: 1, b: 2 }],
  [{ name: "Bob" }, { x: 5, y: 10 }],
])("user %p with data %p", (user, data) => {
  // "user { name: 'Alice' } with data { a: 1, b: 2 }"
  // "user { name: 'Bob' } with data { x: 5, y: 10 }"
});

// %# for index
test.each(["apple", "banana"])("fruit #%# is %s", fruit => {
  // "fruit #0 is apple"
  // "fruit #1 is banana"
});
```

## Assertion Counting

Bun supports verifying that a specific number of assertions were called during a test:

### expect.hasAssertions()

Use `expect.hasAssertions()` to verify that at least one assertion is called during a test:

```ts
test("async work calls assertions", async () => {
  expect.hasAssertions(); // Will fail if no assertions are called

  const data = await fetchData();
  expect(data).toBeDefined();
});
```

This is especially useful for async tests to ensure your assertions actually run.

### expect.assertions(count)

Use `expect.assertions(count)` to verify that a specific number of assertions are called during a test:

```ts
test("exactly two assertions", () => {
  expect.assertions(2); // Will fail if not exactly 2 assertions are called

  expect(1 + 1).toBe(2);
  expect("hello").toContain("ell");
});
```

This helps ensure all your assertions run, especially in complex async code with multiple code paths.

## Matchers

Bun implements the following matchers. Full Jest compatibility is on the roadmap; track progress [here](https://github.com/oven-sh/bun/issues/1825).

{% table %}

---

- ✅
- [`.not`](https://jestjs.io/docs/expect#not)

---

- ✅
- [`.toBe()`](https://jestjs.io/docs/expect#tobevalue)

---

- ✅
- [`.toEqual()`](https://jestjs.io/docs/expect#toequalvalue)

---

- ✅
- [`.toBeNull()`](https://jestjs.io/docs/expect#tobenull)

---

- ✅
- [`.toBeUndefined()`](https://jestjs.io/docs/expect#tobeundefined)

---

- ✅
- [`.toBeNaN()`](https://jestjs.io/docs/expect#tobenan)

---

- ✅
- [`.toBeDefined()`](https://jestjs.io/docs/expect#tobedefined)

---

- ✅
- [`.toBeFalsy()`](https://jestjs.io/docs/expect#tobefalsy)

---

- ✅
- [`.toBeTruthy()`](https://jestjs.io/docs/expect#tobetruthy)

---

- ✅
- [`.toContain()`](https://jestjs.io/docs/expect#tocontainitem)

---

- ✅
- [`.toContainAllKeys()`](https://jest-extended.jestcommunity.dev/docs/matchers/Object#tocontainallkeyskeys)

---

- ✅
- [`.toContainValue()`](https://jest-extended.jestcommunity.dev/docs/matchers/Object#tocontainvaluevalue)

---

- ✅
- [`.toContainValues()`](https://jest-extended.jestcommunity.dev/docs/matchers/Object#tocontainvaluesvalues)

---

- ✅
- [`.toContainAllValues()`](https://jest-extended.jestcommunity.dev/docs/matchers/Object#tocontainallvaluesvalues)

---

- ✅
- [`.toContainAnyValues()`](https://jest-extended.jestcommunity.dev/docs/matchers/Object#tocontainanyvaluesvalues)

---

- ✅
- [`.toStrictEqual()`](https://jestjs.io/docs/expect#tostrictequalvalue)

---

- ✅
- [`.toThrow()`](https://jestjs.io/docs/expect#tothrowerror)

---

- ✅
- [`.toHaveLength()`](https://jestjs.io/docs/expect#tohavelengthnumber)

---

- ✅
- [`.toHaveProperty()`](https://jestjs.io/docs/expect#tohavepropertykeypath-value)

---

- ✅
- [`.extend`](https://jestjs.io/docs/expect#expectextendmatchers)

---

- ✅
- [`.anything()`](https://jestjs.io/docs/expect#expectanything)

---

- ✅
- [`.any()`](https://jestjs.io/docs/expect#expectanyconstructor)

---

- ✅
- [`.arrayContaining()`](https://jestjs.io/docs/expect#expectarraycontainingarray)

---

- ✅
- [`.assertions()`](https://jestjs.io/docs/expect#expectassertionsnumber)

---

- ✅
- [`.closeTo()`](https://jestjs.io/docs/expect#expectclosetonumber-numdigits)

---

- ✅
- [`.hasAssertions()`](https://jestjs.io/docs/expect#expecthasassertions)

---

- ✅
- [`.objectContaining()`](https://jestjs.io/docs/expect#expectobjectcontainingobject)

---

- ✅
- [`.stringContaining()`](https://jestjs.io/docs/expect#expectstringcontainingstring)

---

- ✅
- [`.stringMatching()`](https://jestjs.io/docs/expect#expectstringmatchingstring--regexp)

---

- ❌
- [`.addSnapshotSerializer()`](https://jestjs.io/docs/expect#expectaddsnapshotserializerserializer)

---

- ✅
- [`.resolves()`](https://jestjs.io/docs/expect#resolves)

---

- ✅
- [`.rejects()`](https://jestjs.io/docs/expect#rejects)

---

- ✅
- [`.toHaveBeenCalled()`](https://jestjs.io/docs/expect#tohavebeencalled)

---

- ✅
- [`.toHaveBeenCalledTimes()`](https://jestjs.io/docs/expect#tohavebeencalledtimesnumber)

---

- ✅
- [`.toHaveBeenCalledWith()`](https://jestjs.io/docs/expect#tohavebeencalledwitharg1-arg2-)

---

- ✅
- [`.toHaveBeenLastCalledWith()`](https://jestjs.io/docs/expect#tohavebeenlastcalledwitharg1-arg2-)

---

- ✅
- [`.toHaveBeenNthCalledWith()`](https://jestjs.io/docs/expect#tohavebeennthcalledwithnthcall-arg1-arg2-)

---

- ✅
- [`.toHaveReturned()`](https://jestjs.io/docs/expect#tohavereturned)

---

- ✅
- [`.toHaveReturnedTimes()`](https://jestjs.io/docs/expect#tohavereturnedtimesnumber)

---

- ❌
- [`.toHaveReturnedWith()`](https://jestjs.io/docs/expect#tohavereturnedwithvalue)

---

- ❌
- [`.toHaveLastReturnedWith()`](https://jestjs.io/docs/expect#tohavelastreturnedwithvalue)

---

- ❌
- [`.toHaveNthReturnedWith()`](https://jestjs.io/docs/expect#tohaventhreturnedwithnthcall-value)

---

- ✅
- [`.toBeCloseTo()`](https://jestjs.io/docs/expect#tobeclosetonumber-numdigits)

---

- ✅
- [`.toBeGreaterThan()`](https://jestjs.io/docs/expect#tobegreaterthannumber--bigint)

---

- ✅
- [`.toBeGreaterThanOrEqual()`](https://jestjs.io/docs/expect#tobegreaterthanorequalnumber--bigint)

---

- ✅
- [`.toBeLessThan()`](https://jestjs.io/docs/expect#tobelessthannumber--bigint)

---

- ✅
- [`.toBeLessThanOrEqual()`](https://jestjs.io/docs/expect#tobelessthanorequalnumber--bigint)

---

- ✅
- [`.toBeInstanceOf()`](https://jestjs.io/docs/expect#tobeinstanceofclass)

---

- ✅
- [`.toContainEqual()`](https://jestjs.io/docs/expect#tocontainequalitem)

---

- ✅
- [`.toMatch()`](https://jestjs.io/docs/expect#tomatchregexp--string)

---

- ✅
- [`.toMatchObject()`](https://jestjs.io/docs/expect#tomatchobjectobject)

---

- ✅
- [`.toMatchSnapshot()`](https://jestjs.io/docs/expect#tomatchsnapshotpropertymatchers-hint)

---

- ✅
- [`.toMatchInlineSnapshot()`](https://jestjs.io/docs/expect#tomatchinlinesnapshotpropertymatchers-inlinesnapshot)

---

- ✅
- [`.toThrowErrorMatchingSnapshot()`](https://jestjs.io/docs/expect#tothrowerrormatchingsnapshothint)

---

- ✅
- [`.toThrowErrorMatchingInlineSnapshot()`](https://jestjs.io/docs/expect#tothrowerrormatchinginlinesnapshotinlinesnapshot)

{% /table %}

---

Packages on `npm` can define _lifecycle scripts_ in their `package.json`. Some of the most common are below, but there are [many others](https://docs.npmjs.com/cli/v10/using-npm/scripts).

- `preinstall`: Runs before the package is installed
- `postinstall`: Runs after the package is installed
- `preuninstall`: Runs before the package is uninstalled
- `prepublishOnly`: Runs before the package is published

These scripts are arbitrary shell commands that the package manager is expected to read and execute at the appropriate time. But executing arbitrary scripts represents a potential security risk, so—unlike other `npm` clients—Bun does not execute arbitrary lifecycle scripts by default.

## `postinstall`

The `postinstall` script is particularly important. It's widely used to build or install platform-specific binaries for packages that are implemented as [native Node.js add-ons](https://nodejs.org/api/addons.html). For example, `node-sass` is a popular package that uses `postinstall` to build a native binary for Sass.

```json
{
  "name": "my-app",
  "version": "1.0.0",
  "dependencies": {
    "node-sass": "^6.0.1"
  }
}
```

## `trustedDependencies`

Instead of executing arbitrary scripts, Bun uses a "default-secure" approach. You can add certain packages to an allow list, and Bun will execute lifecycle scripts for those packages. To tell Bun to allow lifecycle scripts for a particular package, add the package name to `trustedDependencies` array in your `package.json`.

```json-diff
  {
    "name": "my-app",
    "version": "1.0.0",
+   "trustedDependencies": ["node-sass"]
  }
```

Once added to `trustedDependencies`, install/re-install the package. Bun will read this field and run lifecycle scripts for `my-trusted-package`.

As of Bun v1.0.16, the top 500 npm packages with lifecycle scripts are allowed by default. You can see the full list [here](https://github.com/oven-sh/bun/blob/main/src/install/default-trusted-dependencies.txt).

## `--ignore-scripts`

To disable lifecycle scripts for all packages, use the `--ignore-scripts` flag.

```bash
$ bun install --ignore-scripts
```

----

Create mocks with the `mock` function.

```ts
import { test, expect, mock } from "bun:test";
const random = mock(() => Math.random());

test("random", async () => {
  const val = random();
  expect(val).toBeGreaterThan(0);
  expect(random).toHaveBeenCalled();
  expect(random).toHaveBeenCalledTimes(1);
});
```

{% callout %}
Alternatively, you can use the `jest.fn()` function, as in Jest. It behaves identically.

```ts
import { test, expect, jest } from "bun:test";
const random = jest.fn(() => Math.random());

test("random", async () => {
  const val = random();
  expect(val).toBeGreaterThan(0);
  expect(random).toHaveBeenCalled();
  expect(random).toHaveBeenCalledTimes(1);
});
```

{% /callout %}

The result of `mock()` is a new function that's been decorated with some additional properties.

```ts
import { mock } from "bun:test";
const random = mock((multiplier: number) => multiplier * Math.random());

random(2);
random(10);

random.mock.calls;
// [[ 2 ], [ 10 ]]

random.mock.results;
//  [
//    { type: "return", value: 0.6533907460954099 },
//    { type: "return", value: 0.6452713933037312 }
//  ]
```

The following properties and methods are implemented on mock functions.

- [x] [mockFn.getMockName()](https://jestjs.io/docs/mock-function-api#mockfngetmockname)
- [x] [mockFn.mock.calls](https://jestjs.io/docs/mock-function-api#mockfnmockcalls)
- [x] [mockFn.mock.results](https://jestjs.io/docs/mock-function-api#mockfnmockresults)
- [x] [mockFn.mock.instances](https://jestjs.io/docs/mock-function-api#mockfnmockinstances)
- [x] [mockFn.mock.contexts](https://jestjs.io/docs/mock-function-api#mockfnmockcontexts)
- [x] [mockFn.mock.lastCall](https://jestjs.io/docs/mock-function-api#mockfnmocklastcall)
- [x] [mockFn.mockClear()](https://jestjs.io/docs/mock-function-api#mockfnmockclear) - Clears call history
- [x] [mockFn.mockReset()](https://jestjs.io/docs/mock-function-api#mockfnmockreset) - Clears call history and removes implementation
- [x] [mockFn.mockRestore()](https://jestjs.io/docs/mock-function-api#mockfnmockrestore) - Restores original implementation
- [x] [mockFn.mockImplementation(fn)](https://jestjs.io/docs/mock-function-api#mockfnmockimplementationfn)
- [x] [mockFn.mockImplementationOnce(fn)](https://jestjs.io/docs/mock-function-api#mockfnmockimplementationoncefn)
- [x] [mockFn.mockName(name)](https://jestjs.io/docs/mock-function-api#mockfnmocknamename)
- [x] [mockFn.mockReturnThis()](https://jestjs.io/docs/mock-function-api#mockfnmockreturnthis)
- [x] [mockFn.mockReturnValue(value)](https://jestjs.io/docs/mock-function-api#mockfnmockreturnvaluevalue)
- [x] [mockFn.mockReturnValueOnce(value)](https://jestjs.io/docs/mock-function-api#mockfnmockreturnvalueoncevalue)
- [x] [mockFn.mockResolvedValue(value)](https://jestjs.io/docs/mock-function-api#mockfnmockresolvedvaluevalue)
- [x] [mockFn.mockResolvedValueOnce(value)](https://jestjs.io/docs/mock-function-api#mockfnmockresolvedvalueoncevalue)
- [x] [mockFn.mockRejectedValue(value)](https://jestjs.io/docs/mock-function-api#mockfnmockrejectedvaluevalue)
- [x] [mockFn.mockRejectedValueOnce(value)](https://jestjs.io/docs/mock-function-api#mockfnmockrejectedvalueoncevalue)
- [x] [mockFn.withImplementation(fn, callback)](https://jestjs.io/docs/mock-function-api#mockfnwithimplementationfn-callback)

## `.spyOn()`

It's possible to track calls to a function without replacing it with a mock. Use `spyOn()` to create a spy; these spies can be passed to `.toHaveBeenCalled()` and `.toHaveBeenCalledTimes()`.

```ts
import { test, expect, spyOn } from "bun:test";

const ringo = {
  name: "Ringo",
  sayHi() {
    console.log(`Hello I'm ${this.name}`);
  },
};

const spy = spyOn(ringo, "sayHi");

test("spyon", () => {
  expect(spy).toHaveBeenCalledTimes(0);
  ringo.sayHi();
  expect(spy).toHaveBeenCalledTimes(1);
});
```

## Module mocks with `mock.module()`

Module mocking lets you override the behavior of a module. Use `mock.module(path: string, callback: () => Object)` to mock a module.

```ts
import { test, expect, mock } from "bun:test";

mock.module("./module", () => {
  return {
    foo: "bar",
  };
});

test("mock.module", async () => {
  const esm = await import("./module");
  expect(esm.foo).toBe("bar");

  const cjs = require("./module");
  expect(cjs.foo).toBe("bar");
});
```

Like the rest of Bun, module mocks support both `import` and `require`.

### Overriding already imported modules

If you need to override a module that's already been imported, there's nothing special you need to do. Just call `mock.module()` and the module will be overridden.

```ts
import { test, expect, mock } from "bun:test";

// The module we're going to mock is here:
import { foo } from "./module";

test("mock.module", async () => {
  const cjs = require("./module");
  expect(foo).toBe("bar");
  expect(cjs.foo).toBe("bar");

  // We update it here:
  mock.module("./module", () => {
    return {
      foo: "baz",
    };
  });

  // And the live bindings are updated.
  expect(foo).toBe("baz");

  // The module is also updated for CJS.
  expect(cjs.foo).toBe("baz");
});
```

### Hoisting & preloading

If you need to ensure a module is mocked before it's imported, you should use `--preload` to load your mocks before your tests run.

```ts
// my-preload.ts
import { mock } from "bun:test";

mock.module("./module", () => {
  return {
    foo: "bar",
  };
});
```

```sh
bun test --preload ./my-preload
```

To make your life easier, you can put `preload` in your `bunfig.toml`:

```toml

[test]
# Load these modules before running tests.
preload = ["./my-preload"]

```

#### What happens if I mock a module that's already been imported?

If you mock a module that's already been imported, the module will be updated in the module cache. This means that any modules that import the module will get the mocked version, BUT the original module will still have been evaluated. That means that any side effects from the original module will still have happened.

If you want to prevent the original module from being evaluated, you should use `--preload` to load your mocks before your tests run.

### `__mocks__` directory and auto-mocking

Auto-mocking is not supported yet. If this is blocking you from switching to Bun, please file an issue.

### Implementation details

Module mocks have different implementations for ESM and CommonJS modules. For ES Modules, we've added patches to JavaScriptCore that allow Bun to override export values at runtime and update live bindings recursively.

As of Bun v1.0.19, Bun automatically resolves the `specifier` argument to `mock.module()` as though you did an `import`. If it successfully resolves, then the resolved specifier string is used as the key in the module cache. This means that you can use relative paths, absolute paths, and even module names. If the `specifier` doesn't resolve, then the original `specifier` is used as the key in the module cache.

After resolution, the mocked module is stored in the ES Module registry **and** the CommonJS require cache. This means that you can use `import` and `require` interchangeably for mocked modules.

The callback function is called lazily, only if the module is imported or required. This means that you can use `mock.module()` to mock modules that don't exist yet, and it means that you can use `mock.module()` to mock modules that are imported by other modules.

### Module Mock Implementation Details

Understanding how `mock.module()` works helps you use it more effectively:

1. **Cache Interaction**: Module mocks interacts with both ESM and CommonJS module caches.

2. **Lazy Evaluation**: The mock factory callback is only evaluated when the module is actually imported or required.

3. **Path Resolution**: Bun automatically resolves the module specifier as though you were doing an import, supporting:

   - Relative paths (`'./module'`)
   - Absolute paths (`'/path/to/module'`)
   - Package names (`'lodash'`)

4. **Import Timing Effects**:

   - When mocking before first import: No side effects from the original module occur
   - When mocking after import: The original module's side effects have already happened
   - For this reason, using `--preload` is recommended for mocks that need to prevent side effects

5. **Live Bindings**: Mocked ESM modules maintain live bindings, so changing the mock will update all existing imports

## Global Mock Functions

### Clear all mocks with `mock.clearAllMocks()`

Reset all mock function state (calls, results, etc.) without restoring their original implementation:

```ts
import { expect, mock, test } from "bun:test";

const random1 = mock(() => Math.random());
const random2 = mock(() => Math.random());

test("clearing all mocks", () => {
  random1();
  random2();

  expect(random1).toHaveBeenCalledTimes(1);
  expect(random2).toHaveBeenCalledTimes(1);

  mock.clearAllMocks();

  expect(random1).toHaveBeenCalledTimes(0);
  expect(random2).toHaveBeenCalledTimes(0);

  // Note: implementations are preserved
  expect(typeof random1()).toBe("number");
  expect(typeof random2()).toBe("number");
});
```

This resets the `.mock.calls`, `.mock.instances`, `.mock.contexts`, and `.mock.results` properties of all mocks, but unlike `mock.restore()`, it does not restore the original implementation.

### Restore all function mocks with `mock.restore()`

Instead of manually restoring each mock individually with `mockFn.mockRestore()`, restore all mocks with one command by calling `mock.restore()`. Doing so does not reset the value of modules overridden with `mock.module()`.

Using `mock.restore()` can reduce the amount of code in your tests by adding it to `afterEach` blocks in each test file or even in your [test preload code](https://bun.sh/docs/runtime/bunfig#test-preload).

```ts
import { expect, mock, spyOn, test } from "bun:test";

import * as fooModule from "./foo.ts";
import * as barModule from "./bar.ts";
import * as bazModule from "./baz.ts";

test("foo, bar, baz", () => {
  const fooSpy = spyOn(fooModule, "foo");
  const barSpy = spyOn(barModule, "bar");
  const bazSpy = spyOn(bazModule, "baz");

  expect(fooSpy).toBe("foo");
  expect(barSpy).toBe("bar");
  expect(bazSpy).toBe("baz");

  fooSpy.mockImplementation(() => 42);
  barSpy.mockImplementation(() => 43);
  bazSpy.mockImplementation(() => 44);

  expect(fooSpy).toBe(42);
  expect(barSpy).toBe(43);
  expect(bazSpy).toBe(44);

  mock.restore();

  expect(fooSpy).toBe("foo");
  expect(barSpy).toBe("bar");
  expect(bazSpy).toBe("baz");
});
```

## Vitest Compatibility

For added compatibility with tests written for [Vitest](https://vitest.dev/), Bun provides the `vi` global object as an alias for parts of the Jest mocking API:

```ts
import { test, expect } from "bun:test";

// Using the 'vi' alias similar to Vitest
test("vitest compatibility", () => {
  const mockFn = vi.fn(() => 42);

  mockFn();
  expect(mockFn).toHaveBeenCalled();

  // The following functions are available on the vi object:
  // vi.fn
  // vi.spyOn
  // vi.mock
  // vi.restoreAllMocks
  // vi.clearAllMocks
});
```

This makes it easier to port tests from Vitest to Bun without having to rewrite all your mocks.

---

bun test's file discovery mechanism determines which files to run as tests. Understanding how it works helps you structure your test files effectively.

## Default Discovery Logic

By default, `bun test` recursively searches the project directory for files that match specific patterns:

- `*.test.{js|jsx|ts|tsx}` - Files ending with `.test.js`, `.test.jsx`, `.test.ts`, or `.test.tsx`
- `*_test.{js|jsx|ts|tsx}` - Files ending with `_test.js`, `_test.jsx`, `_test.ts`, or `_test.tsx`
- `*.spec.{js|jsx|ts|tsx}` - Files ending with `.spec.js`, `.spec.jsx`, `.spec.ts`, or `.spec.tsx`
- `*_spec.{js|jsx|ts|tsx}` - Files ending with `_spec.js`, `_spec.jsx`, `_spec.ts`, or `_spec.tsx`

## Exclusions

By default, Bun test ignores:

- `node_modules` directories
- Hidden directories (those starting with a period `.`)
- Files that don't have JavaScript-like extensions (based on available loaders)

## Customizing Test Discovery

### Position Arguments as Filters

You can filter which test files run by passing additional positional arguments to `bun test`:

```bash
$ bun test <filter> <filter> ...
```

Any test file with a path that contains one of the filters will run. These filters are simple substring matches, not glob patterns.

For example, to run all tests in a `utils` directory:

```bash
$ bun test utils
```

This would match files like `src/utils/string.test.ts` and `lib/utils/array_test.js`.

### Specifying Exact File Paths

To run a specific file in the test runner, make sure the path starts with `./` or `/` to distinguish it from a filter name:

```bash
$ bun test ./test/specific-file.test.ts
```

### Filter by Test Name

To filter tests by name rather than file path, use the `-t`/`--test-name-pattern` flag with a regex pattern:

```sh
# run all tests with "addition" in the name
$ bun test --test-name-pattern addition
```

The pattern is matched against a concatenated string of the test name prepended with the labels of all its parent describe blocks, separated by spaces. For example, a test defined as:

```js
describe("Math", () => {
  describe("operations", () => {
    test("should add correctly", () => {
      // ...
    });
  });
});
```

Would be matched against the string "Math operations should add correctly".

### Changing the Root Directory

By default, Bun looks for test files starting from the current working directory. You can change this with the `root` option in your `bunfig.toml`:

```toml
[test]
root = "src"  # Only scan for tests in the src directory
```

## Execution Order

Tests are run in the following order:

1. Test files are executed sequentially (not in parallel)
2. Within each file, tests run sequentially based on their definition order
