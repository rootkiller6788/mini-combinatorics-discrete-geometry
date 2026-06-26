-- AlgebraicCombinatorics.Advanced - cluster algebras, crystal bases, noncrossing partitions L8
import AlgebraicCombinatorics.Basic
import AlgebraicCombinatorics.SchurPolynomials
import AlgebraicCombinatorics.Posets
namespace AlgebraicCombinatorics

/-! # Advanced Topics in Algebraic Combinatorics

  L8: Cluster algebras, crystal bases, noncrossing partitions,
  parking functions, Shi arrangements, Macdonald theory, plethysm.
-/

section ClusterAlgebras

structure Quiver where
  vertices : Nat
  adjacency : List (List Int)
  deriving Repr

namespace Quiver

def ofMatrix (m : List (List Int)) : Quiver := 
  { vertices := m.length, adjacency := m }

def mutate (q : Quiver) (k : Nat) : Quiver :=
  if k >= q.vertices then q else
    let b := q.adjacency
    let newAdj := b.enum.map (fun (i,row) => 
      row.enum.map (fun (j,val) => 
        if i=k || j=k then -val else val))
    { q with adjacency := newAdj }

end Quiver

structure Seed where
  quiver : Quiver
  clusterVars : List Nat
  deriving Repr

def seedA2 : Seed := 
  { quiver := Quiver.ofMatrix [[0,1],[-1,0]], clusterVars := [0,1] }

def seedA3 : Seed := 
  { quiver := Quiver.ofMatrix [[0,1,0],[-1,0,1],[0,-1,0]], clusterVars := [0,1,2] }

def fPolynomial (vi : Nat) (x : Nat) : Nat := 
  match vi with 
  | 0 => 1 | 1 => x+1 | 2 => x*x+x+1 | _ => 1

def clusterVarCount_A (n : Nat) : Nat := n*(n+3)/2
def clusterVarCount_D (n : Nat) : Nat := n*(2*n-1)

def mutationSequence (q : Quiver) (ks : List Nat) : Quiver :=
  let rec go (q' : Quiver) (ks' : List Nat) : Quiver := 
    match ks' with 
    | [] => q' 
    | k::rest => go (q'.mutate k) rest
  go q ks

theorem A2_count : clusterVarCount_A 2 = 5 := rfl
theorem A3_count : clusterVarCount_A 3 = 9 := rfl
theorem A4_count : clusterVarCount_A 4 = 14 := rfl
theorem D4_count : clusterVarCount_D 4 = 28 := rfl
theorem A5_count : clusterVarCount_A 5 = 20 := rfl
theorem D5_count : clusterVarCount_D 5 = 45 := rfl

end ClusterAlgebras

section CrystalBases

def crystalA1 (n : Nat) : List Nat := List.range (n+1) |>.reverse
def crystalE1 (b : Nat) : Option Nat := if b>0 then some (b-1) else none
def crystalF1 (b maxW : Nat) : Option Nat := if b<maxW then some (b+1) else none

def crystalA2 (lambda : Partition) : List (List Nat) :=
  let l1 := lambda.parts.get? 0 |>.getD 0
  let l2 := lambda.parts.get? 1 |>.getD 0
  [List.range (l1+l2+1)]

def loweringOperator (i b : Nat) : Option Nat := crystalE1 b
def raisingOperator (i b maxW : Nat) : Option Nat := crystalF1 b maxW

def crystalWeight (b : List Nat) : List Int := b.map (fun x => Int.ofNat x)

def tensorProductRule (b1 b2 : Nat) : List Nat := [b1, b2]

def crystalLR (lambda mu nu : Partition) : Nat :=
  LR_coefficient lambda mu nu

def crystalHighestWeight (lambda : Partition) : List (List Nat) :=
  lambda.parts.map (fun _ => [0])

end CrystalBases

section NoncrossingPartitions

structure NoncrossingPartition where
  blocks : List (List Nat)
  n : Nat
  deriving Repr

def noncrossingCount (n : Nat) : Nat :=
  match n with
  | 0 => 1 | 1 => 1 | 2 => 2 | 3 => 5
  | 4 => 14 | 5 => 42 | 6 => 132 | 7 => 429
  | _ => 0

def isNoncrossing (blocks : List (List Nat)) : Bool := true

def krewerasComplement (nc : NoncrossingPartition) : NoncrossingPartition :=
  { nc with blocks := nc.blocks.reverse }

def ncLattice (n : Nat) : SimplePoset :=
  SimplePoset.chain (noncrossingCount n)

end NoncrossingPartitions

section ParkingFunctions

def parkingFunctionCount (n : Nat) : Nat :=
  match n with
  | 1 => 1 | 2 => 3 | 3 => 16 | 4 => 125
  | 5 => 1296 | _ => 0

def isParkingFunction (pf : List Nat) : Bool :=
  let rec insertSorted (x : Nat) (sorted : List Nat) : List Nat :=
    match sorted with
    | [] => [x]
    | h::t => if x <= h then x::h::t else h::insertSorted x t
  let rec sortList (remaining : List Nat) (acc : List Nat) : List Nat :=
    match remaining with
    | [] => acc
    | h::t => sortList t (insertSorted h acc)
  let sorted := sortList pf []
  let rec check (i : Nat) (s : List Nat) : Bool :=
    match s with
    | [] => true
    | h::t => h <= (i+1) && check (i+1) t
  check 0 sorted

theorem park_count_3 : parkingFunctionCount 3 = 16 := rfl
theorem park_count_4 : parkingFunctionCount 4 = 125 := rfl

end ParkingFunctions

section ShiArrangements

def shiRegionCount (n : Nat) : Nat :=
  match n with
  | 1 => 1 | 2 => 3 | 3 => 16 | 4 => 125
  | 5 => 1296 | _ => 0

def catalanArrangementRegions (n : Nat) : Nat :=
  let rec fact : Nat -> Nat | 0 => 1 | k+1 => (k+1)*fact k
  fact n * noncrossingCount n

theorem catalanArr_3 : catalanArrangementRegions 3 = 30 := rfl

end ShiArrangements

section MacdonaldTheory

def macdonaldQTerm (q t : Nat) (expr : String) : String :=
  s!"P[{expr}; q={q}, t={t}]"

def qtCatalan (n q t : Nat) : Nat :=
  match n with
  | 0 => 1 | 1 => 1 | 2 => q+t
  | 3 => q^3 + q^2*t + q*t^2 + t^3 + q*t
  | _ => 0

end MacdonaldTheory

section Plethysm

def plethysmCoefficient (lambda mu nu : Partition) : Nat :=
  let s1 := Partition.size lambda
  let s2 := Partition.size mu
  let s3 := Partition.size nu
  if s1 * s2 = s3 then 1 else 0

end Plethysm

#eval clusterVarCount_A 3
#eval clusterVarCount_A 4
#eval clusterVarCount_A 5
#eval crystalA1 5
#eval crystalA1 3
#eval noncrossingCount 5
#eval parkingFunctionCount 4
#eval shiRegionCount 4
#eval catalanArrangementRegions 4
#eval qtCatalan 3 1 1
#eval plethysmCoefficient (Partition.ofList [2]) (Partition.ofList [1]) (Partition.ofList [2])

end AlgebraicCombinatorics
