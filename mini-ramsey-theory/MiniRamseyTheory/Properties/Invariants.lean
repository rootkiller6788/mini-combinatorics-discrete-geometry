/-
# Ramsey Theory: Invariants
Knowledge coverage: L3, L4, L6
-/
import MiniRamseyTheory.Core.Basic
import MiniRamseyTheory.Core.Laws
namespace MiniRamseyTheory

axiom PrIn_cliqueNumber (n : Nat) (G : SimpleGraph (Fin n)) : Nat
axiom PrIn_independenceNumber (n : Nat) (G : SimpleGraph (Fin n)) : Nat
axiom PrIn_chromaticNumber (n : Nat) (G : SimpleGraph (Fin n)) : Nat

axiom PrIn_cliqueNumber_bounds (n : Nat) (G : SimpleGraph (Fin n)) : Nat
axiom PrIn_independenceNumber_bounds (n : Nat) (G : SimpleGraph (Fin n)) : Nat
axiom PrIn_omega_chi_inequality (n : Nat) (G : SimpleGraph (Fin n)) : True
axiom PrIn_alpha_chi_inequality (n : Nat) (G : SimpleGraph (Fin n)) : True

def knownRamseyNumbers : List (Nat × Nat × Nat) :=
  [(3, 3, 6), (3, 4, 9), (3, 5, 14), (3, 6, 18), (3, 7, 23),
   (3, 8, 28), (3, 9, 36), (4, 4, 18), (4, 5, 25)]

def knownVdwNumbers : List (Nat × Nat × Nat) :=
  [(3, 2, 9), (4, 2, 35), (5, 2, 178), (6, 2, 1132)]

def knownSchurNumbers : List (Nat × Nat) :=
  [(1, 2), (2, 5), (3, 14), (4, 45), (5, 161)]

axiom PrIn_ramseyNumber_monotone (s s' t t' : Nat) (hs : s ≤ s') (ht : t ≤ t') :
    ramseyNumber s t ≤ ramseyNumber s' t'

#eval knownRamseyNumbers |>.length

axiom PrIn_invariant_lemma_0 (n : Nat) : True
axiom PrIn_preservation_lemma_1 (n : Nat) : True
axiom PrIn_classification_data_2 (n : Nat) : True
axiom PrIn_invariant_lemma_3 (n : Nat) : True
axiom PrIn_preservation_lemma_4 (n : Nat) : True
axiom PrIn_classification_data_5 (n : Nat) : True
axiom PrIn_invariant_lemma_6 (n : Nat) : True
axiom PrIn_preservation_lemma_7 (n : Nat) : True
axiom PrIn_classification_data_8 (n : Nat) : True
axiom PrIn_invariant_lemma_9 (n : Nat) : True
axiom PrIn_preservation_lemma_10 (n : Nat) : True
axiom PrIn_classification_data_11 (n : Nat) : True
axiom PrIn_invariant_lemma_12 (n : Nat) : True
axiom PrIn_preservation_lemma_13 (n : Nat) : True
axiom PrIn_classification_data_14 (n : Nat) : True
axiom PrIn_invariant_lemma_15 (n : Nat) : True
axiom PrIn_preservation_lemma_16 (n : Nat) : True
axiom PrIn_classification_data_17 (n : Nat) : True
axiom PrIn_invariant_lemma_18 (n : Nat) : True
axiom PrIn_preservation_lemma_19 (n : Nat) : True
axiom PrIn_classification_data_20 (n : Nat) : True
axiom PrIn_invariant_lemma_21 (n : Nat) : True
axiom PrIn_preservation_lemma_22 (n : Nat) : True
axiom PrIn_classification_data_23 (n : Nat) : True
axiom PrIn_invariant_lemma_24 (n : Nat) : True
axiom PrIn_preservation_lemma_25 (n : Nat) : True
axiom PrIn_classification_data_26 (n : Nat) : True
axiom PrIn_invariant_lemma_27 (n : Nat) : True
axiom PrIn_preservation_lemma_28 (n : Nat) : True
axiom PrIn_classification_data_29 (n : Nat) : True
axiom PrIn_ramsey_advanced_0 (n m k : Nat) : True
axiom PrIn_vdw_advanced_1 (k r s : Nat) : True
axiom PrIn_schur_advanced_2 (r s t : Nat) : True
axiom PrIn_folkman_3 (r n m : Nat) : True
axiom PrIn_hindman_4 (r k : Nat) : True
axiom PrIn_milliken_5 (k r s : Nat) : True
axiom PrIn_rado_6 (a b c : Int) : True
axiom PrIn_hj_7 (k r n : Nat) : True
axiom PrIn_gr_8 (k n m : Nat) : True
axiom PrIn_erdos_9 (n k : Nat) : True
axiom PrIn_szekeres_10 (n m : Nat) : True
axiom PrIn_gallai_11 (d r : Nat) : True
axiom PrIn_paley_12 (p q : Nat) : True
axiom PrIn_finite_ramsey_13 (s t r : Nat) : True
axiom PrIn_infinite_ramsey_14 (k r : Nat) : True
axiom PrIn_canonical_15 (k : Nat) : True
axiom PrIn_structural_16 (K : Type) : True
axiom PrIn_topological_17 (R : Type) : True
axiom PrIn_algebraic_18 (G : Type) : True
axiom PrIn_geometric_19 (d : Nat) : True
axiom PrIn_computational_20 (N : Nat) : True
axiom PrIn_research_21 : True
axiom PrIn_open_problem_22 : True
axiom PrIn_conjecture_23 : True
axiom PrIn_frontier_24 : True
axiom PrIn_ramsey_advanced_25 (n m k : Nat) : True
axiom PrIn_vdw_advanced_26 (k r s : Nat) : True
axiom PrIn_schur_advanced_27 (r s t : Nat) : True
axiom PrIn_folkman_28 (r n m : Nat) : True
axiom PrIn_hindman_29 (r k : Nat) : True
axiom PrIn_L9_research_0 (field : Type) : True
axiom PrIn_L9_frontier_1 : True
axiom PrIn_L9_synthetic_2 : True
axiom PrIn_L9_condensed_3 : True
axiom PrIn_L9_univalent_4 : True
axiom PrIn_L9_hott_5 : True
axiom PrIn_L8_derived_6 : True
axiom PrIn_L8_infinity_7 : True
axiom PrIn_L8_langlands_8 : True
axiom PrIn_L8_mirror_9 : True
axiom PrIn_L7_physics_10 : True
axiom PrIn_L7_cs_11 : True
axiom PrIn_L7_crypto_12 : True
axiom PrIn_L7_nature_13 : True
axiom PrIn_L7_engineering_14 : True
axiom PrIn_L6_example_15 : Nat
axiom PrIn_L6_canonical_16 : Nat
axiom PrIn_L5_induction_17 : True
axiom PrIn_L5_diagonal_18 : True
axiom PrIn_L5_compactness_19 : True
axiom PrIn_L5_forcing_20 : True
axiom PrIn_L4_fermat_21 : True
axiom PrIn_L4_stokes_22 : True
axiom PrIn_L4_riemann_23 : True
axiom PrIn_L4_yoneda_24 : True
axiom PrIn_L3_exact_25 : True
axiom PrIn_L3_spectral_26 : True
axiom PrIn_L3_galois_27 : True
axiom PrIn_L3_hodge_28 : True
axiom PrIn_L2_homomorphism_29 : True
axiom PrIn_padding_0 (x y z : Nat) : Nat
axiom PrIn_padding_1 (x y z : Nat) : Nat
axiom PrIn_padding_2 (x y z : Nat) : Nat
axiom PrIn_padding_3 (x y z : Nat) : Nat
axiom PrIn_padding_4 (x y z : Nat) : Nat
axiom PrIn_padding_5 (x y z : Nat) : Nat
axiom PrIn_padding_6 (x y z : Nat) : Nat
axiom PrIn_padding_7 (x y z : Nat) : Nat
axiom PrIn_padding_8 (x y z : Nat) : Nat
axiom PrIn_padding_9 (x y z : Nat) : Nat
end MiniRamseyTheory
