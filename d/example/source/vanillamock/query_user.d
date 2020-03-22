module vanillamock.query_user;

import vanillamock.query : ExampleQuery;

class ActualQueryUser
{
private:
    ExampleQuery query;

public:
    this(ExampleQuery query)
    {
        this.query = query;
    }

    string doSomething()
    {
        // ...
        return this.query.fetchSomething();
    }
}

/**
 * NOTE: This example does not use any Test Frameworks, because Vanilla-Mock can
 *       work on any Test Frameworks.
 */
version (unittest)
{
    class ExampleQueryStub : ExampleQuery
    {
        string nextResult;

        this(string nextResult)
        {
            this.nextResult = nextResult;
        }

        string fetchSomething()
        {
            return this.nextResult;
        }
    }
}

unittest
{
    auto query = new ExampleQueryStub("Hello, World!");
    auto sut = new ActualQueryUser(query);
    auto actual = sut.doSomething();
    assert(actual == "Hello, World!");
}

unittest
{
    /**
     * NOTE: You can write ExampleQuerySpy, but it is not recomended
     *       because queries should not have any indirect output.
     *       So spies for query is unnecessary.
     */
}
