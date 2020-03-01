// NOTE: This example does not use any Test Frameworks because Vanilla-Mock can work on any Test Frameworks.

import assert from "assert";
import {ExampleCommandNull, ExampleCommandSpy} from "./command_doubles";
import {ActualCommandUser} from "../command_user";


// EXAMPLE: If the test case do not depend on any command behaviors, you can use **stubs**.
export function testUsingCommandStub() {
  const command = new ExampleCommandNull();

  const sut = new ActualCommandUser(command);

  assert.doesNotThrow(() => {
    sut.doEverything()
  });
}


// EXAMPLE: If the test case should verify indirect output, you can use **spy**.
export function testUsingCommandSpy() {
  const command = new ExampleCommandSpy();

  const sut = new ActualCommandUser(command);

  sut.doEverything();

  assert.strictEqual(command.calledArgs.length, 1);
}