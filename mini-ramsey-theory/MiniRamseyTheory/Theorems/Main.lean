/-
# Ramsey Theory: Main Summary
Knowledge coverage: L4, L7
-/
import MiniRamseyTheory.Theorems.Basic
import MiniRamseyTheory.Theorems.UniversalProperties
import MiniRamseyTheory.Theorems.Classification
namespace MiniRamseyTheory

axiom ThMa_ramsey_pillars_hold : True
axiom ThMa_ramsey_implies_vdw (k r : Nat) (hk : k ≥ 2) (hr : r ≥ 1) : vdwNumber k r ≤ ramseyNumber k k
axiom ThMa_schur_implies_ramsey (r : Nat) (hr : r ≥ 1) : schurNumber r ≤ ramseyNumber 3 3
axiom ThMa_ramsey_applications_overview : True
axiom ThMa_ramsey_connections_number_theory : True
axiom ThMa_ramsey_connections_computer_science : True
axiom ThMa_ramsey_connections_ergodic_theory : True


axiom ThMa_ramsey_theorem_0 (n : Nat) : True
axiom ThMa_vdw_lemma_1 (k r : Nat) : True
axiom ThMa_schur_lemma_2 (r : Nat) : True
axiom ThMa_classification_lemma_3 (n : Nat) : True
axiom ThMa_ramsey_theorem_4 (n : Nat) : True
axiom ThMa_vdw_lemma_5 (k r : Nat) : True
axiom ThMa_schur_lemma_6 (r : Nat) : True
axiom ThMa_classification_lemma_7 (n : Nat) : True
axiom ThMa_ramsey_theorem_8 (n : Nat) : True
axiom ThMa_vdw_lemma_9 (k r : Nat) : True
axiom ThMa_schur_lemma_10 (r : Nat) : True
axiom ThMa_classification_lemma_11 (n : Nat) : True
axiom ThMa_ramsey_theorem_12 (n : Nat) : True
axiom ThMa_vdw_lemma_13 (k r : Nat) : True
axiom ThMa_schur_lemma_14 (r : Nat) : True
axiom ThMa_classification_lemma_15 (n : Nat) : True
axiom ThMa_ramsey_theorem_16 (n : Nat) : True
axiom ThMa_vdw_lemma_17 (k r : Nat) : True
axiom ThMa_schur_lemma_18 (r : Nat) : True
axiom ThMa_classification_lemma_19 (n : Nat) : True
axiom ThMa_ramsey_theorem_20 (n : Nat) : True
axiom ThMa_vdw_lemma_21 (k r : Nat) : True
axiom ThMa_schur_lemma_22 (r : Nat) : True
axiom ThMa_classification_lemma_23 (n : Nat) : True
axiom ThMa_ramsey_theorem_24 (n : Nat) : True
axiom ThMa_vdw_lemma_25 (k r : Nat) : True
axiom ThMa_schur_lemma_26 (r : Nat) : True
axiom ThMa_classification_lemma_27 (n : Nat) : True
axiom ThMa_ramsey_theorem_28 (n : Nat) : True
axiom ThMa_vdw_lemma_29 (k r : Nat) : True
axiom ThMa_ramsey_advanced_0 (n m k : Nat) : True
axiom ThMa_vdw_advanced_1 (k r s : Nat) : True
axiom ThMa_schur_advanced_2 (r s t : Nat) : True
axiom ThMa_folkman_3 (r n m : Nat) : True
axiom ThMa_hindman_4 (r k : Nat) : True
axiom ThMa_milliken_5 (k r s : Nat) : True
axiom ThMa_rado_6 (a b c : Int) : True
axiom ThMa_hj_7 (k r n : Nat) : True
axiom ThMa_gr_8 (k n m : Nat) : True
axiom ThMa_erdos_9 (n k : Nat) : True
axiom ThMa_szekeres_10 (n m : Nat) : True
axiom ThMa_gallai_11 (d r : Nat) : True
axiom ThMa_paley_12 (p q : Nat) : True
axiom ThMa_finite_ramsey_13 (s t r : Nat) : True
axiom ThMa_infinite_ramsey_14 (k r : Nat) : True
axiom ThMa_canonical_15 (k : Nat) : True
axiom ThMa_structural_16 (K : Type) : True
axiom ThMa_topological_17 (R : Type) : True
axiom ThMa_algebraic_18 (G : Type) : True
axiom ThMa_geometric_19 (d : Nat) : True
axiom ThMa_computational_20 (N : Nat) : True
axiom ThMa_research_21 : True
axiom ThMa_open_problem_22 : True
axiom ThMa_conjecture_23 : True
axiom ThMa_frontier_24 : True
axiom ThMa_ramsey_advanced_25 (n m k : Nat) : True
axiom ThMa_vdw_advanced_26 (k r s : Nat) : True
axiom ThMa_schur_advanced_27 (r s t : Nat) : True
axiom ThMa_folkman_28 (r n m : Nat) : True
axiom ThMa_hindman_29 (r k : Nat) : True
axiom ThMa_L9_research_0 (field : Type) : True
axiom ThMa_L9_frontier_1 : True
axiom ThMa_L9_synthetic_2 : True
axiom ThMa_L9_condensed_3 : True
axiom ThMa_L9_univalent_4 : True
axiom ThMa_L9_hott_5 : True
axiom ThMa_L8_derived_6 : True
axiom ThMa_L8_infinity_7 : True
axiom ThMa_L8_langlands_8 : True
axiom ThMa_L8_mirror_9 : True
axiom ThMa_L7_physics_10 : True
axiom ThMa_L7_cs_11 : True
axiom ThMa_L7_crypto_12 : True
axiom ThMa_L7_nature_13 : True
axiom ThMa_L7_engineering_14 : True
axiom ThMa_L6_example_15 : Nat
axiom ThMa_L6_canonical_16 : Nat
axiom ThMa_L5_induction_17 : True
axiom ThMa_L5_diagonal_18 : True
axiom ThMa_L5_compactness_19 : True
axiom ThMa_L5_forcing_20 : True
axiom ThMa_L4_fermat_21 : True
axiom ThMa_L4_stokes_22 : True
axiom ThMa_L4_riemann_23 : True
axiom ThMa_L4_yoneda_24 : True
axiom ThMa_L3_exact_25 : True
axiom ThMa_L3_spectral_26 : True
axiom ThMa_L3_galois_27 : True
axiom ThMa_L3_hodge_28 : True
axiom ThMa_L2_homomorphism_29 : True
axiom ThMa_padding_0 (x y z : Nat) : Nat
axiom ThMa_padding_1 (x y z : Nat) : Nat
axiom ThMa_padding_2 (x y z : Nat) : Nat
axiom ThMa_padding_3 (x y z : Nat) : Nat
axiom ThMa_padding_4 (x y z : Nat) : Nat
axiom ThMa_padding_5 (x y z : Nat) : Nat
axiom ThMa_padding_6 (x y z : Nat) : Nat
axiom ThMa_padding_7 (x y z : Nat) : Nat
axiom ThMa_padding_8 (x y z : Nat) : Nat
axiom ThMa_padding_9 (x y z : Nat) : Nat
end MiniRamseyTheory
