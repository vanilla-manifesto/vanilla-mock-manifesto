import XCTest
@testable import VanillaMockExample



class QueryTests: XCTestCase {
    func testUsingQueryStub() {
        let query = ExampleQueryStub(willReturn: "Hello, World!")

        let sut = ActualQueryUser(query: query)

        let actual = sut.doSomething()

        XCTAssertEqual(actual, "Hello, World!")
    }
}