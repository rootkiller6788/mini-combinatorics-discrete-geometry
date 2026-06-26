/-
# MiniGraphTheory.Constructions.Subgraphs

Subgraph operations: induced subgraph, spanning subgraph, edge deletion, vertex deletion.
-/

import MiniGraphTheory.Core.Basic

namespace MiniGraphTheory

/-! ## Subgraphs -/

/-- A subgraph H of G: V(H) <= V(G) and E(H) <= E(G). -/
structure Subgraph [DecidableEq V] (G : SimpleGraph V) where
  vertices : Finset V
  edges : Finset (V * V)
  verts_subset : vertices <= G.vertices
  edges_subset : edges <= G.edges
  edge_symm : forall v w, (v, w) in edges -> (w, v) in edges
  no_loops : forall v, (v, v) notin edges
  edge_in_vertices : forall v w, (v, w) in edges -> v in vertices /\ w in vertices

/-- Convert a subgraph to a SimpleGraph. -/
def Subgraph.toGraph [DecidableEq V] {G : SimpleGraph V} (H : Subgraph G) : SimpleGraph V :=
  { vertices := H.vertices
    edges := H.edges
    edge_symm := H.edge_symm
    no_loops := H.no_loops
    edge_in_vertices := H.edge_in_vertices
  }

/-- The induced subgraph on a vertex subset S: keep all edges of G with both endpoints in S. -/
def inducedSubgraph [DecidableEq V] (G : SimpleGraph V) (S : Finset V) (hS : S <= G.vertices) :
    SimpleGraph V :=
  { vertices := S
    edges := Finset.filter (fun (p : V * V) => p.1 in S /\ p.2 in S) G.edges
    edge_symm := by
      intro v w h
      have hmem := Finset.mem_filter.mp h
      apply Finset.mem_filter.mpr
      refine And.intro (G.edge_symm v w hmem.1) ?_
      rcases hmem.2 with <hvS, hwS>
      exact And.intro hwS hvS
    no_loops := by
      intro v h
      have hmem := Finset.mem_filter.mp h
      exact G.no_loops v hmem.1
    edge_in_vertices := by
      intro v w h
      have hmem := Finset.mem_filter.mp h
      exact hmem.2
  }

/-- The spanning subgraph: same vertices, subset of edges. -/
def spanningSubgraph [DecidableEq V] (G : SimpleGraph V) (E' : Finset (V * V))
    (hE' : E' <= G.edges) (hSymm : forall v w, (v, w) in E' -> (w, v) in E')
    (hNoLoops : forall v, (v, v) notin E') : SimpleGraph V :=
  { vertices := G.vertices
    edges := E'
    edge_symm := hSymm
    no_loops := hNoLoops
    edge_in_vertices := by
      intro v w h
      have hE : (v, w) in G.edges := hE' h
      exact G.edge_in_vertices v w hE
  }

/-- Delete a vertex and all incident edges. -/
def deleteVertex [DecidableEq V] (G : SimpleGraph V) (v : V) : SimpleGraph V :=
  { vertices := G.vertices.erase v
    edges := Finset.filter (fun (p : V * V) => p.1 != v /\ p.2 != v) G.edges
    edge_symm := by
      intro a b h
      have hmem := Finset.mem_filter.mp h
      apply Finset.mem_filter.mpr
      refine And.intro (G.edge_symm a b hmem.1) ?_
      rcases hmem.2 with <ha, hb>
      exact And.intro hb ha
    no_loops := by
      intro a h
      have hmem := Finset.mem_filter.mp h
      exact G.no_loops a hmem.1
    edge_in_vertices := by
      intro a b h
      have hmem := Finset.mem_filter.mp h
      have hG := G.edge_in_vertices a b hmem.1
      rcases hmem.2 with <ha, hb>
      exact And.intro (Finset.mem_erase.mpr And.intro ha hG.1) (Finset.mem_erase.mpr And.intro hb hG.2)
  }

/-- Delete an edge from the graph. -/
def deleteEdge [DecidableEq V] (G : SimpleGraph V) (v w : V) : SimpleGraph V :=
  { vertices := G.vertices
    edges := G.edges.erase (v, w) |>.erase (w, v)
    edge_symm := by
      intro a b h
      apply Finset.mem_erase.mpr  -- need to ensure we don't re-add the deleted edge
      sorry
    no_loops := by
      intro a h
      have hmem := Finset.mem_of_mem_erase h
      exact G.no_loops a hmem
    edge_in_vertices := by
      intro a b h
      have hmem := Finset.mem_of_mem_erase h
      exact G.edge_in_vertices a b hmem
  }

/-- A subgraph is spanning if it contains all vertices of G. -/
def isSpanningSubgraph [DecidableEq V] (G H : SimpleGraph V) : Prop :=
  G.vertices = H.vertices /\ H.edges <= G.edges

/-- A subgraph is induced if it contains all edges of G with both endpoints in its vertex set. -/
def isInducedSubgraph [DecidableEq V] (G H : SimpleGraph V) : Prop :=
  H.vertices <= G.vertices /\
  forall v w in H.vertices, (v, w) in G.edges -> (v, w) in H.edges

/-- Every graph is a spanning subgraph of itself. -/
theorem spanning_self [DecidableEq V] (G : SimpleGraph V) : isSpanningSubgraph G G := by
  refine And.intro rfl ?_
  exact Finset.Subset.refl G.edges

/-- The empty graph on V(G) is a spanning subgraph. -/
theorem empty_is_spanning [DecidableEq V] (G : SimpleGraph V) :
    isSpanningSubgraph G (SimpleGraph.empty G.vertices) := by
  refine And.intro rfl ?_
  exact Finset.empty_subset G.edges

#eval "Constructions.Subgraphs: subgraph, induced, spanning, vertex/edge deletion"
end MiniGraphTheory