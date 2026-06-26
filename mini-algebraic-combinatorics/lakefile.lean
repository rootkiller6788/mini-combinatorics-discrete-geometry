import Lake
open Lake DSL

package «mini-algebraic-combinatorics» where
  -- Algebraic Combinatorics package

@[default_target]
lean_lib «AlgebraicCombinatorics» where
  roots := #[`AlgebraicCombinatorics]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"

/-- Smoke test executable -/
lean_exe «smoke-test» where
  root := `Test.Smoke
  supportInterpreter := true

/-- Examples executable -/
lean_exe «example-test» where
  root := `Test.Examples
  supportInterpreter := true
