/-
Rule of sum and product counting principles. Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Basic
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

open Nat

def countFunctions (m n : Nat) : Nat := n ^ m
def countInjections (n k : Nat) : Nat := if k <= n then falling n k else 0
def countPermutations (n : Nat) : Nat := factorial n
def countSubsets (n : Nat) : Nat := 2 ^ n
def countKSubsets (n k : Nat) : Nat := choose n k
def countWords (n k : Nat) : Nat := n ^ k
def countWordsNoRepeat (n k : Nat) : Nat := if k <= n then falling n k else 0
def countMultisets (n k : Nat) : Nat := choose (n + k - 1) k
def countCompositions (n k : Nat) : Nat := if 1 <= k ∧ k <= n then choose (n-1) (k-1) else 0
def countWeakCompositions (n k : Nat) : Nat := if k >= 1 then choose (n + k - 1) (k - 1) else 0
def countLatticePaths (m n : Nat) : Nat := choose (m + n) m
def countDyckPaths (n : Nat) : Nat := choose (2*n) n / (n+1)

theorem verify_functions_3_2 : countFunctions 3 2 = 8 := by native_decide
theorem verify_injections_5_3 : countInjections 5 3 = 60 := by native_decide
theorem verify_permutations_5 : countPermutations 5 = 120 := by native_decide
theorem verify_subsets_4 : countSubsets 4 = 16 := by native_decide
theorem verify_ksubsets_5_2 : countKSubsets 5 2 = 10 := by native_decide
theorem verify_words_4_3 : countWords 4 3 = 64 := by native_decide
theorem verify_norepeat_5_3 : countWordsNoRepeat 5 3 = 60 := by native_decide
theorem verify_multisets_4_2 : countMultisets 4 2 = 10 := by native_decide
theorem verify_compositions_5_2 : countCompositions 5 2 = 4 := by native_decide
theorem verify_weak_5_3 : countWeakCompositions 5 3 = 21 := by native_decide
theorem verify_lattice_2_3 : countLatticePaths 2 3 = 10 := by native_decide
theorem verify_dyck_3 : countDyckPaths 3 = 5 := by native_decide
theorem verify_dyck_4 : countDyckPaths 4 = 14 := by native_decide

#eval "=== Counting Formulas ==="
#eval "Functions [3]->[2]: " ++ toString (countFunctions 3 2)
#eval "Injections [3]->[5]: " ++ toString (countInjections 5 3)
#eval "K-subsets C(10,3): " ++ toString (countKSubsets 10 3)
#eval "Multisets MS(4,2): " ++ toString (countMultisets 4 2)
#eval "Compositions C(5,2): " ++ toString (countCompositions 5 2)
#eval "Lattice paths (2,3): " ++ toString (countLatticePaths 2 3)
#eval "Dyck paths n=4: " ++ toString (countDyckPaths 4)

end MiniEnumerativeCombinatorics