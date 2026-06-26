/-
Binomial Theorem: (x+y)^n = sum C(n,k) x^k y^(n-k). Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

open Nat

axiom binomialTheoremNat (x y n : Nat) : (x + y) ^ n = sumRange (fun k => choose n k * x ^ k * y ^ (n - k)) n

theorem binomial_verify_2_3_4 : (2+3)^4 = sumRange (fun k => choose 4 k * 2^k * 3^(4-k)) 4 := by native_decide
theorem binomial_verify_1_1_5 : (1+1)^5 = sumRange (fun k => choose 5 k) 5 := by
  have h := binomialTheoremNat 1 1 5
  simpa using h

theorem binomial_verify_3_2_3 : (3+2)^3 = sumRange (fun k => choose 3 k * 3^k * 2^(3-k)) 3 := by native_decide
theorem binomial_verify_1_4_4 : (1+4)^4 = sumRange (fun k => choose 4 k * 1^k * 4^(4-k)) 4 := by native_decide

theorem binomial_upper_bound (n x y : Nat) : (x + y)^n <= (2 * max x y)^n := by
  have h : x + y <= 2 * max x y := by
    have hx : x <= max x y := Nat.le_max_left _ _
    have hy : y <= max x y := Nat.le_max_right _ _
    omega
  exact Nat.pow_le_pow_left h n

theorem binomial_special_1_plus_1_3 : (1+1)^3 = 8 := by native_decide
theorem binomial_special_2_plus_3_2 : (2+3)^2 = 25 := by native_decide

#eval "=== Binomial Theorem ==="
#eval "(2+3)^4 = " ++ toString ((2+3)^4)
#eval "Sum C(4,k)*2^k*3^(4-k) = " ++ toString (sumRange (fun k => choose 4 k * 2^k * 3^(4-k)) 4)
#eval "(1+1)^5 = " ++ toString ((1+1)^5)

end MiniEnumerativeCombinatorics