TypeScript with Vanilla Mock
============================

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



Concept
-------

See [README.md](/README.md#concept).



Code Examples
-------------

### Stub for Query-like

* System under test: [`src/query_user.ts`](./example/src/query_user.ts)
* Depended on component: [`src/query.ts`](./example/src/query.ts)
* Tests: [`src/tests/query_tests.ts`](./example/src/tests/query_tests.ts)
* Vanilla Mock: [`src/tests/query_doubles.ts`](./example/src/tests/query_doubles.ts)


<details>
<summary>Advanced Usages</summary>

#### Named Stub for Query-like

* Tests: [`src/tests/advanced/named_query_tests.ts`](./example/src/tests/advanced/named_query_tests.ts)
* Vanilla Mock: [`src/tests/advanced/named_query_doubles.ts`](./example/src/tests/advanced/named_query_doubles.ts)



#### Stub for Anonymous Function Style Query

* Tests: [`src/tests/advanced/anon_func_style_query_tests.ts`](./example/src/tests/advanced/anon_func_style_query_tests.ts)
* Vanilla Mock: [`src/tests/advanced/anon_func_style_query_doubles.ts`](./example/src/tests/advanced/anon_func_style_query_doubles.ts)
</details>



### Spy for Command-like

* System under test: [`src/command_user.ts`](./example/src/command_user.ts)
* Depended on component: [`src/command.ts`](./example/src/command.ts)
* Tests: [`src/tests/command_tests.ts`](./example/src/tests/command_tests.ts)
* Vanilla Mock: [`src/tests/command_doubles.ts`](./example/src/tests/command_doubles.ts)



### Complex Usages
#### Stub/Spy for Both Command and Query

* System under test: [`src/complex_user.ts`](./example/src/complex_user.ts)
* Depended on component: [`src/complex.ts`](./example/src/complex.ts)
* Tests: [`src/tests/complex_tests.ts`](./example/src/tests/complex_tests.ts)
* Vanilla Mock: [`src/tests/complex_doubles.ts`](./example/src/tests/complex_doubles.ts)



#### Stub for Many Methods

* System under test: [`src/complex_user.ts`](./example/src/complex_user.ts)
* Depended on component: [`src/complex.ts`](./example/src/complex.ts)
* Tests: [`src/tests/complex_tests.ts`](./example/src/tests/complex_tests.ts)
* Vanilla Mock: [`src/tests/complex_doubles.ts`](./example/src/tests/complex_doubles.ts)



#### Stub for Callbacks

* System under test: [`src/complex_user.ts`](./example/src/complex_user.ts)
* Depended on component: [`src/complex.ts`](./example/src/complex.ts)
* Tests: [`src/tests/complex_tests.ts`](./example/src/tests/complex_tests.ts)
* Vanilla Mock: [`src/tests/complex_doubles.ts`](./example/src/tests/complex_doubles.ts)



Refactoring Guides for Typical Smells
-------------------------------------

See [README.md](/README.md#refactoring-guides-for-typical-smells)



FAQ
---

See [README.md](/README.md#faq)



Contributing
------------

Any suggetions are welcome.
Feel free to open issues to discuss about Vanilla DI.
