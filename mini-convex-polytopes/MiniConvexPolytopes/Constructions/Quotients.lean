/-
# MiniConvexPolytopes: Constructions -- Subdivisions and Quotients -- L3
-/

import MiniObjectKernel.Core.Basic
import MiniConvexPolytopes.Core.Basic

namespace MiniConvexPolytopes

def projectOntoFirst (P : Polytope) (k : Nat) (_h : k <= P.dim) : Polytope :=
  { dim := k, vertices := P.vertices.map (fun v => v.take k), nonempty := True.intro }

structure Triangulation (P : Polytope) where
  simplices : List (List (Point P.dim))
  faceToFace : True := True.intro

def polygonTriangulationCount (n : Nat) : Nat := catalanNumber (n - 2)
def cubeTriangulationCount : Nat := 74
def cyclicTriangulationCount (d n : Nat) : Nat := if d % 2 == 0 then 1 else 1

#eval "-- Constructions.Quotients: Subdivisions and Quotients --"
#eval s!"Triangulations of pentagon: {polygonTriangulationCount 5}"
#eval s!"Cube triangulations: {cubeTriangulationCount}"

end MiniConvexPolytopes
