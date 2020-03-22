@testable import VanillaMockExample


// NOTE: If the test case does not depend on any query behaviors, you can use the "any stub" as a don't care value.
func anyExampleQuery() -> ExampleQueryProtocol {
    ExampleQueryStub(willReturn: "ANY")
}


// NOTE: One of usual patterns of named query stubs are successful or failed stubs.
//       Successful query stub should return a value represent success. If you have a type like Result<V, E>,
//       then successful query stub should return the value of Success<V>.
func anySuccessfulQuery() -> ExampleQueryProtocol {
    ExampleQueryStub(willReturn: "OK")
}


// NOTE: Failed query stub should return a value represent failure. If you have a type like Result<V, E>,
//       then the failed query stub should return the value of Failure<E>.
func anyFailedQuery() -> ExampleQueryProtocol {
    ExampleQueryStub(willReturn: "NG")
}