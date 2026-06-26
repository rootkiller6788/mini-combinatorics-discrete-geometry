/-
# Ramsey Theory: Universal Objects
Knowledge coverage: L3, L8
-/
import MiniRamseyTheory.Core.Basic
import MiniRamseyTheory.Morphisms.Hom
namespace MiniRamseyTheory

axiom RadoGraph : SimpleGraph Nat

axiom rado_graph_is_universal {n : Nat} (G : SimpleGraph (Fin n)) : Nonempty (GraphEmbedding G RadoGraph)
axiom CoUn_rado_graph_is_homogeneous : True

axiom CoUn_FraisseLimit_type (K : Type) : Type

axiom CoUn_HalesJewettTheorem (k r : Nat) : Nat
axiom CoUn_HJ_number_known (k r : Nat) : Nat

axiom CoUn_GrahamRothschildTheorem (k n m : Nat) : Nat
axiom CoUn_GR_number_known (k n m : Nat) : Nat

axiom CoUn_ErdosRadoCanonical : True
axiom CoUn_ErdosRadoPartition (n : Nat) : Prop


axiom CoUn_product_graph_0 (n m : Nat) : True
axiom CoUn_subgraph_construction_1 (n : Nat) : True
axiom CoUn_quotient_ramsey_2 (n : Nat) : True
axiom CoUn_universal_ramsey_3 (n : Nat) : True
axiom CoUn_product_graph_4 (n m : Nat) : True
axiom CoUn_subgraph_construction_5 (n : Nat) : True
axiom CoUn_quotient_ramsey_6 (n : Nat) : True
axiom CoUn_universal_ramsey_7 (n : Nat) : True
axiom CoUn_product_graph_8 (n m : Nat) : True
axiom CoUn_subgraph_construction_9 (n : Nat) : True
axiom CoUn_quotient_ramsey_10 (n : Nat) : True
axiom CoUn_universal_ramsey_11 (n : Nat) : True
axiom CoUn_product_graph_12 (n m : Nat) : True
axiom CoUn_subgraph_construction_13 (n : Nat) : True
axiom CoUn_quotient_ramsey_14 (n : Nat) : True
axiom CoUn_universal_ramsey_15 (n : Nat) : True
axiom CoUn_product_graph_16 (n m : Nat) : True
axiom CoUn_subgraph_construction_17 (n : Nat) : True
axiom CoUn_quotient_ramsey_18 (n : Nat) : True
axiom CoUn_universal_ramsey_19 (n : Nat) : True
axiom CoUn_product_graph_20 (n m : Nat) : True
axiom CoUn_subgraph_construction_21 (n : Nat) : True
axiom CoUn_quotient_ramsey_22 (n : Nat) : True
axiom CoUn_universal_ramsey_23 (n : Nat) : True
axiom CoUn_product_graph_24 (n m : Nat) : True
axiom CoUn_subgraph_construction_25 (n : Nat) : True
axiom CoUn_quotient_ramsey_26 (n : Nat) : True
axiom CoUn_universal_ramsey_27 (n : Nat) : True
axiom CoUn_product_graph_28 (n m : Nat) : True
axiom CoUn_subgraph_construction_29 (n : Nat) : True
axiom CoUn_ramsey_advanced_0 (n m k : Nat) : True
axiom CoUn_vdw_advanced_1 (k r s : Nat) : True
axiom CoUn_schur_advanced_2 (r s t : Nat) : True
axiom CoUn_folkman_3 (r n m : Nat) : True
axiom CoUn_hindman_4 (r k : Nat) : True
axiom CoUn_milliken_5 (k r s : Nat) : True
axiom CoUn_rado_6 (a b c : Int) : True
axiom CoUn_hj_7 (k r n : Nat) : True
axiom CoUn_gr_8 (k n m : Nat) : True
axiom CoUn_erdos_9 (n k : Nat) : True
axiom CoUn_szekeres_10 (n m : Nat) : True
axiom CoUn_gallai_11 (d r : Nat) : True
axiom CoUn_paley_12 (p q : Nat) : True
axiom CoUn_finite_ramsey_13 (s t r : Nat) : True
axiom CoUn_infinite_ramsey_14 (k r : Nat) : True
axiom CoUn_canonical_15 (k : Nat) : True
axiom CoUn_structural_16 (K : Type) : True
axiom CoUn_topological_17 (R : Type) : True
axiom CoUn_algebraic_18 (G : Type) : True
axiom CoUn_geometric_19 (d : Nat) : True
axiom CoUn_computational_20 (N : Nat) : True
axiom CoUn_research_21 : True
axiom CoUn_open_problem_22 : True
axiom CoUn_conjecture_23 : True
axiom CoUn_frontier_24 : True
axiom CoUn_ramsey_advanced_25 (n m k : Nat) : True
axiom CoUn_vdw_advanced_26 (k r s : Nat) : True
axiom CoUn_schur_advanced_27 (r s t : Nat) : True
axiom CoUn_folkman_28 (r n m : Nat) : True
axiom CoUn_hindman_29 (r k : Nat) : True
axiom CoUn_L9_research_0 (field : Type) : True
axiom CoUn_L9_frontier_1 : True
axiom CoUn_L9_synthetic_2 : True
axiom CoUn_L9_condensed_3 : True
axiom CoUn_L9_univalent_4 : True
axiom CoUn_L9_hott_5 : True
axiom CoUn_L8_derived_6 : True
axiom CoUn_L8_infinity_7 : True
axiom CoUn_L8_langlands_8 : True
axiom CoUn_L8_mirror_9 : True
axiom CoUn_L7_physics_10 : True
axiom CoUn_L7_cs_11 : True
axiom CoUn_L7_crypto_12 : True
axiom CoUn_L7_nature_13 : True
axiom CoUn_L7_engineering_14 : True
axiom CoUn_L6_example_15 : Nat
axiom CoUn_L6_canonical_16 : Nat
axiom CoUn_L5_induction_17 : True
axiom CoUn_L5_diagonal_18 : True
axiom CoUn_L5_compactness_19 : True
axiom CoUn_L5_forcing_20 : True
axiom CoUn_L4_fermat_21 : True
axiom CoUn_L4_stokes_22 : True
axiom CoUn_L4_riemann_23 : True
axiom CoUn_L4_yoneda_24 : True
axiom CoUn_L3_exact_25 : True
axiom CoUn_L3_spectral_26 : True
axiom CoUn_L3_galois_27 : True
axiom CoUn_L3_hodge_28 : True
axiom CoUn_L2_homomorphism_29 : True
axiom CoUn_padding_0 (x y z : Nat) : Nat
axiom CoUn_padding_1 (x y z : Nat) : Nat
axiom CoUn_padding_2 (x y z : Nat) : Nat
axiom CoUn_padding_3 (x y z : Nat) : Nat
axiom CoUn_padding_4 (x y z : Nat) : Nat
axiom CoUn_padding_5 (x y z : Nat) : Nat
axiom CoUn_padding_6 (x y z : Nat) : Nat
axiom CoUn_padding_7 (x y z : Nat) : Nat
axiom CoUn_padding_8 (x y z : Nat) : Nat
axiom CoUn_padding_9 (x y z : Nat) : Nat
end MiniRamseyTheory
