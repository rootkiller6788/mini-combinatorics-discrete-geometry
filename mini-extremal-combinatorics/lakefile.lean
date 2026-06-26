import Lake
open Lake DSL

package «mini-extremal-combinatorics» where

@[default_target]
lean_lib «MiniExtremalCombinatorics» where
  roots := #[`MiniExtremalCombinatorics]

lean_exe «smoke-test» where
  root := `Test.Smoke
  supportInterpreter := true

lean_exe «example-test» where
  root := `Test.Examples
  supportInterpreter := true

lean_exe «regression-test» where
  root := `Test.Regression
  supportInterpreter := true
