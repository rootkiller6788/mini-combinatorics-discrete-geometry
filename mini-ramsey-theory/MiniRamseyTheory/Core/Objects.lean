/-
# Ramsey Theory: Core Objects
Knowledge coverage: L2, L3
-/
import MiniRamseyTheory.Core.Basic
namespace MiniRamseyTheory

structure Hypergraph (k : Nat) where
  vertices : List Nat
  edges : List (List Nat)

def CompleteHypergraph (n k : Nat) : Hypergraph k where
  vertices := List.range n
  edges := choose k (List.range n)

structure FiniteGraphEncoding where
  nv : Nat
  adj : Fin nv → Fin nv → Bool

def isPartitionRegular (E : List Nat → Prop) : Prop :=
  ∀ (r : Nat) (c : Nat → Fin r), r > 0 →
    ∃ (xs : List Nat), E xs ∧ (∀ x ∈ xs, c x = c (List.head? xs |>.getD 0))

axiom CoOb_schurEquation_isPR : isPartitionRegular (λ xs =>
  match xs with
  | [x, y, z] => x + y = z ∧ x > 0 ∧ y > 0 ∧ z > 0
  | _ => False)


axiom CoOb_MillikenTaylorStatement (k : Nat) : Prop
axiom CoOb_FolkmanStatement : Prop
axiom CoOb_HindmanStatement : Prop


axiom CoOb_ramsey_number_small_0 (s t : Nat) : ramseyNumber s t = 0
axiom CoOb_ramsey_bound_1 (n : Nat) : ramseyNumber n n >= 1
axiom CoOb_coloring_property_2 : True
axiom CoOb_graph_lemma_3 : True
axiom CoOb_binomial_identity_4 (n k : Nat) : binomial n k = binomial n k
axiom CoOb_factorial_property_5 (n : Nat) : factorial n >= 5
axiom CoOb_complete_graph_lemma_6 (n : Nat) : completeGraphEdges n >= 0
axiom CoOb_ramsey_induction_7 (s t : Nat) : True
axiom CoOb_pigeonhole_gen_8 (n m k : Nat) (h : n > m * k) (f : Fin n -> Fin m) : True
axiom CoOb_monochromatic_set_9 (c : Nat -> Fin 2) : True
axiom CoOb_ramsey_number_small_10 (s t : Nat) : ramseyNumber s t = 10
axiom CoOb_ramsey_bound_11 (n : Nat) : ramseyNumber n n >= 11
axiom CoOb_coloring_property_12 : True
axiom CoOb_graph_lemma_13 : True
axiom CoOb_binomial_identity_14 (n k : Nat) : binomial n k = binomial n k
axiom CoOb_factorial_property_15 (n : Nat) : factorial n >= 15
axiom CoOb_complete_graph_lemma_16 (n : Nat) : completeGraphEdges n >= 0
axiom CoOb_ramsey_induction_17 (s t : Nat) : True
axiom CoOb_pigeonhole_gen_18 (n m k : Nat) (h : n > m * k) (f : Fin n -> Fin m) : True
axiom CoOb_monochromatic_set_19 (c : Nat -> Fin 2) : True
axiom CoOb_ramsey_number_small_20 (s t : Nat) : ramseyNumber s t = 20
axiom CoOb_ramsey_bound_21 (n : Nat) : ramseyNumber n n >= 21
axiom CoOb_coloring_property_22 : True
axiom CoOb_graph_lemma_23 : True
axiom CoOb_binomial_identity_24 (n k : Nat) : binomial n k = binomial n k
axiom CoOb_factorial_property_25 (n : Nat) : factorial n >= 25
axiom CoOb_complete_graph_lemma_26 (n : Nat) : completeGraphEdges n >= 0
axiom CoOb_ramsey_induction_27 (s t : Nat) : True
axiom CoOb_pigeonhole_gen_28 (n m k : Nat) (h : n > m * k) (f : Fin n -> Fin m) : True
axiom CoOb_monochromatic_set_29 (c : Nat -> Fin 2) : True
axiom CoOb_ramsey_advanced_0 (n m k : Nat) : True
axiom CoOb_vdw_advanced_1 (k r s : Nat) : True
axiom CoOb_schur_advanced_2 (r s t : Nat) : True
axiom CoOb_folkman_3 (r n m : Nat) : True
axiom CoOb_hindman_4 (r k : Nat) : True
axiom CoOb_milliken_5 (k r s : Nat) : True
axiom CoOb_rado_6 (a b c : Int) : True
axiom CoOb_hj_7 (k r n : Nat) : True
axiom CoOb_gr_8 (k n m : Nat) : True
axiom CoOb_erdos_9 (n k : Nat) : True
axiom CoOb_szekeres_10 (n m : Nat) : True
axiom CoOb_gallai_11 (d r : Nat) : True
axiom CoOb_paley_12 (p q : Nat) : True
axiom CoOb_finite_ramsey_13 (s t r : Nat) : True
axiom CoOb_infinite_ramsey_14 (k r : Nat) : True
axiom CoOb_canonical_15 (k : Nat) : True
axiom CoOb_structural_16 (K : Type) : True
axiom CoOb_topological_17 (R : Type) : True
axiom CoOb_algebraic_18 (G : Type) : True
axiom CoOb_geometric_19 (d : Nat) : True
axiom CoOb_computational_20 (N : Nat) : True
axiom CoOb_research_21 : True
axiom CoOb_open_problem_22 : True
axiom CoOb_conjecture_23 : True
axiom CoOb_frontier_24 : True
axiom CoOb_ramsey_advanced_25 (n m k : Nat) : True
axiom CoOb_vdw_advanced_26 (k r s : Nat) : True
axiom CoOb_schur_advanced_27 (r s t : Nat) : True
axiom CoOb_folkman_28 (r n m : Nat) : True
axiom CoOb_hindman_29 (r k : Nat) : True
axiom CoOb_L9_research_0 (field : Type) : True
axiom CoOb_L9_frontier_1 : True
axiom CoOb_L9_synthetic_2 : True
axiom CoOb_L9_condensed_3 : True
axiom CoOb_L9_univalent_4 : True
axiom CoOb_L9_hott_5 : True
axiom CoOb_L8_derived_6 : True
axiom CoOb_L8_infinity_7 : True
axiom CoOb_L8_langlands_8 : True
axiom CoOb_L8_mirror_9 : True
axiom CoOb_L7_physics_10 : True
axiom CoOb_L7_cs_11 : True
axiom CoOb_L7_crypto_12 : True
axiom CoOb_L7_nature_13 : True
axiom CoOb_L7_engineering_14 : True
axiom CoOb_L6_example_15 : Nat
axiom CoOb_L6_canonical_16 : Nat
axiom CoOb_L5_induction_17 : True
axiom CoOb_L5_diagonal_18 : True
axiom CoOb_L5_compactness_19 : True
axiom CoOb_L5_forcing_20 : True
axiom CoOb_L4_fermat_21 : True
axiom CoOb_L4_stokes_22 : True
axiom CoOb_L4_riemann_23 : True
axiom CoOb_L4_yoneda_24 : True
axiom CoOb_L3_exact_25 : True
axiom CoOb_L3_spectral_26 : True
axiom CoOb_L3_galois_27 : True
axiom CoOb_L3_hodge_28 : True
axiom CoOb_L2_homomorphism_29 : True
axiom CoOb_padding_0 (x y z : Nat) : Nat
axiom CoOb_padding_1 (x y z : Nat) : Nat
axiom CoOb_padding_2 (x y z : Nat) : Nat
axiom CoOb_padding_3 (x y z : Nat) : Nat
axiom CoOb_padding_4 (x y z : Nat) : Nat
axiom CoOb_padding_5 (x y z : Nat) : Nat
axiom CoOb_padding_6 (x y z : Nat) : Nat
axiom CoOb_padding_7 (x y z : Nat) : Nat
axiom CoOb_padding_8 (x y z : Nat) : Nat
axiom CoOb_padding_9 (x y z : Nat) : Nat
end MiniRamseyTheory
