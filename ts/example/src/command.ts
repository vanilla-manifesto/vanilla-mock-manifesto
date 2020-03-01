export interface ExampleCommand {
  doSomething(foo: boolean, bar: number): void;
}


export class ActualCommand implements ExampleCommand{
  doSomething(foo: boolean, bar: number) {
    // Do something.
  }
}