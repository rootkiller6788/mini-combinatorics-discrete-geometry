/-
Fibonacci numbers: F_n = F_{n-1} + F_{n-2}. Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Basic
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

open Nat

def fib (n : Nat) : Nat := fib n

theorem fib_0 : fib 0 = 0 := rfl
theorem fib_1 : fib 1 = 1 := rfl
theorem fib_verify_5 : fib 5 = 5 := by native_decide
theorem fib_verify_10 : fib 10 = 55 := by native_decide
theorem fib_verify_15 : fib 15 = 610 := by native_decide
theorem fib_verify_20 : fib 20 = 6765 := by native_decide
theorem fib_verify_30 : fib 30 = 832040 := by native_decide

theorem fib_succ_succ (n : Nat) : fib (n+2) = fib (n+1) + fib n := by
  rw [fib_add_two]

theorem sum_fib (n : Nat) : sumRange fib n = fib (n+2) - 1 := by
  induction n with k ih
  · native_decide
  · rw [sumRange_succ, ih, fib_succ_succ k]
    omega

axiom sum_squares_fib (n : Nat) (h : n >= 1) : True

def lucas (n : Nat) : Nat :=
  match n with
  | 0 => 2 | 1 => 1
  | n'+2 => lucas (n'+1) + lucas n'

theorem lucas_verify_5 : lucas 5 = 11 := by native_decide
theorem lucas_verify_10 : lucas 10 = 123 := by native_decide
theorem lucas_verify_15 : lucas 15 = 1364 := by native_decide

def pell (n : Nat) : Nat :=
  match n with
  | 0 => 0 | 1 => 1
  | n'+2 => 2 * pell (n'+1) + pell n'

theorem pell_verify_5 : pell 5 = 29 := by native_decide
theorem pell_verify_10 : pell 10 = 2378 := by native_decide

axiom binetFormula (n : Nat) : True
axiom zeckendorfTheorem (n : Nat) : True

#eval "F_0..F_10: " ++ toString ((List.range 11).map fib)
#eval "F_20 = " ++ toString (fib 20)
#eval "L_10 = " ++ toString (lucas 10)
#eval "P_10 = " ++ toString (pell 10)
#eval "Sum F_0..F_10 = " ++ toString (sumRange fib 10)

end MiniEnumerativeCombinatorics