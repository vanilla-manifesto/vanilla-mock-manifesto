Swift with Vanilla Mock
=======================



Code Examples
-------------

### Stub for Query-like

* System under test: [`Sources/VanillaMockExample/QueryUser.swift`](./example/Sources/VanillaMockExample/QueryUser.swift)
* Depended on component: [`Sources/VanillaMockExample/Query.swift`](./example/Sources/VanillaMockExample/Query.swift)
* Tests: [`Tests/VanillaMockExampleTests/QueryTests.swift`](./example/Tests/VanillaMockExampleTests/QueryTests.swift)
* Vanilla Mock: [`Tests/VanillaMockExampleTests/QueryDoubles.swift`](./example/Tests/VanillaMockExampleTests/QueryDoubles.swift)


<details>
<summary>Advanced Usages</summary>

#### Named Stub for Query-like

* Tests: [`Tests/VanillaMockExampleTests/Advanced/NamedQueryTests.swift`](./example/Tests/VanillaMockExampleTests/Advanced/NamedQueryTests.swift)
* Vanilla Mock: [`Tests/VanillaMockExampleTests/Advanced/NamedQueryDoubles.swift`](./example/Tests/VanillaMockExampleTests/Advanced/NamedQueryDoubles.swift)



#### Stub for Anonymous Function Style Query

* Tests: [`Tests/VanillaMockExampleTests/Advanced/AnonFuncStyleQueryTests.swift`](./example/Tests/VanillaMockExampleTests/Advanced/AnonFuncStyleQueryTests.swift)
* Vanilla Mock: [`Tests/VanillaMockExampleTests/Advanced/AnonFuncStyleQueryDoubles.swift`](./example/Tests/VanillaMockExampleTests/Advanced/AnonFuncStyleQueryDoubles.swift)
</details>



### Spy for Command-like

* System under test: [`Sources/VanillaMockExample/CommandUser.swift`](./example/Sources/VanillaMockExample/CommandUser.swift)
* Depended on component: [`Sources/VanillaMockExample/Command.swift`](./example/Sources/VanillaMockExample/Command.swift)
* Tests: [`Tests/VanillaMockExampleTests/CommandTests.swift`](./example/Tests/VanillaMockExampleTests/CommandTests.swift)
* Vanilla Mock: [`Tests/VanillaMockExampleTests/CommandDoubles.swift`](./example/Tests/VanillaMockExampleTests/CommandDoubles.swift)



### Complex Usages
#### Stub/Spy for Both Command and Query

* System under test: [`Sources/VanillaMockExample/ComplexUser.swift`](./example/Sources/VanillaMockExample/ComplexUser.swift)
* Depended on component: [`Sources/VanillaMockExample/Complex.swift`](./example/Sources/VanillaMockExample/Complex.swift)
* Tests: [`Tests/VanillaMockExampleTests/ComplexTests.swift`](./example/Tests/VanillaMockExampleTests/ComplexTests.swift)
* Vanilla Mock: [`Tests/VanillaMockExampleTests/ComplexDoubles.swift`](./example/Tests/VanillaMockExampleTests/ComplexDoubles.swift)



#### Stub for Many Methods

* System under test: [`Sources/VanillaMockExample/ComplexUser.swift`](./example/Sources/VanillaMockExample/ComplexUser.swift)
* Depended on component: [`Sources/VanillaMockExample/Complex.swift`](./example/Sources/VanillaMockExample/Complex.swift)
* Tests: [`Tests/VanillaMockExampleTests/ComplexTests.swift`](./example/Tests/VanillaMockExampleTests/ComplexTests.swift)
* Vanilla Mock: [`Tests/VanillaMockExampleTests/ComplexDoubles.swift`](./example/Tests/VanillaMockExampleTests/ComplexDoubles.swift)



#### Stub for Callbacks

* System under test: [`Sources/VanillaMockExample/ComplexUser.swift`](./example/Sources/VanillaMockExample/ComplexUser.swift)
* Depended on component: [`Sources/VanillaMockExample/Complex.swift`](./example/Sources/VanillaMockExample/Complex.swift)
* Tests: [`Tests/VanillaMockExampleTests/ComplexTests.swift`](./example/Tests/VanillaMockExampleTests/ComplexTests.swift)
* Vanilla Mock: [`Tests/VanillaMockExampleTests/ComplexDoubles.swift`](./example/Tests/VanillaMockExampleTests/ComplexDoubles.swift)
