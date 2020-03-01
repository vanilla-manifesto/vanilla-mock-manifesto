Vanilla Mock manifesto
======================

[![CircleCI](https://circleci.com/gh/vanilla-manifesto/vanilla-mock-manifesto/tree/master.svg?style=svg)](https://circleci.com/gh/vanilla-manifesto/vanilla-mock-manifesto/tree/master)

Vanilla Mock is one of the implementation approaches of [Mock Objects](https://en.wikipedia.org/wiki/Mock_object) (a.k.a. [Test Doubles](http://xunitpatterns.com/Test%20Double.html)).

This approach has the following pros:

<dl>
<dt>Pros</dt>
<dd><ul>
<li>Extremely simple</li>
<li>Extremely easy to use</li>
<li>Dependency-free</li>
<li>Good debuggability</li>
<li>Good readability for beginners</li>
<li>Good portability for most languages</li>
<li>Good way to layered architecture</li>
</ul></dd>
</dl>

For fairness, this approach has the following cons:

<dl>
<dt>Cons</dt>
<dd><ul>
<li>About up to 3 components (but typically 1 component) needed for each object to mock</li>
<li>Maintainability highly depends on design skill</li>
</ul></dd>
</dl>
<dt>

So, Vanilla Mock may not work well if you work on a huge project.
But using Vanilla Mock is still a good choice for many situations.



Code Examples
-------------

We provides examples for the languages:

<!-- TODO: JavaScript -->
- [TypeScript](./ts/)
<!-- TODO: Python -->
<!-- TODO: Go -->
<!-- TODO: Swift -->
<!-- TODO: C# -->

However, we always welcome to add examples for other languages above.
Feel free to send a pull request.



Concept
-------

This approach is extremely simple; **Implement an interface to mock by very small components** (this approach is known as [Hard-Coded Test Double](http://xunitpatterns.com/Hard-Coded%20Test%20Double.html)).

For example, you need to mock the class:

```javascript
class SomethingService {
  foo() {
    // ...
    return x;
  }

  bar() {
    // ...
    return y;
  }
}
```

you can implement the mock as the following:

```javascript
class SomethingServiceStub {
  constructor(nextFooResult, nextBarResult) {
    this.nextFooResult = nextFooResult;
    this.nextBarResult = nextBarResult;
  }

  foo() {
    return this.nextFooResult;
  }

  bar() {
    return this.nextBarResult;
  }
}
```

That's all.



Refactoring Guides for typical Smells
-------------------------------------

If you felt something hard to write mocks or tests, Vanilla Mocker should find several code smells.

Because the important part of Vanilla Mocking are sensitivity for code smells. 
Vanilla Mocks does not hide any code smells, but Mock libraries hides often them.



### Huge Mocks

**Vanilla Mocks should be small**. For example, if the Vanilla Mock has 4+ methods, it might be a Huge Mock.

Typically, it is caused by [Interface Segragation Principle](https://en.wikipedia.org/wiki/Interface_segregation_principle) violations or [Single Responsibility Principle](https://en.wikipedia.org/wiki/Single_responsibility_principle) violations.

There are effective refactoring approaches:

1. [Extract Class](https://www.refactoring.com/catalog/extractClass.html)
2. [Extract Interface (dynamically typed languages)](https://www.refactoring.com/catalog/extractInterface.html)
3. [Extract Interface (statically typed languages)](https://www.refactoring.com/catalog/extractInterface.html)

<details>
<summary>Before refactoring</summary>

```javascript
class Huge {
  foo() { /* ... */ }
  bar() { /* ... */ }
  baz() { /* ... */ }
  qux() { /* ... */ }
}



// PROBLEM: Some users may use only few methods of Huge, but Vanilla Mocking needs
//          to do hard-code all of the methods... It is bored.
class ActualHugeUser {
  constructor(huge) {
    this.huge = huge;
  }


  doSomething() {
    // ...

    if (this.huge.foo()) {
      return;
    }

    // ...
  }
}
```
</details>

<details>
<summary>Approach 1. Extract Class</summary>

```javascript
// APPROACH-1: The best approach is separating the fat component.
class Foo {
  foo() { /* ... */ }
}

class BarBaz {
  bar() { /* ... */ }
  baz() { /* ... */ }
}

// ...


// RESULT: It is enough that only few methods need to be mocked.
class ActualHugeUser {
  constructor(foo) {
    this.foo = foo;
  }


  doSomething() {
    // ...

    if (this.foo.foo()) {
      return;
    }

    // ...
  }
}
```

```javascript
// GOOD: the Vanilla Mock bacames small.
class FooStub {
  foo() { /* ... */ }
}
```
</details>

<details>
<summary>Approach 2. Extract Interface (for dynamically typed languages)</summary>

```javascript
// APPROACH-2: If you can't separate the component, you can still hide
//             unrelated methods by creating the thin wrapper. It respect
//             Interface Segragation Principle.
class Foo {
  constructor(huge) {
    this.huge = huge;
  }

  foo() { return this.huge; }
}


class ActualHugeUser {
  constructor(foo) {
    this.foo = foo;
  }


  doSomething() {
    // ...

    if (this.foo.foo()) {
      return;
    }

    // ...
  }
}
```

```javascript
// GOOD: the Vanilla Mock bacames small.
class FooStub {
  foo() { /* ... */ }
}
```
</details>

<details>
<summary>Approach 3. Extract Interface (for statically typed languages)</summary>

```typescript
// APPROACH-3: If you uses a statically typed language, you can take the another
//             approach simular to APPROACH-2 but more handy. Separating
//             the interface of the depended on component into several
//             small interfaces and implementing all of them by the depended on
//             component. Then, you can indivisually implement Vanilla Mocks
//             with the small interfaces.

interface Foo { foo(): void; }
interface Bar { bar(): void; }
interface Baz { baz(): void; }
interface Qux { qux(): void; }


class Huge implements Foo, Bar, Baz, Qux {
  /* ... */
}


// Switch the depended on component to the small interface.
// It is like wrapping by thin wrapper but you can pass a Huge instance without the wrappers.
class ActualHugeUser {
  constructor(private foo: Foo) {}


  doSomething() {
    // ...

    if (this.foo.foo()) {
      return;
    }

    // ...
  }
}
```

```typescript
// GOOD: the Vanilla Mock bacames small.
class FooStub implements Foo {
  foo(): void { /* ... */ }
}
```
</details>




### Fragile Mocks

Ideally, **Vanilla Mocks should not be modified frequently**. Modifying Vanilla Mocks should do only occasionally.

Modifying Vanilla Mocks frequently means modifying frequently the interface or behavior that expected by components in production code.
It lead to expensive testing cost or ton of bugs.

Typically, it is caused by [Open-closed Principle](https://en.wikipedia.org/wiki/Open%E2%80%93closed_principle) violations or [Single Responsibility Principle](https://en.wikipedia.org/wiki/Single_responsibility_principle) violations.

There are effective refactoring approaches:

1. Wrap Class<sup><a id="note-ref-WEwLC-c6" href="#note-WEwLC-c6">1</a></sup>



<details>
<summary>Before refactoring</summary>

If you need to add the feature for caches to:

```javascript
class FooRepository {
  fetch() {
    // ...
  }
}
```

then, the simple but bad solution is:

```javascript
class FooRepository {
  // BAD: Method signature has been changed. It will lead to change the Vanilla Mock.
  fetch(ignoreCaches) {
    if (!ignoreCaches) {
        // ...
    }
    // ...
  }
}
```
</details>

<details>
<summary>Approach 1. Wrap Class</summary>

Instead, creating the Wrap Class like following:

```javascript
// GOOD: Method signature did not changed. It can keep existing the Vanilla Mock.
class CachedFooRepository {
  constructor(fooRepo) {
    this.fooRepo = fooRepo;
  }

  fetch() {
    if (this.hasCache) {
      // ...
    }

    return this.fooRepo.fetch();
  }
}
```
</details>

And also, learning Functional programming languages (Haskell or so on) is effective.
These languages provides very small components than typical Object-oriented programming languages.
Programmers can compose the component needed from the small component with pre-defined combinators.
This should be one of an ideal goal to respect Open-closed Principle.



### Versatile Mocks

**Vanilla Mocks should have only minimum functionality**. If you need to add extra functionality to Vanilla Mocks, it might be a Versatile Mocks. Keep in mind, the pro of Vanilla Mocks is derived from the minimum functionality.

Typically, it is caused by [Single Responsibility Principle](https://en.wikipedia.org/wiki/Single_responsibility_principle) violations or tight couples with systems under test.

<details>
<summary>Before refactoring</summary>

The component need to be mock is:

```javascript
class SomethingGreatService {
  // ROOT CAUSE: Typical Bulleted Method.
  doSomething(callback) {
    // ...

    if (isConnectionProblem()) {
      throw new ConnectionProblem();
    }

    if (this.config.shouldNeverDispatch) {
      return;
    }

    if (DateUtils.isLeapYear(new Date())) {
      return;
    }

    callback();
  }
}
```

the component is used like:

```javascript
somethingGreatService.doSomething(() => {
  doAnotherSomething();
});
```

then, we will face to the Versatile Mock:

```javascript
// PROBLEM: This Vanilla Mock has noisey features.
class SomethingGreatServiceStub {
  constructor(stubMode) {
    this.stubMode = stubMode;
  }


  doSomething(callback) {
    switch (this.stubMode) {
      case STUB_MODE_CONNECTION_PROBLEM:
        throw new ConnectoinProblem();
      case STUB_MODE_NEVER_DISPATCH:
      case STUB_MODE_LEAP_YEAR:
        return;
      default:
        setTimeout(0, callback);
    }
  }
}
```
</details>

<details>
<summary>Approach 1. Decorator</summary>

```javascript
// APPROACH: Move branches to small simple decorators.
class SomethingGreatService {
  doSomething(callback) {
    // ...
    callback();
  }
}


// NOTE: These decorators can test indivisually.
function handleConnectionProblem(callback) {
  return () => {
    if (isConnectoinProblem()) {
      throw new ConnectionProblem(x);
    }
    callback();
  };
}


function careConfig(config, callback) {
  return () => {
    if (config.shouldNeverDispatch) {
      return;
    }
    callback();
  };
}


function handleLeapYearProblem(callback) {
  return () => {
    if (DateUtils.isLeapYear(new Date())) {
      return;
    }
    callback();
  };
}
```

```javascript
// The service can be used like:
somethingGreatService.doSomething(handleConnectionProblem(careConfig(config, handleLeapYearProblem(() => {
  doAnotherSomething();
}))));
```

```javascript
// GOOD: Vanilla Mocks have only minimum functionality.
class SomethingGreatServiceStub {
  doSomething(callback) {
    setTimeout(0, callback);
  }
}
```
</details>



FAQ
---

### X is the de facto library of Y language. So we should use it, right?

Yes and no. It completely depends on your situation.

For example, you should use some DI libraries if the library is already used in your project.
For another example, you should not use any DI libraries if the project is across many programming languages and the project members are not experts for each languages.

It means, using DI liberaries is not always the best solution.

**Don't be afraid to be away from DI libraries.**



### What is the differences between Vanilla Mock and Hard-Coded Test Double?

Vanilla Mock = Hard-Coded Test Double + Phillosophy

The phillosophy is **emphasizing design smells**; Facing something hard to mock means a design smell.



Contributing
------------

Any suggetions are welcome.
Feel free to open issues to discuss about Vanilla DI.



References
----------

- **<a id="note-WEwLC-c6" href="#note-ref-WEwLC-c6">^</a>** Michael Feathers. (2004). [Working Effectively With Legacy Code](https://www.pearson.com/us/higher-education/program/Feathers-Working-Effectively-with-Legacy-Code/PGM254740.html).
