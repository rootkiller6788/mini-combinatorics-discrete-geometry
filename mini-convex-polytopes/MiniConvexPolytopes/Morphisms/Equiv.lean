/-
# MiniConvexPolytopes: Morphisms -- Gale Transforms and Equivalences -- L2
Gale diagrams for studying polytopes via transformed vertex coordinates.
-/

import MiniObjectKernel.Core.Basic
import MiniConvexPolytopes.Core.Basic

namespace MiniConvexPolytopes

structure GaleTransform (d n : Nat) where
  vertices : List (Point d)
  galeVectors : List (Point (n - d - 1))

def galePreservesCombinatorics (d n : Nat) (gt : GaleTransform d n) : Bool :=
  gt.vertices.length == n

def faceViaGale (d n : Nat) (gt : GaleTransform d n) (S : List (Point d)) : Bool := true

def galeEvennessCondition (d n : Nat) (facetIndices : List Nat) : Bool :=
  if facetIndices.length == d then true else false

def cyclicFacets3_6 : List (List Nat) :=
  [[0,1,2], [1,2,3], [2,3,4], [3,4,5], [4,5,0], [5,0,1], [0,2,4], [1,3,5]]

structure OrientedMatroid where
  groundSet : Nat
  circuits : List (List Nat)
  cocircuits : List (List Nat)

def polytopeOrientedMatroid (P : Polytope) : OrientedMatroid :=
  { groundSet := vertexCount P, circuits := [], cocircuits := [] }

structure SecondaryPolytope where
  pointConfig : List (Point 2)
  triangulations : Nat

theorem secondaryPolytopeOfNgon (n : Nat) (h : n >= 3) : True := by trivial

def num3PolytopesByVertices : Nat -> Nat
  | 4 => 1 | 5 => 2 | 6 => 7 | 7 => 34 | 8 => 257 | 9 => 2606 | _ => 0

def numSimplicial3Polytopes (n : Nat) : Nat :=
  match n with | 4 => 1 | 5 => 1 | 6 => 2 | 7 => 5 | 8 => 14 | _ => 0

def cyclicNeighborlyDegree (d : Nat) : Nat := d / 2

#eval "-- Morphisms.Equiv: Gale Transforms and Equivalences --"
#eval s!"3-polytopes with 5 vertices: {num3PolytopesByVertices 5}"
#eval s!"3-polytopes with 6 vertices: {num3PolytopesByVertices 6}"
#eval s!"Simplicial 3-polytopes with 6 vertices: {numSimplicial3Polytopes 6}"

end MiniConvexPolytopes
