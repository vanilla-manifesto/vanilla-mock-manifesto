import XCTest
@testable import VanillaMockExample



class ComplexTests: XCTestCase {
    func testUsingBothCommandAndQuerySpy() {
        let spy = BothCommandAndQuerySpy()

        let sut = ActualBothCommandAndQueryUser(cmdAndQuery: spy)

        _ = sut.doSomething()

        XCTAssertEqual(spy.callArgs.count, 1)
    }


    func testUsingManyMethodsStub() {
        let stub = ExampleManyMethodsStub(barResult: 123, bazResult: 456)

        let sut = ActualManyMethodsUser(manyMethods: stub)

        let actual = sut.doSomething()

        XCTAssertEqual(actual, 456)
    }


    func testUsingManyMethodsSpy() {
        let spy = ExampleManyMethodsSpy(dynamicallyInheriting: ExampleManyMethodsStub(barResult: 456, bazResult: 789))

        let sut = ActualManyMethodsUser(manyMethods: spy)

        _ = sut.doSomething()

        XCTAssertEqual(spy.callArgs, [.foo(123), .bar, .baz(456)])
    }


    func testUsingCallbackStub() {
        let stub = ExampleCallbackStub()

        let sut = ActualCallbackUser(stub)

        sut.doSomething()
        stub.fireCallback(x: "Hello, World!")

        XCTAssertEqual(sut.isCalled, true)
    }
}