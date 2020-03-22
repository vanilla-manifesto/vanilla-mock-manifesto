protocol ExampleCommandProtocol {
    func doSomething(foo: Bool, bar: Int)
}


class ExampleCommand: ExampleCommandProtocol {
    func doSomething(foo: Bool, bar: Int) {
        // Do something.
    }
}