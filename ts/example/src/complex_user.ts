import {ExampleBothCommandAndQuery, ExampleCallback, ExampleManyMethods} from "./complex";



export class ActualBothCommandAndQueryUser {
  constructor(private cmdAndQuery: ExampleBothCommandAndQuery) {}


  doSomething(): number {
    // Do something.
    return this.cmdAndQuery.doSomething(true, 123);
  }
}


export class ActualManyMethodsUser {
  constructor(private manyMethods: ExampleManyMethods) {}

  doSomething(): number {
    this.manyMethods.foo(123);
    const i = this.manyMethods.bar();
    return this.manyMethods.baz(i);
  }
}


export class ActualCallbackUser {
  public isCalled = false;

  constructor(private callback: ExampleCallback) {}


  doSomething() {
    this.callback.doSomethingAsync(() => this.isCalled = true);
  }
}