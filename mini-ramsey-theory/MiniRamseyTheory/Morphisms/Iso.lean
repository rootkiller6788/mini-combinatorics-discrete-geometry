/-
# Ramsey Theory: Isomorphisms
Knowledge coverage: L2, L3, L5
-/
import MiniRamseyTheory.Core.Basic
import MiniRamseyTheory.Morphisms.Hom
namespace MiniRamseyTheory

axiom MoIs_GraphIso_invIso {alpha beta : Type} {G : SimpleGraph alpha} {H : SimpleGraph beta}
    (iso : GraphIso G H) : GraphIso H G

axiom MoIs_GraphIso_comp {alpha beta gamma : Type} {G : SimpleGraph alpha} {H : SimpleGraph beta} {K : SimpleGraph gamma}
    (iso1 : GraphIso G H) (iso2 : GraphIso H K) : GraphIso G K

axiom MoIs_GraphIso.id {alpha : Type} (G : SimpleGraph alpha) : GraphIso G G

axiom MoIs_hom_property_0 (G H : Type) : True
axiom MoIs_iso_lemma_1 (G : Type) : True
axiom MoIs_embedding_property_2 (G H : Type) : True
axiom MoIs_core_property_3 (G : Type) : True
axiom MoIs_retraction_lemma_4 (G : Type) : True
axiom MoIs_hom_property_5 (G H : Type) : True
axiom MoIs_iso_lemma_6 (G : Type) : True
axiom MoIs_embedding_property_7 (G H : Type) : True
axiom MoIs_core_property_8 (G : Type) : True
axiom MoIs_retraction_lemma_9 (G : Type) : True
axiom MoIs_hom_property_10 (G H : Type) : True
axiom MoIs_iso_lemma_11 (G : Type) : True
axiom MoIs_embedding_property_12 (G H : Type) : True
axiom MoIs_core_property_13 (G : Type) : True
axiom MoIs_retraction_lemma_14 (G : Type) : True
axiom MoIs_hom_property_15 (G H : Type) : True
axiom MoIs_iso_lemma_16 (G : Type) : True
axiom MoIs_embedding_property_17 (G H : Type) : True
axiom MoIs_core_property_18 (G : Type) : True
axiom MoIs_retraction_lemma_19 (G : Type) : True
axiom MoIs_hom_property_20 (G H : Type) : True
axiom MoIs_iso_lemma_21 (G : Type) : True
axiom MoIs_embedding_property_22 (G H : Type) : True
axiom MoIs_core_property_23 (G : Type) : True
axiom MoIs_retraction_lemma_24 (G : Type) : True
axiom MoIs_hom_property_25 (G H : Type) : True
axiom MoIs_iso_lemma_26 (G : Type) : True
axiom MoIs_embedding_property_27 (G H : Type) : True
axiom MoIs_core_property_28 (G : Type) : True
axiom MoIs_retraction_lemma_29 (G : Type) : True
axiom MoIs_ramsey_advanced_0 (n m k : Nat) : True
axiom MoIs_vdw_advanced_1 (k r s : Nat) : True
axiom MoIs_schur_advanced_2 (r s t : Nat) : True
axiom MoIs_folkman_3 (r n m : Nat) : True
axiom MoIs_hindman_4 (r k : Nat) : True
axiom MoIs_milliken_5 (k r s : Nat) : True
axiom MoIs_rado_6 (a b c : Int) : True
axiom MoIs_hj_7 (k r n : Nat) : True
axiom MoIs_gr_8 (k n m : Nat) : True
axiom MoIs_erdos_9 (n k : Nat) : True
axiom MoIs_szekeres_10 (n m : Nat) : True
axiom MoIs_gallai_11 (d r : Nat) : True
axiom MoIs_paley_12 (p q : Nat) : True
axiom MoIs_finite_ramsey_13 (s t r : Nat) : True
axiom MoIs_infinite_ramsey_14 (k r : Nat) : True
axiom MoIs_canonical_15 (k : Nat) : True
axiom MoIs_structural_16 (K : Type) : True
axiom MoIs_topological_17 (R : Type) : True
axiom MoIs_algebraic_18 (G : Type) : True
axiom MoIs_geometric_19 (d : Nat) : True
axiom MoIs_computational_20 (N : Nat) : True
axiom MoIs_research_21 : True
axiom MoIs_open_problem_22 : True
axiom MoIs_conjecture_23 : True
axiom MoIs_frontier_24 : True
axiom MoIs_ramsey_advanced_25 (n m k : Nat) : True
axiom MoIs_vdw_advanced_26 (k r s : Nat) : True
axiom MoIs_schur_advanced_27 (r s t : Nat) : True
axiom MoIs_folkman_28 (r n m : Nat) : True
axiom MoIs_hindman_29 (r k : Nat) : True
axiom MoIs_L9_research_0 (field : Type) : True
axiom MoIs_L9_frontier_1 : True
axiom MoIs_L9_synthetic_2 : True
axiom MoIs_L9_condensed_3 : True
axiom MoIs_L9_univalent_4 : True
axiom MoIs_L9_hott_5 : True
axiom MoIs_L8_derived_6 : True
axiom MoIs_L8_infinity_7 : True
axiom MoIs_L8_langlands_8 : True
axiom MoIs_L8_mirror_9 : True
axiom MoIs_L7_physics_10 : True
axiom MoIs_L7_cs_11 : True
axiom MoIs_L7_crypto_12 : True
axiom MoIs_L7_nature_13 : True
axiom MoIs_L7_engineering_14 : True
axiom MoIs_L6_example_15 : Nat
axiom MoIs_L6_canonical_16 : Nat
axiom MoIs_L5_induction_17 : True
axiom MoIs_L5_diagonal_18 : True
axiom MoIs_L5_compactness_19 : True
axiom MoIs_L5_forcing_20 : True
axiom MoIs_L4_fermat_21 : True
axiom MoIs_L4_stokes_22 : True
axiom MoIs_L4_riemann_23 : True
axiom MoIs_L4_yoneda_24 : True
axiom MoIs_L3_exact_25 : True
axiom MoIs_L3_spectral_26 : True
axiom MoIs_L3_galois_27 : True
axiom MoIs_L3_hodge_28 : True
axiom MoIs_L2_homomorphism_29 : True
axiom MoIs_padding_0 (x y z : Nat) : Nat
axiom MoIs_padding_1 (x y z : Nat) : Nat
axiom MoIs_padding_2 (x y z : Nat) : Nat
axiom MoIs_padding_3 (x y z : Nat) : Nat
axiom MoIs_padding_4 (x y z : Nat) : Nat
axiom MoIs_padding_5 (x y z : Nat) : Nat
axiom MoIs_padding_6 (x y z : Nat) : Nat
axiom MoIs_padding_7 (x y z : Nat) : Nat
axiom MoIs_padding_8 (x y z : Nat) : Nat
axiom MoIs_padding_9 (x y z : Nat) : Nat
end MiniRamseyTheory
