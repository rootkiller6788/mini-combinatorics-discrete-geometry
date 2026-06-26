/-
The Twelvefold Way: unified counting framework. Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Binomial
import MiniEnumerativeCombinatorics.Core.Factorials
import MiniEnumerativeCombinatorics.Structures.Partitions

namespace MiniEnumerativeCombinatorics

open Nat

def twelvefold_1_1 (n x : Nat) : Nat := x ^ n
def twelvefold_1_2 (n x : Nat) : Nat := falling x n
def twelvefold_1_3 (n x : Nat) : Nat := factorial x * stirlingSecondKind n x
def twelvefold_2_1 (n x : Nat) : Nat := choose (x + n - 1) n
def twelvefold_2_2 (n x : Nat) : Nat := choose x n
def twelvefold_2_3 (n x : Nat) : Nat := if n >= x ∧ x >= 1 then choose (n-1) (x-1) else 0
def twelvefold_3_1 (n x : Nat) : Nat := sumRange (fun k => stirlingSecondKind n k) x
def twelvefold_3_2 (n x : Nat) : Nat := if n <= x then 1 else 0
def twelvefold_3_3 (n x : Nat) : Nat := stirlingSecondKind n x
def twelvefold_4_1 (n x : Nat) : Nat := partitionNumber n
def twelvefold_4_2 (n x : Nat) : Nat := if n <= x then 1 else 0
def twelvefold_4_3 (n x : Nat) : Nat := partitionNumber n

theorem verify_1_1_2_3 : twelvefold_1_1 2 3 = 9 := by native_decide
theorem verify_1_2_2_3 : twelvefold_1_2 2 3 = 6 := by native_decide
theorem verify_1_3_3_2 : twelvefold_1_3 3 2 = 6 := by native_decide
theorem verify_2_1_3_2 : twelvefold_2_1 3 2 = 4 := by native_decide
theorem verify_2_2_3_2 : twelvefold_2_2 3 2 = 3 := by native_decide
theorem verify_2_3_5_3 : twelvefold_2_3 5 3 = 6 := by native_decide
theorem verify_3_1_3_2 : twelvefold_3_1 3 2 = 4 := by native_decide
theorem verify_3_3_3_2 : twelvefold_3_3 3 2 = 3 := by native_decide

#eval "=== Twelvefold Way ==="
#eval "1-1 (any f): 3^2 = " ++ toString (twelvefold_1_1 2 3)
#eval "1-2 (inj f): P(3,2) = " ++ toString (twelvefold_1_2 2 3)
#eval "1-3 (surj f): 2!*S(3,2) = " ++ toString (twelvefold_1_3 3 2)
#eval "2-1 (f up to perm dom): C(4,3) = " ++ toString (twelvefold_2_1 3 2)
#eval "2-2 (inj f up to perm dom): C(3,2) = " ++ toString (twelvefold_2_2 3 2)
#eval "3-3 (surj f up to perm cod): S(3,2) = " ++ toString (twelvefold_3_3 3 2)

end MiniEnumerativeCombinatorics