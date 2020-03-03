D with Vanilla Mock
===================

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

* System under test: [`source/vanillamock/query_user.d`](./example/source/vanillamock/query_user.d)
* Depended on component: [`source/vanillamock/query.d`](./example/source/vanillamock/query.d)


### Spy for Command-like

* System under test: [`source/vanillamock/command_user.d`](./example/source/vanillamock/command_user.d)
* Depended on component: [`source/vanillamock/command.d`](./example/source/vanillamock/command.d)

### Complex Usages

#### Stub/Spy for Both Command and Query

* System under test: [`source/vanillamock/complex_user.d`](./example/source/vanillamock/complex_user.d)
* Depended on component: [`source/vanillamock/complex.d`](./example/source/vanillamock/complex.d)

#### Stub for Many Methods

* System under test: [`source/vanillamock/complex_user.d`](./example/source/vanillamock/complex_user.d)
* Depended on component: [`source/vanillamock/complex.d`](./example/source/vanillamock/complex.d)

#### Stub for Callbacks

* System under test: [`source/vanillamock/complex_user.d`](./example/source/vanillamock/complex_user.d)
* Depended on component: [`source/vanillamock/complex.d`](./example/source/vanillamock/complex.d)

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
