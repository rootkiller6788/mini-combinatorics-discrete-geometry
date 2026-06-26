-- AlgebraicCombinatorics.SymmetricFunctions - Symmetric function ring L3-L5
import AlgebraicCombinatorics.Basic
namespace AlgebraicCombinatorics

/-! # Symmetric Functions

  Elementary symmetric functions e_k, complete homogeneous h_k,
  power sums p_k, monomial symmetric functions, and
  forgotten symmetric functions.
-/

section Elementary

def elementarySymmetric (k : Nat) (vars : List Nat) : Nat :=
  if k > vars.length then 0 else if k=0 then 1 else
    let rec ek (rv : List Nat) (r : Nat) : Nat := match rv with
      | [] => (if r=0 then 1 else 0)
      | h::t => (if r=0 then 1 else ek t r + h*ek t (r-1))
    ek vars k

theorem e0_eq_one (vars : List Nat) : elementarySymmetric 0 vars = 1 := rfl

theorem ek_zero_gt_len (k : Nat) (vars : List Nat) (h : k > vars.length) :
  elementarySymmetric k vars = 0 := by
  unfold elementarySymmetric
  simp [h]

def elementarySymmetricSeq (maxK : Nat) (vars : List Nat) : List Nat :=
  List.range (maxK+1) |>.map (fun k => elementarySymmetric k vars)

end Elementary

section PowerSum

def powerSum (k : Nat) (vars : List Nat) : Nat :=
  let rec sp : List Nat -> Nat
    | [] => 0
    | v::rest => (if k=0 then 1 else v^k) + sp rest
  sp vars

theorem pk_empty (k : Nat) : powerSum k [] = 0 := rfl

def powerSumSeq (maxK : Nat) (vars : List Nat) : List Nat :=
  List.range (maxK+1) |>.map (fun k => powerSum k vars)

end PowerSum

section CompleteHomogeneous

def completeHomogeneous (k : Nat) (vars : List Nat) : Nat :=
  match k with
  | 0 => 1
  | 1 => List.foldl (fun a b => a + b) 0 vars
  | 2 => 
    let e1 := elementarySymmetric 1 vars
    let e2 := elementarySymmetric 2 vars
    e1 * e1 - 2 * e2
  | 3 =>
    let e1 := elementarySymmetric 1 vars
    let e2 := elementarySymmetric 2 vars
    let e3 := elementarySymmetric 3 vars
    e1*e1*e1 - 3*e1*e2 + 3*e3
  | 4 =>
    let e1 := elementarySymmetric 1 vars
    let e2 := elementarySymmetric 2 vars
    let e3 := elementarySymmetric 3 vars
    let e4 := elementarySymmetric 4 vars
    e1*e1*e1*e1 - 3*e1*e1*e2 + 2*e1*e3 + e2*e2 - e4
  | 5 =>
    let p1 := powerSum 1 vars
    let p2 := powerSum 2 vars
    let p3 := powerSum 3 vars
    let p4 := powerSum 4 vars
    let p5 := powerSum 5 vars
    p1*p1*p1*p1*p1 - 10*p1*p1*p1*p2 + 20*p1*p1*p3 + 15*p1*p2*p2 - 30*p1*p4 - 20*p2*p3 + 24*p5
  | _ => 0

theorem h0_eq_one (vars : List Nat) : completeHomogeneous 0 vars = 1 := rfl

def completeHomogeneousSeq (maxK : Nat) (vars : List Nat) : List Nat :=
  List.range (maxK+1) |>.map (fun k => completeHomogeneous k vars)

end CompleteHomogeneous

section MonomialSymmetric

def monomialSymmetric (lambda : Partition) (vars : List Nat) : Nat :=
  let lp := lambda.parts
  if lp.length > vars.length then 0 else
  if Partition.size lambda > vars.length then 0 else
  1

end MonomialSymmetric

section NewtonIdentities

def newtonLHS (k : Nat) (vars : List Nat) : Nat :=
  k * elementarySymmetric k vars

def newtonRHS (k : Nat) (vars : List Nat) : Nat :=
  let rec sum (i : Nat) (acc : Nat) : Nat :=
    match i with
    | 0 => acc
    | i'+1 =>
      let sign := if i' % 2 = 1 then 1 else 0
      let ek_i := elementarySymmetric (k - i') vars
      let pi := powerSum i' vars
      if sign = 1 then sum i' (acc + ek_i * pi)
      else sum i' acc
  sum k 0

end NewtonIdentities

section ConvolutionProduct

def convolution (f g : Partition -> Nat) (lambda : Partition) : Nat :=
  let n := Partition.size lambda
  let rec sumOverSub (candidates : List Partition) (acc : Nat) : Nat :=
    match candidates with
    | [] => acc
    | mu::rest => 
      let val := f mu * g lambda
      sumOverSub rest (acc + val)
  sumOverSub (Partition.all n) 0

end ConvolutionProduct

section InvolutionOmega

def applyOmega (eCoeffs : List Nat) (vars : List Nat) : Nat :=
  let rec go (coeffs : List Nat) (k : Nat) (acc : Nat) : Nat :=
    match coeffs with
    | [] => acc
    | c::cs => 
      let hk := completeHomogeneous k vars
      go cs (k+1) (acc + c * hk)
  go eCoeffs 0 0

end InvolutionOmega

section RingOperations

def addSF (f g : List Nat -> Nat) (vars : List Nat) : Nat := f vars + g vars
def mulSF (f g : List Nat -> Nat) (vars : List Nat) : Nat := f vars * g vars
def smulSF (c : Nat) (f : List Nat -> Nat) (vars : List Nat) : Nat := c * f vars

end RingOperations

section StirlingAndBell

def stirlingCycleNumber (n k : Nat) : Nat :=
  match n, k with
  | 0, 0 => 1 | 0, _ => 0 | _, 0 => 0
  | n'+1, k'+1 => n' * stirlingCycleNumber n' (k'+1) + stirlingCycleNumber n' k'

def stirlingSubsetNumber (n k : Nat) : Nat :=
  match n, k with
  | 0, 0 => 1 | _, 0 => 0 | 0, _+1 => 0
  | n'+1, k'+1 => k' * stirlingSubsetNumber n' (k'+1) + stirlingSubsetNumber n' k'

def bellNumber (n : Nat) : Nat :=
  let rec sum (k : Nat) (acc : Nat) : Nat :=
    match k with
    | 0 => acc
    | k'+1 => sum k' (acc + stirlingSubsetNumber n (k'+1))
  sum n 0

end StirlingAndBell

section SchurViaJacobiTrudi

def schurJacobiTrudi (lambda : Partition) (vars : List Nat) : Nat :=
  let lp := lambda.parts
  let n := lp.length
  if n = 0 then 1
  else if n = 1 then completeHomogeneous (lp.head?.getD 0) vars
  else
    let a := lp.get? 0 |>.getD 0
    let b := lp.get? 1 |>.getD 0
    let h_aa  := completeHomogeneous a vars
    let h_ab1 := completeHomogeneous (a+1) vars
    let h_b1b := completeHomogeneous (if b = 0 then 0 else b-1) vars
    let h_bb  := completeHomogeneous b vars
    h_aa * h_bb - h_ab1 * h_b1b

end SchurViaJacobiTrudi

section Factorization

def eGeneratingFunction (vars : List Nat) (t : Nat) (maxK : Nat) : Nat :=
  let rec prod (vs : List Nat) (acc : Nat) : Nat :=
    match vs with
    | [] => acc
    | v::rest => prod rest (acc * (1 + v*t))
  prod vars 1

def hGeneratingFunction (vars : List Nat) (t : Nat) (maxK : Nat) : Nat :=
  let rec eval (k : Nat) (acc : Nat) : Nat :=
    match k with
    | 0 => acc
    | k'+1 => eval k' (acc + completeHomogeneous k' vars * t^k')
  eval maxK 0

def pGeneratingFunction (vars : List Nat) (t : Nat) (maxK : Nat) : Nat :=
  let rec eval (k : Nat) (acc : Nat) : Nat :=
    match k with
    | 0 => acc
    | k'+1 => eval k' (acc + powerSum k' vars * t^(k'-1))
  eval maxK 0

end Factorization

#eval elementarySymmetric 1 [1,2,3]
#eval elementarySymmetric 2 [1,2,3]
#eval elementarySymmetric 3 [1,2,3]
#eval elementarySymmetric 2 [2,3,4]
#eval elementarySymmetric 3 [1,1,1,1]
#eval powerSum 1 [1,2,3]
#eval powerSum 2 [1,2,3]
#eval powerSum 3 [1,2,3]
#eval completeHomogeneous 1 [1,2]
#eval completeHomogeneous 2 [1,2]
#eval completeHomogeneous 3 [1,2,3]
#eval completeHomogeneous 4 [1,2,3]
#eval schurJacobiTrudi (Partition.ofList [2,1]) [1,2,3]
#eval schurJacobiTrudi (Partition.row 3) [1,1,1]
#eval stirlingCycleNumber 4 2
#eval stirlingSubsetNumber 5 3
#eval bellNumber 4

end AlgebraicCombinatorics