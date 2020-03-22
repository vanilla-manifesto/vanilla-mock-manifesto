@testable import VanillaMockExample


class BothCommandAndQueryStub: ExampleBothCommandAndQueryProtocol {
    var nextResult: Int


    // NOTE: Default parameter is useful to represent don't-care value.
    init(willReturn nextResult: Int = -1) {
        self.nextResult = nextResult
    }


    func doSomething(foo: Bool, bar: Int) -> Int {
        self.nextResult
    }
}



class BothCommandAndQuerySpy: ExampleBothCommandAndQueryProtocol {
    enum CallArgs: Equatable {
        case doSomething(foo: Bool, bar: Int)
    }


    // NOTE: Dynamic inheritance is a handy technique in this case.
    var inherited: ExampleBothCommandAndQueryProtocol
    private(set) var callArgs = [CallArgs]()


    // NOTE: Default parameter is useful to represent don't-care value.
    init(dynamicallyInheriting inherited: ExampleBothCommandAndQueryProtocol = BothCommandAndQueryStub()) {
        self.inherited = inherited
    }


    func doSomething(foo: Bool, bar: Int) -> Int {
        self.callArgs.append(.doSomething(foo: foo, bar: bar))
        return self.inherited.doSomething(foo: foo, bar: bar)
    }
}



class ExampleManyMethodsStub: ExampleManyMethodsProtocol {
    var barResult: Int
    var bazResult: Int


    // NOTE: Should hold return values for each methods.
    // NOTE: Default parameter is useful to represent don't-care value.
    init(barResult: Int = -1, bazResult: Int = -1) {
        self.barResult = barResult
        self.bazResult = bazResult
    }


    func foo(_ i: Int) {}
    func bar() -> Int { self.barResult }
    func baz(_ j: Int) -> Int { self.bazResult }
}



// BAD: Too long test double definition. It is a code smell tell you should separate
//      ExampleManyMethods into several independent components.
class ExampleManyMethodsSpy: ExampleManyMethodsProtocol {
    enum CallArgs: Equatable {
        case foo(Int)
        case bar
        case baz(Int)
    }


    // NOTE: Dynamic inheritance is a handy technique in this case.
    //       You can keep DRY between spies and stubs to hold return values for each methods.
    public var inherited: ExampleManyMethodsProtocol

    // NOTE: Should hold indirect output histories for each methods.
    private(set) var callArgs = [CallArgs]()


    // NOTE: Default parameter is useful to represent don't-care value.
    init(dynamicallyInheriting inherited: ExampleManyMethodsProtocol = ExampleManyMethodsStub()) {
        self.inherited = inherited
    }


    func foo(_ i: Int) {
        self.callArgs.append(.foo(i))
        self.inherited.foo(i)
    }


    func bar() -> Int {
        self.callArgs.append(.bar)
        return self.inherited.bar()
    }


    func baz(_ j: Int) -> Int {
        self.callArgs.append(.baz(j))
        return self.inherited.baz(j)
    }
}



class ExampleCallbackStub: ExampleCallbackProtocol {
    private var callback: ((String) -> Void)?


    func doSomethingAsync(callback: @escaping (String) -> Void) {
        self.callback = callback
    }


    func fireCallback(x: String) {
        self.callback?(x)
    }
}
