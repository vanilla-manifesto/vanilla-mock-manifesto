module vanillamock.command;

interface ExampleCommand
{
    void doSomething(bool foo, int bar);
}

class ActualCommand : ExampleCommand
{
    void doSomething(bool foo, int bar)
    {
        // Do something.
    }
}
