module vanillamock.query;

interface ExampleQuery
{
    string fetchSomething();
}

class AcutalQuery : ExampleQuery
{
    string fetchSomething()
    {
        // Do something.
        return "something great content";
    }
}
