/-
Catalan numbers: C_n = C(2n,n)/(n+1). Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

open Nat

def catalan (n : Nat) : Nat := choose (2*n) n / (n+1)

theorem catalan_verify_0 : catalan 0 = 1 := by native_decide
theorem catalan_verify_1 : catalan 1 = 1 := by native_decide
theorem catalan_verify_2 : catalan 2 = 2 := by native_decide
theorem catalan_verify_3 : catalan 3 = 5 := by native_decide
theorem catalan_verify_4 : catalan 4 = 14 := by native_decide
theorem catalan_verify_5 : catalan 5 = 42 := by native_decide
theorem catalan_verify_6 : catalan 6 = 132 := by native_decide
theorem catalan_verify_7 : catalan 7 = 429 := by native_decide
theorem catalan_verify_8 : catalan 8 = 1430 := by native_decide
theorem catalan_verify_9 : catalan 9 = 4862 := by native_decide
theorem catalan_verify_10 : catalan 10 = 16796 := by native_decide
theorem catalan_verify_11 : catalan 11 = 58786 := by native_decide
theorem catalan_verify_12 : catalan 12 = 208012 := by native_decide

axiom catalanRecurrence (n : Nat) : catalan (n+1) * (n+2) = 2 * (2*n+1) * catalan n

def fussCatalan (m n : Nat) : Nat := choose ((m+1)*n) n / (m*n+1)

theorem fussCatalan_verify_2_3 : fussCatalan 2 3 = 12 := by native_decide
theorem fussCatalan_verify_3_2 : fussCatalan 3 2 = 5 := by native_decide

#eval "Catalan C_0..C_12"
#eval "C_5 = " ++ toString (catalan 5)
#eval "C_10 = " ++ toString (catalan 10)

end MiniEnumerativeCombinatorics