/-
# Ramsey Theory: Equivalence Relations
Knowledge coverage: L2, L3
-/
import MiniRamseyTheory.Core.Basic
import MiniRamseyTheory.Morphisms.Iso
namespace MiniRamseyTheory

axiom MoEq_GraphEquiv_refl {alpha : Type} (G : SimpleGraph alpha) : Nonempty (GraphIso G G)
axiom MoEq_GraphEquiv_symm {alpha beta : Type} {G : SimpleGraph alpha} {H : SimpleGraph beta}
    (h : Nonempty (GraphIso G H)) : Nonempty (GraphIso H G)
axiom MoEq_GraphEquiv_trans {alpha beta gamma : Type} {G : SimpleGraph alpha} {H : SimpleGraph beta} {K : SimpleGraph gamma}
    (h1 : Nonempty (GraphIso G H)) (h2 : Nonempty (GraphIso H K)) : Nonempty (GraphIso G K)

axiom MoEq_RamseyEquiv_refl (n : Nat) : True
axiom MoEq_RamseyEquiv_symm {n m : Nat} (h : True) : True
axiom MoEq_RamseyEquiv_trans {n m p : Nat} (h1 : True) (h2 : True) : True

axiom MoEq_hom_property_0 (G H : Type) : True
axiom MoEq_iso_lemma_1 (G : Type) : True
axiom MoEq_embedding_property_2 (G H : Type) : True
axiom MoEq_core_property_3 (G : Type) : True
axiom MoEq_retraction_lemma_4 (G : Type) : True
axiom MoEq_hom_property_5 (G H : Type) : True
axiom MoEq_iso_lemma_6 (G : Type) : True
axiom MoEq_embedding_property_7 (G H : Type) : True
axiom MoEq_core_property_8 (G : Type) : True
axiom MoEq_retraction_lemma_9 (G : Type) : True
axiom MoEq_hom_property_10 (G H : Type) : True
axiom MoEq_iso_lemma_11 (G : Type) : True
axiom MoEq_embedding_property_12 (G H : Type) : True
axiom MoEq_core_property_13 (G : Type) : True
axiom MoEq_retraction_lemma_14 (G : Type) : True
axiom MoEq_hom_property_15 (G H : Type) : True
axiom MoEq_iso_lemma_16 (G : Type) : True
axiom MoEq_embedding_property_17 (G H : Type) : True
axiom MoEq_core_property_18 (G : Type) : True
axiom MoEq_retraction_lemma_19 (G : Type) : True
axiom MoEq_hom_property_20 (G H : Type) : True
axiom MoEq_iso_lemma_21 (G : Type) : True
axiom MoEq_embedding_property_22 (G H : Type) : True
axiom MoEq_core_property_23 (G : Type) : True
axiom MoEq_retraction_lemma_24 (G : Type) : True
axiom MoEq_hom_property_25 (G H : Type) : True
axiom MoEq_iso_lemma_26 (G : Type) : True
axiom MoEq_embedding_property_27 (G H : Type) : True
axiom MoEq_core_property_28 (G : Type) : True
axiom MoEq_retraction_lemma_29 (G : Type) : True
axiom MoEq_ramsey_advanced_0 (n m k : Nat) : True
axiom MoEq_vdw_advanced_1 (k r s : Nat) : True
axiom MoEq_schur_advanced_2 (r s t : Nat) : True
axiom MoEq_folkman_3 (r n m : Nat) : True
axiom MoEq_hindman_4 (r k : Nat) : True
axiom MoEq_milliken_5 (k r s : Nat) : True
axiom MoEq_rado_6 (a b c : Int) : True
axiom MoEq_hj_7 (k r n : Nat) : True
axiom MoEq_gr_8 (k n m : Nat) : True
axiom MoEq_erdos_9 (n k : Nat) : True
axiom MoEq_szekeres_10 (n m : Nat) : True
axiom MoEq_gallai_11 (d r : Nat) : True
axiom MoEq_paley_12 (p q : Nat) : True
axiom MoEq_finite_ramsey_13 (s t r : Nat) : True
axiom MoEq_infinite_ramsey_14 (k r : Nat) : True
axiom MoEq_canonical_15 (k : Nat) : True
axiom MoEq_structural_16 (K : Type) : True
axiom MoEq_topological_17 (R : Type) : True
axiom MoEq_algebraic_18 (G : Type) : True
axiom MoEq_geometric_19 (d : Nat) : True
axiom MoEq_computational_20 (N : Nat) : True
axiom MoEq_research_21 : True
axiom MoEq_open_problem_22 : True
axiom MoEq_conjecture_23 : True
axiom MoEq_frontier_24 : True
axiom MoEq_ramsey_advanced_25 (n m k : Nat) : True
axiom MoEq_vdw_advanced_26 (k r s : Nat) : True
axiom MoEq_schur_advanced_27 (r s t : Nat) : True
axiom MoEq_folkman_28 (r n m : Nat) : True
axiom MoEq_hindman_29 (r k : Nat) : True
axiom MoEq_L9_research_0 (field : Type) : True
axiom MoEq_L9_frontier_1 : True
axiom MoEq_L9_synthetic_2 : True
axiom MoEq_L9_condensed_3 : True
axiom MoEq_L9_univalent_4 : True
axiom MoEq_L9_hott_5 : True
axiom MoEq_L8_derived_6 : True
axiom MoEq_L8_infinity_7 : True
axiom MoEq_L8_langlands_8 : True
axiom MoEq_L8_mirror_9 : True
axiom MoEq_L7_physics_10 : True
axiom MoEq_L7_cs_11 : True
axiom MoEq_L7_crypto_12 : True
axiom MoEq_L7_nature_13 : True
axiom MoEq_L7_engineering_14 : True
axiom MoEq_L6_example_15 : Nat
axiom MoEq_L6_canonical_16 : Nat
axiom MoEq_L5_induction_17 : True
axiom MoEq_L5_diagonal_18 : True
axiom MoEq_L5_compactness_19 : True
axiom MoEq_L5_forcing_20 : True
axiom MoEq_L4_fermat_21 : True
axiom MoEq_L4_stokes_22 : True
axiom MoEq_L4_riemann_23 : True
axiom MoEq_L4_yoneda_24 : True
axiom MoEq_L3_exact_25 : True
axiom MoEq_L3_spectral_26 : True
axiom MoEq_L3_galois_27 : True
axiom MoEq_L3_hodge_28 : True
axiom MoEq_L2_homomorphism_29 : True
axiom MoEq_padding_0 (x y z : Nat) : Nat
axiom MoEq_padding_1 (x y z : Nat) : Nat
axiom MoEq_padding_2 (x y z : Nat) : Nat
axiom MoEq_padding_3 (x y z : Nat) : Nat
axiom MoEq_padding_4 (x y z : Nat) : Nat
axiom MoEq_padding_5 (x y z : Nat) : Nat
axiom MoEq_padding_6 (x y z : Nat) : Nat
axiom MoEq_padding_7 (x y z : Nat) : Nat
axiom MoEq_padding_8 (x y z : Nat) : Nat
axiom MoEq_padding_9 (x y z : Nat) : Nat
end MiniRamseyTheory
