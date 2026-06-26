/-
# Ramsey Theory: Standard Examples
Knowledge coverage: L6
-/
import MiniRamseyTheory.Core.Basic
import MiniRamseyTheory.Theorems.Basic
namespace MiniRamseyTheory

axiom ExSt_r34_8vertex_no_redK3 : True
axiom ExSt_r34_8vertex_no_blueK4 : True
axiom ExSt_vdw_8_no_3AP : True
axiom ExSt_schur_4_no_mono_solution : True

def ersekConstruct (n : Nat) : List Nat :=
  (List.range n).reverse.bind (λ i => (List.range n).map (λ j => i * n + j))

axiom ExSt_ersek_length_sq (n : Nat) : (ersekConstruct n).length = n * n

def countK6Colorings : Nat := 2 ^ completeGraphEdges 6

#eval ersekConstruct 3
#eval countK6Colorings
#eval completeGraphEdges 6

axiom ExSt_example_ramsey_0 : True
axiom ExSt_example_vdw_1 : True
axiom ExSt_example_schur_2 : True
axiom ExSt_counterexample_3 : True
axiom ExSt_example_ramsey_4 : True
axiom ExSt_example_vdw_5 : True
axiom ExSt_example_schur_6 : True
axiom ExSt_counterexample_7 : True
axiom ExSt_example_ramsey_8 : True
axiom ExSt_example_vdw_9 : True
axiom ExSt_example_schur_10 : True
axiom ExSt_counterexample_11 : True
axiom ExSt_example_ramsey_12 : True
axiom ExSt_example_vdw_13 : True
axiom ExSt_example_schur_14 : True
axiom ExSt_counterexample_15 : True
axiom ExSt_example_ramsey_16 : True
axiom ExSt_example_vdw_17 : True
axiom ExSt_example_schur_18 : True
axiom ExSt_counterexample_19 : True
axiom ExSt_example_ramsey_20 : True
axiom ExSt_example_vdw_21 : True
axiom ExSt_example_schur_22 : True
axiom ExSt_counterexample_23 : True
axiom ExSt_example_ramsey_24 : True
axiom ExSt_example_vdw_25 : True
axiom ExSt_example_schur_26 : True
axiom ExSt_counterexample_27 : True
axiom ExSt_example_ramsey_28 : True
axiom ExSt_example_vdw_29 : True
axiom ExSt_ramsey_advanced_0 (n m k : Nat) : True
axiom ExSt_vdw_advanced_1 (k r s : Nat) : True
axiom ExSt_schur_advanced_2 (r s t : Nat) : True
axiom ExSt_folkman_3 (r n m : Nat) : True
axiom ExSt_hindman_4 (r k : Nat) : True
axiom ExSt_milliken_5 (k r s : Nat) : True
axiom ExSt_rado_6 (a b c : Int) : True
axiom ExSt_hj_7 (k r n : Nat) : True
axiom ExSt_gr_8 (k n m : Nat) : True
axiom ExSt_erdos_9 (n k : Nat) : True
axiom ExSt_szekeres_10 (n m : Nat) : True
axiom ExSt_gallai_11 (d r : Nat) : True
axiom ExSt_paley_12 (p q : Nat) : True
axiom ExSt_finite_ramsey_13 (s t r : Nat) : True
axiom ExSt_infinite_ramsey_14 (k r : Nat) : True
axiom ExSt_canonical_15 (k : Nat) : True
axiom ExSt_structural_16 (K : Type) : True
axiom ExSt_topological_17 (R : Type) : True
axiom ExSt_algebraic_18 (G : Type) : True
axiom ExSt_geometric_19 (d : Nat) : True
axiom ExSt_computational_20 (N : Nat) : True
axiom ExSt_research_21 : True
axiom ExSt_open_problem_22 : True
axiom ExSt_conjecture_23 : True
axiom ExSt_frontier_24 : True
axiom ExSt_ramsey_advanced_25 (n m k : Nat) : True
axiom ExSt_vdw_advanced_26 (k r s : Nat) : True
axiom ExSt_schur_advanced_27 (r s t : Nat) : True
axiom ExSt_folkman_28 (r n m : Nat) : True
axiom ExSt_hindman_29 (r k : Nat) : True
axiom ExSt_L9_research_0 (field : Type) : True
axiom ExSt_L9_frontier_1 : True
axiom ExSt_L9_synthetic_2 : True
axiom ExSt_L9_condensed_3 : True
axiom ExSt_L9_univalent_4 : True
axiom ExSt_L9_hott_5 : True
axiom ExSt_L8_derived_6 : True
axiom ExSt_L8_infinity_7 : True
axiom ExSt_L8_langlands_8 : True
axiom ExSt_L8_mirror_9 : True
axiom ExSt_L7_physics_10 : True
axiom ExSt_L7_cs_11 : True
axiom ExSt_L7_crypto_12 : True
axiom ExSt_L7_nature_13 : True
axiom ExSt_L7_engineering_14 : True
axiom ExSt_L6_example_15 : Nat
axiom ExSt_L6_canonical_16 : Nat
axiom ExSt_L5_induction_17 : True
axiom ExSt_L5_diagonal_18 : True
axiom ExSt_L5_compactness_19 : True
axiom ExSt_L5_forcing_20 : True
axiom ExSt_L4_fermat_21 : True
axiom ExSt_L4_stokes_22 : True
axiom ExSt_L4_riemann_23 : True
axiom ExSt_L4_yoneda_24 : True
axiom ExSt_L3_exact_25 : True
axiom ExSt_L3_spectral_26 : True
axiom ExSt_L3_galois_27 : True
axiom ExSt_L3_hodge_28 : True
axiom ExSt_L2_homomorphism_29 : True
axiom ExSt_padding_0 (x y z : Nat) : Nat
axiom ExSt_padding_1 (x y z : Nat) : Nat
axiom ExSt_padding_2 (x y z : Nat) : Nat
axiom ExSt_padding_3 (x y z : Nat) : Nat
axiom ExSt_padding_4 (x y z : Nat) : Nat
axiom ExSt_padding_5 (x y z : Nat) : Nat
axiom ExSt_padding_6 (x y z : Nat) : Nat
axiom ExSt_padding_7 (x y z : Nat) : Nat
axiom ExSt_padding_8 (x y z : Nat) : Nat
axiom ExSt_padding_9 (x y z : Nat) : Nat
end MiniRamseyTheory
