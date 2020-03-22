@testable import VanillaMockExample



class ExampleQueryStub: ExampleQueryProtocol {
    public var nextResult: String


    init(willReturn nextResult: String) {
        self.nextResult = nextResult
    }


    func fetchSomething() -> String {
        self.nextResult
    }
}


// NOTE: You can write ExampleQuerySpy, but it is not recommended.
//       Because Queries should not have any indirect output.
//       So spies for query should not be needed.