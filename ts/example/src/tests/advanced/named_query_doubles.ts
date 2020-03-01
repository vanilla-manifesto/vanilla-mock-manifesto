import {ExampleQuery} from "../../query";
import {ExampleQueryStub} from "../query_doubles";


// NOTE: If the test case does not depend on any query behaviors, you can use the "any stub" as a don't care value.
export function anyExampleQuery(): ExampleQuery {
  return new ExampleQueryStub("ANY");
}


// NOTE: One of usual patterns of named query stubs are successful or failed stubs.
//       Successful query stub should return a value represent success. If you have a type like:
//
//          type Result<V, E> = Success<V> | Failure<E>
//
//       then, the successful query stub should return the value of Success<V>.
export function anySuccessfulQuery(): ExampleQuery {
  return new ExampleQueryStub("OK");
}


// NOTE: Failed query stub should return a value represent failure. If you have a type like:
//
//          type Result<V, E> = Success<V> | Failure<E>
//
//       then, the failed query stub should return the value of Failure<E>.
export function anyFailedQuery(): ExampleQuery {
  return new ExampleQueryStub("NG");
}
