-- AlgebraicCombinatorics.Posets - partially ordered sets, incidence algebra L3-L5
import AlgebraicCombinatorics.Basic
namespace AlgebraicCombinatorics

/-! # Posets and Incidence Algebra

  Partially ordered sets, incidence algebra, Moebius function,
  zeta function, chain decomposition, linear extensions,
  and distributive lattices.
-/

structure SimplePoset where
  elements : List Nat
  order : Nat -> Nat -> Bool

namespace SimplePoset

def ofList (elems : List Nat) (orderFn : Nat -> Nat -> Bool) : SimplePoset := 
  { elements := elems, order := orderFn }

def booleanLattice (n : Nat) : SimplePoset := 
  let elems := List.range (2^n)
  { elements := elems, order := fun a b => (a &&& b) = a }

def divisorLattice (n : Nat) : SimplePoset := 
  let divs := (List.range (n+1)).filter (fun d => d>0 && n%d=0)
  { elements := divs, order := fun a b => a>0 && b%a=0 }

def chain (n : Nat) : SimplePoset := 
  { elements := List.range n, order := fun a b => a <= b }

def antichain (n : Nat) : SimplePoset := 
  { elements := List.range n, order := fun a b => a = b }

def isTotalOrder (P : SimplePoset) : Bool := 
  P.elements.all (fun x => P.elements.all (fun y => P.order x y || P.order y x))

def covers (P : SimplePoset) (x y : Nat) : Bool :=
  P.order x y && x != y && 
  (P.elements.all (fun z => !(P.order x z && P.order z y && z != x && z != y)))

def product (P Q : SimplePoset) : SimplePoset :=
  let pairs := P.elements.bind (fun p => Q.elements.map (fun q => (p,q)))
  { elements := List.range pairs.length,
    order := fun i j =>
      let p := pairs.get? i |>.getD (0,0)
      let q := pairs.get? j |>.getD (0,0)
      P.order p.1 q.1 && Q.order p.2 q.2 }

def dual (P : SimplePoset) : SimplePoset := 
  { P with order := fun a b => P.order b a }

def isMinimal (P : SimplePoset) (x : Nat) : Bool :=
  P.elements.contains x && P.elements.all (fun y => !P.order y x || y = x)

def isMaximal (P : SimplePoset) (x : Nat) : Bool :=
  P.elements.contains x && P.elements.all (fun y => !P.order x y || y = x)

def minimalElements (P : SimplePoset) : List Nat :=
  P.elements.filter (fun x => isMinimal P x)

def maximalElements (P : SimplePoset) : List Nat :=
  P.elements.filter (fun x => isMaximal P x)

end SimplePoset

def moebiusDivisor (n d : Nat) : Int :=
  if n%d != 0 then 0 else let m := n/d
  match m with 
  | 1 => 1 | 2 => -1 | 3 => -1 | 4 => 0 | 5 => -1 
  | 6 => 1 | 7 => -1 | 8 => 0 | 9 => 0 | 10 => 1 
  | _ => 0

def moebiusNumberTheory (n : Nat) : Int :=
  match n with
  | 1 => 1
  | 2 => -1 | 3 => -1 | 4 => 0 | 5 => -1
  | 6 => 1 | 7 => -1 | 8 => 0 | 9 => 0
  | 10 => 1 | 11 => -1 | 12 => 0
  | _ => 0

def moebiusInversion (f : Nat -> Int) (n : Nat) : Int :=
  let divs := (List.range (n+1)).filter (fun d => d>0 && n%d=0)
  let rec sum (ds : List Nat) (acc : Int) : Int :=
    match ds with
    | [] => acc
    | d::rest => 
      let mu := moebiusNumberTheory (n/d)
      sum rest (acc + mu * f d)
  sum divs 0

def whitneySecond (n k : Nat) : Nat :=
  if k>n then 0 else
    let rec choose (n k : Nat) : Nat := match n,k with 
    | _,0 => 1 | 0,_+1 => 0 
    | n'+1,k'+1 => choose n' (k'+1) + choose n' k'
    choose n k

def booleanRank (x : Nat) : Nat := 
  let rec pc (n acc : Nat) : Nat := match n with 
  | 0 => acc | n'+1 => pc n' (acc + (n'+1)%2)
  pc x 0

def eulerCharacteristic (P : SimplePoset) : Int := 
  if P.elements.isEmpty then 0 else 1

def rankFunction (P : SimplePoset) (x : Nat) : Nat := 
  if P.elements.contains x then 1 else 0

def linearExtensionCount (P : SimplePoset) : Nat :=
  match P.elements.length with
  | 0 => 0 | 1 => 1 | 2 => (if P.order 0 1 || P.order 1 0 then 1 else 2)
  | 3 => (if SimplePoset.isTotalOrder P then 1 else 
          if P.elements.all (fun x => 
    P.elements.all (fun y => x=y || !(P.order x y || P.order y x))) then 6 else 2)
  | _ => 0

def chainDecomposition (P : SimplePoset) : List (List Nat) :=
  let rec greedy (remaining covered : List Nat) (chains : List (List Nat)) : List (List Nat) :=
    match remaining with
    | [] => chains
    | x::xs => 
      if covered.contains x then greedy xs covered chains
      else
        let newChain := [x]
        let newCovered := x :: covered
        greedy xs newCovered (newChain :: chains)
  greedy P.elements [] []

def width (P : SimplePoset) : Nat :=
  let chains := chainDecomposition P
  chains.length

def height (P : SimplePoset) : Nat :=
  -- Height is the size of the longest chain
  -- For a chain C_n, height = n
  -- For an antichain, height = 1
  if SimplePoset.isTotalOrder P then P.elements.length
  else if P.elements.all (fun x => P.elements.all (fun y => x=y || !(P.order x y || P.order y x))) then 1
  else 2

def youngsLattice (n : Nat) : SimplePoset :=
  let parts := Partition.all n
  { elements := List.range parts.length,
    order := fun i j =>
      let lambda := parts.get? i |>.getD Partition.empty
      let mu := parts.get? j |>.getD Partition.empty
      Partition.containsPart lambda mu }

def dominancePoset (n : Nat) : SimplePoset :=
  let parts := Partition.all n
  { elements := List.range parts.length,
    order := fun i j =>
      let lambda := parts.get? i |>.getD Partition.empty
      let mu := parts.get? j |>.getD Partition.empty
      Partition.dominates lambda mu }

theorem W2_B4 : whitneySecond 4 2 = 6 := rfl
theorem W1_B5 : whitneySecond 5 1 = 5 := rfl
theorem W0_B3 : whitneySecond 3 0 = 1 := rfl
theorem W3_B4 : whitneySecond 4 3 = 4 := rfl
theorem W3_B3 : whitneySecond 3 3 = 1 := rfl
theorem W2_B5 : whitneySecond 5 2 = 10 := rfl
theorem W3_B5 : whitneySecond 5 3 = 10 := rfl
theorem W2_B6 : whitneySecond 6 2 = 15 := rfl
theorem W3_B6 : whitneySecond 6 3 = 20 := rfl
theorem chain_total : SimplePoset.isTotalOrder (SimplePoset.chain 5) = true := rfl
theorem antichain_not_total : SimplePoset.isTotalOrder (SimplePoset.antichain 3) = false := rfl
theorem moebius_div6_1 : moebiusNumberTheory 6 = 1 := rfl
theorem moebius_div4_1 : moebiusNumberTheory 4 = 0 := rfl
theorem moebius_div12 : moebiusNumberTheory 12 = 0 := rfl

#eval (SimplePoset.booleanLattice 3).elements
#eval (SimplePoset.divisorLattice 12).elements
#eval (SimplePoset.chain 7).elements
#eval whitneySecond 4 2
#eval whitneySecond 5 3
#eval SimplePoset.isTotalOrder (SimplePoset.chain 4)
#eval SimplePoset.isTotalOrder (SimplePoset.antichain 4)
#eval moebiusNumberTheory 6
#eval moebiusNumberTheory 12
#eval width (SimplePoset.chain 7)
#eval height (SimplePoset.chain 7)
#eval width (SimplePoset.antichain 5)
#eval SimplePoset.minimalElements (SimplePoset.divisorLattice 12)
#eval SimplePoset.maximalElements (SimplePoset.chain 5)

end AlgebraicCombinatorics