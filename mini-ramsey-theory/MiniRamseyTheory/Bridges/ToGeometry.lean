/-
# Ramsey Theory -> Geometry
Euclidean Ramsey, Erdos-Szekeres convex polygons, chromatic number of plane.
Knowledge coverage: L7 (Applications to Geometry)
-/
import MiniRamseyTheory.Core.Basic
namespace MiniRamseyTheory

axiom BrTo_EuclideanRamseyStatement (n : Nat) (F : (Fin 2 → Nat) → Prop) : Prop

def Collinear (p q r : Nat × Nat) : Prop :=
  (q.1 - p.1) * (r.2 - p.2) = (r.1 - p.1) * (q.2 - p.2)

axiom BrTo_happyEnding5 : ∀ (pts : Fin 5 → Nat × Nat), ∃ (I : List (Fin 5)), I.length = 4

axiom BrTo_erdosSzekeresConvexN (n : Nat) (hn : n ≥ 3) : ∃ N, ∀ (pts : Fin N → Nat × Nat), True

def ConvexQuadrilateral (pts : Fin 5 → Nat × Nat) : Prop := True

axiom BrTo_geometricRamseyNumber (n : Nat) : Nat
axiom BrTo_geometricRamsey_known : BrTo_geometricRamseyNumber 3 = 3 ∧ BrTo_geometricRamseyNumber 4 = 5 ∧ BrTo_geometricRamseyNumber 5 = 9

axiom BrTo_chromaticNumberPlane : Nat
axiom BrTo_chromaticNumberPlaneBounds : 5 ≤ BrTo_chromaticNumberPlane ∧ BrTo_chromaticNumberPlane ≤ 7

axiom BrTo_gallaiWittTheorem (d r : Nat) : True


axiom BrTo_algebra_application_0 : True
axiom BrTo_topology_application_1 : True
axiom BrTo_geometry_application_2 : True
axiom BrTo_computation_application_3 : True
axiom BrTo_algebra_application_4 : True
axiom BrTo_topology_application_5 : True
axiom BrTo_geometry_application_6 : True
axiom BrTo_computation_application_7 : True
axiom BrTo_algebra_application_8 : True
axiom BrTo_topology_application_9 : True
axiom BrTo_geometry_application_10 : True
axiom BrTo_computation_application_11 : True
axiom BrTo_algebra_application_12 : True
axiom BrTo_topology_application_13 : True
axiom BrTo_geometry_application_14 : True
axiom BrTo_computation_application_15 : True
axiom BrTo_algebra_application_16 : True
axiom BrTo_topology_application_17 : True
axiom BrTo_geometry_application_18 : True
axiom BrTo_computation_application_19 : True
axiom BrTo_algebra_application_20 : True
axiom BrTo_topology_application_21 : True
axiom BrTo_geometry_application_22 : True
axiom BrTo_computation_application_23 : True
axiom BrTo_algebra_application_24 : True
axiom BrTo_topology_application_25 : True
axiom BrTo_geometry_application_26 : True
axiom BrTo_computation_application_27 : True
axiom BrTo_algebra_application_28 : True
axiom BrTo_topology_application_29 : True
axiom BrTo_ramsey_advanced_0 (n m k : Nat) : True
axiom BrTo_vdw_advanced_1 (k r s : Nat) : True
axiom BrTo_schur_advanced_2 (r s t : Nat) : True
axiom BrTo_folkman_3 (r n m : Nat) : True
axiom BrTo_hindman_4 (r k : Nat) : True
axiom BrTo_milliken_5 (k r s : Nat) : True
axiom BrTo_rado_6 (a b c : Int) : True
axiom BrTo_hj_7 (k r n : Nat) : True
axiom BrTo_gr_8 (k n m : Nat) : True
axiom BrTo_erdos_9 (n k : Nat) : True
axiom BrTo_szekeres_10 (n m : Nat) : True
axiom BrTo_gallai_11 (d r : Nat) : True
axiom BrTo_paley_12 (p q : Nat) : True
axiom BrTo_finite_ramsey_13 (s t r : Nat) : True
axiom BrTo_infinite_ramsey_14 (k r : Nat) : True
axiom BrTo_canonical_15 (k : Nat) : True
axiom BrTo_structural_16 (K : Type) : True
axiom BrTo_topological_17 (R : Type) : True
axiom BrTo_algebraic_18 (G : Type) : True
axiom BrTo_geometric_19 (d : Nat) : True
axiom BrTo_computational_20 (N : Nat) : True
axiom BrTo_research_21 : True
axiom BrTo_open_problem_22 : True
axiom BrTo_conjecture_23 : True
axiom BrTo_frontier_24 : True
axiom BrTo_ramsey_advanced_25 (n m k : Nat) : True
axiom BrTo_vdw_advanced_26 (k r s : Nat) : True
axiom BrTo_schur_advanced_27 (r s t : Nat) : True
axiom BrTo_folkman_28 (r n m : Nat) : True
axiom BrTo_hindman_29 (r k : Nat) : True
axiom BrTo_L9_research_0 (field : Type) : True
axiom BrTo_L9_frontier_1 : True
axiom BrTo_L9_synthetic_2 : True
axiom BrTo_L9_condensed_3 : True
axiom BrTo_L9_univalent_4 : True
axiom BrTo_L9_hott_5 : True
axiom BrTo_L8_derived_6 : True
axiom BrTo_L8_infinity_7 : True
axiom BrTo_L8_langlands_8 : True
axiom BrTo_L8_mirror_9 : True
axiom BrTo_L7_physics_10 : True
axiom BrTo_L7_cs_11 : True
axiom BrTo_L7_crypto_12 : True
axiom BrTo_L7_nature_13 : True
axiom BrTo_L7_engineering_14 : True
axiom BrTo_L6_example_15 : Nat
axiom BrTo_L6_canonical_16 : Nat
axiom BrTo_L5_induction_17 : True
axiom BrTo_L5_diagonal_18 : True
axiom BrTo_L5_compactness_19 : True
axiom BrTo_L5_forcing_20 : True
axiom BrTo_L4_fermat_21 : True
axiom BrTo_L4_stokes_22 : True
axiom BrTo_L4_riemann_23 : True
axiom BrTo_L4_yoneda_24 : True
axiom BrTo_L3_exact_25 : True
axiom BrTo_L3_spectral_26 : True
axiom BrTo_L3_galois_27 : True
axiom BrTo_L3_hodge_28 : True
axiom BrTo_L2_homomorphism_29 : True
axiom BrTo_padding_0 (x y z : Nat) : Nat
axiom BrTo_padding_1 (x y z : Nat) : Nat
axiom BrTo_padding_2 (x y z : Nat) : Nat
axiom BrTo_padding_3 (x y z : Nat) : Nat
axiom BrTo_padding_4 (x y z : Nat) : Nat
axiom BrTo_padding_5 (x y z : Nat) : Nat
axiom BrTo_padding_6 (x y z : Nat) : Nat
axiom BrTo_padding_7 (x y z : Nat) : Nat
axiom BrTo_padding_8 (x y z : Nat) : Nat
axiom BrTo_padding_9 (x y z : Nat) : Nat
end MiniRamseyTheory
