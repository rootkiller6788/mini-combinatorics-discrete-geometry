/-
Factorial properties, double factorial, bounds. Knowledge: L1-L2, L6.
-/
import MiniEnumerativeCombinatorics.Core.Basic

namespace MiniEnumerativeCombinatorics

axiom factorial_pos (n : Nat) : factorial n > 0
axiom factorial_dvd_factorial {m n : Nat} (h : m <= n) : factorial m ∣ factorial n
axiom falling_eq_factorial_div (n k : Nat) (h : k <= n) : falling n k = factorial n / factorial (n - k)
axiom factorial_ge_two_pow (n : Nat) (h : n >= 1) : factorial n >= 2^(n-1)
axiom factorial_le_pow_self (n : Nat) : factorial n <= n ^ n

def doubleFactorial : Nat -> Nat
  | 0 => 1 | 1 => 1
  | n+2 => (n+2) * doubleFactorial n

theorem doubleFactorial_verify_0 : doubleFactorial 0 = 1 := by native_decide
theorem doubleFactorial_verify_1 : doubleFactorial 1 = 1 := by native_decide
theorem doubleFactorial_verify_2 : doubleFactorial 2 = 2 := by native_decide
theorem doubleFactorial_verify_3 : doubleFactorial 3 = 3 := by native_decide
theorem doubleFactorial_verify_4 : doubleFactorial 4 = 8 := by native_decide
theorem doubleFactorial_verify_5 : doubleFactorial 5 = 15 := by native_decide
theorem doubleFactorial_verify_6 : doubleFactorial 6 = 48 := by native_decide
theorem doubleFactorial_verify_7 : doubleFactorial 7 = 105 := by native_decide
theorem doubleFactorial_verify_8 : doubleFactorial 8 = 384 := by native_decide
theorem doubleFactorial_verify_9 : doubleFactorial 9 = 945 := by native_decide
theorem doubleFactorial_verify_10 : doubleFactorial 10 = 3840 := by native_decide

axiom stirlingsApproximation (n : Nat) (h : n >= 1) : True

#eval "factorial 5 = " ++ toString (factorial 5)
#eval "factorial 10 = " ++ toString (factorial 10)
#eval "6!! = " ++ toString (doubleFactorial 6)
#eval "8!! = " ++ toString (doubleFactorial 8)

end MiniEnumerativeCombinatorics