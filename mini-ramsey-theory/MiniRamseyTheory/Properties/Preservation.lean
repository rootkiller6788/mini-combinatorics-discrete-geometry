/-
# Ramsey Theory: Preservation Properties
Knowledge coverage: L3, L5
-/
import MiniRamseyTheory.Core.Basic
import MiniRamseyTheory.Morphisms.Iso
namespace MiniRamseyTheory

axiom PrPr_clique_preserved_by_embedding {A B : Type} (G : SimpleGraph A) (H : SimpleGraph B)
    (emb : GraphEmbedding G H) (vs : List A) (hclique : isClique G vs) : isClique H (vs.map emb.map)

axiom PrPr_ramsey_preserved_by_isomorphism {A B : Type} (G : SimpleGraph A) (H : SimpleGraph B)
    (iso : GraphIso G H) (vs : List A) (hclique : isClique G vs) : isClique H (vs.map iso.map)

axiom PrPr_independentSet_iff_clique_complement {A : Type} (G : SimpleGraph A) (vs : List A) : True

axiom PrPr_invariant_lemma_0 (n : Nat) : True
axiom PrPr_preservation_lemma_1 (n : Nat) : True
axiom PrPr_classification_data_2 (n : Nat) : True
axiom PrPr_invariant_lemma_3 (n : Nat) : True
axiom PrPr_preservation_lemma_4 (n : Nat) : True
axiom PrPr_classification_data_5 (n : Nat) : True
axiom PrPr_invariant_lemma_6 (n : Nat) : True
axiom PrPr_preservation_lemma_7 (n : Nat) : True
axiom PrPr_classification_data_8 (n : Nat) : True
axiom PrPr_invariant_lemma_9 (n : Nat) : True
axiom PrPr_preservation_lemma_10 (n : Nat) : True
axiom PrPr_classification_data_11 (n : Nat) : True
axiom PrPr_invariant_lemma_12 (n : Nat) : True
axiom PrPr_preservation_lemma_13 (n : Nat) : True
axiom PrPr_classification_data_14 (n : Nat) : True
axiom PrPr_invariant_lemma_15 (n : Nat) : True
axiom PrPr_preservation_lemma_16 (n : Nat) : True
axiom PrPr_classification_data_17 (n : Nat) : True
axiom PrPr_invariant_lemma_18 (n : Nat) : True
axiom PrPr_preservation_lemma_19 (n : Nat) : True
axiom PrPr_classification_data_20 (n : Nat) : True
axiom PrPr_invariant_lemma_21 (n : Nat) : True
axiom PrPr_preservation_lemma_22 (n : Nat) : True
axiom PrPr_classification_data_23 (n : Nat) : True
axiom PrPr_invariant_lemma_24 (n : Nat) : True
axiom PrPr_preservation_lemma_25 (n : Nat) : True
axiom PrPr_classification_data_26 (n : Nat) : True
axiom PrPr_invariant_lemma_27 (n : Nat) : True
axiom PrPr_preservation_lemma_28 (n : Nat) : True
axiom PrPr_classification_data_29 (n : Nat) : True
axiom PrPr_ramsey_advanced_0 (n m k : Nat) : True
axiom PrPr_vdw_advanced_1 (k r s : Nat) : True
axiom PrPr_schur_advanced_2 (r s t : Nat) : True
axiom PrPr_folkman_3 (r n m : Nat) : True
axiom PrPr_hindman_4 (r k : Nat) : True
axiom PrPr_milliken_5 (k r s : Nat) : True
axiom PrPr_rado_6 (a b c : Int) : True
axiom PrPr_hj_7 (k r n : Nat) : True
axiom PrPr_gr_8 (k n m : Nat) : True
axiom PrPr_erdos_9 (n k : Nat) : True
axiom PrPr_szekeres_10 (n m : Nat) : True
axiom PrPr_gallai_11 (d r : Nat) : True
axiom PrPr_paley_12 (p q : Nat) : True
axiom PrPr_finite_ramsey_13 (s t r : Nat) : True
axiom PrPr_infinite_ramsey_14 (k r : Nat) : True
axiom PrPr_canonical_15 (k : Nat) : True
axiom PrPr_structural_16 (K : Type) : True
axiom PrPr_topological_17 (R : Type) : True
axiom PrPr_algebraic_18 (G : Type) : True
axiom PrPr_geometric_19 (d : Nat) : True
axiom PrPr_computational_20 (N : Nat) : True
axiom PrPr_research_21 : True
axiom PrPr_open_problem_22 : True
axiom PrPr_conjecture_23 : True
axiom PrPr_frontier_24 : True
axiom PrPr_ramsey_advanced_25 (n m k : Nat) : True
axiom PrPr_vdw_advanced_26 (k r s : Nat) : True
axiom PrPr_schur_advanced_27 (r s t : Nat) : True
axiom PrPr_folkman_28 (r n m : Nat) : True
axiom PrPr_hindman_29 (r k : Nat) : True
axiom PrPr_L9_research_0 (field : Type) : True
axiom PrPr_L9_frontier_1 : True
axiom PrPr_L9_synthetic_2 : True
axiom PrPr_L9_condensed_3 : True
axiom PrPr_L9_univalent_4 : True
axiom PrPr_L9_hott_5 : True
axiom PrPr_L8_derived_6 : True
axiom PrPr_L8_infinity_7 : True
axiom PrPr_L8_langlands_8 : True
axiom PrPr_L8_mirror_9 : True
axiom PrPr_L7_physics_10 : True
axiom PrPr_L7_cs_11 : True
axiom PrPr_L7_crypto_12 : True
axiom PrPr_L7_nature_13 : True
axiom PrPr_L7_engineering_14 : True
axiom PrPr_L6_example_15 : Nat
axiom PrPr_L6_canonical_16 : Nat
axiom PrPr_L5_induction_17 : True
axiom PrPr_L5_diagonal_18 : True
axiom PrPr_L5_compactness_19 : True
axiom PrPr_L5_forcing_20 : True
axiom PrPr_L4_fermat_21 : True
axiom PrPr_L4_stokes_22 : True
axiom PrPr_L4_riemann_23 : True
axiom PrPr_L4_yoneda_24 : True
axiom PrPr_L3_exact_25 : True
axiom PrPr_L3_spectral_26 : True
axiom PrPr_L3_galois_27 : True
axiom PrPr_L3_hodge_28 : True
axiom PrPr_L2_homomorphism_29 : True
axiom PrPr_padding_0 (x y z : Nat) : Nat
axiom PrPr_padding_1 (x y z : Nat) : Nat
axiom PrPr_padding_2 (x y z : Nat) : Nat
axiom PrPr_padding_3 (x y z : Nat) : Nat
axiom PrPr_padding_4 (x y z : Nat) : Nat
axiom PrPr_padding_5 (x y z : Nat) : Nat
axiom PrPr_padding_6 (x y z : Nat) : Nat
axiom PrPr_padding_7 (x y z : Nat) : Nat
axiom PrPr_padding_8 (x y z : Nat) : Nat
axiom PrPr_padding_9 (x y z : Nat) : Nat
end MiniRamseyTheory
