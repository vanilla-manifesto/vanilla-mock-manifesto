import XCTest
@testable import VanillaMockExample



class NamedQueryTests: XCTestCase {
    func testUsingNamedQueryStub() {
        let sut = ActualQueryUser(query: anySuccessfulQuery())

        sut.doSomething()
    }
}