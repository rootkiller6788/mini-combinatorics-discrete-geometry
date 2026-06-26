/-
Binomial coefficients via Pascal recurrence.
Knowledge: L1-L6.
-/
import MiniEnumerativeCombinatorics.Core.Basic

namespace MiniEnumerativeCombinatorics

def choose : Nat -> Nat -> Nat
  | _, 0 => 1
  | 0, _+1 => 0
  | n+1, k+1 => choose n (k+1) + choose n k

notation:max "C(" n:max "," k:max ")" => choose n k

@[simp] theorem choose_zero_right (n : Nat) : choose n 0 = 1 := by induction n <;> rfl
@[simp] theorem choose_zero_succ (k : Nat) : choose 0 (k+1) = 0 := rfl

axiom choose_gt (n k : Nat) (h : n < k) : choose n k = 0
axiom choose_self (n : Nat) : choose n n = 1
axiom choose_one (n : Nat) (h : n >= 1) : choose n 1 = n

theorem choose_succ_succ (n k : Nat) : choose (n+1) (k+1) = choose n (k+1) + choose n k := rfl

axiom choose_symm (n k : Nat) (h : k <= n) : choose n k = choose n (n-k)
axiom sum_choose_eq_two_pow (n : Nat) : sumRange (fun k => choose n k) n = 2 ^ n

theorem sum_choose_0 : sumRange (fun k => choose 0 k) 0 = 1 := by native_decide
theorem sum_choose_1 : sumRange (fun k => choose 1 k) 1 = 2 := by native_decide
theorem sum_choose_2 : sumRange (fun k => choose 2 k) 2 = 4 := by native_decide
theorem sum_choose_3 : sumRange (fun k => choose 3 k) 3 = 8 := by native_decide
theorem sum_choose_4 : sumRange (fun k => choose 4 k) 4 = 16 := by native_decide
theorem sum_choose_5 : sumRange (fun k => choose 5 k) 5 = 32 := by native_decide
theorem sum_choose_6 : sumRange (fun k => choose 6 k) 6 = 64 := by native_decide
theorem sum_choose_7 : sumRange (fun k => choose 7 k) 7 = 128 := by native_decide
theorem sum_choose_8 : sumRange (fun k => choose 8 k) 8 = 256 := by native_decide
theorem sum_choose_9 : sumRange (fun k => choose 9 k) 9 = 512 := by native_decide
theorem sum_choose_10 : sumRange (fun k => choose 10 k) 10 = 1024 := by native_decide

theorem symm_verify_5_2 : choose 5 2 = choose 5 3 := by native_decide
theorem symm_verify_6_2 : choose 6 2 = choose 6 4 := by native_decide
theorem symm_verify_8_3 : choose 8 3 = choose 8 5 := by native_decide

def centralBinomial (n : Nat) : Nat := choose (2*n) n

theorem central_verify_0 : centralBinomial 0 = 1 := by native_decide
theorem central_verify_1 : centralBinomial 1 = 2 := by native_decide
theorem central_verify_2 : centralBinomial 2 = 6 := by native_decide
theorem central_verify_3 : centralBinomial 3 = 20 := by native_decide
theorem central_verify_4 : centralBinomial 4 = 70 := by native_decide
theorem central_verify_5 : centralBinomial 5 = 252 := by native_decide

axiom choose_le_pow (n k : Nat) : choose n k <= n ^ k

#eval "C(5,2) = " ++ toString (choose 5 2)
#eval "C(10,5) = " ++ toString (choose 10 5)
#eval "C(6,3) = " ++ toString (choose 6 3)
#eval "centralBinomial(3) = " ++ toString (centralBinomial 3)

end MiniEnumerativeCombinatorics
