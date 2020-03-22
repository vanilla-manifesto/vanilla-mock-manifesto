import XCTest
@testable import VanillaMockExample



class AnonFuncStyleQueryTest: XCTestCase {
    func testUsingAnonFuncStub() {
        let query = { "Hello, World!" }

        let sut = ActualAnonFuncStyleQueryUser(query: query)

        let actual = sut.doSomething()
        XCTAssertEqual(actual, "Hello, World!")
    }


    func testUsingNamedFuncStub() {
        let sut = ActualAnonFuncStyleQueryUser(query: anyExampleAnonFuncStyleQuery)

        _ = sut.doSomething()
    }
}