# odin_regression_tests

Regression tests for bugs found in the Odin compiler.

## Status

|                        Issue#                       |                                         Result                                        |
|-----------------------------------------------------|---------------------------------------------------------------------------------------|
| [642](https://github.com/odin-lang/Odin/issues/642) | OK                                                                                    |
| [647](https://github.com/odin-lang/Odin/issues/647) | OK                                                                                    |
| [674](https://github.com/odin-lang/Odin/issues/674) | OK                                                                                    |
| [705](https://github.com/odin-lang/Odin/issues/705) | OK                                                                                    |
| [708](https://github.com/odin-lang/Odin/issues/708) | OK                                                                                    |
| [714](https://github.com/odin-lang/Odin/issues/714) | OK            																		  |
| [718](https://github.com/odin-lang/Odin/issues/718) | OK            																		  |

## How to use

```sh
$ git submodule update --init
$ make
```

Example output:

```
clang -O0 -g -Wno-switch -Wno-pointer-sign -Wno-tautological-constant-out-of-range-compare -Wno-tautological-compare -Wno-macro-redefined -pthread -ldl -lm -lstdc++ -std=c++11 -liconv Odin/src/main.cpp -o Odin/odin-debug
Odin commit:
cbfe3571ab73eeb91b636c58455b1fbe3bcd1c1e
================================================================================
Running 642 with ../Odin/odin-debug ...
Odin/src/ir.cpp(1003): Panic: Invalid abi type pass kind: proc()
make[1]: *** [all] Illegal instruction: 4
================================================================================
Running 647 with ../Odin/odin-debug ...
OK
================================================================================
Running 674 with ../Odin/odin-debug ...
Odin/src/array.cpp(14): Assertion Failure: `0 <= index && index < count` Index 2 is out of bounds ranges 0..<2
make[1]: *** [all] Illegal instruction: 4
================================================================================
Running 705 with ../Odin/odin-debug ...
Odin/src/ir.cpp(6290): Panic: NOT FOUND ir_type_info_index u64 @ index 98
make[1]: *** [all] Illegal instruction: 4
================================================================================
Running 706 with ../Odin/odin-debug ...
/Users/oskar/code/github/oskarnp/odin_regression_tests/706/test.odin(44:2) runtime assertion
make[1]: *** [all] Trace/BPT trap: 5
make: *** [test1] Error 2
```
