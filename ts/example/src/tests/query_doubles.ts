import {ExampleQuery} from "../query";


export class ExampleQueryStub implements ExampleQuery {
  constructor(public nextResult: string) {}


  fetchSomething(): string {
    return this.nextResult;
  }
}


// NOTE: You can write ExampleQuerySpy, but it is not recommended.
//       Because Queries should not have any indirect output.
//       So spies for query should not be needed.
