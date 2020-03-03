// XXX: 3 complex examples, but complexity like this should be desing smells.
module vanillamock.complex;

// BAD: should re-design to achieve Command-Query separation.
interface ExampleBothCommandAndQuery
{
    int doSomething(bool foo, int bar);
}

// BAD: should separate into several small interfaces.
interface ExampleManyMethods
{
    void foo(int i);
    int bar();
    int baz(int j);
}

// BAD?: should use promises if available.
interface ExampleCallback
{
    void doSomethingAsync(void delegate(string x));
}
