class ActualAnonFuncStyleQueryUser {
    private let query: ExampleAnonFuncStyleQueryProtocol


    init(query: @escaping ExampleAnonFuncStyleQueryProtocol) {
        self.query = query
    }


    func doSomething() -> String {
        // Do something.

        self.query()
    }
}