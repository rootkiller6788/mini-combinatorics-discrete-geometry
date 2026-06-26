/-
# MiniConvexPolytopes: Object Registrations -- L3
-/

import MiniObjectKernel.Core.Basic
import MiniConvexPolytopes.Core.Basic
import MiniConvexPolytopes.Core.Laws

namespace MiniConvexPolytopes

def registerTheory : IO Unit := IO.println s!"Theory: ConvexGeometry.Polytopes"
def theoryRegistry : List String := ["Polytope", "Face", "FVector", "HVector"]

structure GradedPoset (alpha : Type) where
  elements : List alpha
  le : alpha -> alpha -> Bool
  rank : alpha -> Nat

def facePoset (P : Polytope) : GradedPoset (Face P) :=
  { elements := faceLattice P, le := fun _ _ => true, rank := faceDim }

structure PolytopeAutomorphism (P : Polytope) where
  perm : Point P.dim -> Point P.dim

def automorphismGroupOrder (P : Polytope) : Nat := 0

def platonicSymmetryOrder (name : String) : Nat :=
  match name with
  | "tetrahedron" => 12 | "cube" => 24 | "octahedron" => 24
  | "icosahedron" => 60 | "dodecahedron" => 60 | _ => 1

def num3PolytopeTypes (n : Nat) : Nat :=
  match n with | 4 => 1 | 5 => 2 | 6 => 7 | 7 => 34 | 8 => 257 | _ => 0

def numKfaces (P : Polytope) (k : Nat) : Nat := 0

def f_facets (P : Polytope) : Nat := if P.dim > 0 then numKfaces P (P.dim - 1) else 0

def f0 (P : Polytope) : Nat := vertexCount P
def f1 (P : Polytope) : Nat := numKfaces P 1

def classicalFvectors : List (Prod String (List Nat)) := [
  ("Simplex 3D", [4, 6, 4]), ("Cube 3D", [8, 12, 6]),
  ("Octahedron", [6, 12, 8]), ("Icosahedron", [12, 30, 20]),
  ("Dodecahedron", [20, 30, 12])
]

#eval "-- Core.Objects: Theory Registration --"
#eval registerTheory
#eval s!"Platonic symmetry: tetrahedron={platonicSymmetryOrder "tetrahedron"}, cube={platonicSymmetryOrder "cube"}"
#eval s!"3-polytope types with 6 vertices: {num3PolytopeTypes 6}"

end MiniConvexPolytopes
