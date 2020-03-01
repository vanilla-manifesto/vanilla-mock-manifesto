import {ExampleBothCommandAndQuery, ExampleManyMethods, ExampleCallback} from "../complex";



export class BothCommandAndQueryStub implements ExampleBothCommandAndQuery {
  constructor(public nextResult: number) {}


  doSomething(foo: boolean, bar: number): number {
    return this.nextResult;
  }
}


export function anyBothCommandAndQueryStub(): BothCommandAndQueryStub {
  return new BothCommandAndQueryStub(-1);
}



export class BothCommandAndQuerySpy implements ExampleBothCommandAndQuery {
  // NOTE: Dynamic inheritance is a handy technique in this case.
  constructor(public inherited: ExampleBothCommandAndQuery) {}


  calledArgs: [boolean, number][] = [];


  doSomething(foo: boolean, bar: number): number {
    this.calledArgs.push([foo, bar]);

    return this.inherited.doSomething(foo, bar);
  }
}



export class ExampleManyMethodsStub implements ExampleManyMethods {
  // NOTE: Should hold return values for each methods.
  constructor(public nextBarResult: number, public nextBazResult: number) {}


  foo(i: number): void {}


  bar(): number {
    return this.nextBarResult;
  }


  baz(j: number): number {
    return this.nextBazResult;
  }
}



// BAD: Too long test double definition. It is a code smell tell you should separate
//      ExampleManyMethods into several independent components.
export class ExampleManyMethodsSpy implements ExampleManyMethods {
  // NOTE: Dynamic inheritance is a handy technique in this case.
  //       You can keep DRY between spies and stubs to hold return values for each methods.
  constructor(public inherited: ExampleManyMethods) {}


  // NOTE: Should hold indirect output histories for each methods.
  fooCalledArgs: [number][] = [];
  bazCalledArgs: [number][] = [];


  foo(i: number): void {
    this.fooCalledArgs.push([i]);
    this.inherited.foo(i);
  }


  bar(): number {
    return this.inherited.bar();
  }


  baz(j: number): number {
    this.bazCalledArgs.push([j]);
    return this.inherited.baz(j);
  }
}



export class ExampleCallbackStub implements ExampleCallback {
  private callback: (x: string) => void = () => undefined;


  doSomethingAsync(callback: (x: string) => void): void {
    this.callback = callback;
  }


  fireCallback(x: string) {
    this.callback(x);
  }
}
