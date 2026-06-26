-- AlgebraicCombinatorics.RobinsonSchensted - RSK correspondence, Knuth equivalence L4-L5
import AlgebraicCombinatorics.Basic
namespace AlgebraicCombinatorics

/-! # Robinson-Schensted-Knuth Correspondence

  RSK establishes a bijection between permutations and pairs
  of standard Young tableaux of the same shape.
-/

section SchenstedInsertion

def rowInsert (x : Nat) (r : List Nat) : List Nat := 
  match r with 
  | [] => [x] 
  | y::ys => if x<=y then x::ys else y::rowInsert x ys

def schenstedInsert (x : Nat) (tableau : List (List Nat)) : List (List Nat) :=
  let rec ins (v : Nat) (rows : List (List Nat)) : List (List Nat) := match rows with
    | [] => [[v]] 
    | r::rest => 
      let nr := rowInsert v r
      if nr.length = r.length then nr::rest 
      else nr::ins v rest
  ins x tableau

def columnInsert (x : Nat) (c : List Nat) : List Nat :=
  match c with
  | [] => [x]
  | y::ys => if x<y then x::ys else y::columnInsert x ys

def columnSchenstedInsert (x : Nat) (tableau : List (List Nat)) : List (List Nat) :=
  let rec ins (v : Nat) (cols : List (List Nat)) : List (List Nat) := match cols with
    | [] => [[v]]
    | c::rest =>
      let nc := columnInsert v c
      if nc.length = c.length then nc::rest
      else nc::ins v rest
  ins x tableau

def insertionTableau (w : List Nat) : List (List Nat) :=
  let rec fold (t : List (List Nat)) (rem : List Nat) : List (List Nat) := 
    match rem with 
    | [] => t 
    | x::xs => fold (schenstedInsert x t) xs
  fold [] w

def columnInsertionTableau (w : List Nat) : List (List Nat) :=
  let rec fold (t : List (List Nat)) (rem : List Nat) : List (List Nat) :=
    match rem with
    | [] => t
    | x::xs => fold (columnSchenstedInsert x t) xs
  fold [] w

def recordingTableau (w : List Nat) : List (List Nat) :=
  let rec go (i : Nat) (wr : List Nat) (q : List (List Nat)) : List (List Nat) :=
    match wr with 
    | [] => q 
    | _::rest => go (i+1) rest (schenstedInsert (i+1) q)
  go 0 w []

def shapesAgree (w : List Nat) : Bool :=
  let p := insertionTableau w
  let q := recordingTableau w
  let rec rl : List (List Nat) -> List Nat 
    | [] => [] 
    | r::rs => r.length :: rl rs
  rl p = rl q

end SchenstedInsertion

section Bumping

def bumpedElement (x : Nat) (r : List Nat) : Option Nat :=
  match r with
  | [] => none
  | y::ys => if x<=y then some y else bumpedElement x ys

def bumpingPath (x : Nat) (tableau : List (List Nat)) : List (Nat × Nat × Nat) :=
  let rec trace (v : Nat) (rowIdx : Nat) (rows : List (List Nat)) 
    (acc : List (Nat × Nat × Nat)) : List (Nat × Nat × Nat) :=
    match rows with
    | [] => acc ++ [(rowIdx, 0, v)]
    | r::rest =>
      match r with
      | [] => acc ++ [(rowIdx, 0, v)]
      | y::ys =>
        if v <= y then acc ++ [(rowIdx, 0, v)]
        else 
          match bumpedElement v r with
          | none => acc ++ [(rowIdx, r.length, v)]
          | some bv => 
            let pos := 
              let rec findPos (l : List Nat) (idx : Nat) : Nat :=
                match l with
                | [] => idx
                | h::t => if h > v then idx else findPos t (idx+1)
              findPos r 0
            trace bv (rowIdx+1) rest (acc ++ [(rowIdx, pos, v)])
  trace x 0 tableau []

end Bumping

section KnuthEquivalence

def knuthMoveK1 (w : List Nat) (i : Nat) : Option (List Nat) :=
  match w.get? i, w.get? (i+1), w.get? (i+2) with
  | some a, some b, some c =>
    if a<b && b<c then
      let front := w.take i
      let back := w.drop (i+3)
      some (front ++ [a,c,b] ++ back)
    else none
  | _, _, _ => none

def knuthEquivalent (v w : List Nat) : Bool :=
  insertionTableau v = insertionTableau w

end KnuthEquivalence

section GreeneTheorem

def longestIncreasingSubseq (w : List Nat) : List Nat := 
  insertionTableau w |>.head?.getD []

def longestDecreasingSubseq (w : List Nat) : List Nat :=
  insertionTableau w.reverse |>.head?.getD []

def greeneLength (w : List Nat) (k : Nat) : Nat :=
  let p := insertionTableau w
  let rec sum (rows : List (List Nat)) (r : Nat) : Nat := 
    match rows, r with 
    | _, 0 => 0 
    | [], _ => 0 
    | rw::rs, k'+1 => rw.length + sum rs k'
  sum p k

end GreeneTheorem

section Standardization

def standardize (w : List Nat) : List Nat :=
  let rec assign (remaining : List (Nat × Nat)) (next : Nat) : List Nat :=
    match remaining with
    | [] => []
    | (pos, val)::rest => next :: assign rest (next+1)
  assign (w.enum) 1

end Standardization

section WordOperations

def wordInsertionTableau (w : List Nat) (alphabet : Nat) : List (List Nat) :=
  insertionTableau w

def wordShape (w : List Nat) : Partition :=
  let p := insertionTableau w
  Partition.ofList (p.map (fun row => row.length))

end WordOperations

#eval insertionTableau [3,1,4,1,5,9,2,6]
#eval insertionTableau [5,4,3,2,1]
#eval insertionTableau [1,3,2,5,4]
#eval insertionTableau [2,4,1,3,5]
#eval recordingTableau [2,4,1,3,5]
#eval shapesAgree [3,1,4]
#eval shapesAgree [5,4,3,2,1]
#eval shapesAgree [2,4,1,3,5]
#eval greeneLength [3,1,4,1,5,9,2,6] 1
#eval greeneLength [3,1,4,1,5,9,2,6] 2
#eval greeneLength [3,1,4,1,5,9,2,6] 3
#eval longestIncreasingSubseq [3,1,4,1,5]
#eval columnInsertionTableau [3,1,4]
#eval wordShape [3,1,4,1,5]

end AlgebraicCombinatorics
