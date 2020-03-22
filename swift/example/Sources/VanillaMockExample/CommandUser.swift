class ActualCommandUser {
    private let command: ExampleCommandProtocol


    init(command: ExampleCommandProtocol) {
        self.command = command
    }


    func doEveryThing() {
        // Do something.
        self.command.doSomething(foo: true, bar: 123)
    }
}