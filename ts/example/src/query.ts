export interface ExampleQuery {
  fetchSomething(): string;
}


export class ActualQuery implements ExampleQuery {
  fetchSomething(): string {
    // Do something.
    return "something great content";
  }
}