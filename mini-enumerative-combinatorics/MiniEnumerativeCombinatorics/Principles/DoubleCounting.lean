/-
Double counting principle and identities. Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Basic
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

open Nat

axiom doubleCountingPrinciple : True

theorem committee_chair_5 : sumRange (fun k => k * choose 5 k) 5 = 5 * 2^4 := by native_decide
theorem committee_chair_6 : sumRange (fun k => k * choose 6 k) 6 = 6 * 2^5 := by native_decide

theorem sum_squares_3 : sumRange (fun k => choose 3 k * choose 3 k) 3 = choose 6 3 := by native_decide
theorem sum_squares_4 : sumRange (fun k => choose 4 k * choose 4 k) 4 = choose 8 4 := by native_decide
theorem sum_squares_5 : sumRange (fun k => choose 5 k * choose 5 k) 5 = choose 10 5 := by native_decide

axiom sum_squares_choose_general (n : Nat) : sumRange (fun k => choose n k * choose n k) n = choose (2*n) n
axiom committee_chair_general (n : Nat) (h : n >= 1) : sumRange (fun k => k * choose n k) n = n * 2^(n-1)

axiom spernerTheorem (n : Nat) : True
axiom lymInequality (n : Nat) : True
axiom handshakingLemma : True

#eval "=== Double Counting ==="
#eval "Committee-chair: sum k*C(5,k) = 5*16 = 80"
#eval "Sum squares: sum C(4,k)^2 = C(8,4) = 70"
#eval "Double counting: same set counted two ways"

end MiniEnumerativeCombinatorics