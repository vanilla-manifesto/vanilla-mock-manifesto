@testable import VanillaMockExample


class ExampleCommandNull: ExampleCommandProtocol {
    func doSomething(foo: Bool, bar: Int) {}
}



class ExampleCommandSpy: ExampleCommandProtocol {
    enum CallArgs: Equatable {
        case doSomething(foo: Bool, bar: Int)
    }


    private(set) var callArgs = [CallArgs]()


    func doSomething(foo: Bool, bar: Int) {
        self.callArgs.append(.doSomething(foo: foo, bar: bar))
    }
}
