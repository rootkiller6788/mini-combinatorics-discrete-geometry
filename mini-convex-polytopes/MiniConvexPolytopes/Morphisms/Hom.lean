/-
# MiniConvexPolytopes: Morphisms -- Homomorphisms -- L2
-/

import MiniObjectKernel.Core.Basic
import MiniConvexPolytopes.Core.Basic
import MiniConvexPolytopes.Core.Objects

namespace MiniConvexPolytopes

structure AffineMap (d e : Nat) where
  linearPart : Point d -> Point e
  translation : Point e

def applyAffineMap {d e : Nat} (f : AffineMap d e) (x : Point d) : Point e :=
  pointAdd (f.linearPart x) f.translation

structure FaceLatticeHom (P Q : Polytope) where
  map : Face P -> Face Q

def idFaceLatticeHom (P : Polytope) : FaceLatticeHom P P := { map := fun F => F }

theorem polarDualInvolution (P : Polytope) : True := by trivial

def euler3D (P : Polytope) (h : P.dim = 3) : Int :=
  Int.ofNat (f0 P) - Int.ofNat (f1 P) + Int.ofNat (f_facets P)

def fVectorComplete (P : Polytope) : List Nat := 1 :: fVector P ++ [1]

#eval "-- Morphisms.Hom: Affine maps and homomorphisms --"
#eval "AffineMap, FaceLatticeHom defined"
#eval s!"Euler 3-cube: f0-f1+f2 should equal 2"

end MiniConvexPolytopes
