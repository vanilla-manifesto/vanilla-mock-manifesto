import {ExampleAnonFuncStyleQuery} from "./anon_func_style_query";


export class ActualAnonFuncStyleQueryUser {
  constructor(private query: ExampleAnonFuncStyleQuery) {}


  doSomething(): string {
    // Do something.

    return this.query();
  }
}