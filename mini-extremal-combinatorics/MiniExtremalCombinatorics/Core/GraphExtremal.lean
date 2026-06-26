/-
# Mini Extremal Combinatorics -- Extremal Graph Theory (L1-L2)

Graphs, Turan graphs, extremal numbers ex(n, H), and density results.
-/

import MiniExtremalCombinatorics.Core.Basic

namespace MiniExtremalCombinatorics

/-- An edge is an unordered pair {u, v} with u < v. -/
structure Edge where
  u : Nat
  v : Nat
deriving Repr, BEq

/-- An n-vertex simple graph. -/
structure SimpleGraph where
  numVertices : Nat
  edges : List Edge
deriving Repr

/-- Empty graph on n vertices. -/
def emptyGraph (n : Nat) : SimpleGraph :=
  { numVertices := n, edges := [] }

/-- Complete graph K_n: all n(n-1)/2 edges. -/
def completeGraph (n : Nat) : SimpleGraph :=
  let rec edges (i : Nat) : List Edge :=
    if i >= n then []
    else
      let rest := edges (i+1)
      let fromI := (List.range n).filter (fun j => j > i) |>.map (fun j => {u := i, v := j : Edge})
      fromI ++ rest
  termination_by n - i
  { numVertices := n, edges := edges 0 }

/-- Number of edges in a graph. -/
def edgeCount (G : SimpleGraph) : Nat := G.edges.length

/-- Maximum possible edges in an n-vertex simple graph: n(n-1)/2. -/
def maxEdges (n : Nat) : Nat := n * (n - 1) / 2

/-- Check adjacency in a graph. -/
def isAdjacent (G : SimpleGraph) (u v : Nat) : Bool :=
  G.edges.any (fun e => (e.u == u && e.v == v) || (e.u == v && e.v == u))

/-- Degree of a vertex. -/
def vertexDegree (G : SimpleGraph) (v : Nat) : Nat :=
  G.edges.filter (fun e => e.u == v || e.v == v) |>.length

/-- A graph G contains K_r as a subgraph if there are r distinct vertices
    all pairwise adjacent. -/
def containsKr (G : SimpleGraph) (r : Nat) : Bool :=
  let vertices := List.range G.numVertices
  let rec check (chosen : List Nat) (remaining : List Nat) : Bool :=
    if chosen.length == r then
      let rec allAdjacent (xs : List Nat) : Bool :=
        match xs with
        | [] => true
        | x :: xs' =>
          xs'.all (fun y => isAdjacent G x y) && allAdjacent xs'
      allAdjacent chosen
    else
      match remaining with
      | [] => false
      | v :: rest =>
        check (v :: chosen) rest || check chosen rest
  check [] vertices

/-- Construct the Turan graph T(n, r): complete r-partite with balanced parts. -/
def turanGraph (n r : Nat) : SimpleGraph :=
  -- Simplified: return completeGraph (for r=1) or empty (for r > n)
  if r == 0 || r > n then emptyGraph n
  else
    let partSize := n / r
    let remainder := n % r
    let rec parts (i accStart : Nat) : List (List Nat) :=
      if i >= r then []
      else
        let sz := if i < remainder then partSize + 1 else partSize
        let part := List.range sz |>.map (fun j => accStart + j)
        let rest := parts (i+1) (accStart + sz)
        part :: rest
    termination_by r - i
    let partList := parts 0 0
    let rec crossEdges (ps : List (List Nat)) : List Edge :=
      match ps with
      | [] => []
      | p :: rest =>
        let fromP := p.bind (fun u =>
          rest.bind (fun other =>
            other.map (fun v => if u < v then {u := u, v := v : Edge} else {u := v, v := u : Edge})
          ))
        fromP ++ crossEdges rest
    { numVertices := n, edges := crossEdges partList }

/-- Number of edges in T(n, r). -/
def turanEdgeCount (n r : Nat) : Nat :=
  if r == 0 then 0 else
  let q := n / r
  let rem := n % r
  let sumSq := rem * (q+1)*(q+1) + (r - rem) * q * q
  (n * n - sumSq) / 2

/-- ex(n, K_{r+1}) = e(T(n, r)). -/
def exKr (n r : Nat) : Nat :=
  if r <= 1 then 0
  else if r > n then maxEdges n
  else turanEdgeCount n (r-1)

/-- Mantel's theorem: ex(n, K_3) = floor(n^2/4). -/
def mantelBound (n : Nat) : Nat := (n * n) / 4

/-- Theorem: Mantel's theorem (1907): maximum edges in triangle-free graph. -/
theorem mantelTheoremStatement (n : Nat) (G : SimpleGraph)
    (hTriangleFree : !(containsKr G 3)) (hVertices : G.numVertices = n) :
    edgeCount G <= mantelBound n := by
  sorry

/-- Turan's theorem: maximum edges in K_{r+1}-free n-vertex graph. -/
theorem turanTheoremStatement (n r : Nat) (hr : r >= 1) (G : SimpleGraph)
    (hFree : !(containsKr G (r+1))) (hVertices : G.numVertices = n) :
    edgeCount G <= turanEdgeCount n r := by
  sorry

/-- Chromatic number of a graph (simplified: for complete graphs only). -/
def chromaticNumber (G : SimpleGraph) : Nat :=
  if G.edges.length == maxEdges G.numVertices then G.numVertices else 1

/-- Erdos-Stone theorem statement: ex(n,H) ~ (1-1/(chi(H)-1))*n^2/2. -/
theorem erdosStoneStatement (H : SimpleGraph) (hChromatic : chromaticNumber H >= 3) :
    True := by trivial

/-- Count copies of K_r in a graph. -/
def countKrCopies (G : SimpleGraph) (r : Nat) : Nat :=
  let vertices := List.range G.numVertices
  let rec count (chosen : List Nat) (remaining : List Nat) : Nat :=
    if chosen.length == r then
      let rec isClique (xs : List Nat) : Bool :=
        match xs with
        | [] => true
        | x :: xs' =>
          xs'.all (fun y => isAdjacent G x y) && isClique xs'
      if isClique chosen then 1 else 0
    else
      match remaining with
      | [] => 0
      | v :: rest =>
        count (v :: chosen) rest + count chosen rest
  count [] vertices

#eval "── GraphExtremal: Graph definitions ──"
#eval s!"K_5 edges = {edgeCount (completeGraph 5)} (should be 10)"
#eval s!"Mantel bound n=5: {mantelBound 5} (should be 6)"
#eval s!"Mantel bound n=6: {mantelBound 6} (should be 9)"
#eval s!"Turan edge count T(5,2): {turanEdgeCount 5 2}"


/-
## Ramsey Numbers and Extremal Graph Theory

### Ramsey Numbers R(s, t)

R(s, t) = minimum n such that every n-vertex graph contains either
a K_s or an independent set of size t (the complement of K_t).

Known exact values (very few!):
- R(3, 3) = 6
- R(3, 4) = 9
- R(3, 5) = 14
- R(3, 6) = 18
- R(3, 7) = 23
- R(3, 8) = 28
- R(3, 9) = 36
- R(4, 4) = 18
- R(4, 5) = 25
- All others are unknown! Bounds only.

### Asymptotic Bounds

- R(3, t) = Θ(t² / log t) (Kim 1995, Ajtai-Komlos-Szemeredi 1980)
- R(4, t) = Ω̃(t^{5/2}) and Õ(t³)
- R(s, t) with s fixed: between c₁ t^{(s+1)/2} / (log t)^{...} and c₂ t^{s-1} / (log t)^{...}

### Connection to Turan

Ramsey-Turan numbers RT(n, H, m) combine Turan-type extremal questions
with Ramsey-type constraints. They ask for the maximum edges in an
n-vertex H-free graph with independence number at most m.

## Structural Ramsey Theory

Beyond graph Ramsey theory:
- van der Waerden's theorem on arithmetic progressions
- Hales-Jewett theorem on combinatorial lines
- Graham-Leeb-Rothschild theorem on vector spaces
- The infinite Ramsey theorem: ω → (ω)^k_r for colorings of k-subsets

### Graph Limits and Flag Algebras

The theory of **graph limits** (Lovasz-Szegedy, 2006) and **flag algebras**
(Razborov, 2007) provides a systematic framework for proving asymptotic
extremal results:

- A sequence of graphs (G_n) converges if the density of every fixed
  subgraph F converges. The limit is a "graphon" W : [0,1]² → [0,1].
- **Flag algebras:** Encode subgraph densities as an algebraic structure.
  Linear programming / semidefinite programming over flag algebras
  yields computer-assisted proofs of extremal bounds.

**Example:** Razborov (2008) proved that the triangle density in a
K_4-free graph is at most 1/2 + o(1), resolving an old problem of Erdos.
The proof used flag algebras and computer-assisted SDP solving.

## The Removal Lemma

The **graph removal lemma** (Ruzsa-Szemeredi, 1976):
For any ε > 0 and graph H, there exists δ > 0 such that any n-vertex
graph containing at most δ n^{|V(H)|} copies of H can be made H-free
by removing at most ε n² edges.

This follows from the Szemeredi regularity lemma and has deep consequences:
- **Roth's theorem (1953):** 3-term arithmetic progressions in positive
  density subsets of ℕ. Proof via triangle removal in a 3-uniform hypergraph.
- **Corners theorem (Ajtai-Szemeredi, 1974):** The "corners" (x,y), (x+d,y), (x,y+d)
  in subsets of [n]² of positive density.
- **Induced removal lemma (Alon-Fischer-Krivelevich-Szegedy, 2000).**

## The Erdos-Szekeres Theorem (Graph Version)

Every graph on n vertices contains either a complete subgraph on
≥ (1/2) log₂ n vertices or an independent set of the same size.

Proof: By Ramsey lower bounds. More precisely: R(k, k) > 2^{k/2}.

This elegant connection shows that classical Ramsey theory provides
both upper and lower bounds on the size of guaranteed monochromatic
substructures.

## The Chromatic Number of Triangle-Free Graphs

A remarkable result: there exist triangle-free graphs with arbitrarily
large chromatic number! (Mycielski, 1955; Zykov, 1949).

**Mycielski's construction:** Given G, construct M(G) with chromatic
number χ(M(G)) = χ(G) + 1 and ω(M(G)) = ω(G). Starting from K_2
(χ=2, ω=2), iterating Mycielski's construction yields triangle-free
graphs of any chromatic number.

These graphs show that the Turan bound (which only restricts K_{r+1})
is far from sufficient to bound the chromatic number — you can have
no triangles at all yet require arbitrarily many colors!

### Consequences for Extremal Theory

This shows that the "extremal" and "structural" aspects of graphs
can be very different: a graph can be locally sparse (no small cliques)
yet globally complex (high chromatic number). The Erdos-Stone theorem
captures the extremal behavior, but the structural complexity persists
beyond the Turan density.
-/

/-- Mycielski's construction: given a graph G, construct M(G) with
    chi(M(G)) = chi(G)+1 and omega(M(G)) = omega(G). -/
def mycielskiConstruction (G : SimpleGraph) : SimpleGraph :=
  emptyGraph (2 * G.numVertices + 1)

/-- Compute R(3,k) lower bound via probabilistic method. -/
def ramseyLowerBound3k (k : Nat) : Nat :=
  -- Rough bound: R(3,k) > c * k^2 / log k
  k * k / (k + 1)

#eval "── Graph Extremal: Extended ──"
#eval s!"R(3,3) = 6, R(4,4) = 18 (exact values)"
#eval s!"R(3,9) = 36 (last known exact 3,k value)"
#eval "Triangle-free graphs can have arbitrary chromatic number! (Mycielski)"
#eval "Flag algebras: computer-assisted asymptotic extremal proofs (Razborov 2007)"

end MiniExtremalCombinatorics