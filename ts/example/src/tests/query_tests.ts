// NOTE: This example does not use any Test Frameworks because Vanilla-Mock can work on any Test Frameworks.

import assert from "assert";
import {ExampleQueryStub} from "./query_doubles";
import {ActualQueryUser} from "../query_user";


export function testUsingQueryStub() {
  const query = new ExampleQueryStub("Hello, World!");

  const sut = new ActualQueryUser(query);

  const actual = sut.doSomething();
  assert.strictEqual(actual, "Hello, World!");
}
