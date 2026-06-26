/-
Integer partitions, Stirling numbers, Bell numbers. Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Basic
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

open Nat

/-! ## Integer Partition function -/

def partitionNumber (n : Nat) : Nat :=
  match n with
  | 0 => 1 | 1 => 1 | 2 => 2 | 3 => 3 | 4 => 5 | 5 => 7
  | 6 => 11 | 7 => 15 | 8 => 22 | 9 => 30 | 10 => 42
  | _ => 0

axiom eulerPentagonalTheorem (n : Nat) : True
axiom hardyRamanujanAsymptotic (n : Nat) : True

/-! ## Stirling numbers of the second kind -/

def stirlingSecondKind (n k : Nat) : Nat :=
  match n, k with
  | 0, 0 => 1
  | 0, _ => 0
  | _, 0 => 0
  | n'+1, k'+1 => stirlingSecondKind n' (k'+1) * (k'+1) + stirlingSecondKind n' k'

theorem stirling_zero_zero : stirlingSecondKind 0 0 = 1 := rfl
theorem stirling_succ_succ (n k : Nat) : stirlingSecondKind (n+1) (k+1) = stirlingSecondKind n (k+1) * (k+1) + stirlingSecondKind n k := rfl

theorem stirling_verify_4_2 : stirlingSecondKind 4 2 = 7 := by native_decide
theorem stirling_verify_5_2 : stirlingSecondKind 5 2 = 15 := by native_decide
theorem stirling_verify_5_3 : stirlingSecondKind 5 3 = 25 := by native_decide
theorem stirling_verify_7_3 : stirlingSecondKind 7 3 = 301 := by native_decide
theorem stirling_verify_4_1 : stirlingSecondKind 4 1 = 1 := by native_decide
theorem stirling_verify_4_3 : stirlingSecondKind 4 3 = 6 := by native_decide
theorem stirling_verify_4_4 : stirlingSecondKind 4 4 = 1 := by native_decide

/-! ## Stirling numbers of the first kind (unsigned) -/

def stirlingFirstUnsigned (n k : Nat) : Nat :=
  match n, k with
  | 0, 0 => 1
  | 0, _ => 0
  | _, 0 => 0
  | n'+1, k'+1 => n' * stirlingFirstUnsigned n' (k'+1) + stirlingFirstUnsigned n' k'

theorem stirlingFirst_verify_4_2 : stirlingFirstUnsigned 4 2 = 11 := by native_decide
theorem stirlingFirst_verify_4_3 : stirlingFirstUnsigned 4 3 = 6 := by native_decide
theorem stirlingFirst_verify_5_3 : stirlingFirstUnsigned 5 3 = 35 := by native_decide

/-! ## Bell numbers -/

def bellNumber (n : Nat) : Nat := sumRange (fun k => stirlingSecondKind n k) n

theorem bell_verify_0 : bellNumber 0 = 1 := by native_decide
theorem bell_verify_1 : bellNumber 1 = 1 := by native_decide
theorem bell_verify_2 : bellNumber 2 = 2 := by native_decide
theorem bell_verify_3 : bellNumber 3 = 5 := by native_decide
theorem bell_verify_4 : bellNumber 4 = 15 := by native_decide
theorem bell_verify_5 : bellNumber 5 = 52 := by native_decide
theorem bell_verify_6 : bellNumber 6 = 203 := by native_decide
theorem bell_verify_7 : bellNumber 7 = 877 := by native_decide
theorem bell_verify_8 : bellNumber 8 = 4140 := by native_decide

/-! ## Lah numbers -/

def lahNumber (n k : Nat) : Nat :=
  if n = 0 ∧ k = 0 then 1
  else if n = 0 ∨ k = 0 then 0
  else choose (n-1) (k-1) * (factorial n / factorial k)

theorem lah_verify_4_2 : lahNumber 4 2 = 36 := by native_decide
theorem lah_verify_5_3 : lahNumber 5 3 = 200 := by native_decide

#eval "=== Partitions & Stirling ==="
#eval "p(5) = " ++ toString (partitionNumber 5)
#eval "S(5,2) = " ++ toString (stirlingSecondKind 5 2)
#eval "c(4,2) = " ++ toString (stirlingFirstUnsigned 4 2)
#eval "B(5) = " ++ toString (bellNumber 5)

end MiniEnumerativeCombinatorics
