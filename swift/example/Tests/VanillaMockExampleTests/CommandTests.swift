import XCTest
@testable import VanillaMockExample



class CommandTests: XCTestCase {
    // EXAMPLE: If the test case do not depend on any command behaviors, you can use **stubs**.
    func testUsingCommandStub() {
        let command = ExampleCommandNull()

        let sut = ActualCommandUser(command: command)

        sut.doEveryThing()
    }


    // EXAMPLE: If the test case should verify indirect output, you can use **spy**.
    func testUsingCommandSpy() {
        let commandSpy = ExampleCommandSpy()

        let sut = ActualCommandUser(command: commandSpy)

        sut.doEveryThing()

        XCTAssertEqual(commandSpy.callArgs.count, 1)
    }
}