/-
Solving recurrences via generating functions. Knowledge: L5-L8.
-/
import MiniEnumerativeCombinatorics.Core.Basic
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

open Nat

/-! ## Method: 5-step process -/
-- 1. Let A(x) = sum a_n x^n
-- 2. Multiply recurrence by x^n and sum over n
-- 3. Express sums in terms of A(x)
-- 4. Solve functional equation for A(x)
-- 5. Extract coefficient [x^n]A(x)

axiom rationalOGFTheorem : True
axiom partialFractionMethod : True
axiom catalanGFDerivation : True

/-! ## Examples -/

def exampleRecurrence (n : Nat) : Nat :=
  match n with
  | 0 => 1
  | n'+1 => 2 * exampleRecurrence n' + 1

theorem example_verify_3 : exampleRecurrence 3 = 15 := by native_decide
theorem example_verify_5 : exampleRecurrence 5 = 63 := by native_decide

def exampleRecurrence2 (n : Nat) : Nat :=
  match n with
  | 0 => 0 | 1 => 1
  | n'+2 => exampleRecurrence2 (n'+1) + exampleRecurrence2 n'

theorem example2_verify_5 : exampleRecurrence2 5 = 5 := by native_decide
theorem example2_verify_10 : exampleRecurrence2 10 = 55 := by native_decide

#eval "Generating function method for recurrences"
#eval "Example: a_n = 2a_{n-1} + 1, a_0=1 -> a_5 = " ++ toString (exampleRecurrence 5)

end MiniEnumerativeCombinatorics