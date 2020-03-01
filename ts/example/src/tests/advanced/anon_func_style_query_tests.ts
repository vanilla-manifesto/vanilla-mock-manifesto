import assert from "assert";
import {ActualAnonFuncStyleQueryUser} from "./anon_func_style_query_user";
import {anyExampleAnonFuncStyleQuery} from "./anon_func_style_query_doubles";



// NOTE: Anonymous function as stub is one of handy and flexible approaches.
export function testUsingAnonFuncStub() {
  const query = () => "Hello, World!";

  const sut = new ActualAnonFuncStyleQueryUser(query);

  const actual = sut.doSomething();
  assert.strictEqual(actual, "Hello, World!")
}



// NOTE: Also named stubs are useful for Anonymous function style queries.
export function testUsingNamedFuncStub() {
  const sut = new ActualAnonFuncStyleQueryUser(anyExampleAnonFuncStyleQuery);

  assert.doesNotThrow(() => {
    sut.doSomething();
  });
}