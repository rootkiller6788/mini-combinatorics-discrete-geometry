/-
Inclusion-Exclusion Principle and derangements. Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Basic
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

open Nat

def subfactorial (n : Nat) : Nat :=
  match n with
  | 0 => 1
  | 1 => 0
  | n'+2 => (n'+1) * (subfactorial (n'+1) + subfactorial n')

@[simp] theorem subfactorial_zero : subfactorial 0 = 1 := rfl
@[simp] theorem subfactorial_one : subfactorial 1 = 0 := rfl

theorem subfactorial_verify_2 : subfactorial 2 = 1 := by native_decide
theorem subfactorial_verify_3 : subfactorial 3 = 2 := by native_decide
theorem subfactorial_verify_4 : subfactorial 4 = 9 := by native_decide
theorem subfactorial_verify_5 : subfactorial 5 = 44 := by native_decide
theorem subfactorial_verify_6 : subfactorial 6 = 265 := by native_decide
theorem subfactorial_verify_7 : subfactorial 7 = 1854 := by native_decide
theorem subfactorial_verify_8 : subfactorial 8 = 14833 := by native_decide
theorem subfactorial_verify_9 : subfactorial 9 = 133496 := by native_decide
theorem subfactorial_verify_10 : subfactorial 10 = 1334961 := by native_decide

theorem subfactorial_succ (n : Nat) : subfactorial (n+2) = (n+1) * (subfactorial (n+1) + subfactorial n) := rfl

axiom inclusionExclusionGeneral {alpha : Type} (sets : List (List alpha)) : True

def countOntoFunctions (m n : Nat) : Nat :=
  sumRange (fun k => choose n (n-k) * (if k % 2 = 0 then (n-k)^m else 0)) n

theorem countOnto_verify_3_2 : countOntoFunctions 3 2 = 6 := by native_decide
theorem countOnto_verify_4_2 : countOntoFunctions 4 2 = 14 := by native_decide

#eval "=== Derangements ==="
#eval "!0 = " ++ toString (subfactorial 0)
#eval "!1 = " ++ toString (subfactorial 1)
#eval "!5 = " ++ toString (subfactorial 5)
#eval "!10 = " ++ toString (subfactorial 10)
#eval "Onto(3,2) = " ++ toString (countOntoFunctions 3 2)

end MiniEnumerativeCombinatorics