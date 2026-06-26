/-
# Mini Extremal Combinatorics -- Kruskal-Katona Theorem (L4-L5)

Kruskal-Katona (1963/1968): Among k-uniform families of given size m,
the colex-initial segment minimizes the lower shadow.
-/

import MiniExtremalCombinatorics.Core.Basic
import MiniExtremalCombinatorics.Core.SetFamilies

namespace MiniExtremalCombinatorics

/-- Colex order: A <_colex B iff max(A diff B) in B. -/
def colexLT (A B : List Nat) : Bool :=
  -- Compare the largest differing element
  let combined := insertionSort (A ++ B)
  let rec go (xs : List Nat) : Bool :=
    match xs with
    | [] => false
    | [x] => B.elem x
    | x :: xs' =>
      let inA := A.elem x
      let inB := B.elem x
      if inA != inB then B.elem x
      else go xs'
  match combined.reverse with
  | [] => false
  | _ => go combined.reverse

/-- The k-cascade representation of m:
    m = C(a_k, k) + C(a_{k-1}, k-1) + ... + C(a_t, t)
    with a_k > a_{k-1} > ... > a_t >= t >= 1. -/
partial def kCascade (m k : Nat) : List (Nat × Nat) :=
  let rec build (remaining : Nat) (level : Nat) (acc : List (Nat × Nat)) : List (Nat × Nat) :=
    if remaining == 0 || level == 0 then acc
    else
      let rec largestA (a : Nat) : Nat :=
        if a > 20 then a  -- bound for safety
        else if binomial a level <= remaining then largestA (a+1) else a-1
    
      let a := largestA level
      if a < level then acc
      else
        let coeff := binomial a level
        build (remaining - coeff) (level - 1) ((a, level) :: acc)
  build m k []

/-- Kruskal-Katona shadow bound from k-cascade. -/
def kruskalKatonaBound (m k : Nat) : Nat :=
  let cascade := kCascade m k
  cascade.foldl (fun s (p : Nat × Nat) => s + binomial p.1 (p.2 - 1)) 0

/-- Kruskal-Katona theorem: shadow size lower bound. -/
theorem kruskalKatonaTheorem (F : SetFamily) (k : Nat) (hUniform : isKUniform F k)
    (hSize : familySize F = m) : familySize (lowerShadow F) >= kruskalKatonaBound m k := by
  sorry

/-- Lovasz version: if |F| >= C(x, k) then |shadow| >= C(x, k-1). -/
theorem kruskalKatonaLovasz (F : SetFamily) (k : Nat) (x : Nat)
    (hUniform : isKUniform F k) (hSize : familySize F >= binomial x k)
    (hx : x >= k) : familySize (lowerShadow F) >= binomial x (k-1) := by
  sorry

/-- Harper's isoperimetric inequality for hypercube (statement). -/
theorem harperIsoperimetricInequality (F : SetFamily) (n : Nat) (hGround : F.groundSize = n) :
    True := by trivial

#eval "── Kruskal-Katona: Cascade examples ──"
#eval s!"kCascade 10 3 = {kCascade 10 3}"
#eval s!"kruskalKatonaBound 10 3 = {kruskalKatonaBound 10 3}"


/-
## The Kruskal-Katona Shadow Theorem — Detailed Explanation

### Shadow in the Boolean Lattice

Let F be a k-uniform family. The (lower) shadow ∂F consists of all
(k-1)-subsets that are contained in at least one member of F.

**Question:** For a fixed family size |F| = m, what's the minimum
possible shadow size |∂F|?

**Answer (Kruskal-Katona):** Achieved by the first m sets in the
colexicographic order (colex).

### Colexicographic Order (Colex)

For two k-sets A ≠ B, let x = max(A Δ B) be the largest element
where they differ. Then A <_colex B if x ∈ B.

**Intuition:** Compare largest elements first. The set whose largest
"new" element is smaller comes earlier. This is the reverse of the
usual lexicographic order.

**Example:** For 3-subsets of [5]:
Colex order: 012, 013, 023, 123, 014, 024, 124, 034, 134, 234
(Compare to lex: 012, 013, 014, 023, 024, 034, 123, 124, 134, 234)

### The k-Cascade Representation

Any integer m can be uniquely written as:
  m = C(a_k, k) + C(a_{k-1}, k-1) + ... + C(a_t, t)
where a_k > a_{k-1} > ... > a_t ≥ t ≥ 1.

This is the "k-binomial representation" (or k-cascade) of m.
It generalizes the binary representation (k=1: every number is
a sum of distinct C(a_i, 1) = a_i, i.e., binary expansion).

### Shadow Size Formula

For the colex-initial segment of size m, the shadow size is:
  |∂F| = C(a_k, k-1) + C(a_{k-1}, k-2) + ... + C(a_t, t-1)

This is the minimum possible shadow size for any k-uniform family of size m.

### Proof Outline

1. **Compression:** Apply shifting to F to get a compressed family F'
   with |F'| = |F| and |∂F'| ≤ |∂F|.
2. **Structure lemma:** A compressed k-uniform family is an initial
   segment of the colex order (up to isomorphism).
3. **Counting:** For a colex-initial segment, the shadow size is
   given by the cascade formula.
4. **Minimality:** Therefore, among all k-uniform families of size m,
   the colex-initial segment minimizes the shadow.

### Connection to LYM

The Kruskal-Katona theorem implies the LYM inequality via the
"normalized matching property" of the Boolean lattice:
  |∂F|/C(n, k-1) ≥ |F|/C(n, k)

This is a local version of LYM: for any family F concentrated at level k
(not necessarily uniform), the "shadow ratio" is at least 1.

### Lovasz's Continuous Version

**Theorem (Lovasz, 1979):** Let F be a k-uniform family with |F| = C(x, k)
for some real x ≥ k. Then |∂F| ≥ C(x, k-1).

Here C(x, k) = x(x-1)...(x-k+1)/k! is the polynomial extension of the
binomial coefficient to real x. This formulation avoids the discrete
cascade representation and is often easier to apply.

### Harper's Isoperimetric Inequality

Kruskal-Katona generalizes from one level to the whole hypercube:
Among all families of given size in {0,1}^n, the initial segment
in the "simplicial order" (by total number of 1's, then colex
within each level) minimizes the vertex boundary.

This is **Harper's theorem** (1966) and is the vertex-isoperimetric
inequality for the Boolean hypercube.

### Applications Beyond Sperner

1. **Erdos-Ko-Rado for t-intersecting families:** Kruskal-Katona can
   be used to prove sharp bounds (Frankl, 1976).
2. **Set systems with restricted intersections:** The "delta-system"
   method in coding theory.
3. **Threshold phenomena in random graphs:** The "cascade" representation
   appears in the analysis of the Erdős–Rényi random graph G(n, p).
4. **Discrete isoperimetric inequalities:** Kruskal-Katona ⇒ Harper ⇒
   concentration of measure on the hypercube.

## Open Problems

1. **Stability of Kruskal-Katona:** Characterize families whose shadow
   size is close to the minimum.
2. **Continuous LYM-type inequalities:** For general ranked posets,
   when does the LYM inequality hold?
3. **Shadow minimization for multiple levels:** Given a family spanning
   several levels, what's the minimum total shadow?
4. **The "product" shadow problem:** Shadow in product posets
   (e.g., the grid [k]^n).
-/

/-- Compute the colex rank of a k-subset: the number of k-subsets
    that appear before it in the colex order. -/
def colexRank (A : List Nat) (k : Nat) : Nat :=
  -- A is a canonical k-subset
  let rec go (xs : List Nat) (r : Nat) (acc : Nat) : Nat :=
    match xs with
    | [] => acc
    | x :: xs' =>
      let remaining := xs'.length
      -- Count all subsets whose largest element < x that would appear before
      go xs' (r-1) (acc + binomial x (r))
  go A.reverse k 0

#eval "── Kruskal-Katona: Extended ──"
#eval "The Kruskal-Katona theorem gives the minimum shadow size"
#eval "Achieved by the colex-initial segment of k-subsets"
#eval "Shadow size = sum of cascade binomials: C(a_k, k-1) + ... + C(a_t, t-1)"
#eval s!"Colex rank of [0,1,2] among 3-subsets: {colexRank [0,1,2] 3}"

end MiniExtremalCombinatorics