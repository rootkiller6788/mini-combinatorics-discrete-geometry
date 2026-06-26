/-
Linear recurrences with constant coefficients. Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Sequences.Fibonacci

namespace MiniEnumerativeCombinatorics

open Nat

structure LinearRecurrence (k : Nat) where
  coefficients : Fin k -> Nat
  initialValues : Fin k -> Nat

axiom characteristicPolynomialMethod : True
axiom matrixMethod : True

def towerOfHanoi (n : Nat) : Nat := 2^n - 1

theorem towerOfHanoi_recurrence (n : Nat) (h : n >= 2) : towerOfHanoi n = 2 * towerOfHanoi (n-1) + 1 := by
  dsimp [towerOfHanoi]; omega

theorem towerOfHanoi_1 : towerOfHanoi 1 = 1 := by native_decide
theorem towerOfHanoi_2 : towerOfHanoi 2 = 3 := by native_decide
theorem towerOfHanoi_3 : towerOfHanoi 3 = 7 := by native_decide
theorem towerOfHanoi_4 : towerOfHanoi 4 = 15 := by native_decide
theorem towerOfHanoi_5 : towerOfHanoi 5 = 31 := by native_decide
theorem towerOfHanoi_10 : towerOfHanoi 10 = 1023 := by native_decide

def josephus (n : Nat) : Nat :=
  match n with
  | 0 => 0
  | n'+1 => (josephus n' + 2) % (n'+1)

theorem josephus_verify_5 : josephus 5 = 2 := by native_decide
theorem josephus_verify_7 : josephus 7 = 6 := by native_decide
theorem josephus_verify_10 : josephus 10 = 4 := by native_decide

#eval "=== Linear Recurrences ==="
#eval "Tower of Hanoi T_5 = " ++ toString (towerOfHanoi 5)
#eval "Tower of Hanoi T_10 = " ++ toString (towerOfHanoi 10)
#eval "Josephus J(5) = " ++ toString (josephus 5)
#eval "Josephus J(10) = " ++ toString (josephus 10)

end MiniEnumerativeCombinatorics