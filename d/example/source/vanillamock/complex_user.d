module vanillamock.complex_user;

import vanillamock.complex : ExampleBothCommandAndQuery, ExampleManyMethods, ExampleTask;

import std.parallelism : Task, task;

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

class ActualTaskUser
{
private:
    ExampleTask innerTask;

public:
    bool isCalled;

    this(ExampleTask task)
    {
        this.innerTask = task;
    }

    void doSomething(string x)
    {
        this.innerTask.doSomethingAsync((_x) { this.isCalled = true; }, x);
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

    class ExampleTaskStub : ExampleTask
    {
    private:
        typeof(task((void delegate(string)).init, "")) inner;

    public:
        void doSomethingAsync(void delegate(string) del, string x)
        {
            this.inner = task(del, x);
        }

        void executeTask()
        {
            this.inner.executeInNewThread();
        }

        void yieldForce()
        {
            this.inner.yieldForce();
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
    auto stub = new ExampleTaskStub;
    auto sut = new ActualTaskUser(stub);
    sut.doSomething("Hello, World!");
    stub.executeTask();
    stub.yieldForce();  // Ensure be executed.
    assert(sut.isCalled);
}
