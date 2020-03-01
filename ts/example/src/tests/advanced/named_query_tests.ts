import assert from "assert";
import {ActualQueryUser} from "../../query_user";
import {anySuccessfulQuery} from "./named_query_doubles";



export function testUsingNamedQueryStub() {
  const sut = new ActualQueryUser(anySuccessfulQuery());

  assert.doesNotThrow(() => {
    sut.doSomething();
  });
}
