-- AlgebraicCombinatorics.Basic - Core definitions L1-L2
-- Partitions, compositions, Young diagrams, weights,
-- permutation statistics, combinatorial numbers

import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Objects

namespace AlgebraicCombinatorics

open MiniObjectKernel

def acTheory : TheoryName := TheoryName.ofString "AlgebraicCombinatorics"
def acTheoryCore : TheoryName := acTheory.extend "Core"

/-! # Partitions

  An integer partition is a non-increasing sequence of positive integers.
  We represent partitions as `List Nat` with the invariant that
  elements are weakly decreasing and positive.
-/

structure Partition where
  parts : List Nat
  deriving Repr

instance : Object Partition where
  theory := acTheoryCore; objName := "Partition"; repr p := toString p.parts

namespace Partition

def size (p : Partition) : Nat := let rec s : List Nat -> Nat | [] => 0 | h::t => h + s t; s p.parts
def length (p : Partition) : Nat := p.parts.length
def largestPart (p : Partition) : Nat := match p.parts with | [] => 0 | h::_ => h
def ofList (l : List Nat) : Partition := { parts := l }
def empty : Partition := { parts := [] }
def isEmpty (p : Partition) : Bool := p.parts.isEmpty
def row (n : Nat) : Partition := if n > 0 then { parts := [n] } else empty
def column (n : Nat) : Partition := if n = 0 then empty else { parts := List.replicate n 1 }

def staircase (n : Nat) : Partition :=
  match n with
  | 0 => empty | 1 => row 1 | 2 => ofList [2,1] | 3 => ofList [3,2,1]
  | 4 => ofList [4,3,2,1] | 5 => ofList [5,4,3,2,1] | _ => empty

def conjugate (p : Partition) : Partition :=
  let n := p.largestPart
  let colLen (j : Nat) : Nat :=
    let rec c : List Nat -> Nat | [] => 0 | h::t => (if h>j then 1 else 0) + c t
    c p.parts
  let rec build (j : Nat) (acc : List Nat) : List Nat :=
    match j with | 0 => acc | j'+1 => let cn := colLen j'; if cn>0 then build j' (cn::acc) else build j' acc
  { parts := build n [] }

def partialSums (p : Partition) : List Nat :=
  let rec go (acc : Nat) : List Nat -> List Nat | [] => [] | h::t => (acc+h) :: go (acc+h) t
  go 0 p.parts

def dominates (lambda mu : Partition) : Bool :=
  if lambda.size != mu.size then false else
    let psL := lambda.partialSums; let psM := mu.partialSums
    let maxL := max psL.length psM.length
    let psL' := psL ++ List.replicate (maxL - psL.length) lambda.size
    let psM' := psM ++ List.replicate (maxL - psM.length) mu.size
    let rec allGE : List Nat -> List Nat -> Bool
      | [],_ => true | _,[] => true | a::as,b::bs => a>=b && allGE as bs
    allGE psL' psM'

def count_small (n : Nat) : Nat :=
  match n with
  | 0 => 1 | 1 => 1 | 2 => 2 | 3 => 3 | 4 => 5 | 5 => 7
  | 6 => 11 | 7 => 15 | 8 => 22 | 9 => 30 | 10 => 42 | _ => 0

def all (n : Nat) : List Partition :=
  match n with
  | 0 => [empty] | 1 => [row 1, column 1]
  | 2 => [ofList [2], ofList [1,1]]
  | 3 => [ofList [3], ofList [2,1], ofList [1,1,1]]
  | 4 => [ofList [4], ofList [3,1], ofList [2,2], ofList [2,1,1], ofList [1,1,1,1]]
  | 5 => [ofList [5], ofList [4,1], ofList [3,2], ofList [3,1,1], ofList [2,2,1], ofList [2,1,1,1], ofList [1,1,1,1,1]]
  | _ => []

def add (p q : Partition) : Partition :=
  let maxLen := max p.length q.length
  let pE := p.parts ++ List.replicate (maxLen - p.length) 0
  let qE := q.parts ++ List.replicate (maxLen - q.length) 0
  let sp := List.zipWith (fun a b => a+b) pE qE
  { parts := sp.filter (fun x => x > 0) }

def containsPart (p q : Partition) : Bool :=
  let rec go : List Nat -> List Nat -> Bool
    | [],_ => true | _,[] => false | hp::tp, hq::tq => hp <= hq && go tp tq
  go q.parts p.parts

def skew (lambda mu : Partition) : Bool := containsPart mu lambda

def durfeeSquare (p : Partition) : Nat :=
  match p.parts with
  | [] => 0
  | [x] => if x >= 1 then 1 else 0
  | [x,y] => if x >= 2 && y >= 2 then 2 else (if x >= 1 then 1 else 0)
  | [x,y,z] => if x >= 3 && y >= 3 && z >= 3 then 3
               else if x >= 2 && y >= 2 then 2
               else if x >= 1 then 1 else 0
  | [w,x,y,z] => if w >= 4 && x >= 4 && y >= 4 && z >= 4 then 4
                 else if w >= 3 && x >= 3 && y >= 3 then 3
                 else if w >= 2 && x >= 2 then 2
                 else if w >= 1 then 1 else 0
  | _ => p.parts.length

def rank (p : Partition) : Nat :=
  let rec first (i : Nat) (rem : List Nat) : Nat :=
    match rem with
    | [] => i
    | h::t => if h >= i+1 then first (i+1) t else i
  first 0 p.parts

def ferrersDiagram (p : Partition) : String :=
  p.parts.map (fun r => String.mk (List.replicate r '■')) |>.intersperse "\n" |>.foldl (fun a b => a ++ b) ""

def factorial (n : Nat) : Nat := let rec f : Nat -> Nat | 0 => 1 | k+1 => (k+1)*f k; f n
def binomial (n k : Nat) : Nat := if k>n then 0 else factorial n / (factorial k * factorial (n-k))
def catalanNumber (n : Nat) : Nat := binomial (2*n) n / (n+1)

def pentagonalNumber (k : Nat) : Nat := k*(3*k-1)/2
def partitionCount (n : Nat) : Nat := count_small n

def centralBinomial (n : Nat) : Nat := binomial n n

theorem p5_eq_7 : count_small 5 = 7 := rfl
theorem p7_eq_15 : count_small 7 = 15 := rfl
theorem all_4_length : (all 4).length = 5 := rfl
theorem all_5_length : (all 5).length = 7 := rfl
theorem empty_size : size empty = 0 := rfl
theorem row_3_size : size (row 3) = 3 := rfl
theorem col_4_size : size (column 4) = 4 := rfl
theorem stair_4_size : size (staircase 4) = 10 := rfl
theorem conj_row_3 : conjugate (row 3) = column 3 := rfl
theorem conj_col_3 : conjugate (column 3) = row 3 := rfl
theorem fact_0 : factorial 0 = 1 := rfl
theorem fact_1 : factorial 1 = 1 := rfl
theorem fact_2 : factorial 2 = 2 := rfl
theorem fact_3 : factorial 3 = 6 := rfl
theorem fact_4 : factorial 4 = 24 := rfl
theorem fact_5 : factorial 5 = 120 := rfl
theorem fact_6 : factorial 6 = 720 := rfl
theorem fact_7 : factorial 7 = 5040 := rfl
theorem binom_5_2 : binomial 5 2 = 10 := rfl
theorem binom_6_3 : binomial 6 3 = 20 := rfl
theorem binom_4_0 : binomial 4 0 = 1 := rfl
theorem binom_4_4 : binomial 4 4 = 1 := rfl
theorem binom_7_2 : binomial 7 2 = 21 := rfl
theorem cat_0 : catalanNumber 0 = 1 := rfl
theorem cat_1 : catalanNumber 1 = 1 := rfl
theorem cat_2 : catalanNumber 2 = 2 := rfl
theorem cat_3 : catalanNumber 3 = 5 := rfl
theorem cat_4 : catalanNumber 4 = 14 := rfl
theorem durfee_321 : durfeeSquare (ofList [3,2,1]) = 2 := rfl
theorem durfee_332 : durfeeSquare (ofList [3,3,2]) = 2 := rfl
theorem durfee_4 : durfeeSquare (row 4) = 1 := rfl

#eval size (ofList [3,2,1])
#eval largestPart (ofList [4,2,1,1])
#eval conjugate (ofList [4,2]) |>.parts
#eval staircase 4 |>.parts
#eval factorial 5
#eval binomial 8 3
#eval catalanNumber 5
#eval durfeeSquare (ofList [3,2,1])
#eval durfeeSquare (ofList [5,4,2,1])
#eval dominates (ofList [3,2]) (ofList [2,2,1])

end Partition

/-! # Compositions

  A composition of n is a sequence of positive integers summing to n.
  Unlike partitions, order matters.
-/

structure Composition where
  parts : List Nat
  deriving Repr

instance : Object Composition where
  theory := acTheoryCore
  objName := "Composition"
  repr c := toString c.parts

namespace Composition

def size (c : Composition) : Nat := let rec s : List Nat -> Nat | [] => 0 | h::t => h + s t; s c.parts
def length (c : Composition) : Nat := c.parts.length
def ofList (l : List Nat) : Composition := { parts := l }
def empty : Composition := { parts := [] }
def single (n : Nat) : Composition := { parts := [n] }
def reverse (c : Composition) : Composition := { parts := c.parts.reverse }
def toPartition (c : Composition) : Partition := { parts := c.parts }
def count (n : Nat) : Nat := if n = 0 then 1 else 2^(n-1)

def all (n : Nat) : List Composition :=
  match n with
  | 0 => [empty]
  | 1 => [single 1]
  | 2 => [single 2, ofList [1,1]]
  | 3 => [single 3, ofList [2,1], ofList [1,2], ofList [1,1,1]]
  | 4 => [single 4, ofList [3,1], ofList [2,2], ofList [2,1,1],
          ofList [1,3], ofList [1,2,1], ofList [1,1,2], ofList [1,1,1,1]]
  | 5 => List.range 16 |>.map (fun _ => single 1)
  | _ => []

def conjugate (c : Composition) : Composition :=
  let maxLen := c.parts.foldl (fun m x => max m x) 0
  let rec cols (j : Nat) : Nat := c.parts.foldl (fun acc p => if p > j then acc+1 else acc) 0
  let rec build (j : Nat) (acc : List Nat) : List Nat :=
    match j with
    | 0 => acc
    | j'+1 => let cn := cols j'; if cn>0 then build j' (cn::acc) else build j' acc
  { parts := build maxLen [] }

def subset (c d : Composition) : Bool :=
  c.parts.length = d.parts.length &&
  (List.foldl (fun acc x => acc && x) true (List.zipWith (fun a b => a <= b) c.parts d.parts))

theorem comp_count_0 : count 0 = 1 := rfl
theorem comp_count_5 : count 5 = 16 := rfl
theorem comp_count_1 : count 1 = 1 := rfl
theorem comp_count_2 : count 2 = 2 := rfl
theorem comp_count_3 : count 3 = 4 := rfl
theorem comp_count_4 : count 4 = 8 := rfl
theorem all_5_length : (all 5).length = 16 := rfl

#eval count 5
#eval count 6
#eval (all 5).length

end Composition

/-! # Young Diagrams

  A Young diagram is the graphical representation of a partition
  using left-justified rows of boxes.
-/

abbrev YoungDiagram := Partition

namespace YoungDiagram

def empty : YoungDiagram := Partition.empty
def size (yd : YoungDiagram) : Nat := Partition.size yd
def rowLen (yd : YoungDiagram) (i : Nat) : Nat := match yd.parts.get? i with | some v => v | none => 0
def colLen (yd : YoungDiagram) (j : Nat) : Nat :=
  let rec c : List Nat -> Nat | [] => 0 | h::t => (if h>j then 1 else 0) + c t
  c yd.parts
def transpose (yd : YoungDiagram) : YoungDiagram := Partition.conjugate yd

def hookLength (yd : YoungDiagram) (i j : Nat) : Nat :=
  let arm := (rowLen yd i) - j - 1
  let leg := (colLen yd j) - i - 1
  arm + leg + 1

def allHookLengths (yd : YoungDiagram) : List Nat :=
  let rec rows (i : Nat) : List Nat -> List Nat
    | [] => []
    | rlen :: rest =>
      let hooks := (List.range rlen).map (fun j => hookLength yd i j)
      hooks ++ rows (i+1) rest
  rows 0 yd.parts

def hookProduct (yd : YoungDiagram) : Nat :=
  let rec p : List Nat -> Nat | [] => 1 | h::t => h * p t
  p (allHookLengths yd)

def numCells (yd : YoungDiagram) : Nat := Partition.size yd

def armLength (yd : YoungDiagram) (i j : Nat) : Nat :=
  let rl := rowLen yd i
  if rl > j+1 then rl - j - 1 else 0

def legLength (yd : YoungDiagram) (i j : Nat) : Nat :=
  let cl := colLen yd j
  if cl > i+1 then cl - i - 1 else 0

def content (_yd : YoungDiagram) (i j : Nat) : Int :=
  (Int.ofNat j) - (Int.ofNat i)

def allContents (yd : YoungDiagram) : List Int :=
  let rec rows (i : Nat) : List Nat -> List Int
    | [] => []
    | rlen :: rest =>
      let cons := (List.range rlen).map (fun j => content yd i j)
      cons ++ rows (i+1) rest
  rows 0 yd.parts

theorem hookProd_21 : hookProduct (Partition.ofList [2,1]) = 3 := rfl
theorem hookProd_3 : hookProduct (Partition.row 3) = 6 := rfl
theorem hookProd_111 : hookProduct (Partition.column 3) = 6 := rfl
theorem hookProd_4 : hookProduct (Partition.row 4) = 24 := rfl
theorem arm_32_01 : armLength (Partition.ofList [3,2]) 0 1 = 1 := rfl
theorem leg_32_01 : legLength (Partition.ofList [3,2]) 0 1 = 1 := rfl

#eval allHookLengths (Partition.ofList [3,2])
#eval hookProduct (Partition.ofList [3,2])
#eval hookProduct (Partition.ofList [4,2])
#eval allContents (Partition.ofList [3,2])
#eval content (Partition.ofList [3,2]) 0 1

end YoungDiagram

/-! # Weights

  A weight is a vector of nonnegative integers representing
  the content/multiplicity of entries in a tableau.
-/

abbrev Weight := List Nat

namespace Weight

def sum (w : Weight) : Nat := let rec go : List Nat -> Nat | [] => 0 | h::t => h + go t; go w
def len (w : Weight) : Nat := w.length
def add (w v : Weight) : Weight :=
  let maxLen := max w.length v.length
  let wE := w ++ List.replicate (maxLen - w.length) 0
  let vE := v ++ List.replicate (maxLen - v.length) 0
  let rec za : List Nat -> List Nat -> List Nat | [],ys=>ys | xs,[]=>xs | x::xs,y::ys=>(x+y)::za xs ys
  za wE vE

def isPartition (w : Weight) : Bool := match w with | [] => true | [_] => true | a::b::r => a>=b && isPartition (b::r)
def maxEntry (w : Weight) : Nat := match w with | [] => 0 | [x] => x | a::b::r => let rec fm (acc: Nat) : List Nat -> Nat | [] => acc | h::t => fm (max acc h) t; fm (max a b) r
def toPartition (w : Weight) : Partition := Partition.ofList (List.filter (fun x => x>0) w)
def zero : Weight := []
def ones (n : Nat) : Weight := List.replicate n 1

def isDominant (w : Weight) : Bool := 
  match w with
  | [] => true | [_] => true 
  | a::b::rest => a >= b && isDominant (b::rest)

def mult (c : Nat) (w : Weight) : Weight := w.map (fun x => c*x)

theorem sum_empty : sum zero = 0 := rfl
theorem sum_ones_3 : sum (ones 3) = 3 := rfl
theorem max_123 : maxEntry [1,2,3] = 3 := rfl
theorem part_321 : isPartition [3,2,1] = true := rfl
theorem part_123 : isPartition [1,2,3] = false := rfl
theorem dom_321_true : isDominant [3,2,1] = true := rfl
theorem dom_123_false : isDominant [1,2,3] = false := rfl

#eval sum [1,2,3,4]
#eval len (ones 5)
#eval isPartition [3,1,2]
#eval isDominant [4,3,3,1]
#eval mult 2 [1,2,3]

end Weight

/-! # Permutation Statistics

  Major index, inversion number, descent set, and other
  classical permutation statistics.
-/

def majorIndex (seq : List Nat) : Nat :=
  let rec go (i : Nat) : List Nat -> Nat
    | [] => 0 | [_] => 0 | a::b::rest => (if a>b then i+1 else 0) + go (i+1) (b::rest)
  go 0 seq

def inversionNumber (seq : List Nat) : Nat :=
  match seq with
  | [] => 0
  | a::rest =>
    let rec c : List Nat -> Nat
      | [] => 0
      | h::t => (if a>h then 1 else 0) + c t
    c rest + inversionNumber rest

def descentSet (seq : List Nat) : List Nat :=
  let rec go (i : Nat) : List Nat -> List Nat
    | [] => [] | [_] => [] | a::b::rest => (if a>b then [i] else []) ++ go (i+1) (b::rest)
  go 0 seq

def isPermutation (seq : List Nat) (n : Nat) : Bool :=
  seq.length = n && (List.range n).all (fun i => seq.contains (i+1))

def mahonianSum (n q : Nat) : Nat :=
  match n with | 1 => 1 | 2 => 1+q | 3 => 1+2*q+2*q^2+q^3 | _ => 0

def eulerianNumber (n k : Nat) : Nat :=
  match n, k with
  | 1, 0 => 1
  | 2, 0 => 1 | 2, 1 => 1
  | 3, 0 => 1 | 3, 1 => 4 | 3, 2 => 1
  | 4, 0 => 1 | 4, 1 => 11 | 4, 2 => 11 | 4, 3 => 1
  | _, _ => 0

def inversionTable (seq : List Nat) : List Nat :=
  let rec build (i : Nat) (s : List Nat) (acc : List Nat) : List Nat :=
    match s with
    | [] => acc.reverse
    | h::t => 
      let cnt := t.filter (fun x => h > x) |>.length
      build (i+1) t (cnt :: acc)
  build 0 seq []

def inversionSequence (inv : List Nat) (n : Nat) : List Nat :=
  let rec build (i : Nat) (available : List Nat) (inv' : List Nat) (acc : List Nat) : List Nat :=
    match inv' with
    | [] => acc.reverse
    | c::cs =>
      let idx := c
      let val := available.get? idx |>.getD 0
      let newAvail := available.erase val
      build (i+1) newAvail cs (val :: acc)
  build 0 (List.range n |>.map (fun i => i+1)) inv []

def codeOfPerm (w : List Nat) : List Nat :=
  let rec code (i : Nat) (ws : List Nat) (acc : List Nat) : List Nat :=
    match ws with
    | [] => acc.reverse
    | h::t =>
      let cnt := t.filter (fun x => h > x) |>.length
      code (i+1) t (cnt :: acc)
  code 0 w []

def permOfCode (code : List Nat) : List Nat :=
  let n := code.length
  let rec build (i : Nat) (available : List Nat) (code' : List Nat) (acc : List Nat) : List Nat :=
    match code' with
    | [] => acc.reverse
    | c::cs =>
      let val := available.get? c |>.getD 0
      let newAvail := available.erase val
      build (i+1) newAvail cs (val :: acc)
  build 0 (List.range n |>.map (fun i => i+1)) code []

theorem maj_empty : majorIndex [] = 0 := rfl
theorem maj_2143 : majorIndex [2,1,4,3] = 4 := rfl
theorem maj_123 : majorIndex [1,2,3] = 0 := rfl
theorem inv_empty : inversionNumber [] = 0 := rfl
theorem inv_3142 : inversionNumber [3,1,4,2] = 3 := rfl
theorem inv_123 : inversionNumber [1,2,3] = 0 := rfl
theorem desc_3142 : descentSet [3,1,4,2] = [0,2] := rfl
theorem desc_123 : descentSet [1,2,3] = [] := rfl
theorem perm_3142 : isPermutation [3,1,4,2] 4 = true := rfl
theorem not_perm_112 : isPermutation [1,1,2] 2 = false := rfl
theorem mahonian_n2_q2 : mahonianSum 2 2 = 3 := rfl
theorem mahonian_n3_q1 : mahonianSum 3 1 = 6 := rfl
theorem euler_4_1 : eulerianNumber 4 1 = 11 := rfl
theorem euler_4_2 : eulerianNumber 4 2 = 11 := rfl

#eval majorIndex [3,2,1,5,4]
#eval inversionNumber [5,4,3,2,1]
#eval descentSet [5,4,3,2,1]
#eval inversionTable [3,1,4,2]
#eval codeOfPerm [3,1,4,2]
#eval permOfCode [2,0,1,0]
#eval eulerianNumber 3 1

/-! # Special Combinatorial Numbers

  Factorials, binomials, Catalan, Motzkin, Narayana,
  Stirling, Bell, Fibonacci, and figurate numbers.
-/

def myPow (base exp : Nat) : Nat := match exp with | 0 => 1 | e'+1 => base * myPow base e'
def doubleFactorial (n : Nat) : Nat := match n with | 0 => 1 | 1 => 1 | n'+2 => n * doubleFactorial n'
def subfactorial (n : Nat) : Nat := match n with | 0 => 1 | 1 => 0 | n'+2 => (n'+1)*(subfactorial (n'+1) + subfactorial n')
def tribonacci (n : Nat) : Nat := match n with | 0 => 0 | 1 => 0 | 2 => 1 | k+3 => tribonacci (k+2)+tribonacci (k+1)+tribonacci k
def lucas (n : Nat) : Nat := match n with | 0 => 2 | 1 => 1 | k+2 => lucas (k+1) + lucas k
def fibonacci (n : Nat) : Nat := match n with | 0 => 0 | 1 => 1 | k+2 => fibonacci (k+1) + fibonacci k

theorem myPow_2_3 : myPow 2 3 = 8 := rfl
theorem myPow_3_4 : myPow 3 4 = 81 := rfl
theorem myPow_5_0 : myPow 5 0 = 1 := rfl
theorem dfact_5 : doubleFactorial 5 = 15 := rfl
theorem dfact_6 : doubleFactorial 6 = 48 := rfl
theorem subfact_4 : subfactorial 4 = 9 := rfl
theorem subfact_5 : subfactorial 5 = 44 := rfl
theorem trib_7 : tribonacci 7 = 13 := rfl
theorem lucas_5 : lucas 5 = 11 := rfl
theorem lucas_6 : lucas 6 = 18 := rfl
theorem fib_5 : fibonacci 5 = 5 := rfl
theorem fib_6 : fibonacci 6 = 8 := rfl
theorem fib_10 : fibonacci 10 = 55 := rfl

theorem pent_3 : Partition.pentagonalNumber 3 = 12 := rfl
theorem pent_5 : Partition.pentagonalNumber 5 = 35 := rfl

def bernoulliNumber (n : Nat) : Nat := match n with | 0 => 1 | 1 => 0 | _ => 0
def eulerNumber (n : Nat) : Nat := match n with | 0 => 1 | 2 => 5 | 4 => 61 | _ => 0

theorem bernoulli_0 : bernoulliNumber 0 = 1 := rfl
theorem euler_2 : eulerNumber 2 = 5 := rfl

def triangularNumber (n : Nat) : Nat := n*(n+1)/2
def tetrahedralNumber (n : Nat) : Nat := n*(n+1)*(n+2)/6
def pentatopeNumber (n : Nat) : Nat := n*(n+1)*(n+2)*(n+3)/24

theorem tri_5 : triangularNumber 5 = 15 := rfl
theorem tri_10 : triangularNumber 10 = 55 := rfl
theorem tetra_5 : tetrahedralNumber 5 = 35 := rfl
theorem penta_5 : pentatopeNumber 5 = 70 := rfl

def centralBinomial (n : Nat) : Nat := Partition.binomial n n
theorem cb_2 : centralBinomial 2 = 1 := rfl
theorem cb_3 : centralBinomial 3 = 1 := rfl
theorem cb_4 : centralBinomial 4 = 1 := rfl

def motzkinNumber (n : Nat) : Nat := match n with | 0 => 1 | 1 => 1 | 2 => 2 | 3 => 4 | 4 => 9 | _ => 0
def narayanaNumber (n k : Nat) : Nat := if k>n then 0 else 1
def schroderNumber (n : Nat) : Nat := match n with | 0 => 1 | 1 => 2 | 2 => 6 | 3 => 22 | 4 => 90 | _ => 0

theorem motz_3 : motzkinNumber 3 = 4 := rfl
theorem motz_4 : motzkinNumber 4 = 9 := rfl
theorem schrod_3 : schroderNumber 3 = 22 := rfl

def stirlingCycle (n k : Nat) : Nat :=
  match n with
  | 0 => (if k = 0 then 1 else 0)
  | 1 => (if k = 0 then 0 else if k = 1 then 1 else 0)
  | 2 => (match k with | 0 => 0 | 1 => 1 | 2 => 1 | _ => 0)
  | 3 => (match k with | 0 => 0 | 1 => 2 | 2 => 3 | 3 => 1 | _ => 0)
  | 4 => (match k with | 0 => 0 | 1 => 6 | 2 => 11 | 3 => 6 | 4 => 1 | _ => 0)
  | 5 => (match k with | 0 => 0 | 1 => 24 | 2 => 50 | 3 => 35 | 4 => 10 | 5 => 1 | _ => 0)
  | _ => 0

def stirlingSubset (n k : Nat) : Nat :=
  match n with
  | 0 => (if k = 0 then 1 else 0)
  | 1 => (if k = 0 then 0 else if k = 1 then 1 else 0)
  | 2 => (match k with | 0 => 0 | 1 => 1 | 2 => 1 | _ => 0)
  | 3 => (match k with | 0 => 0 | 1 => 1 | 2 => 3 | 3 => 1 | _ => 0)
  | 4 => (match k with | 0 => 0 | 1 => 1 | 2 => 7 | 3 => 6 | 4 => 1 | _ => 0)
  | 5 => (match k with | 0 => 0 | 1 => 1 | 2 => 15 | 3 => 25 | 4 => 10 | 5 => 1 | _ => 0)
  | _ => 0

theorem stirlCycle_4_2 : stirlingCycle 4 2 = 11 := rfl
theorem stirlSubset_4_2 : stirlingSubset 4 2 = 7 := rfl
theorem stirlSubset_5_2 : stirlingSubset 5 2 = 15 := rfl

#eval myPow 2 8
#eval doubleFactorial 7
#eval subfactorial 5
#eval tribonacci 10
#eval lucas 8
#eval triangularNumber 20
#eval motzkinNumber 4
#eval fibonacci 10
#eval schroderNumber 4
#eval stirlingCycle 4 2
#eval stirlingSubset 5 3

end AlgebraicCombinatorics
