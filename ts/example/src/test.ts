import {testUsingQueryStub} from "./tests/query_tests";
import {testUsingCommandSpy, testUsingCommandStub} from "./tests/command_tests";
import {testUsingNamedQueryStub} from "./tests/advanced/named_query_tests";
import {testUsingAnonFuncStub, testUsingNamedFuncStub} from "./tests/advanced/anon_func_style_query_tests";
import {
  testUsingBothCommandAndQuerySpy, testUsingCallbackStub,
  testUsingManyMethodsSpy,
  testUsingManyMethodsStub
} from "./tests/complex_tests";

let isFailed = false;

run(testUsingQueryStub);
run(testUsingCommandStub);
run(testUsingCommandSpy);
run(testUsingNamedQueryStub);
run(testUsingAnonFuncStub);
run(testUsingNamedFuncStub);
run(testUsingBothCommandAndQuerySpy);
run(testUsingManyMethodsStub);
run(testUsingManyMethodsSpy);
run(testUsingCallbackStub);

function run(test: () => void): void {
  try {
    test();
    console.info(`${test.name}: OK`)
  }
  catch (e) {
    isFailed = true;
    console.error(`${test.name}: NG\n${e.message}`)
  }
}

process.exitCode = isFailed ? 1 : 0;
