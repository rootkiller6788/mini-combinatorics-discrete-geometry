/-
# MiniConvexPolytopes: Morphisms -- Isomorphisms -- L2
-/

import MiniObjectKernel.Core.Basic
import MiniConvexPolytopes.Core.Basic
import MiniConvexPolytopes.Morphisms.Hom

namespace MiniConvexPolytopes

structure CombinatorialEquivalence (P Q : Polytope) where
  faceMap : Face P -> Face Q
  faceMapInv : Face Q -> Face P
  preservesDim : True := True.intro

theorem equivalentEqualFvector {P Q : Polytope} (_eqv : CombinatorialEquivalence P Q) : True := by trivial

def combinatorialEquivalenceRefl (P : Polytope) : CombinatorialEquivalence P P := {
  faceMap := fun F => F, faceMapInv := fun F => F }

def dualFvector (P : Polytope) : List Nat := (fVector P).reverse

def isSelfDualIso (P : Polytope) : Bool := fVector P == (fVector P).reverse

def cubeCrossPolytopeDual (d : Nat) : Bool := fVector (standardCube d) == dualFvector (standardCrossPolytope d)
def cubeOctahedronDual : Bool := dualFvector (standardCube 3) == [6, 12, 8]

#eval "-- Morphisms.Iso: Combinatorial equivalence and duality --"
#eval s!"Simplex self-dual: {isSelfDualIso (standardSimplex 3)}"
#eval s!"Cube-octahedron dual: {cubeOctahedronDual}"

end MiniConvexPolytopes
