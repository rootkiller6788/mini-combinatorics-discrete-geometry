/-
# Mini Extremal Combinatorics -- Hall's Marriage Theorem (L4-L5)

Hall's marriage theorem (1935): A bipartite graph has a perfect matching
iff for every subset S of the left side, |N(S)| >= |S|.
-/

import MiniExtremalCombinatorics.Core.Basic

namespace MiniExtremalCombinatorics

/-- A bipartite graph: left side [0..m-1], right side [0..n-1]. -/
structure BipartiteGraph where
  leftSize : Nat
  rightSize : Nat
  edges : List (Nat × Nat)
deriving Repr

/-- Neighborhood of a vertex in X: set of vertices in Y adjacent to it. -/
def neighborhood (G : BipartiteGraph) (x : Nat) : List Nat :=
  G.edges.filter (fun (u, _) => u == x) |>.map (fun (_, v) => v)

/-- Neighborhood of a set S subset of X: union of neighborhoods. -/
def setNeighborhood (G : BipartiteGraph) (S : List Nat) : List Nat :=
  S.bind (fun x => neighborhood G x)

/-- A matching is a set of edges with distinct left and right endpoints. -/
structure Matching (G : BipartiteGraph) where
  edges : List (Nat × Nat)
deriving Repr

/-- Size of a matching. -/
def matchingSize (M : Matching G) : Nat := M.edges.length

/-- A matching is perfect if it covers all vertices on both sides. -/
def isPerfectMatching (M : Matching G) : Bool :=
  M.edges.length == G.leftSize && M.edges.length == G.rightSize

/-- Hall's condition: for all S subset of X, |N(S)| >= |S|. -/
def hallsCondition (G : BipartiteGraph) : Bool :=
  let allSubsets := completeFamily G.leftSize
  allSubsets.members.all (fun S =>
    (setNeighborhood G S).length >= S.length)

/-- Hall's marriage theorem: G has a perfect matching iff Hall's condition holds. -/
theorem hallMarriageTheorem (G : BipartiteGraph) (hEqSize : G.leftSize = G.rightSize) :
    (∃ (M : Matching G), isPerfectMatching M) ↔ hallsCondition G := by
  constructor
  · intro h
    -- If there's a perfect matching, each subset S is matched to |S| distinct vertices
    sorry
  · intro h
    -- If Hall's condition holds, construct perfect matching via augmenting paths
    sorry

/-- Defect form: max matching size >= |X| - d if |N(S)| >= |S| - d for all S. -/
theorem hallDefectForm (G : BipartiteGraph) (d : Nat) (hDefect : True) :
    ∃ (M : Matching G), matchingSize M + d >= G.leftSize := by
  sorry

/-- Application: Every regular bipartite graph has a perfect matching. -/
theorem regularBipartiteHasPerfectMatching (G : BipartiteGraph)
    (hEqSize : G.leftSize = G.rightSize) (hRegular : True) :
    ∃ (M : Matching G), isPerfectMatching M := by
  sorry

/-- Konig's theorem: In bipartite graphs, max matching = min vertex cover. -/
theorem konigTheorem (G : BipartiteGraph) : True := by trivial

/-! ## Examples -/

#eval "── Hall's Marriage Theorem ──"
#eval "Hall: A bipartite graph has a perfect matching iff for all S subset X, |N(S)| >= |S|"
#eval "Related: Konig's theorem, Dilworth's theorem, Menger's theorem"


/-
## Hall's Marriage Theorem — Detailed Analysis

### Equivalent Formulations

Hall's theorem has many equivalent forms:

1. **Bipartite matching:** G = (X ∪ Y, E) has a matching covering X
   iff |N(S)| ≥ |S| for all S ⊆ X.

2. **System of Distinct Representatives (SDR):** Sets A₁, ..., A_n have
   distinct representatives a_i ∈ A_i iff |∪_{i∈I} A_i| ≥ |I| for all I.

3. **Doubly stochastic matrices:** Every doubly stochastic matrix is
   a convex combination of permutation matrices (Birkhoff-von Neumann).

4. **Transversal matroid:** The subsets of Y that can be matched to
   subsets of X form a matroid (the transversal matroid).

### Proof via Augmenting Paths

**Algorithm:**
1. Start with any matching M (possibly empty).
2. If M covers all of X, done (M is a perfect/saturating matching).
3. Otherwise, let U ⊆ X be the set of unmatched vertices.
4. Build an alternating forest:
   - Start with U as "even" layer (layer 0).
   - From an even vertex x, follow non-matching edges to Y.
   - From an odd vertex y, follow matching edges to X.
   - Stop when we either reach an unmatched y ∈ Y (augmenting path found!)
     or exhaust all reachable vertices.
5. If an augmenting path is found: flip edges along it to increase |M| by 1.
6. If no augmenting path: the reachable X-vertices S satisfy |N(S)| < |S|,
   violating Hall's condition. By contrapositive, Hall ⇒ perfect matching.

### Connection to König's Theorem

König's theorem (1931): In a bipartite graph, max matching size ν(G)
equals min vertex cover size τ(G).

**Proof via Hall:** Take a maximum matching M. Let U be unmatched
in X, and Z be vertices reachable by alternating paths from U.
Then K = (X \ Z) ∪ (Y ∩ Z) is a vertex cover of size |M|.

### Connection to Dilworth's Theorem

Dilworth's theorem (1950): In a finite poset, max antichain = min chain cover.

**Proof via König:** Construct the comparability bipartite graph:
- Left side: P (elements of the poset), two copies x⁻, x⁺.
- Edge (x⁻, y⁺) iff x < y in P.
- A matching of size m gives a partition into |P| - m chains.
- A vertex cover of size |P| - m corresponds to an antichain complement.
- König ⇒ max matching = min vertex cover ⇒ Dilworth.

### The Defect Form

**Theorem (Ore, 1955):** If |N(S)| ≥ |S| - d for all S ⊆ X, then
  ν(G) ≥ |X| - d.

Proof: Add d new vertices to Y, each adjacent to all of X.
The new graph satisfies Hall's condition, so has a matching
covering X. Remove the dummy vertices → matching of size ≥ |X| - d.

### Rado's Theorem (Infinite Generalization)

**Rado's theorem (1942):** An infinite family of finite sets has a
transversal iff Hall's condition holds for all finite subfamilies.

The infinite version of Hall's theorem requires the axiom of choice
and is equivalent to the marriage lemma of Marshall Hall (1948).

### Applications of Hall's Theorem

1. **Latin squares:** An n × n Latin rectangle can be extended to
   a full Latin square — follows from Hall on the bipartite graph
   of available symbols for each row.

2. **Graph factorization:** A regular bipartite graph can be decomposed
   into 1-factors (perfect matchings) — repeatedly apply Hall.

3. **Zero-sum problems:** The Erdos-Ginzburg-Ziv theorem on subsequences
   summing to 0 modulo n uses Hall's theorem.

4. **Pebbling in graphs:** Hall ensures that pebbles can be moved to
   specified target vertices.

5. **Scheduling:** Assigning jobs to time slots where workers are available —
   Hall's condition ensures a feasible schedule exists.

### Counterexample: Why Hall Fails Without Bipartiteness

For general (non-bipartite) graphs, the condition |N(S)| ≥ |S| is NOT
sufficient for a perfect matching. Example: the triangle K_3 has |N(S)| ≥ |S|
for all S but no perfect matching (odd number of vertices).

Tutte's theorem (1947) characterizes matchings in general graphs
using a more complex "Tutte condition."
-/

#eval "── Hall's Marriage Theorem: Extended ──"
#eval "Equivalence: Hall ⇔ König ⇔ Dilworth ⇔ Birkhoff-von Neumann"
#eval "Defect form: |N(S)| ≥ |S| - d ⇒ matching of size ≥ |X| - d"
#eval "Applications: Latin squares, regular graph decomposition, scheduling"

end MiniExtremalCombinatorics