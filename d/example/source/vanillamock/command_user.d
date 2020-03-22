module vanillamock.command_user;

import vanillamock.command : ExampleCommand;

class ActualCommandUser
{
    ExampleCommand command;

    this(ExampleCommand command)
    {
        this.command = command;
    }

    void doEverything()
    {
        // Do somthing.
        this.command.doSomething(true, 123);
    }
}

/**
 * NOTE: This example does not use any Test Frameworks bacause Vanilla-Mock can
 *       work on any Test Framework.
 */

version (unittest)
{
    class ExampleCommandNull : ExampleCommand
    {
        void doSomething(bool foo, int bar) {}
    }

    class ExampleCommandSpy : ExampleCommand
    {
        import std.typecons : Tuple, tuple;
        alias CalledArg = Tuple!(bool, int);

        // Spies for Commands must have records of how the Command were called.
        CalledArg[] calledArgs;

        void doSomething(bool foo, int bar)
        {
            // Record how were called.
            this.calledArgs ~= tuple(foo, bar);
        }
    }
}

unittest
{
    // EXAMPLE: If the test case do not depend on any command behavior, you can use **stub**.
    import std.exception : assertNotThrown;
    auto command = new ExampleCommandNull;
    auto sut = new ActualCommandUser(command);
    assertNotThrown(sut.doEverything());
}

unittest
{
    // EXAMPLE: If the test case should verify indirect output, you can use **spy**.
    auto command = new ExampleCommandSpy;
    auto sut = new ActualCommandUser(command);
    sut.doEverything;
    assert(command.calledArgs.length == 1);
}
