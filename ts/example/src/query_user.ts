import {ExampleQuery} from "./query";



export class ActualQueryUser {
  constructor(private query: ExampleQuery) {}


  doSomething() {
    // ...

    return this.query.fetchSomething();
  }
}