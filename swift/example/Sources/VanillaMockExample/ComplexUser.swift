class ActualBothCommandAndQueryUser {
    private let cmdAndQuery: ExampleBothCommandAndQueryProtocol


    init(cmdAndQuery: ExampleBothCommandAndQueryProtocol) {
        self.cmdAndQuery = cmdAndQuery
    }


    func doSomething() -> Int {
        self.cmdAndQuery.doSomething(foo: true, bar: 123)
    }
}



class ActualManyMethodsUser {
    private let manyMethods: ExampleManyMethodsProtocol


    init(manyMethods: ExampleManyMethodsProtocol) {
        self.manyMethods = manyMethods
    }


    func doSomething() -> Int {
        self.manyMethods.foo(123)
        let i = self.manyMethods.bar()
        return self.manyMethods.baz(i)
    }
}



class ActualCallbackUser {
    private let callback: ExampleCallbackProtocol
    private(set) var isCalled = false


    init(_ callback: ExampleCallbackProtocol) {
        self.callback = callback
    }


    func doSomething() {
        self.callback.doSomethingAsync { _ in self.isCalled = true }
    }
}