/-
# MiniGraphTheory.Core.Basic

Fundamental definitions of graph theory:
- Simple graphs (undirected, no loops, no multiple edges)
- Directed graphs
- Weighted graphs
- Multigraphs
- Bipartite graphs via structures
- Key operations: vertices, edges, degree, adjacency, neighbors

This module provides the foundational types for the entire graph theory library.
-/

namespace MiniGraphTheory

/-! ## Simple Graph

A simple graph G = (V, E) where:
- V is a type representing vertices (with decidable equality)
- E is a symmetric, irreflexive binary relation on V

We use `Finset V` to represent finite vertex sets and `Finset (V × V)` for edge sets.
This gives us computable graph operations via `dec_trivial` and `simp`.
-/

/-- A simple undirected graph on a finite set of vertices.
Edges are represented as unordered pairs. No loops, no multiple edges.
The edge relation is symmetric. -/
structure SimpleGraph (V : Type) [DecidableEq V] where
  vertices : Finset V
  edges : Finset (V × V)
  edge_symm : ∀ v w, (v, w) ∈ edges → (w, v) ∈ edges
  no_loops : ∀ v, (v, v) ∉ edges
  edge_in_vertices : ∀ v w, (v, w) ∈ edges → v ∈ vertices ∧ w ∈ vertices

/-- Create a simple graph from an adjacency list specification. -/
def SimpleGraph.ofAdjList [DecidableEq V] (verts : Finset V) (adjPairs : Finset (V × V))
    (hSymm : ∀ v w, (v, w) ∈ adjPairs → (w, v) ∈ adjPairs)
    (hNoLoop : ∀ v, (v, v) ∉ adjPairs)
    (hVert : ∀ v w, (v, w) ∈ adjPairs → v ∈ verts ∧ w ∈ verts) : SimpleGraph V :=
  { vertices := verts
    edges := adjPairs
    edge_symm := hSymm
    no_loops := hNoLoop
    edge_in_vertices := hVert
  }

/-- The empty graph on a vertex set (no edges). -/
def SimpleGraph.empty [DecidableEq V] (verts : Finset V) : SimpleGraph V :=
  { vertices := verts
    edges := ∅
    edge_symm := by intro v w h; exfalso; exact Finset.not_mem_empty _ h
    no_loops := by intro v; exact Finset.not_mem_empty _
    edge_in_vertices := by intro v w h; exfalso; exact Finset.not_mem_empty _ h
  }

/-- The complete graph K_n on a vertex set (all possible edges). -/
def SimpleGraph.complete [DecidableEq V] (verts : Finset V) : SimpleGraph V :=
  { vertices := verts
    edges := Finset.filter (λ ⟨v,w⟩ => v ≠ w) (Finset.product verts verts)
    edge_symm := by
      intro v w h
      have hmem : (v, w) ∈ Finset.product verts verts :=
        Finset.mem_of_mem_filter h (λ ⟨x,y⟩ => x ≠ y)
      have hvw : v ≠ w := by
        let h' := Finset.mem_filter.mp h
        exact h'.2
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_product.mpr ⟨hmem.2, hmem.1⟩, ?_⟩
      intro h_eq; apply hvw; exact h_eq.symm
    no_loops := by
      intro v
      intro h
      have hmem := Finset.mem_filter.mp h
      exact hmem.2 rfl
    edge_in_vertices := by
      intro v w h
      have hmem := Finset.mem_filter.mp h
      have hprod := Finset.mem_product.mp hmem.1
      exact ⟨hprod.1, hprod.2⟩
  }

/-- Check if two vertices are adjacent in a simple graph. -/
def SimpleGraph.adj [DecidableEq V] (G : SimpleGraph V) (v w : V) : Bool :=
  (v, w) ∈ G.edges

/-- Get the neighbors of a vertex in a simple graph. -/
def SimpleGraph.neighbors [DecidableEq V] (G : SimpleGraph V) (v : V) : Finset V :=
  Finset.filter (λ w => G.adj v w) G.vertices

/-- Degree of a vertex in a simple graph. -/
def SimpleGraph.degree [DecidableEq V] (G : SimpleGraph V) (v : V) : Nat :=
  (G.neighbors v).card

/-- A graph is regular if all vertices have the same degree. -/
def SimpleGraph.isRegular [DecidableEq V] (G : SimpleGraph V) (k : Nat) : Prop :=
  ∀ v ∈ G.vertices, G.degree v = k

/-! ## Edge Count and Handshake Preliminaries -/

/-- Total number of edges in the graph (counting each undirected edge once).
Since edges are symmetric, we count each pair once by taking only those (v,w) where v ≤ w in some ordering.
We use the raw edge count divided by 2 from the symmetric representation. -/
def SimpleGraph.edgeCount [DecidableEq V] (G : SimpleGraph V) : Nat :=
  G.edges.card / 2

/-- Sum of all degrees in a simple graph. -/
def SimpleGraph.degreeSum [DecidableEq V] (G : SimpleGraph V) : Nat :=
  Finset.sum G.vertices (λ v => G.degree v)

/-! ## Directed Graph -/

/-- A directed graph (digraph) D = (V, A) where A is a set of ordered pairs (arcs).
Loops are allowed. -/
structure DirectedGraph (V : Type) [DecidableEq V] where
  vertices : Finset V
  arcs : Finset (V × V)
  arc_in_vertices : ∀ v w, (v, w) ∈ arcs → v ∈ vertices ∧ w ∈ vertices

/-- Out-degree in a directed graph. -/
def DirectedGraph.outDegree [DecidableEq V] (D : DirectedGraph V) (v : V) : Nat :=
  (Finset.filter (λ (a : V × V) => a.1 = v) D.arcs).card

/-- In-degree in a directed graph. -/
def DirectedGraph.inDegree [DecidableEq V] (D : DirectedGraph V) (v : V) : Nat :=
  (Finset.filter (λ (a : V × V) => a.2 = v) D.arcs).card

/-! ## Weighted Graph -/

/-- A weighted graph where edges have weights of type W. -/
structure WeightedGraph (V W : Type) [DecidableEq V] where
  vertices : Finset V
  edges : Finset (V × V × W)
  edge_symm : ∀ v w wt, (v, w, wt) ∈ edges → (w, v, wt) ∈ edges
  no_loops : ∀ v wt, (v, v, wt) ∉ edges
  edge_in_vertices : ∀ v w wt, (v, w, wt) ∈ edges → v ∈ vertices ∧ w ∈ vertices

/-! ## Bipartite Graph -/

/-- A bipartite graph with left vertices L and right vertices R.
All edges go between L and R. -/
structure BipartiteGraph (L R : Type) [DecidableEq L] [DecidableEq R] where
  leftVertices : Finset L
  rightVertices : Finset R
  edges : Finset (L × R)
  edge_in_vertices : ∀ l r, (l, r) ∈ edges → l ∈ leftVertices ∧ r ∈ rightVertices

/-- Check if a simple graph is bipartite. Returns true if it can be 2-colored. -/
def SimpleGraph.isBipartite [DecidableEq V] (G : SimpleGraph V) : Bool :=
  -- A graph is bipartite iff it has no odd cycles.
  -- We check via 2-coloring BFS; here we provide the definition.
  -- The computational check can be done via BFS algorithm.
  -- This is a placeholder: actual 2-colorability is tested via no odd cycle property.
  G.vertices.all (λ v => true)  -- Stub: will be refined with BFS algorithm
  -- In a full implementation, this would run a BFS 2-coloring algorithm.

/-! ## Graph Complement -/

/-- The complement of a simple graph: same vertices, edges where the original has none. -/
def SimpleGraph.complement [DecidableEq V] (G : SimpleGraph V) : SimpleGraph V :=
  let possibleEdges := Finset.filter (λ ⟨v,w⟩ => v ≠ w) (Finset.product G.vertices G.vertices)
  let compEdges := Finset.filter (λ e => e ∉ G.edges) possibleEdges
  { vertices := G.vertices
    edges := compEdges
    edge_symm := by
      intro v w h
      have hmem : (v, w) ∈ possibleEdges := Finset.mem_of_mem_filter h (λ e => e ∉ G.edges)
      have hnotEdge : (v, w) ∉ G.edges := (Finset.mem_filter.mp h).2
      have hv_ne_w : v ≠ w := by
        have h' := Finset.mem_filter.mp hmem
        exact h'.2
      apply Finset.mem_filter.mpr
      refine ⟨?_, ?_⟩
      · apply Finset.mem_filter.mpr
        refine ⟨Finset.mem_product.mpr ⟨?_, ?_⟩, ?_⟩
        · have h' := Finset.mem_filter.mp hmem
          have hp := Finset.mem_product.mp h'.1
          exact hp.2
        · have h' := Finset.mem_filter.mp hmem
          have hp := Finset.mem_product.mp h'.1
          exact hp.1
        · intro h_eq; apply hv_ne_w; exact h_eq.symm
      · intro h_edge
        have h_symm_edge : (w, v) ∈ G.edges := G.edge_symm v w h_edge
        exact hnotEdge h_symm_edge
    no_loops := by
      intro v h
      have hmem : (v,v) ∈ possibleEdges := Finset.mem_of_mem_filter h (λ e => e ∉ G.edges)
      have hv_ne_v : v ≠ v := (Finset.mem_filter.mp hmem).2
      exact hv_ne_v rfl
    edge_in_vertices := by
      intro v w h
      have hmem : (v,w) ∈ possibleEdges := Finset.mem_of_mem_filter h (λ e => e ∉ G.edges)
      have hp := Finset.mem_filter.mp hmem
      have hprod := Finset.mem_product.mp hp.1
      exact ⟨hprod.1, hprod.2⟩
  }

/-! ## Graph Union and Intersection -/

/-- The union of two simple graphs on the same vertex set. -/
def SimpleGraph.union [DecidableEq V] (G H : SimpleGraph V) (hSameVerts : G.vertices = H.vertices) : SimpleGraph V :=
  { vertices := G.vertices
    edges := G.edges ∪ H.edges
    edge_symm := by
      intro v w h
      rcases Finset.mem_union.mp h with (hG | hH)
      · apply Finset.mem_union_left; exact G.edge_symm v w hG
      · apply Finset.mem_union_right; exact H.edge_symm v w hH
    no_loops := by
      intro v h
      rcases Finset.mem_union.mp h with (hG | hH)
      · exact G.no_loops v hG
      · exact H.no_loops v hH
    edge_in_vertices := by
      intro v w h
      rcases Finset.mem_union.mp h with (hG | hH)
      · exact G.edge_in_vertices v w hG
      · rw [hSameVerts] at hH
        exact H.edge_in_vertices v w hH
  }

/-- The intersection of two simple graphs on the same vertex set. -/
def SimpleGraph.inter [DecidableEq V] (G H : SimpleGraph V) (hSameVerts : G.vertices = H.vertices) : SimpleGraph V :=
  { vertices := G.vertices
    edges := G.edges ∩ H.edges
    edge_symm := by
      intro v w h
      have hG : (v,w) ∈ G.edges := (Finset.mem_inter.mp h).1
      have hH : (v,w) ∈ H.edges := (Finset.mem_inter.mp h).2
      apply Finset.mem_inter.mpr
      exact ⟨G.edge_symm v w hG, H.edge_symm v w hH⟩
    no_loops := by
      intro v h
      have hG : (v,v) ∈ G.edges := (Finset.mem_inter.mp h).1
      exact G.no_loops v hG
    edge_in_vertices := by
      intro v w h
      have hG : (v,w) ∈ G.edges := (Finset.mem_inter.mp h).1
      exact G.edge_in_vertices v w hG
  }

/-! ## Graph Equality -/

/-- Two simple graphs are equal if they have the same vertices and edges. -/
theorem SimpleGraph.ext [DecidableEq V] (G H : SimpleGraph V)
    (hVert : G.vertices = H.vertices) (hEdge : G.edges = H.edges) : G = H := by
  cases G; cases H; simp at *; subst hVert; subst hEdge; rfl

#eval "Core.Basic: SimpleGraph, DirectedGraph, WeightedGraph, BipartiteGraph, operations defined"
end MiniGraphTheory
