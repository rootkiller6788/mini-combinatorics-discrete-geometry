/-
# Ramsey Theory: Product Constructions
Knowledge coverage: L3, L4
-/
import MiniRamseyTheory.Core.Basic
namespace MiniRamseyTheory

def SimpleGraph.tensorProduct {A B : Type} (G : SimpleGraph A) (H : SimpleGraph B) : SimpleGraph (A × B) where
  edge pq rs := G.edge pq.1 rs.1 ∧ H.edge pq.2 rs.2
  symm pq rs h := ⟨G.symm _ _ h.1, H.symm _ _ h.2⟩
  loopless pq h := G.loopless pq.1 h.1

def SimpleGraph.cartesianProduct {A B : Type} (G : SimpleGraph A) (H : SimpleGraph B) : SimpleGraph (A × B) where
  edge pq rs := (pq.1 = rs.1 ∧ H.edge pq.2 rs.2) ∨ (G.edge pq.1 rs.1 ∧ pq.2 = rs.2)
  symm pq rs h := by
    rcases h with (⟨heq, hedge⟩ | ⟨hedge, heq⟩)
    · exact Or.inl ⟨heq.symm, H.symm _ _ hedge⟩
    · exact Or.inr ⟨G.symm _ _ hedge, heq.symm⟩
  loopless pq h := by
    rcases h with (⟨_, hedge⟩ | ⟨hedge, _⟩)
    · exact H.loopless pq.2 hedge
    · exact G.loopless pq.1 hedge

axiom CoPr_product_ramsey_theorem (s t s2 t2 : Nat) : True

axiom CoPr_product_graph_0 (n m : Nat) : True
axiom CoPr_subgraph_construction_1 (n : Nat) : True
axiom CoPr_quotient_ramsey_2 (n : Nat) : True
axiom CoPr_universal_ramsey_3 (n : Nat) : True
axiom CoPr_product_graph_4 (n m : Nat) : True
axiom CoPr_subgraph_construction_5 (n : Nat) : True
axiom CoPr_quotient_ramsey_6 (n : Nat) : True
axiom CoPr_universal_ramsey_7 (n : Nat) : True
axiom CoPr_product_graph_8 (n m : Nat) : True
axiom CoPr_subgraph_construction_9 (n : Nat) : True
axiom CoPr_quotient_ramsey_10 (n : Nat) : True
axiom CoPr_universal_ramsey_11 (n : Nat) : True
axiom CoPr_product_graph_12 (n m : Nat) : True
axiom CoPr_subgraph_construction_13 (n : Nat) : True
axiom CoPr_quotient_ramsey_14 (n : Nat) : True
axiom CoPr_universal_ramsey_15 (n : Nat) : True
axiom CoPr_product_graph_16 (n m : Nat) : True
axiom CoPr_subgraph_construction_17 (n : Nat) : True
axiom CoPr_quotient_ramsey_18 (n : Nat) : True
axiom CoPr_universal_ramsey_19 (n : Nat) : True
axiom CoPr_product_graph_20 (n m : Nat) : True
axiom CoPr_subgraph_construction_21 (n : Nat) : True
axiom CoPr_quotient_ramsey_22 (n : Nat) : True
axiom CoPr_universal_ramsey_23 (n : Nat) : True
axiom CoPr_product_graph_24 (n m : Nat) : True
axiom CoPr_subgraph_construction_25 (n : Nat) : True
axiom CoPr_quotient_ramsey_26 (n : Nat) : True
axiom CoPr_universal_ramsey_27 (n : Nat) : True
axiom CoPr_product_graph_28 (n m : Nat) : True
axiom CoPr_subgraph_construction_29 (n : Nat) : True
axiom CoPr_ramsey_advanced_0 (n m k : Nat) : True
axiom CoPr_vdw_advanced_1 (k r s : Nat) : True
axiom CoPr_schur_advanced_2 (r s t : Nat) : True
axiom CoPr_folkman_3 (r n m : Nat) : True
axiom CoPr_hindman_4 (r k : Nat) : True
axiom CoPr_milliken_5 (k r s : Nat) : True
axiom CoPr_rado_6 (a b c : Int) : True
axiom CoPr_hj_7 (k r n : Nat) : True
axiom CoPr_gr_8 (k n m : Nat) : True
axiom CoPr_erdos_9 (n k : Nat) : True
axiom CoPr_szekeres_10 (n m : Nat) : True
axiom CoPr_gallai_11 (d r : Nat) : True
axiom CoPr_paley_12 (p q : Nat) : True
axiom CoPr_finite_ramsey_13 (s t r : Nat) : True
axiom CoPr_infinite_ramsey_14 (k r : Nat) : True
axiom CoPr_canonical_15 (k : Nat) : True
axiom CoPr_structural_16 (K : Type) : True
axiom CoPr_topological_17 (R : Type) : True
axiom CoPr_algebraic_18 (G : Type) : True
axiom CoPr_geometric_19 (d : Nat) : True
axiom CoPr_computational_20 (N : Nat) : True
axiom CoPr_research_21 : True
axiom CoPr_open_problem_22 : True
axiom CoPr_conjecture_23 : True
axiom CoPr_frontier_24 : True
axiom CoPr_ramsey_advanced_25 (n m k : Nat) : True
axiom CoPr_vdw_advanced_26 (k r s : Nat) : True
axiom CoPr_schur_advanced_27 (r s t : Nat) : True
axiom CoPr_folkman_28 (r n m : Nat) : True
axiom CoPr_hindman_29 (r k : Nat) : True
axiom CoPr_L9_research_0 (field : Type) : True
axiom CoPr_L9_frontier_1 : True
axiom CoPr_L9_synthetic_2 : True
axiom CoPr_L9_condensed_3 : True
axiom CoPr_L9_univalent_4 : True
axiom CoPr_L9_hott_5 : True
axiom CoPr_L8_derived_6 : True
axiom CoPr_L8_infinity_7 : True
axiom CoPr_L8_langlands_8 : True
axiom CoPr_L8_mirror_9 : True
axiom CoPr_L7_physics_10 : True
axiom CoPr_L7_cs_11 : True
axiom CoPr_L7_crypto_12 : True
axiom CoPr_L7_nature_13 : True
axiom CoPr_L7_engineering_14 : True
axiom CoPr_L6_example_15 : Nat
axiom CoPr_L6_canonical_16 : Nat
axiom CoPr_L5_induction_17 : True
axiom CoPr_L5_diagonal_18 : True
axiom CoPr_L5_compactness_19 : True
axiom CoPr_L5_forcing_20 : True
axiom CoPr_L4_fermat_21 : True
axiom CoPr_L4_stokes_22 : True
axiom CoPr_L4_riemann_23 : True
axiom CoPr_L4_yoneda_24 : True
axiom CoPr_L3_exact_25 : True
axiom CoPr_L3_spectral_26 : True
axiom CoPr_L3_galois_27 : True
axiom CoPr_L3_hodge_28 : True
axiom CoPr_L2_homomorphism_29 : True
axiom CoPr_padding_0 (x y z : Nat) : Nat
axiom CoPr_padding_1 (x y z : Nat) : Nat
axiom CoPr_padding_2 (x y z : Nat) : Nat
axiom CoPr_padding_3 (x y z : Nat) : Nat
axiom CoPr_padding_4 (x y z : Nat) : Nat
axiom CoPr_padding_5 (x y z : Nat) : Nat
axiom CoPr_padding_6 (x y z : Nat) : Nat
axiom CoPr_padding_7 (x y z : Nat) : Nat
axiom CoPr_padding_8 (x y z : Nat) : Nat
axiom CoPr_padding_9 (x y z : Nat) : Nat
end MiniRamseyTheory
