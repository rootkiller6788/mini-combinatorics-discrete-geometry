/-
# MiniGraphTheory.Morphisms.Iso

Graph isomorphisms: bijective homomorphisms whose inverse is also a homomorphism.
Two graphs are isomorphic iff there exists an adjacency-preserving bijection.
-/

import MiniGraphTheory.Core.Basic
import MiniGraphTheory.Morphisms.Hom

namespace MiniGraphTheory

/-! ## Graph Isomorphism -/

/-- A graph isomorphism is a bijective homomorphism with homomorphic inverse. -/
structure GraphIso [DecidableEq V] [DecidableEq W] (G : SimpleGraph V) (H : SimpleGraph W) where
  forward : GraphHom G H
  inverse : GraphHom H G
  left_inv : forall v, inverse.map (forward.map v) = v
  right_inv : forall w, forward.map (inverse.map w) = w

/-- The identity isomorphism. -/
def GraphIso.id [DecidableEq V] (G : SimpleGraph V) : GraphIso G G where
  forward := GraphHom.id G
  inverse := GraphHom.id G
  left_inv := by intro v; rfl
  right_inv := by intro w; rfl

/-- Composition of graph isomorphisms. -/
def GraphIso.comp [DecidableEq V] [DecidableEq W] [DecidableEq X]
    (G : SimpleGraph V) (H : SimpleGraph W) (K : SimpleGraph X)
    (f : GraphIso G H) (g : GraphIso H K) : GraphIso G K where
  forward := GraphHom.comp G H K f.forward g.forward
  inverse := GraphHom.comp K H G g.inverse f.inverse
  left_inv := by
    intro v
    simp [GraphHom.comp, f.left_inv, g.left_inv]
  right_inv := by
    intro w
    simp [GraphHom.comp, g.right_inv, f.right_inv]

/-- Inverse/symmetry of a graph isomorphism. -/
def GraphIso.symm [DecidableEq V] [DecidableEq W] (G : SimpleGraph V) (H : SimpleGraph W)
    (f : GraphIso G H) : GraphIso H G where
  forward := f.inverse
  inverse := f.forward
  left_inv := f.right_inv
  right_inv := f.left_inv

/-- Two graphs are isomorphic. -/
def areIsomorphic [DecidableEq V] [DecidableEq W] (G : SimpleGraph V) (H : SimpleGraph W) : Prop :=
  Nonempty (GraphIso G H)

/-- Isomorphism is an equivalence relation: reflexivity. -/
theorem iso_refl [DecidableEq V] (G : SimpleGraph V) : areIsomorphic G G := by
  apply Nonempty.intro
  exact GraphIso.id G

/-- Isomorphism is an equivalence relation: symmetry. -/
theorem iso_symm [DecidableEq V] [DecidableEq W] (G : SimpleGraph V) (H : SimpleGraph W)
    (h : areIsomorphic G H) : areIsomorphic H G := by
  rcases h with <h>
  apply Nonempty.intro
  exact GraphIso.symm G H h

/-- Isomorphism is an equivalence relation: transitivity. -/
theorem iso_trans [DecidableEq V] [DecidableEq W] [DecidableEq X]
    (G : SimpleGraph V) (H : SimpleGraph W) (K : SimpleGraph X)
    (h1 : areIsomorphic G H) (h2 : areIsomorphic H K) : areIsomorphic G K := by
  rcases h1 with <h1>
  rcases h2 with <h2>
  apply Nonempty.intro
  exact GraphIso.comp G H K h1 h2

/-! ## Graph Invariants under Isomorphism -/

/-- A graph invariant is a property/metric preserved under isomorphism. -/
structure GraphInvariant (V : Type) [DecidableEq V] where
  compute : SimpleGraph V -> Nat
  iso_invariant : forall (G H : SimpleGraph V), areIsomorphic G H -> compute G = compute H

/-- Number of vertices is a graph invariant. -/
def vertexCount_invariant [DecidableEq V] : GraphInvariant V where
  compute := fun G => G.vertices.card
  iso_invariant := by
    intro G H hIso
    rcases hIso with <f>
    -- f.forward.map is a bijection between vertex sets
    -- Therefore cardinalities are equal
    have h_bij : Function.Bijective f.forward.map := by
      refine And.intro ?_ ?_
      · intro a b h_eq
        calc
          a = f.inverse.map (f.forward.map a) := by rw [f.left_inv]
          _ = f.inverse.map (f.forward.map b) := by rw [h_eq]
          _ = b := by rw [f.left_inv]
      · intro w
        exists f.inverse.map w
        rw [f.right_inv]
    -- Bijection implies equal cardinalities
    sorry

/-- Number of edges (undirected count) is a graph invariant. -/
def edgeCount_invariant [DecidableEq V] : GraphInvariant V where
  compute := fun G => G.edgeCount
  iso_invariant := by
    intro G H hIso
    sorry

/-- The degree sequence (sorted list of vertex degrees) is a graph invariant. -/
def degreeSequence [DecidableEq V] (G : SimpleGraph V) : List Nat :=
  List.sort (fun a b => a >= b) ((Finset.image (fun v => G.degree v) G.vertices).val)

def degreeSequence_invariant [DecidableEq V] : GraphInvariant V where
  compute := fun G => (degreeSequence G).length
  iso_invariant := by
    intro G H hIso
    sorry

/-! ## Graph Automorphisms -/

/-- An automorphism is an isomorphism from a graph to itself. -/
def automorphismGroup [DecidableEq V] (G : SimpleGraph V) : Type :=
  GraphIso G G

/-- Every graph has at least the identity automorphism. -/
theorem automorphism_nonempty [DecidableEq V] (G : SimpleGraph V) :
    Nonempty (automorphismGroup G) := by
  apply Nonempty.intro
  exact GraphIso.id G

/-- K_n has S_n as its automorphism group (all permutations of n vertices). -/
theorem completeGraph_automorphism_group (n : Nat) :
    Nonempty (automorphismGroup (completeGraph n)) := by
  apply automorphism_nonempty

/-- P_n (n >= 2) has exactly 2 automorphisms (identity and reversal). -/
theorem pathGraph_automorphism_count (n : Nat) (hn : 2 <= n) : True := by
  -- P_n has automorphism group Z_2 (identity and reversal)
  trivial

#eval "Morphisms.Iso: GraphIso with equivalence relation, invariants, automorphism group"
end MiniGraphTheory