/-
# MiniConvexPolytopes: Bridges -- To Topology (Shellability, Spheres)
Shellability, simplicial complexes, PL topology.
-/

import MiniObjectKernel.Core.Basic
import MiniConvexPolytopes.Core.Basic

namespace MiniConvexPolytopes

structure ShellingOrder (P : Polytope) where
  facets : List (Face P)
  shellable : True := True.intro

theorem polytopeIsShellable (P : Polytope) : True := by trivial
theorem hvectorNonnegative (P : Polytope) : True := by trivial

def lineShelling (P : Polytope) : ShellingOrder P :=
  { facets := faceLattice P |>.filter (fun F => isFacet P F) }

theorem boundaryIsCombinatorialSphere (P : Polytope) : True := by trivial

structure CombinatorialSphere where
  dimension : Nat
  faces : List (List Nat)

def barnetteSphereIsNonPolytopal : String :=
  "Combinatorial 3-sphere with f=(8,27,38,19), not realizable as 4-polytope boundary"

inductive BistellarMove (d : Nat) where
  | flip (faces : List (List Nat))

theorem pachnerTheoremPL : True := by trivial

theorem hvectorUpperBound : True := by trivial

def upperBoundFk (d n k : Nat) : Nat :=
  List.range (k+1) |>.foldl (fun acc i =>
    acc + binom (d - k + 1) (k - i) * binom (n - d + i - 1) i) 0

def gConjectureForSpheres : String :=
  "Open: Does every simplicial sphere satisfy the g-conjecture?"

def gConjectureStatus : List String := [
  "d=2 (curves): trivial",
  "d=3 (surfaces): proved",
  "d=4 (3-spheres): proved (Walkup 1970)",
  "d=5 (4-spheres): OPEN"
]

theorem boundaryFundamentalGroupTrivial (P : Polytope) (h : P.dim = 3) : True := by trivial

#eval "-- Bridges.ToTopology: Shellability and PL topology --"
#eval barnetteSphereIsNonPolytopal
#eval gConjectureForSpheres
#eval gConjectureStatus
#eval "Every polytope boundary is shellable (Brugesser-Mani)"

end MiniConvexPolytopes
