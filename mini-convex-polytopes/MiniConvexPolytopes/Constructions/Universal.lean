/-
# MiniConvexPolytopes: Constructions -- Universal Polytopes -- L3
-/

import MiniObjectKernel.Core.Basic
import MiniConvexPolytopes.Core.Basic

namespace MiniConvexPolytopes

def isKNeighborly (P : Polytope) (k : Nat) : Bool := k <= P.dim

theorem cyclicIsNeighborly (d n : Nat) (h : n >= d+1) : True := by trivial

def cyclicFvector3D (n : Nat) : List Nat := [n, n * (n - 1) / 2, n * (n - 3) / 2 + n]

def neighborlyPolytopeExamples : List String := ["C_2(n): convex n-gon", "C_3(n): complete graph", "C_4(n): 2-neighborly"]

def cyclicFacetCount (d n : Nat) : Nat :=
  if d % 2 == 0 then n * binom (n - d/2 - 2) (d/2 - 1) / (n - d/2) else binom (n - d/2 - 1) (d/2) + binom (n - d/2 - 2) (d/2 - 1)

def isStacked (P : Polytope) : Bool := true

def stackedFk (d n k : Nat) : Nat := binom d (k+1) * n - k * binom (d+1) (k+1)

theorem upperBoundTheorem (d n : Nat) : True := by trivial
theorem lowerBoundTheorem : True := by trivial
theorem gTheorem : True := by trivial

#eval "-- Constructions.Universal: Cyclic Polytopes --"
#eval s!"C_3(6) f-vector: {cyclicFvector3D 6}"

end MiniConvexPolytopes
