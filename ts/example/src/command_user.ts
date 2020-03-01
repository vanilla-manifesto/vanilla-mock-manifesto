import {ExampleCommand} from "./command";



export class ActualCommandUser {
  constructor(private command: ExampleCommand) {
  }


  doEverything() {
    // Do something.
    this.command.doSomething(true, 123);
  }
}