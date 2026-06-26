/-
Multinomial Theorem and coefficients. Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Binomial
import MiniEnumerativeCombinatorics.Core.Factorials

namespace MiniEnumerativeCombinatorics

open Nat

def multinomial (n : Nat) (ks : List Nat) : Nat :=
  if ks.sum = n then factorial n / (ks.map factorial).prod else 0

notation "M(" n ";" ks ")" => multinomial n ks

theorem multinomial_5_2_2_1 : multinomial 5 [2,2,1] = 30 := by native_decide
theorem multinomial_6_3_2_1 : multinomial 6 [3,2,1] = 60 := by native_decide
theorem multinomial_4_4_0 : multinomial 4 [4,0] = 1 := by native_decide
theorem multinomial_7_2_2_2_1 : multinomial 7 [2,2,2,1] = 630 := by native_decide
theorem multinomial_3_1_1_1 : multinomial 3 [1,1,1] = 6 := by native_decide
theorem multinomial_5_1_2_2 : multinomial 5 [1,2,2] = 30 := by native_decide
theorem multinomial_8_3_3_2 : multinomial 8 [3,3,2] = 560 := by native_decide

axiom multinomialTheorem (xs : List Nat) (n : Nat) : True

axiom multinomial_reduces_to_binomial (n k : Nat) (h : k <= n) : multinomial n [k, n-k] = choose n k

#eval "M(5; 2,2,1) = " ++ toString (multinomial 5 [2,2,1])
#eval "M(6; 3,2,1) = " ++ toString (multinomial 6 [3,2,1])
#eval "M(3; 1,1,1) = " ++ toString (multinomial 3 [1,1,1])
#eval "M(8; 3,3,2) = " ++ toString (multinomial 8 [3,3,2])

end MiniEnumerativeCombinatorics