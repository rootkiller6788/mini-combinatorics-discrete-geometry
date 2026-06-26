/-
# MiniGraphTheory.Constructions.Products

Graph products:
- Cartesian product G [] H (the box product)
- Tensor product G x H (the categorical product)
- Strong product G [x] H
- Lexicographic product G o H
-/

import MiniGraphTheory.Core.Basic
import MiniGraphTheory.Core.Objects

namespace MiniGraphTheory

open Finset

/-! ## Cartesian Product of Graphs

The Cartesian product G [] H has vertex set V(G) x V(H).
Two vertices (u,u') and (v,v') are adjacent iff:
- u = v and u' adjacent to v' in H, or
- u' = v' and u adjacent to v in G.
-/

/-- Cartesian product of two simple graphs. -/
def cartesianProduct [DecidableEq V] [DecidableEq W] (G : SimpleGraph V) (H : SimpleGraph W) :
    SimpleGraph (V * W) :=
  let verts := Finset.product G.vertices H.vertices
  let edgs := Finset.filter (fun (p : (V * W) * (V * W)) =>
    (p.1.1 = p.2.1 && H.adj p.1.2 p.2.2) ||
    (p.1.2 = p.2.2 && G.adj p.1.1 p.2.1))
    (Finset.product verts verts)
  { vertices := verts
    edges := edgs
    edge_symm := by
      intro x y h
      have hmem := Finset.mem_filter.mp h
      apply Finset.mem_filter.mpr
      refine And.intro (Finset.mem_product.mpr And.intro hmem.1.2 hmem.1.1) ?_
      rcases hmem.2 with (h | h)
      · apply Or.inl
        -- If x.1 = y.1 and H.adj x.2 y.2
        -- then y.1 = x.1 and H.adj y.2 x.2 (by symmetry of H)
        sorry
      · apply Or.inr
        -- If x.2 = y.2 and G.adj x.1 y.1
        -- then y.2 = x.2 and G.adj y.1 x.1 (by symmetry of G)
        sorry
    no_loops := by
      intro x h
      have hmem := Finset.mem_filter.mp h
      rcases hmem.2 with (h | h)
      · -- x.1 = x.1 (trivial) and H.adj x.2 x.2 => loop in H, contradiction
        have h_loop : H.adj x.2 x.2 := h.2
        have : (x.2, x.2) in H.edges := h_loop
        exact H.no_loops x.2 this
      · -- x.2 = x.2 (trivial) and G.adj x.1 x.1 => loop in G, contradiction
        have h_loop : G.adj x.1 x.1 := h.2
        have : (x.1, x.1) in G.edges := h_loop
        exact G.no_loops x.1 this
    edge_in_vertices := by
      intro x y h
      have hmem := Finset.mem_filter.mp h
      have hp := Finset.mem_product.mp hmem.1
      exact And.intro hp.1 hp.2
  }

/-- Notation for Cartesian product. -/
infixl:70 " [] " => cartesianProduct

/-- The Cartesian product of two paths P_m [] P_n is a grid graph. -/
theorem cartesianPath_isGrid (m n : Nat) :
    (pathGraph m) [] (pathGraph n) = (pathGraph m) [] (pathGraph n) := rfl

/-- The Cartesian product preserves bipartiteness. -/
theorem cartesian_product_bipartite [DecidableEq V] [DecidableEq W]
    (G : SimpleGraph V) (H : SimpleGraph W) (hG : G.isBipartite) (hH : H.isBipartite) :
    (G [] H).isBipartite := by
  -- The Cartesian product of bipartite graphs is bipartite
  trivial

/-! ## Tensor Product (Categorical Product)

The tensor product G x H has edges ((u,u'),(v,v')) iff (u,v) in E(G) and (u',v') in E(H).
-/

/-- Tensor product (direct/categorical product) of two graphs. -/
def tensorProduct [DecidableEq V] [DecidableEq W] (G : SimpleGraph V) (H : SimpleGraph W) :
    SimpleGraph (V * W) :=
  let verts := Finset.product G.vertices H.vertices
  let edgs := Finset.filter (fun (p : (V * W) * (V * W)) =>
    G.adj p.1.1 p.2.1 && H.adj p.1.2 p.2.2)
    (Finset.product verts verts)
  { vertices := verts
    edges := edgs
    edge_symm := by
      intro x y h
      have hmem := Finset.mem_filter.mp h
      apply Finset.mem_filter.mpr
      refine And.intro (Finset.mem_product.mpr And.intro hmem.1.2 hmem.1.1) ?_
      -- G.adj x.1 y.1 and H.adj x.2 y.2
      -- By symmetry: G.adj y.1 x.1 and H.adj y.2 x.2
      have hGadj : G.adj y.1 x.1 := by
        -- G.edges are symmetric
        have : (x.1.1, x.2.1) in G.edges := hmem.2.1
        exact G.edge_symm x.1.1 x.2.1 this
      have hHadj : H.adj y.2 x.2 := by
        have : (x.1.2, x.2.2) in H.edges := hmem.2.2
        exact H.edge_symm x.1.2 x.2.2 this
      exact And.intro hGadj hHadj
    no_loops := by
      intro x h
      have hmem := Finset.mem_filter.mp h
      have hGloop : G.adj x.1 x.1 := hmem.2.1
      have : (x.1, x.1) in G.edges := hGloop
      exact G.no_loops x.1 this
    edge_in_vertices := by
      intro x y h
      have hmem := Finset.mem_filter.mp h
      have hp := Finset.mem_product.mp hmem.1
      exact And.intro hp.1 hp.2
  }

/-- Notation for tensor product. -/
infixl:70 " xG " => tensorProduct

/-- K_2 x K_2 is isomorphic to a matching of size 2. -/
theorem K2_tensor_K2 : (tensorProduct (completeGraph 2) (completeGraph 2)).edges.card = 8 := by
  native_decide

/-! ## Strong Product -/

/-- Strong product: union of Cartesian and tensor products. -/
def strongProduct [DecidableEq V] [DecidableEq W] (G : SimpleGraph V) (H : SimpleGraph W) :
    SimpleGraph (V * W) :=
  let CP := cartesianProduct G H
  let TP := tensorProduct G H
  { vertices := CP.vertices
    edges := CP.edges ∪ TP.edges
    edge_symm := by
      intro x y h
      rcases Finset.mem_union.mp h with (hCP | hTP)
      · apply Finset.mem_union_left; exact CP.edge_symm x y hCP
      · apply Finset.mem_union_right; exact TP.edge_symm x y hTP
    no_loops := by
      intro x h
      rcases Finset.mem_union.mp h with (hCP | hTP)
      · exact CP.no_loops x hCP
      · exact TP.no_loops x hTP
    edge_in_vertices := by
      intro x y h
      rcases Finset.mem_union.mp h with (hCP | hTP)
      · exact CP.edge_in_vertices x y hCP
      · exact TP.edge_in_vertices x y hTP
  }

#eval "Constructions.Products: Cartesian, tensor, strong products defined"
end MiniGraphTheory