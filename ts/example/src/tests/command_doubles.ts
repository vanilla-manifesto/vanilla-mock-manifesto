import {ExampleCommand} from "../command";



export class ExampleCommandNull implements ExampleCommand {
  doSomething(foo: boolean, bar: number): void {}
}



export class ExampleCommandSpy implements ExampleCommand {
  // NOTE: Spies for Commands must have records of how the Command were called.
  calledArgs: [boolean, number][] = [];


  doSomething(foo: boolean, bar: number): void {
    // Records how were called.
    this.calledArgs.push([foo, bar]);
  }
}
