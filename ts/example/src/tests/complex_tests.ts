import assert from "assert";
import {ActualBothCommandAndQueryUser, ActualCallbackUser, ActualManyMethodsUser} from "../complex_user";
import {
  BothCommandAndQuerySpy,
  anyBothCommandAndQueryStub,
  ExampleCallbackStub,
  ExampleManyMethodsSpy,
  ExampleManyMethodsStub,
} from "./complex_doubles";



export function testUsingBothCommandAndQuerySpy() {
  const spy = new BothCommandAndQuerySpy(anyBothCommandAndQueryStub());

  const sut = new ActualBothCommandAndQueryUser(spy);

  sut.doSomething();

  assert.strictEqual(spy.calledArgs.length, 1);
}


export function testUsingManyMethodsStub() {
  const stub = new ExampleManyMethodsStub(123, 456);

  const sut = new ActualManyMethodsUser(stub);

  const actual = sut.doSomething();
  assert.strictEqual(actual, 456);
}


export function testUsingManyMethodsSpy() {
  const stub = new ExampleManyMethodsSpy(
    new ExampleManyMethodsStub(123, 456)
  );

  const sut = new ActualManyMethodsUser(stub);

  const actual = sut.doSomething();
  assert.strictEqual(actual, 456);
}


export function testUsingCallbackStub() {
  const stub = new ExampleCallbackStub();

  const sut = new ActualCallbackUser(stub);

  sut.doSomething();

  stub.fireCallback("Hello, World!");

  assert.strictEqual(sut.isCalled, true);
}