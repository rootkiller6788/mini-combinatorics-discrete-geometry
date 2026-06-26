/-
Permutation structures. Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Basic

namespace MiniEnumerativeCombinatorics

structure Perm (n : Nat) where
  toFun : Fin n -> Fin n
  invFun : Fin n -> Fin n
  left_inv : forall x, invFun (toFun x) = x
  right_inv : forall x, toFun (invFun x) = x

def permId (n : Nat) : Perm n :=
  { toFun := id, invFun := id, left_inv := fun _ => rfl, right_inv := fun _ => rfl }

axiom sign {n : Nat} (p : Perm n) : Int

theorem factorial_verify_3 : factorial 3 = 6 := by native_decide
theorem factorial_verify_4 : factorial 4 = 24 := by native_decide
theorem factorial_verify_5 : factorial 5 = 120 := by native_decide

#eval "=== Permutations ==="
#eval "|S_3| = 3! = " ++ toString (factorial 3)
#eval "|S_4| = 4! = " ++ toString (factorial 4)
#eval "|S_5| = 5! = " ++ toString (factorial 5)

end MiniEnumerativeCombinatorics