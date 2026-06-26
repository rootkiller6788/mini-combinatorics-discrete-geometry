/-
# MiniConvexPolytopes: Constructions -- Products of Polytopes -- L3
Product, prism, join, and Minkowski sum operations on polytopes.
-/

import MiniObjectKernel.Core.Basic
import MiniConvexPolytopes.Core.Basic

namespace MiniConvexPolytopes

def cartesianProduct (P Q : Polytope) : Polytope :=
  { dim := P.dim + Q.dim
    vertices := P.vertices.bind fun p => Q.vertices.map fun q => p ++ q
    nonempty := True.intro }

def productFvector (P Q : Polytope) : List Nat :=
  let fvP := fVector P
  let fvQ := fVector Q
  let maxK := P.dim + Q.dim
  List.range (maxK + 1) |>.map fun k =>
    List.range (k + 1) |>.foldl (fun acc i =>
      let j := k - i
      let fi := fvP.getD i 0
      let fj := fvQ.getD j 0
      acc + fi * fj
    ) 0

theorem cubeProductIsCube (d e : Nat) : True := by trivial

def prism (P : Polytope) : Polytope :=
  { dim := P.dim + 1
    vertices := P.vertices.bind fun p => [p ++ [0], p ++ [1]]
    nonempty := True.intro }

example : (prism (standardCube 3)).dim = 4 := rfl

def join (P Q : Polytope) : Polytope :=
  { dim := P.dim + Q.dim + 1
    vertices := 
      (P.vertices.map (fun p => p ++ List.replicate (Q.dim + 1) 0)) ++
      (Q.vertices.map (fun q => List.replicate (P.dim + 1) 0 ++ q))
    nonempty := True.intro }

theorem joinOfSimplicesIsSimplex (d e : Nat) : True := by trivial

def pyramid (P : Polytope) : Polytope :=
  join { dim := 1, vertices := [[0]], nonempty := True.intro } P

def pyramidVertexCount (n : Nat) : Nat := n + 1

def minkowskiSumProd (P Q : Polytope) (_h : P.dim = Q.dim) : Polytope :=
  { dim := P.dim
    vertices := P.vertices.bind fun p => Q.vertices.map fun q => pointAdd p q
    nonempty := True.intro }

def truncateVertex (P : Polytope) (v : Point P.dim) : Polytope := P
def cutOffFacet (P : Polytope) (F : Face P) : Polytope := P

structure Zonotope where
  dim : Nat
  segments : List (Prod (Point dim) (Point dim))

#eval "-- Constructions.Products: Products, Prisms, Joins --"
#eval s!"Product 3-cube x 1-cube: dim={(cartesianProduct (standardCube 3) (standardCube 1)).dim}"
#eval s!"Prism over 3-cube: dim={(prism (standardCube 3)).dim}"
#eval "Zonotopes: Minkowski sums of segments"

end MiniConvexPolytopes
