/-
CS applications: sorting, BST, hashing, complexity. Knowledge: L7.
-/
import MiniEnumerativeCombinatorics.Core.Binomial
import MiniEnumerativeCombinatorics.Core.Factorials
import MiniEnumerativeCombinatorics.Sequences.Catalan

namespace MiniEnumerativeCombinatorics

open Nat

def bubbleSortComparisons (n : Nat) : Nat := choose n 2
def mergeSortComparisons (n : Nat) : Nat := n * (Nat.log 2 n)
def bstCount (n : Nat) : Nat := catalan n
def hashNoCollision (m n : Nat) : Nat := falling m n

theorem bubble_verify_5 : bubbleSortComparisons 5 = 10 := by native_decide
theorem bubble_verify_10 : bubbleSortComparisons 10 = 45 := by native_decide
theorem bst_verify_3 : bstCount 3 = 5 := by native_decide
theorem bst_verify_5 : bstCount 5 = 42 := by native_decide

#eval "=== CS Applications ==="
#eval "Bubble sort n=10: C(10,2) = " ++ toString (bubbleSortComparisons 10)
#eval "BST shapes n=5: C_5 = " ++ toString (bstCount 5)
#eval "Hash no collision m=365 n=23: " ++ toString (hashNoCollision 365 23)
#eval "2^10 subsets = " ++ toString (2^10) ++ " (exponential)"
#eval "10! permutations = " ++ toString (factorial 10) ++ " (super-exponential)"
#eval "C(20,10) = " ++ toString (choose 20 10) ++ " (intractable)"
#eval "Merge sort n=16: ~" ++ toString (mergeSortComparisons 16)
#eval "Zeckendorf: 100 = 89+8+3 (non-consecutive Fibonacci)"
#eval "Euclidean algorithm worst case: consecutive Fibonacci"
#eval "Binary search: O(log n) comparisons"

end MiniEnumerativeCombinatorics