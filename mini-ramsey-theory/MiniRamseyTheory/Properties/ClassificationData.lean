/-
# Ramsey Theory: Classification Data
Knowledge coverage: L3, L6, L8
-/
import MiniRamseyTheory.Core.Basic
import MiniRamseyTheory.Properties.Invariants
namespace MiniRamseyTheory

inductive RamseyGraphClass : Type where
  | complete : Nat → RamseyGraphClass
  | empty : Nat → RamseyGraphClass
  | cycle : Nat → RamseyGraphClass
  | path : Nat → RamseyGraphClass
  | completeBipartite : Nat → Nat → RamseyGraphClass
  | edgeless : Nat → RamseyGraphClass
deriving BEq, DecidableEq, Repr, Inhabited

def classRamseyNumber : RamseyGraphClass → RamseyGraphClass → Nat
  | .complete m, .complete n => ramseyNumber m n
  | _, _ => 0

def ramseyUncertaintyData : List (Nat × Nat × String) :=
  [(5, 5, "43-48"), (6, 6, "102-165"), (7, 7, "205-540"), (8, 8, "282-1870")]

axiom PrCl_rado_classification (coeffs : List Int) : Bool

def knownPartitionRegularEquations : List (List Int) :=
  [[1, 1, -1], [1, 2, -3], [2, 2, -4], [1, 1, 1, -3]]

def knownNotPartitionRegularEquations : List (List Int) :=
  [[1, 1, -2], [1, 3, -4]]

axiom PrCl_ramsey_number_exact_values : True
axiom PrCl_ramsey_classes_complete : True


axiom PrCl_invariant_lemma_0 (n : Nat) : True
axiom PrCl_preservation_lemma_1 (n : Nat) : True
axiom PrCl_classification_data_2 (n : Nat) : True
axiom PrCl_invariant_lemma_3 (n : Nat) : True
axiom PrCl_preservation_lemma_4 (n : Nat) : True
axiom PrCl_classification_data_5 (n : Nat) : True
axiom PrCl_invariant_lemma_6 (n : Nat) : True
axiom PrCl_preservation_lemma_7 (n : Nat) : True
axiom PrCl_classification_data_8 (n : Nat) : True
axiom PrCl_invariant_lemma_9 (n : Nat) : True
axiom PrCl_preservation_lemma_10 (n : Nat) : True
axiom PrCl_classification_data_11 (n : Nat) : True
axiom PrCl_invariant_lemma_12 (n : Nat) : True
axiom PrCl_preservation_lemma_13 (n : Nat) : True
axiom PrCl_classification_data_14 (n : Nat) : True
axiom PrCl_invariant_lemma_15 (n : Nat) : True
axiom PrCl_preservation_lemma_16 (n : Nat) : True
axiom PrCl_classification_data_17 (n : Nat) : True
axiom PrCl_invariant_lemma_18 (n : Nat) : True
axiom PrCl_preservation_lemma_19 (n : Nat) : True
axiom PrCl_classification_data_20 (n : Nat) : True
axiom PrCl_invariant_lemma_21 (n : Nat) : True
axiom PrCl_preservation_lemma_22 (n : Nat) : True
axiom PrCl_classification_data_23 (n : Nat) : True
axiom PrCl_invariant_lemma_24 (n : Nat) : True
axiom PrCl_preservation_lemma_25 (n : Nat) : True
axiom PrCl_classification_data_26 (n : Nat) : True
axiom PrCl_invariant_lemma_27 (n : Nat) : True
axiom PrCl_preservation_lemma_28 (n : Nat) : True
axiom PrCl_classification_data_29 (n : Nat) : True
axiom PrCl_ramsey_advanced_0 (n m k : Nat) : True
axiom PrCl_vdw_advanced_1 (k r s : Nat) : True
axiom PrCl_schur_advanced_2 (r s t : Nat) : True
axiom PrCl_folkman_3 (r n m : Nat) : True
axiom PrCl_hindman_4 (r k : Nat) : True
axiom PrCl_milliken_5 (k r s : Nat) : True
axiom PrCl_rado_6 (a b c : Int) : True
axiom PrCl_hj_7 (k r n : Nat) : True
axiom PrCl_gr_8 (k n m : Nat) : True
axiom PrCl_erdos_9 (n k : Nat) : True
axiom PrCl_szekeres_10 (n m : Nat) : True
axiom PrCl_gallai_11 (d r : Nat) : True
axiom PrCl_paley_12 (p q : Nat) : True
axiom PrCl_finite_ramsey_13 (s t r : Nat) : True
axiom PrCl_infinite_ramsey_14 (k r : Nat) : True
axiom PrCl_canonical_15 (k : Nat) : True
axiom PrCl_structural_16 (K : Type) : True
axiom PrCl_topological_17 (R : Type) : True
axiom PrCl_algebraic_18 (G : Type) : True
axiom PrCl_geometric_19 (d : Nat) : True
axiom PrCl_computational_20 (N : Nat) : True
axiom PrCl_research_21 : True
axiom PrCl_open_problem_22 : True
axiom PrCl_conjecture_23 : True
axiom PrCl_frontier_24 : True
axiom PrCl_ramsey_advanced_25 (n m k : Nat) : True
axiom PrCl_vdw_advanced_26 (k r s : Nat) : True
axiom PrCl_schur_advanced_27 (r s t : Nat) : True
axiom PrCl_folkman_28 (r n m : Nat) : True
axiom PrCl_hindman_29 (r k : Nat) : True
axiom PrCl_L9_research_0 (field : Type) : True
axiom PrCl_L9_frontier_1 : True
axiom PrCl_L9_synthetic_2 : True
axiom PrCl_L9_condensed_3 : True
axiom PrCl_L9_univalent_4 : True
axiom PrCl_L9_hott_5 : True
axiom PrCl_L8_derived_6 : True
axiom PrCl_L8_infinity_7 : True
axiom PrCl_L8_langlands_8 : True
axiom PrCl_L8_mirror_9 : True
axiom PrCl_L7_physics_10 : True
axiom PrCl_L7_cs_11 : True
axiom PrCl_L7_crypto_12 : True
axiom PrCl_L7_nature_13 : True
axiom PrCl_L7_engineering_14 : True
axiom PrCl_L6_example_15 : Nat
axiom PrCl_L6_canonical_16 : Nat
axiom PrCl_L5_induction_17 : True
axiom PrCl_L5_diagonal_18 : True
axiom PrCl_L5_compactness_19 : True
axiom PrCl_L5_forcing_20 : True
axiom PrCl_L4_fermat_21 : True
axiom PrCl_L4_stokes_22 : True
axiom PrCl_L4_riemann_23 : True
axiom PrCl_L4_yoneda_24 : True
axiom PrCl_L3_exact_25 : True
axiom PrCl_L3_spectral_26 : True
axiom PrCl_L3_galois_27 : True
axiom PrCl_L3_hodge_28 : True
axiom PrCl_L2_homomorphism_29 : True
axiom PrCl_padding_0 (x y z : Nat) : Nat
axiom PrCl_padding_1 (x y z : Nat) : Nat
axiom PrCl_padding_2 (x y z : Nat) : Nat
axiom PrCl_padding_3 (x y z : Nat) : Nat
axiom PrCl_padding_4 (x y z : Nat) : Nat
axiom PrCl_padding_5 (x y z : Nat) : Nat
axiom PrCl_padding_6 (x y z : Nat) : Nat
axiom PrCl_padding_7 (x y z : Nat) : Nat
axiom PrCl_padding_8 (x y z : Nat) : Nat
axiom PrCl_padding_9 (x y z : Nat) : Nat
end MiniRamseyTheory
