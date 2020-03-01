// XXX: 3 complex examples, but complexity like this should be design smells.


// BAD: Should redesign to achieve Command-Query Separation.
export interface ExampleBothCommandAndQuery {
  doSomething(foo: boolean, bar: number): number;
}


// BAD: Should separate into several small interfaces.
export interface ExampleManyMethods {
  foo(i: number): void;
  bar(): number;
  baz(j: number): number;
}


// BAD: Should use Promises if available.
export interface ExampleCallback {
  doSomethingAsync(callback: (x: string) => void): void;
}
