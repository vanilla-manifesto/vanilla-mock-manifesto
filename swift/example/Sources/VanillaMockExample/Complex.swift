// XXX: 3 complex examples, but complexity like this should be design smells.


// BAD: Should redesign to achieve Command-Query Separation.
protocol ExampleBothCommandAndQueryProtocol {
    func doSomething(foo: Bool, bar: Int) -> Int
}


// BAD: Should separate into several small interfaces.
protocol ExampleManyMethodsProtocol {
    func foo(_ i: Int)
    func bar() -> Int
    func baz(_ j: Int) -> Int
}


// BAD: Should use Promises-like async operation abstractions if available.
protocol ExampleCallbackProtocol {
    func doSomethingAsync(callback: @escaping (String) -> Void)
}