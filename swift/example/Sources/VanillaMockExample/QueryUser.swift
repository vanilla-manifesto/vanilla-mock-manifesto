class ActualQueryUser {
    private let query: ExampleQueryProtocol


    init(query: ExampleQueryProtocol) {
        self.query = query
    }


    func doSomething() -> String {
        // ...

        self.query.fetchSomething()
    }
}