protocol ExampleQueryProtocol {
    func fetchSomething() -> String
}


class ExampleQuery: ExampleQueryProtocol {
    func fetchSomething() -> String {
        // Do something.
        "something great content"
    }
}