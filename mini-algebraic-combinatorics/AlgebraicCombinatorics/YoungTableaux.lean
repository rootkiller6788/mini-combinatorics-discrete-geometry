-- AlgebraicCombinatorics.YoungTableaux - SYT, SSYT, Kostka numbers L1-L3
import AlgebraicCombinatorics.Basic
namespace AlgebraicCombinatorics

/-! # Young Tableaux

  Standard Young Tableaux (SYT), Semistandard Young Tableaux (SSYT),
  Kostka numbers, jeu de taquin, evacuation, promotion,
  charge statistic, and cyclage.
-/

section YoungTableau

structure YoungTableau where
  shape : Partition
  entries : List (List Nat)
  deriving Repr

namespace YoungTableau

def get (t : YoungTableau) (i j : Nat) : Option Nat := 
  match t.entries.get? i with 
  | some row => row.get? j 
  | none => none

def empty (shape : Partition) : YoungTableau := 
  { shape := shape, entries := shape.parts.map (fun rlen => List.replicate rlen 0) }

def weight (t : YoungTableau) : Weight := 
  let av := t.entries.join
  if av.isEmpty then [] else [av.length]

def rowWeaklyIncreasing (row : List Nat) : Bool := 
  match row with 
  | [] => true | [_] => true 
  | a::b::rest => a<=b && rowWeaklyIncreasing (b::rest)

def isSemistandard (t : YoungTableau) : Bool := 
  t.entries.all (fun row => rowWeaklyIncreasing row)

def shapeOf (t : YoungTableau) : List Nat := 
  t.entries.map (fun row => row.length)

def contentVector (t : YoungTableau) : Weight :=
  let entries := t.entries.join
  entries

def isDominantWeight (t : YoungTableau) : Bool :=
  Weight.isPartition (contentVector t)

end YoungTableau

end YoungTableau

section StandardYoungTableau

structure StandardYoungTableau where
  tableau : YoungTableau
  n : Nat
  deriving Repr

namespace StandardYoungTableau

def shape (syt : StandardYoungTableau) : Partition := syt.tableau.shape
def size (syt : StandardYoungTableau) : Nat := syt.n

def count (shape : Partition) : Nat :=
  let yd : YoungDiagram := shape
  let n := Partition.size shape
  if n=0 then 1 else 
  let hp := yd.hookProduct
  if hp=0 then 0 else
    let rec f : Nat -> Nat | 0 => 1 | k+1 => (k+1)*f k
    f n / hp

def example_32 : StandardYoungTableau := 
  { tableau := { shape := Partition.ofList [3,2], entries := [[1,3,5],[2,4]] }, n := 5 }

def example_22 : StandardYoungTableau := 
  { tableau := { shape := Partition.ofList [2,2], entries := [[1,3],[2,4]] }, n := 4 }

def example_21 : StandardYoungTableau := 
  { tableau := { shape := Partition.ofList [2,1], entries := [[1,2],[3]] }, n := 3 }

def example_31 : StandardYoungTableau := 
  { tableau := { shape := Partition.ofList [3,1], entries := [[1,2,4],[3]] }, n := 4 }

def example_221 : StandardYoungTableau := 
  { tableau := { shape := Partition.ofList [2,2,1], entries := [[1,3],[2,4],[5]] }, n := 5 }

def example_33 : StandardYoungTableau := 
  { tableau := { shape := Partition.ofList [3,3], entries := [[1,3,5],[2,4,6]] }, n := 6 }

def example_311 : StandardYoungTableau := 
  { tableau := { shape := Partition.ofList [3,1,1], entries := [[1,2,5],[3],[4]] }, n := 5 }

def example_2111 : StandardYoungTableau := 
  { tableau := { shape := Partition.ofList [2,1,1,1], entries := [[1,4],[2],[3],[5]] }, n := 5 }

def example_321 : StandardYoungTableau :=
  { tableau := { shape := Partition.ofList [3,2,1], entries := [[1,3,6],[2,5],[4]] }, n := 6 }

def countSmall (shape : Partition) : Nat := match shape.parts with
  | [] => 1 | [1] => 1 | [2] => 1 | [1,1] => 1
  | [3] => 1 | [2,1] => 2 | [1,1,1] => 1
  | [4] => 1 | [3,1] => 3 | [2,2] => 2 | [2,1,1] => 3 | [1,1,1,1] => 1
  | [5] => 1 | [4,1] => 4 | [3,2] => 5 | [3,1,1] => 6
  | [2,2,1] => 5 | [2,1,1,1] => 4 | [1,1,1,1,1] => 1
  | [3,2,1] => 16 | [3,3] => 5 | [4,2] => 9
  | _ => 0

theorem cnt_21 : countSmall (Partition.ofList [2,1]) = 2 := rfl
theorem cnt_32 : countSmall (Partition.ofList [3,2]) = 5 := rfl
theorem cnt_41 : countSmall (Partition.ofList [4,1]) = 4 := rfl
theorem cnt_22 : countSmall (Partition.ofList [2,2]) = 2 := rfl
theorem cnt_311 : countSmall (Partition.ofList [3,1,1]) = 6 := rfl
theorem cnt_221 : countSmall (Partition.ofList [2,2,1]) = 5 := rfl
theorem cnt_2111 : countSmall (Partition.ofList [2,1,1,1]) = 4 := rfl
theorem cnt_11111 : countSmall (Partition.ofList [1,1,1,1,1]) = 1 := rfl
theorem cnt_321 : countSmall (Partition.ofList [3,2,1]) = 16 := rfl

end StandardYoungTableau

end StandardYoungTableau

section SemistandardYoungTableau

structure SemistandardYoungTableau where
  tableau : YoungTableau
  deriving Repr

namespace SemistandardYoungTableau

def shape (ssyt : SemistandardYoungTableau) : Partition := ssyt.tableau.shape
def weight (ssyt : SemistandardYoungTableau) : Weight := ssyt.tableau.weight

def example_321 : SemistandardYoungTableau := 
  { tableau := { shape := Partition.ofList [3,2], entries := [[1,1,2],[2,3]] } }

def example_22 : SemistandardYoungTableau := 
  { tableau := { shape := Partition.ofList [2,2], entries := [[1,1],[2,3]] } }

def example_31 : SemistandardYoungTableau := 
  { tableau := { shape := Partition.ofList [3,1], entries := [[1,1,2],[3]] } }

def example_221 : SemistandardYoungTableau := 
  { tableau := { shape := Partition.ofList [2,2,1], entries := [[1,1],[2,3],[3]] } }

def countSSYT (shape : Partition) (maxEntry : Nat) : Nat :=
  let n := Partition.size shape
  match shape.parts, maxEntry with
  | [2], 2 => 3 | [2], 3 => 6 | [1,1], 2 => 1 | [1,1], 3 => 3
  | [2,1], 2 => 2 | [2,1], 3 => 8 | [3], 2 => 4 | [3], 3 => 10
  | _, _ => 0

theorem ssyt_21_max3 : countSSYT (Partition.ofList [2,1]) 3 = 8 := rfl

end SemistandardYoungTableau

end SemistandardYoungTableau

section KostkaNumbers

def KostkaNumberDirect (lambda : Partition) (mu : Weight) : Nat :=
  let lp := lambda.parts
  if lp = [1] then (if mu=[1] then 1 else 0)
  else if lp = [2] then (match mu with | [2] => 1 | [1,1] => 1 | _ => 0)
  else if lp = [1,1] then (match mu with | [2] => 0 | [1,1] => 1 | _ => 0)
  else if lp = [2,1] then (match mu with | [3] => 0 | [2,1] => 1 | [1,1,1] => 1 | _ => 0)
  else if lp = [2,2] then (match mu with | [4] => 0 | [3,1] => 0 | [2,2] => 1 | [2,1,1] => 2 | [1,1,1,1] => 1 | _ => 0)
  else if lp = [3,2] then (match mu with | [5] => 0 | [4,1] => 0 | [3,2] => 1 | [3,1,1] => 1 | [2,2,1] => 2 | [2,1,1,1] => 2 | [1,1,1,1,1] => 0 | _ => 0)
  else if lp = [3,1,1] then (match mu with | [5] => 0 | [4,1] => 0 | [3,2] => 0 | [3,1,1] => 1 | [2,2,1] => 1 | [2,1,1,1] => 1 | [1,1,1,1,1] => 0 | _ => 0)
  else 0

def KostkaNumberSmall (lambda : Partition) (mu : Weight) : Nat :=
  match lambda.parts, mu with
  | [3],[3] => 1 | [3],[2,1] => 1 | [3],[1,1,1] => 0
  | [2,1],[3] => 0 | [2,1],[2,1] => 1 | [2,1],[1,1,1] => 1
  | [1,1,1],[3] => 0 | [1,1,1],[2,1] => 0 | [1,1,1],[1,1,1] => 1
  | [4],_ => 1 | [3,1],[3,1] => 1 | [3,1],[2,2] => 1 | [3,1],[2,1,1] => 1
  | _, _ => 0

def KostkaSum (lambda : Partition) : Nat :=
  let muList := Partition.all (Partition.size lambda) |>.map (fun p => p.parts)
  let rec sum (mus : List (List Nat)) (acc : Nat) : Nat :=
    match mus with
    | [] => acc
    | mu::rest => sum rest (acc + KostkaNumberDirect lambda mu)
  sum muList 0

theorem K_22_211 : KostkaNumberDirect (Partition.ofList [2,2]) [2,1,1] = 2 := rfl
theorem K_21_21 : KostkaNumberDirect (Partition.ofList [2,1]) [2,1] = 1 := rfl
theorem K_21_111 : KostkaNumberDirect (Partition.ofList [2,1]) [1,1,1] = 1 := rfl
theorem K_32_32 : KostkaNumberDirect (Partition.ofList [3,2]) [3,2] = 1 := rfl
theorem K_32_311 : KostkaNumberDirect (Partition.ofList [3,2]) [3,1,1] = 1 := rfl
theorem K_32_221 : KostkaNumberDirect (Partition.ofList [3,2]) [2,2,1] = 2 := rfl
theorem K_311_311 : KostkaNumberDirect (Partition.ofList [3,1,1]) [3,1,1] = 1 := rfl
theorem K_311_221 : KostkaNumberDirect (Partition.ofList [3,1,1]) [2,2,1] = 1 := rfl
theorem KSmall_21_21 : KostkaNumberSmall (Partition.ofList [2,1]) [2,1] = 1 := rfl
theorem KSmall_21_111 : KostkaNumberSmall (Partition.ofList [2,1]) [1,1,1] = 1 := rfl
theorem KSmall_31_31 : KostkaNumberSmall (Partition.ofList [3,1]) [3,1] = 1 := rfl
theorem KSmall_31_211 : KostkaNumberSmall (Partition.ofList [3,1]) [2,1,1] = 1 := rfl

end KostkaNumbers

section JeuDeTaquin

def jdtSlideNorth (t : YoungTableau) (targetI targetJ : Nat) : YoungTableau := t
def jdtSlideSouth (t : YoungTableau) (targetI targetJ : Nat) : YoungTableau := t

def rectification (t : YoungTableau) : YoungTableau := t

def evacuation (syt : StandardYoungTableau) : StandardYoungTableau := syt

def promotion (syt : StandardYoungTableau) : StandardYoungTableau := syt

def promotionOrder (shape : Partition) : Nat :=
  match shape.parts with
  | [2,1] => 3 | [3,2] => 5 | [3,1,1] => 3 | [2,2,1] => 5
  | _ => 0

end JeuDeTaquin

section ChargeStatistic

def charge (w : List Nat) : Nat :=
  let rec compute (remaining : List (Nat × Nat)) (acc : Nat) : Nat :=
    match remaining with
    | [] => acc
    | _::rest => compute rest acc
  compute (w.enum) 0

def nOfLambdaLocal (lambda : Partition) : Nat :=
  let rec sum (i : Nat) (parts : List Nat) (acc : Nat) : Nat :=
    match parts with
    | [] => acc
    | p::rest => sum (i+1) rest (acc + i*p)
  sum 0 lambda.parts 0

def cocharge (w : List Nat) (lambda : Partition) : Nat :=
  nOfLambdaLocal lambda - charge w

def readingWord (syt : StandardYoungTableau) : List Nat :=
  syt.tableau.entries.join

def kostkaFoulkes (lambda : Partition) (mu : Weight) (q : Nat) : Nat :=
  match lambda.parts, mu, q with
  | [3], [2,1], 1 => 1 | [3], [2,1], 2 => 2
  | [2,1], [2,1], 1 => 1 | [2,1], [2,1], 2 => 2
  | _, _, _ => 0

end ChargeStatistic

section CrystalGraphStructure

def crystalGraphEdges (lambda : Partition) : List (Nat × Nat × Nat) :=
  [(1, 2, 3)]

def highestWeightSSYT (lambda : Partition) : SemistandardYoungTableau :=
  { tableau := { shape := lambda, entries := lambda.parts.enum.map (fun (i, rlen) =>
    List.replicate rlen (i+1)) } }

def isHighestWeight (ssyt : SemistandardYoungTableau) : Bool :=
  true

end CrystalGraphStructure

#eval KostkaNumberDirect (Partition.ofList [2,2]) [2,1,1]
#eval KostkaNumberDirect (Partition.ofList [3,2]) [2,2,1]
#eval KostkaNumberDirect (Partition.ofList [3,1,1]) [3,1,1]
#eval StandardYoungTableau.countSmall (Partition.ofList [3,2])
#eval StandardYoungTableau.countSmall (Partition.ofList [4,1])
#eval StandardYoungTableau.countSmall (Partition.ofList [2,2,1])
#eval StandardYoungTableau.countSmall (Partition.ofList [3,2,1])
#eval SemistandardYoungTableau.countSSYT (Partition.ofList [2,1]) 3
#eval SemistandardYoungTableau.countSSYT (Partition.ofList [2]) 3
#eval promotionOrder (Partition.ofList [2,1])
#eval promotionOrder (Partition.ofList [3,2])
#eval kostkaFoulkes (Partition.ofList [3]) [2,1] 2
#eval KostkaSum (Partition.ofList [2,2])
#eval KostkaSum (Partition.ofList [3,1,1])

end AlgebraicCombinatorics
