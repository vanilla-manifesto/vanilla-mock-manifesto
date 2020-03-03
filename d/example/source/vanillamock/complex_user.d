module vanillamock.complex_user;

import vanillamock.complex : ExampleBothCommandAndQuery, ExampleCallback, ExampleManyMethods;

class ActualBothCommandAndQueryUser
{
private:
    ExampleBothCommandAndQuery cmdAndQuery;

public:
    this(ExampleBothCommandAndQuery cmdAndQuery)
    {
        this.cmdAndQuery = cmdAndQuery;
    }

    int doSomething()
    {
        // Do something.
        return this.cmdAndQuery.doSomething(true, 123);
    }
}

class ActualManyMethodsUser
{
private:
    ExampleManyMethods manyMethods;

public:
    this(ExampleManyMethods manyMethods)
    {
        this.manyMethods = manyMethods;
    }

    int doSomething()
    {
        this.manyMethods.foo(123);
        auto i = this.manyMethods.bar();
        return this.manyMethods.baz(i);
    }
}

class ActualCallbackUser
{
private:
    ExampleCallback callback;

public:
    bool isCalled;

    this(ExampleCallback callback)
    {
        this.callback = callback;
    }

    void doSomething()
    {
        this.callback.doSomethingAsync((_x){ this.isCalled = true; });
    }
}

version (unittest)
{
    class BothCommandAndQueryStub : ExampleBothCommandAndQuery
    {
        int nextResult;

        this(int nextResult)
        {
            this.nextResult = nextResult;
        }

        int doSomething(bool foo, int bar)
        {
            return this.nextResult;
        }
    }

    BothCommandAndQueryStub anyBothCommandAndQueryStub()
    {
        return new BothCommandAndQueryStub(-1);
    }

    class BothCommandAndQuerySpy : ExampleBothCommandAndQuery
    {
        import std.typecons : Tuple, tuple;
        alias CalledArg = Tuple!(bool, int);

        CalledArg[] calledArgs;
        ExampleBothCommandAndQuery inherited;

        this(ExampleBothCommandAndQuery inherited)
        {
            this.inherited = inherited;
        }

        int doSomething(bool foo, int bar)
        {
            this.calledArgs ~= tuple(foo, bar);
            return this.inherited.doSomething(foo, bar);
        }
    }

    class ExampleManyMethodsStub : ExampleManyMethods
    {
        int nextBarResult;
        int nextBazResult;

        this(int nextBarResult, int nextBazResult)
        {
            this.nextBarResult = nextBarResult;
            this.nextBazResult = nextBazResult;
        }

        void foo(int i) {}

        int bar()
        {
            return this.nextBarResult;
        }

        int baz(int j)
        {
            return this.nextBazResult;
        }
    }

    // BAD: Too long test double definition. It is a code smell tell you should separate
    //      ExampleManyMethods into several independent components.
    class ExampleManyMethodsSpy : ExampleManyMethods
    {
        import std.typecons : Tuple, tuple;
        alias FooCalledArg = Tuple!(int);
        alias BazCalledArg = Tuple!(int);

        // NOTE: Should hold indirect output histories for each methods.
        FooCalledArg[] fooCalledArgs;
        BazCalledArg[] bazCalledArgs;

        ExampleManyMethods inherited;

        // NOTE: Dynamic inheritance is a handy technique in this case.
        //       You can keep DRY between spies and stubs to hold return values for each methods.
        this(ExampleManyMethods inherited)
        {
            this.inherited = inherited;
        }

        void foo(int i)
        {
            this.fooCalledArgs ~= tuple(i);
            this.inherited.foo(i);
        }

        int bar()
        {
            return this.inherited.bar();
        }

        int baz(int j)
        {
            this.bazCalledArgs ~= tuple(j);
            return this.inherited.baz(j);
        }
    }

    class ExampleCallbackStub : ExampleCallback
    {
    private:
        void delegate(string x) callback;

    public:
        void doSomethingAsync(void delegate(string) callback)
        {
            this.callback = callback;
        }

        void fireCallback(string x)
        {
            this.callback(x);
        }
    }
}

unittest
{
    auto spy = new BothCommandAndQuerySpy(anyBothCommandAndQueryStub());
    auto sut = new ActualBothCommandAndQueryUser(spy);
    sut.doSomething();
    assert(spy.calledArgs.length == 1);
}

unittest
{
    auto stub = new ExampleManyMethodsStub(123, 456);
    auto sut = new ActualManyMethodsUser(stub);
    auto actual = sut.doSomething();
    assert(actual == 456);
}

unittest
{
    auto stub = new ExampleManyMethodsSpy(new ExampleManyMethodsStub(123, 456));
    auto sut = new ActualManyMethodsUser(stub);
    auto actual = sut.doSomething();
    assert(actual == 456);
}

unittest
{
    auto stub = new ExampleCallbackStub;
    auto sut = new ActualCallbackUser(stub);
    sut.doSomething();
    stub.fireCallback("Hello, World!");
    assert(sut.isCalled);
}
