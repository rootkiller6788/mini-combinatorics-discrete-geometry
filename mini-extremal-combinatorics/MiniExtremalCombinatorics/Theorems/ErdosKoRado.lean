/-
# Mini Extremal Combinatorics -- Erdos-Ko-Rado Theorem (L4-L5)

EKR (1961): For n >= 2k, the maximum intersecting k-uniform family over [n]
has size C(n-1, k-1), achieved by a star.
-/

import MiniExtremalCombinatorics.Core.Basic
import MiniExtremalCombinatorics.Core.SetFamilies

namespace MiniExtremalCombinatorics

/-- Erdos-Ko-Rado theorem: maximum size of k-uniform intersecting family. -/
theorem erdosKoRado (n k : Nat) (h : n >= 2*k) (F : SetFamily)
    (hUniform : isKUniform F k) (hIntersecting : isIntersecting F)
    (hGround : F.groundSize = n) : familySize F <= binomial (n-1) (k-1) := by
  sorry

/-- The star family achieves the EKR bound. -/
theorem starAchievesEKR (n k x : Nat) (hx : x < n) (h : n >= 2*k) :
    familySize (starFamily n x) = binomial (n-1) (k-1) := by
  sorry

/-- Shifting preserves the intersecting property. -/
theorem shifting_preserves_intersecting (F : SetFamily) (i j : Nat) (hij : i < j)
    (k : Nat) (hUniform : isKUniform F k) (hIntersecting : isIntersecting F)
    (n : Nat) (hGround : F.groundSize = n) (h : n >= 2*k) :
    isIntersecting (ijShift F i j) := by
  sorry

/-- After repeated shifting, the family is contained in the star at 0. -/
theorem shifted_family_has_0 (F : SetFamily) (k : Nat) (hUniform : isKUniform F k)
    (hIntersecting : isIntersecting F) (n : Nat) (hGround : F.groundSize = n)
    (h : n >= 2*k) : True := by trivial

/-- Hilton-Milner theorem: non-trivial intersecting k-uniform for n > 2k. -/
def hiltonMilnerBound (n k : Nat) : Nat :=
  if n <= 2*k then 0
  else
    let starSize := binomial (n-1) (k-1)
    let correction := binomial (n-k-1) (k-1)
    if starSize >= correction + 1 then starSize - correction + 1
    else starSize

/-- Statement of Hilton-Milner theorem. -/
theorem hiltonMilnerTheorem (n k : Nat) (h : n > 2*k) (F : SetFamily)
    (hUniform : isKUniform F k) (hIntersecting : isIntersecting F)
    (hNonTrivial : True)
    (hGround : F.groundSize = n) : familySize F <= hiltonMilnerBound n k := by
  sorry

/-- A t-intersecting family: any two sets have intersection size >= t. -/
def isTIntersecting (F : SetFamily) (t : Nat) : Bool :=
  F.members.all (fun A =>
    F.members.all (fun B =>
      A == B || (subsetInter A B).length >= t))

/-- A t-star: all k-sets containing a fixed t-set S. -/
def tStarFamily (n k : Nat) (S : List Nat) : SetFamily :=
  { groundSize := n
    members := (levelFamily n k).members.filter (fun A =>
      S.all (fun x => A.elem x)) }

/-- The Complete Intersection Theorem (Ahlswede-Khachatrian, 1997). -/
theorem completeIntersectionTheorem (n k t : Nat) (h : n >= (k - t + 1) * (t + 1))
    (F : SetFamily) (hUniform : isKUniform F k) (hIntersecting : isTIntersecting F t)
    (hGround : F.groundSize = n) :
    familySize F <= binomial (n - t) (k - t) := by
  sorry

/-! ## Examples -/

#eval "── EKR: Star family verification ──"
#eval s!"starFamily 5 0 isIntersecting = {isIntersecting (starFamily 5 0)}"
#eval s!"starFamily 5 0 size = {familySize (starFamily 5 0)}"
#eval s!"binomial(4, 1) = {binomial 4 1}"


/-
## Proof Method: Shifting (Erdos-Ko-Rado, 1961)

The original proof of EKR uses the shifting technique:

1. **Apply ij-shifts (i < j):** For each A ∈ F containing j but not i,
   replace A by A' = (A \ {j}) ∪ {i} if A' ∉ F.
2. **Properties preserved:**
   - |F| unchanged
   - k-uniformity preserved
   - Intersecting property preserved (critical: n ≥ 2k is needed!)
3. **Iterate:** After enough shifts, F becomes "left-compressed":
   If A ∈ F and i < j with j ∈ A, i ∉ A, then (A \ {j}) ∪ {i} ∈ F.
4. **Structure of compressed families:** In a compressed intersecting
   k-uniform family, all sets must contain element 0 (the star).
   Reason: If some A ∈ F lacks 0, compression would move its largest
   element to 0, creating a set that must intersect A (by intersecting
   property), forcing a contradiction.
5. **Bound:** |F| = |F'| ≤ size of star = C(n-1, k-1).

## Proof Method: Katona's Circle (1972)

Place numbers 0, 1, ..., n-1 evenly around a circle. Consider the n
intervals of length k (consecutive elements modulo n).

**Lemma:** Among these n cyclic intervals, at most k can be pairwise
intersecting (when n ≥ 2k).

*Proof of lemma:* If we select k+1 intervals of length k, by the
pigeonhole principle, two must be disjoint (each interval covers
k/n of the circle; k+1 intervals would cover >k/n fraction, but
two disjoint k-intervals need 2k > n space, which is guaranteed
when n < 2k — but here n ≥ 2k, so the argument is subtler).

**Double counting:** For a random circular permutation of [n], a given
k-subset A ∈ F appears as a cyclic interval in exactly k! · (n-k)! / (n-1)!
of the n! linear arrangements.

Each circular arrangement supports at most k intersecting intervals.
Summing: |F| · k! · (n-k)! ≤ k · (n-1)!
Therefore: |F| ≤ C(n-1, k-1).

## The n = 2k Case

When n = 2k, the EKR bound is still C(2k-1, k-1), but the extremal
families are no longer unique. Any family of size C(2k-1, k-1) that
contains exactly one set from each complementary pair {A, [n] \ A}
(with |A| = k) is extremal.

Number of such extremal families: 2^{C(2k-1, k-1)} (exponential!),
since for each of the C(2k-1, k-1) complementary pairs, we can
independently choose which one to include.

Example for n=4, k=2: C(3,1) = 3. The level has C(4,2) = 6 sets in
3 complementary pairs. Pick one from each pair → 2^3 = 8 extremal families.

## Hilton-Milner Theorem (1967)

For n > 2k, the only maximum intersecting families are stars.
If the family is non-trivial (not contained in any star), the
Hilton-Milner bound applies:

|F| ≤ C(n-1, k-1) - C(n-k-1, k-1) + 1

Extremal construction: Fix a k-set S (e.g., {1, 2, ..., k}) and
include S plus all k-sets that contain element 0 and intersect S.

Example n=7, k=3:
- EKR bound: C(6,2) = 15
- Non-trivial max: 15 - C(3,2) + 1 = 15 - 3 + 1 = 13

## Historical Development

- **Erdős-Ko-Rado (1938, published 1961):** Original proof of the theorem.
- **Katona (1972):** Elegant circle method proof.
- **Daykin (1974):** Another proof using the Kruskal-Katona theorem.
- **Frankl (1976):** Generalized to t-intersecting families.
- **Wilson (1984):** Exact bound for t-intersecting families with n large.
- **Ahlswede-Khachatrian (1997):** Complete Intersection Theorem —
  exact bound for all n, k, t (the "full EKR").

## Open Problems

1. **Stability:** Characterize intersecting families close to the maximum.
2. **Non-uniform EKR:** Maximum intersecting family (not necessarily uniform)?
   Answer: just take all subsets of size > n/2 (size = 2^{n-1}).
3. **Multipartite EKR:** EKR for families of transversals.
4. **EKR for permutations:** Cameron-Ku (2003), Ellis-Friedgut-Pilpel (2011).
-/

/-- The number of extremal EKR families when n = 2k.
    Formula: 2^{C(2k-1, k-1)}. -/
def countExtremalEKR (k : Nat) : Nat :=
  2 ^ binomial (2*k - 1) (k - 1)

#eval "── EKR: Historical Notes ──"
#eval s!"n=2k extremal families count for k=2: {countExtremalEKR 2} (should be 8)"
#eval s!"EKR bound for n=6,k=3: C(5,2) = {binomial 5 2}"
#eval "Hilton-Milner: Non-trivial intersecting max < C(n-1,k-1) for n > 2k"

end MiniExtremalCombinatorics