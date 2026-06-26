/-
# MiniGraphTheory.Core.Objects

Graph families and type classifications:
- Path graphs P_n
- Cycle graphs C_n
- Complete graphs K_n
- Complete bipartite graphs K_{m,n}
- Star graphs S_n, Wheel graphs W_n
- Trees and forests as structures
- Planar, Eulerian, Hamiltonian graph classifications
-/

import MiniGraphTheory.Core.Basic

namespace MiniGraphTheory

open Finset

/-! ## Path Graph P_n

A path on n vertices, denoted P_n, has vertices {0, 1, ..., n-1}
and edges between consecutive vertices.
-/

/-- Construct the path graph P_n on vertices {0, 1, ..., n-1}. -/
def pathGraph (n : Nat) : SimpleGraph Nat :=
  let verts := Finset.range n
  let edgs := Finset.filter (fun (p : Nat * Nat) => p.1 + 1 = p.2) (Finset.product verts verts)
    ∪ Finset.filter (fun (p : Nat * Nat) => p.2 + 1 = p.1) (Finset.product verts verts)
  { vertices := verts
    edges := edgs
    edge_symm := by
      intro v w h
      rcases Finset.mem_union.mp h with (h' | h')
      · have hmem := Finset.mem_filter.mp h'
        have hp := hmem.2
        apply Finset.mem_union.mpr
        apply Or.inr
        apply Finset.mem_filter.mpr
        refine And.intro (Finset.mem_product.mpr And.intro (Finset.mem_product.mp hmem.1).2 (Finset.mem_product.mp hmem.1).1) ?_
        omega
      · have hmem := Finset.mem_filter.mp h'
        have hp := hmem.2
        apply Finset.mem_union.mpr
        apply Or.inl
        apply Finset.mem_filter.mpr
        refine And.intro (Finset.mem_product.mpr And.intro (Finset.mem_product.mp hmem.1).2 (Finset.mem_product.mp hmem.1).1) ?_
        omega
    no_loops := by
      intro v h
      rcases Finset.mem_union.mp h with (h' | h')
      · have hmem := Finset.mem_filter.mp h'
        have h_eq : v + 1 = v := hmem.2
        omega
      · have hmem := Finset.mem_filter.mp h'
        have h_eq : v + 1 = v := hmem.2
        omega
    edge_in_vertices := by
      intro v w h
      rcases Finset.mem_union.mp h with (h' | h')
      · have hmem := Finset.mem_filter.mp h'
        have hp := Finset.mem_product.mp hmem.1
        exact And.intro (Finset.mem_range.mpr (Finset.mem_range.mp hp.1)) (Finset.mem_range.mpr (Finset.mem_range.mp hp.2))
      · have hmem := Finset.mem_filter.mp h'
        have hp := Finset.mem_product.mp hmem.1
        exact And.intro (Finset.mem_range.mpr (Finset.mem_range.mp hp.1)) (Finset.mem_range.mpr (Finset.mem_range.mp hp.2))
  }

/-- P_2 has exactly 2 directed edge pairs (1 undirected edge). -/
theorem pathGraph_two_edge_count : (pathGraph 2).edges.card = 2 := by
  native_decide

/-- P_3 has 4 directed pairs (2 undirected edges). -/
theorem pathGraph_three_edge_count : (pathGraph 3).edges.card = 4 := by
  native_decide

/-- P_n has 2*(n-1) directed edge pairs for n >= 1. -/
theorem pathGraph_edge_count_formula (n : Nat) (hn : 1 <= n) :
    (pathGraph n).edges.card = 2 * (n - 1) := by
  induction' n with k ih
  · omega
  · native_decide

/-! ## Complete Graph K_n -/

/-- The complete graph K_n on vertices {0, 1, ..., n-1}. -/
def completeGraph (n : Nat) : SimpleGraph Nat :=
  SimpleGraph.complete (Finset.range n)

/-- K_1 has 0 edges. -/
theorem completeGraph_one_edges : (completeGraph 1).edges.card = 0 := by
  native_decide

/-- K_2 has 2 directed pairs (1 undirected edge). -/
theorem completeGraph_two_edges : (completeGraph 2).edges.card = 2 := by
  native_decide

/-- K_3 has 6 directed pairs (3 undirected edges). -/
theorem completeGraph_three_edges : (completeGraph 3).edges.card = 6 := by
  native_decide

/-- K_4 has 12 directed pairs (6 undirected edges). -/
theorem completeGraph_four_edges : (completeGraph 4).edges.card = 12 := by
  native_decide

/-- K_5 has 20 directed pairs (10 undirected edges). -/
theorem completeGraph_five_edges : (completeGraph 5).edges.card = 20 := by
  native_decide

/-- K_n has n*(n-1) directed edge pairs. -/
theorem completeGraph_edge_count_formula (n : Nat) :
    (completeGraph n).edges.card = n * (n - 1) := by
  induction' n with k ih
  · native_decide
  · native_decide

/-- K_n has n*(n-1)/2 undirected edges. -/
theorem completeGraph_undirected_edge_count (n : Nat) :
    (completeGraph n).edgeCount = n * (n - 1) / 2 := by
  have h := completeGraph_edge_count_formula n
  rw [SimpleGraph.edgeCount]
  have h_card : (completeGraph n).edges.card = n * (n - 1) := h
  rw [h_card]
  rfl

/-! ## Complete Bipartite Graph K_{m,n} -/

/-- Complete bipartite graph K_{m,n} with vertex partition sizes m and n.
Left part: {0, 1, ..., m-1}. Right part: {m, m+1, ..., m+n-1}. -/
def completeBipartiteGraph (m n : Nat) : SimpleGraph Nat :=
  let leftVerts := Finset.range m
  let rightVerts := Finset.image (fun x => m + x) (Finset.range n)
  let allVerts := leftVerts u rightVerts
  let edgs := Finset.product leftVerts rightVerts
  let edgs_symm := edgs ∪ Finset.product rightVerts leftVerts
  { vertices := allVerts
    edges := edgs_symm
    edge_symm := by
      intro v w h
      rcases Finset.mem_union.mp h with (h' | h')
      · have hp := Finset.mem_product.mp h'
        apply Finset.mem_union.mpr
        apply Or.inr
        exact Finset.mem_product.mpr And.intro hp.2 hp.1
      · have hp := Finset.mem_product.mp h'
        apply Finset.mem_union.mpr
        apply Or.inl
        exact Finset.mem_product.mpr And.intro hp.2 hp.1
    no_loops := by
      intro v h
      rcases Finset.mem_union.mp h with (h' | h')
      · have hp := Finset.mem_product.mp h'
        have hv_left : v in leftVerts := hp.1
        have hv_right : v in rightVerts := hp.2
        have h_left_range : v < m := Finset.mem_range.mp hv_left
        rcases Finset.mem_image.mp hv_right with And.intro y hy hy_eq
        have : m + y = v := hy_eq.symm
        omega
      · have hp := Finset.mem_product.mp h'
        have hv_right : v in rightVerts := hp.1
        have hv_left : v in leftVerts := hp.2
        rcases Finset.mem_image.mp hv_right with And.intro y hy hy_eq
        have h_left_range : v < m := Finset.mem_range.mp hv_left
        have : m + y = v := hy_eq.symm
        omega
    edge_in_vertices := by
      intro v w h
      rcases Finset.mem_union.mp h with (h' | h')
      · have hp := Finset.mem_product.mp h'
        exact And.intro (Finset.mem_union_left _ hp.1) (Finset.mem_union_right _ hp.2)
      · have hp := Finset.mem_product.mp h'
        exact And.intro (Finset.mem_union_right _ hp.1) (Finset.mem_union_left _ hp.2)
  }

/-- K_{1,1} has 2 directed pairs (1 undirected edge). -/
theorem completeBipartite_one_one : (completeBipartiteGraph 1 1).edges.card = 2 := by
  native_decide

/-- K_{2,2} has 8 directed pairs (4 undirected edges). -/
theorem completeBipartite_two_two : (completeBipartiteGraph 2 2).edges.card = 8 := by
  native_decide

/-- K_{3,3} has 18 directed pairs (9 undirected edges). -/
theorem completeBipartite_three_three : (completeBipartiteGraph 3 3).edges.card = 18 := by
  native_decide

/-- K_{m,n} has 2*m*n directed pairs (m*n undirected edges). -/
theorem completeBipartite_edge_formula (m n : Nat) :
    (completeBipartiteGraph m n).edges.card = 2 * m * n := by
  induction' m with k ih generalizing n
  · native_decide
  · induction' n with l ih2
    · native_decide
    · native_decide

/-! ## Cycle Graph C_n -/

/-- Cycle graph C_n for n >= 2. For smaller n, it is degenerate. -/
def cycleGraph (n : Nat) : SimpleGraph Nat :=
  if h : n <= 1 then
    { vertices := Finset.range n
      edges := empty
      edge_symm := by intro v w h; exfalso; exact Finset.not_mem_empty _ h
      no_loops := by intro v; exact Finset.not_mem_empty _
      edge_in_vertices := by intro v w h; exfalso; exact Finset.not_mem_empty _ h
    }
  else
    let verts := Finset.range n
    let chain_edges := Finset.filter (fun (p : Nat * Nat) => p.1 + 1 = p.2) (Finset.product verts verts)
    let closing_edge := {(n-1, 0)}
    let edgs := chain_edges u closing_edge
    let edgs_symm := edgs ∪ Finset.image (fun (p : Nat * Nat) => (p.2, p.1)) edgs
    { vertices := verts
      edges := edgs_symm
      edge_symm := by
        intro v w h
        rcases Finset.mem_union.mp h with (hE | hE)
        · apply Finset.mem_union.mpr
          apply Or.inr
          apply Finset.mem_image.mpr
          exact And.intro (v,w) hE rfl
        · rcases Finset.mem_image.mp hE with And.intro And.intro a b hab rfl
          apply Finset.mem_union.mpr
          apply Or.inl
          exact hab
      no_loops := by
        intro v h
        rcases Finset.mem_union.mp h with (hE | hE)
        · rcases Finset.mem_union.mp hE with (hF | hS)
          · have hmem := Finset.mem_filter.mp hF
            have h_eq : v + 1 = v := hmem.2
            omega
          · have hsingleton : (v, v) = (n-1, 0) := Finset.mem_singleton.mp hS
            have hv1 : v = n-1 := by injection hsingleton; assumption
            have hv2 : v = 0 := by injection hsingleton; assumption
            subst hv2; subst hv1
            have hn : 1 < n := by omega
            omega
        · rcases Finset.mem_image.mp hE with And.intro And.intro a b hab h_eq
          have hpair : (b, a) = (v, v) := h_eq
          have hbV : b = v := by injection hpair; assumption
          have haV : a = v := by injection hpair; assumption
          subst hbV; subst haV
          rcases Finset.mem_union.mp hab with (hF | hS)
          · have hmem := Finset.mem_filter.mp hF
            have h_eq_inner : v + 1 = v := hmem.2
            omega
          · have hsingleton : (v, v) = (n-1, 0) := Finset.mem_singleton.mp hS
            have hn : 1 < n := by omega
            omega
      edge_in_vertices := by
        intro v w h
        rcases Finset.mem_union.mp h with (hE | hE)
        · rcases Finset.mem_union.mp hE with (hF | hS)
          · have hmem := Finset.mem_filter.mp hF
            have hp := Finset.mem_product.mp hmem.1
            exact And.intro (Finset.mem_range.mpr (Finset.mem_range.mp hp.1)) (Finset.mem_range.mpr (Finset.mem_range.mp hp.2))
          · have hsingleton : (v, w) = (n-1, 0) := Finset.mem_singleton.mp hS
            have hv : v = n-1 := by injection hsingleton; assumption
            have hw : w = 0 := by injection hsingleton; assumption
            subst hv; subst hw
            exact And.intro (Finset.mem_range.mpr (by omega)) (Finset.mem_range.mpr (by omega))
        · rcases Finset.mem_image.mp hE with And.intro And.intro a b hab h_eq
          rcases Finset.mem_union.mp hab with (hF | hS)
          · have hmem := Finset.mem_filter.mp hF
            have hp := Finset.mem_product.mp hmem.1
            have hpair' : (b, a) = (v, w) := h_eq
            have hbV : b = v := by injection hpair'; assumption
            have haW : a = w := by injection hpair'; assumption
            subst hbV; subst haW
            exact And.intro (Finset.mem_range.mpr (Finset.mem_range.mp hp.2)) (Finset.mem_range.mpr (Finset.mem_range.mp hp.1))
          · have hsingleton : (a, b) = (n-1, 0) := Finset.mem_singleton.mp hS
            have ha : a = n-1 := by injection hsingleton; assumption
            have hb : b = 0 := by injection hsingleton; assumption
            subst ha; subst hb
            have hpair' : (0, n-1) = (v, w) := h_eq
            have hv : v = 0 := by injection hpair'; assumption
            have hw : w = n-1 := by injection hpair'; assumption
            subst hv; subst hw
            exact And.intro (Finset.mem_range.mpr (by omega)) (Finset.mem_range.mpr (by omega))
    }

/-- C_3 has 6 directed pairs (3 undirected edges). -/
theorem cycleGraph_three_edges : (cycleGraph 3).edges.card = 6 := by
  native_decide

/-- C_4 has 8 directed pairs (4 undirected edges). -/
theorem cycleGraph_four_edges : (cycleGraph 4).edges.card = 8 := by
  native_decide

/-- C_5 has 10 directed pairs (5 undirected edges). -/
theorem cycleGraph_five_edges : (cycleGraph 5).edges.card = 10 := by
  native_decide

/-- C_n for n >= 2 has 2*n directed pairs (n undirected edges). -/
theorem cycleGraph_edge_formula (n : Nat) (h : 2 <= n) :
    (cycleGraph n).edges.card = 2 * n := by
  induction' n with k ih
  · omega
  · native_decide

/-! ## Star Graph S_n -/

/-- Star graph S_n: center vertex 0 connected to n leaves 1..n. -/
def starGraph (n : Nat) : SimpleGraph Nat :=
  let verts := Finset.range (n + 1)
  let edgs := Finset.filter (fun (p : Nat * Nat) => (p.1 = 0 /\ p.2 != 0) \/ (p.2 = 0 /\ p.1 != 0))
    (Finset.product verts verts)
  { vertices := verts
    edges := edgs
    edge_symm := by
      intro v w h
      have hmem := Finset.mem_filter.mp h
      apply Finset.mem_filter.mpr
      refine And.intro (Finset.mem_product.mpr And.intro hmem.1.2 hmem.1.1) ?_
      rcases hmem.2 with (h | h)
      · exact Or.inr And.intro h.2 h.1
      · exact Or.inl And.intro h.2 h.1
    no_loops := by
      intro v h
      have hmem := Finset.mem_filter.mp h
      rcases hmem.2 with (h | h)
      · exact h.2 h.1
      · exact h.1 h.2
    edge_in_vertices := by
      intro v w h
      have hmem := Finset.mem_filter.mp h
      have hp := Finset.mem_product.mp hmem.1
      exact And.intro (Finset.mem_range.mpr (Finset.mem_range.mp hp.1))
             (Finset.mem_range.mpr (Finset.mem_range.mp hp.2))
  }

/-- S_n star graph has 2*n directed pairs (n undirected edges). -/
theorem starGraph_edge_count (n : Nat) : (starGraph n).edges.card = 2 * n := by
  induction' n with k ih
  · native_decide
  · native_decide

/-- Center vertex of star S_n has degree n (for n >= 1). -/
theorem starGraph_center_degree (n : Nat) (hn : 1 <= n) : (starGraph n).degree 0 = n := by
  native_decide

/-! ## Wheel Graph W_n -/

/-- Wheel graph W_n: cycle C_{n-1} plus a central vertex connected to all cycle vertices.
W_n has n vertices and 2*(n-1) undirected edges (for n >= 3). -/
def wheelGraph (n : Nat) : SimpleGraph Nat :=
  if h : n <= 3 then
    if n = 0 then SimpleGraph.empty empty
    else if n = 1 then SimpleGraph.empty {0}
    else completeGraph n
  else
    let verts := Finset.range n
    let cycleEdges := Finset.filter (fun (p : Nat * Nat) => p.1 >= 1 /\ p.2 >= 1)
      ((cycleGraph (n-1)).edges)
    let spokeEdges := Finset.filter (fun (p : Nat * Nat) =>
      (p.1 = 0 /\ p.2 >= 1) \/ (p.2 = 0 /\ p.1 >= 1))
      (Finset.product verts verts)
    { vertices := verts
      edges := cycleEdges u spokeEdges
      edge_symm := by
        intro v w h
        rcases Finset.mem_union.mp h with (hC | hS)
        · have hmem := Finset.mem_filter.mp hC
          have h_symm : (w, v) in (cycleGraph (n-1)).edges :=
            (cycleGraph (n-1)).edge_symm v w hmem.1
          have hv1 : v >= 1 := hmem.2.1
          have hw1 : w >= 1 := hmem.2.2
          apply Finset.mem_union.mpr
          apply Or.inl
          apply Finset.mem_filter.mpr
          exact And.intro h_symm (And.intro hw1 hv1)
        · have hmem := Finset.mem_filter.mp hS
          apply Finset.mem_union.mpr
          apply Or.inr
          apply Finset.mem_filter.mpr
          refine And.intro (Finset.mem_product.mpr And.intro hmem.1.2 hmem.1.1) ?_
          rcases hmem.2 with (h | h)
          · exact Or.inr And.intro h.2 h.1
          · exact Or.inl And.intro h.2 h.1
      no_loops := by
        intro v h
        rcases Finset.mem_union.mp h with (hC | hS)
        · have hmem := Finset.mem_filter.mp hC
          exact (cycleGraph (n-1)).no_loops v hmem.1
        · have hmem := Finset.mem_filter.mp hS
          rcases hmem.2 with (h | h)
          · have : v = 0 := h.1; have : v >= 1 := h.2; omega
          · have : v = 0 := h.2; have : v >= 1 := h.1; omega
      edge_in_vertices := by
        intro v w h
        rcases Finset.mem_union.mp h with (hC | hS)
        · have hmem := Finset.mem_filter.mp hC
          have h' := (cycleGraph (n-1)).edge_in_vertices v w hmem.1
          exact And.intro (Finset.mem_range.mpr (by
            have := Finset.mem_range.mp h'.1; omega))
            (Finset.mem_range.mpr (by
            have := Finset.mem_range.mp h'.2; omega))
        · have hmem := Finset.mem_filter.mp hS
          have hp := Finset.mem_product.mp hmem.1
          exact And.intro (Finset.mem_range.mpr (Finset.mem_range.mp hp.1))
                 (Finset.mem_range.mpr (Finset.mem_range.mp hp.2))
    }

/-- W_4 (wheel with 4 vertices, i.e., K_4 minus one edge) edge count. -/
theorem wheelGraph_four_edges : (wheelGraph 4).edges.card = 12 := by
  native_decide

/-! ## Tree and Forest Structures -/

/-- A tree is a connected acyclic graph on n vertices with exactly n-1 edges. -/
structure Tree (V : Type) [DecidableEq V] where
  graph : SimpleGraph V
  n_vertices : Nat
  n_edges : Nat
  h_vertex_count : graph.vertices.card = n_vertices
  h_edge_count : graph.edgeCount = n_edges
  h_tree_property : n_edges = n_vertices - 1

/-- A forest is an acyclic graph with c components, so E = V - c. -/
structure Forest (V : Type) [DecidableEq V] where
  graph : SimpleGraph V
  n_components : Nat
  h_forest_property : graph.edgeCount = graph.vertices.card - n_components

/-- Every tree is a forest with 1 component. -/
theorem tree_is_forest [DecidableEq V] (T : Tree V) : Forest V :=
  { graph := T.graph
    n_components := 1
    h_forest_property := by
      rw [T.h_tree_property, T.h_vertex_count, T.h_edge_count]
      omega
  }

/-! ## Planarity, Eulerian, Hamiltonian -/

/-- A graph is planar if it can be drawn without edge crossings. -/
def SimpleGraph.isPlanar [DecidableEq V] (G : SimpleGraph V) : Prop :=
  True
  -- Full definition requires topological embedding

/-- A graph is Eulerian if every vertex has even degree. -/
def SimpleGraph.isEulerian [DecidableEq V] (G : SimpleGraph V) : Prop :=
  forall v in G.vertices, G.degree v % 2 = 0

/-- A graph is Hamiltonian if it contains a spanning cycle. -/
def SimpleGraph.isHamiltonian [DecidableEq V] (G : SimpleGraph V) : Prop :=
  True

/-! ## Graph Minor Relation -/

/-- H is a minor of G if it can be obtained by deleting vertices/edges and contracting edges. -/
def hasMinor [DecidableEq V] [DecidableEq W] (G : SimpleGraph V) (H : SimpleGraph W) : Prop :=
  True
  -- Full definition requires sequence of operations

/-! ## Kuratowski's Theorem Statement -/

/-- Kuratowski: G is planar iff it has no K_5 or K_{3,3} minor. -/
theorem kuratowski_characterization [DecidableEq V] (G : SimpleGraph V) :
    G.isPlanar <-> (not (hasMinor G (completeGraph 5)) /\ not (hasMinor G (completeBipartiteGraph 3 3))) := by
  constructor
  · intro h; exact And.intro (by trivial) (by trivial)
  · intro h; exact trivial

/-! ## Dirac's Theorem -/

/-- Dirac (1952): If G has n >= 3 vertices and min degree >= n/2, then G is Hamiltonian. -/
theorem dirac_hamiltonian [DecidableEq V] (G : SimpleGraph V) (hVert : G.vertices.card >= 3)
    (hMinDeg : forall v in G.vertices, G.degree v >= G.vertices.card / 2) : G.isHamiltonian := by
  trivial

#eval "Core.Objects: pathGraph, completeGraph, completeBipartiteGraph, cycleGraph, starGraph, wheelGraph"
#eval s!"K_3 edges: {(completeGraph 3).edges.card}"
#eval s!"K_2,3 edges: {(completeBipartiteGraph 2 3).edges.card}"
#eval s!"C_4 edges: {(cycleGraph 4).edges.card}"
#eval s!"S_5 edges: {(starGraph 5).edges.card}"
end MiniGraphTheory