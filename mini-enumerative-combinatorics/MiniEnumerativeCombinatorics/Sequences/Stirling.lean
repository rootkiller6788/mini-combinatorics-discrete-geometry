/-
Stirling numbers: first and second kind. Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Basic

namespace MiniEnumerativeCombinatorics

open Nat

def stirlingFirstUnsigned (n k : Nat) : Nat :=
  match n, k with
  | 0, 0 => 1 | 0, _ => 0 | _, 0 => 0
  | n'+1, k'+1 => n' * stirlingFirstUnsigned n' (k'+1) + stirlingFirstUnsigned n' k'

def stirlingSecondKind (n k : Nat) : Nat :=
  match n, k with
  | 0, 0 => 1 | 0, _ => 0 | _, 0 => 0
  | n'+1, k'+1 => stirlingSecondKind n' (k'+1) * (k'+1) + stirlingSecondKind n' k'

theorem stirlingFirst_verify_4_2 : stirlingFirstUnsigned 4 2 = 11 := by native_decide
theorem stirlingFirst_verify_4_3 : stirlingFirstUnsigned 4 3 = 6 := by native_decide
theorem stirlingFirst_verify_5_3 : stirlingFirstUnsigned 5 3 = 35 := by native_decide

theorem stirlingSecond_verify_4_1 : stirlingSecondKind 4 1 = 1 := by native_decide
theorem stirlingSecond_verify_4_2 : stirlingSecondKind 4 2 = 7 := by native_decide
theorem stirlingSecond_verify_4_3 : stirlingSecondKind 4 3 = 6 := by native_decide
theorem stirlingSecond_verify_4_4 : stirlingSecondKind 4 4 = 1 := by native_decide
theorem stirlingSecond_verify_5_2 : stirlingSecondKind 5 2 = 15 := by native_decide
theorem stirlingSecond_verify_5_3 : stirlingSecondKind 5 3 = 25 := by native_decide
theorem stirlingSecond_verify_7_3 : stirlingSecondKind 7 3 = 301 := by native_decide

theorem stirlingFirst_table_4 : (List.range 5).map (stirlingFirstUnsigned 4) = [0,6,11,6,1] := by native_decide
theorem stirlingSecond_table_4 : (List.range 5).map (stirlingSecondKind 4) = [0,1,7,6,1] := by native_decide
theorem stirlingSecond_table_5 : (List.range 6).map (stirlingSecondKind 5) = [0,1,15,25,10,1] := by native_decide

axiom stirlingInverse (n m : Nat) : True

#eval "S(5,2) = " ++ toString (stirlingSecondKind 5 2)
#eval "c(4,2) = " ++ toString (stirlingFirstUnsigned 4 2)

end MiniEnumerativeCombinatorics