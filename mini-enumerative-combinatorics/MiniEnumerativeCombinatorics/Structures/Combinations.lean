/-
Combinations, multisets, compositions. Knowledge: L1-L7.
-/
import MiniEnumerativeCombinatorics.Core.Basic
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

open Nat

def kCombinations (n k : Nat) : List (List Nat) :=
  if k = 0 then [[]]
  else if n = 0 then []
  else
    let withFirst := (kCombinations (n-1) (k-1)).map (fun s => (n-1) :: s)
    let withoutFirst := kCombinations (n-1) k
    withFirst ++ withoutFirst

theorem kCombinations_count (n k : Nat) : (kCombinations n k).length = choose n k := by
  induction n with m ih generalizing k
  · cases k <;> simp [kCombinations, choose]
  · cases' k with k'
    · simp [kCombinations, choose]
    · simp [kCombinations, choose_succ_succ, ih, List.length_append, List.length_map]

def generateCombinations (n k : Nat) : List (List Nat) :=
  match k with
  | 0 => [[]]
  | k'+1 => if n < k'+1 then [] else
    (generateCombinations (n-1) (k'+1)).map (fun s => 0 :: s) ++
    (generateCombinations (n-1) k').map (fun s => List.map (fun x => x+1) s)

theorem generateCombinations_count (n k : Nat) (h : k <= n) : (generateCombinations n k).length = choose n k := by
  induction n with m ih generalizing k
  · have hk0 : k = 0 := by omega; subst hk0; simp [generateCombinations, choose]
  · cases' k with k'
    · simp [generateCombinations, choose]
    · simp [generateCombinations, choose_succ_succ, ih (k'+1) (by omega), ih k' (by omega), List.length_append, List.length_map]

def weakCompositions (n k : Nat) : Nat := choose (n + k - 1) (k - 1)

theorem weakCompositions_verify_5_3 : weakCompositions 5 3 = 21 := by native_decide

#eval "C(5,2) combinations: " ++ toString ((kCombinations 5 2).length)
#eval "generate C(4,2): " ++ toString (generateCombinations 4 2)

end MiniEnumerativeCombinatorics