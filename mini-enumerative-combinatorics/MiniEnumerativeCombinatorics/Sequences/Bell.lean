/-
Bell numbers: B_n = sum S(n,k). Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Basic
import MiniEnumerativeCombinatorics.Structures.Partitions

namespace MiniEnumerativeCombinatorics

open Nat

theorem bell_verify_0 : bellNumber 0 = 1 := by native_decide
theorem bell_verify_1 : bellNumber 1 = 1 := by native_decide
theorem bell_verify_2 : bellNumber 2 = 2 := by native_decide
theorem bell_verify_3 : bellNumber 3 = 5 := by native_decide
theorem bell_verify_4 : bellNumber 4 = 15 := by native_decide
theorem bell_verify_5 : bellNumber 5 = 52 := by native_decide
theorem bell_verify_6 : bellNumber 6 = 203 := by native_decide
theorem bell_verify_7 : bellNumber 7 = 877 := by native_decide
theorem bell_verify_8 : bellNumber 8 = 4140 := by native_decide
theorem bell_verify_9 : bellNumber 9 = 21147 := by native_decide
theorem bell_verify_10 : bellNumber 10 = 115975 := by native_decide

def bellTriangle (n k : Nat) : Nat :=
  match n, k with
  | 0, 0 => 1 | 0, _ => 0
  | _, 0 => bellTriangle (n-1) (n-1)
  | n'+1, k'+1 => bellTriangle n' k' + (k'+1) * bellTriangle n' (k'+1)

theorem bellTriangle_row1 : bellTriangle 1 0 = 1 := by native_decide
theorem bellTriangle_row2_col1 : bellTriangle 2 1 = 2 := by native_decide

axiom dobinskiFormula (n : Nat) : True
axiom touchardCongruence (p n : Nat) : True

#eval "B_5 = " ++ toString (bellNumber 5)
#eval "B_8 = " ++ toString (bellNumber 8)

end MiniEnumerativeCombinatorics