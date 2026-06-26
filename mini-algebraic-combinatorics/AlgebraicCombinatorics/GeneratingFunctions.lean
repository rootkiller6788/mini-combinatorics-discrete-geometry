-- AlgebraicCombinatorics.GeneratingFunctions - OGF, EGF, DGF, operations L3-L6
import AlgebraicCombinatorics.Basic
namespace AlgebraicCombinatorics

/-! # Generating Functions

  Ordinary (OGF), Exponential (EGF), and Dirichlet (DGF)
  generating functions with fundamental operations.
-/

section OGF

def OGF := List Nat

namespace OGF

def coeff (f : OGF) (n : Nat) : Nat := match f.get? n with | some v => v | none => 0
def zero : OGF := [0]
def const (c : Nat) : OGF := [c]
def geometric : OGF := List.replicate 20 1
def allOnes : OGF := geometric
def nats : OGF := 0::List.range 19

def add (f g : OGF) : OGF :=
  let maxLen := max f.length g.length
  let rec za (i : Nat) (acc : List Nat) : List Nat :=
    match i with
    | 0 => acc.reverse
    | i'+1 => za i' ((coeff f (i'+1) + coeff g (i'+1)) :: acc)
  za maxLen []

def mul (f g : OGF) : OGF :=
  let rec cauchy (n : Nat) : Nat :=
    let rec sum (k : Nat) (acc : Nat) : Nat :=
      match k with
      | 0 => acc
      | k'+1 => sum k' (acc + coeff f (k'+1) * coeff g (n - (k'+1)))
    sum (n+1) 0
  List.range 20 |>.map (fun n => cauchy n)

def smul (c : Nat) (f : OGF) : OGF := f.map (fun a => c*a)

def fibonacciOGF : OGF := 
  let rec fibs (a b cnt : Nat) : List Nat := 
    match cnt with 
    | 0 => [] 
    | c'+1 => a::fibs b (a+b) c'
  0::fibs 1 1 19

def catalanOGF : OGF := 
  [1,1,2,5,14,42,132,429,1430,4862,16796,58786,208012,742900,
   2674440,9694845,35357670,129644790,477638700,1767263190]

def partitionOGF (maxN : Nat) : OGF := 
  List.range (maxN+1) |>.map Partition.count_small

end OGF

end OGF

section EGF

structure EGF where
  coeffs : List Nat
  deriving Repr

namespace EGF

def coeff (f : EGF) (n : Nat) : Nat := match f.coeffs.get? n with | some v => v | none => 0
def zero : EGF := { coeffs := [0] }

def add (f g : EGF) : EGF :=
  let maxLen := max f.coeffs.length g.coeffs.length
  let rec za (i : Nat) (acc : List Nat) : List Nat :=
    match i with
    | 0 => acc.reverse
    | i'+1 => za i' ((coeff f (i'+1) + coeff g (i'+1)) :: acc)
  { coeffs := za maxLen [] }

def mul (f g : EGF) : EGF :=
  let binomCoeff := List.range 20 |>.map (fun n => 
    let rec sum (k : Nat) (acc : Nat) : Nat :=
      match k with
      | 0 => acc
      | k'+1 => sum k' (acc + coeff f (k'+1) * coeff g (n-(k'+1)) * 
        Partition.binomial n (k'+1))
    sum (n+1) 0)
  { coeffs := binomCoeff }

def exp : EGF := { coeffs := List.replicate 20 1 }
def sin : EGF := { coeffs := List.range 20 |>.map (fun n => if n%2=0 then 0 else if (n/2)%2=0 then 1 else 0) }
def cos : EGF := { coeffs := List.range 20 |>.map (fun n => if n%2=0 then (if (n/2)%2=0 then 1 else 0) else 0) }
def bell : EGF := { coeffs := [1,1,2,5,15,52,203,877,4140,21147,115975] }
def derangement : EGF := { coeffs := [1,0,1,2,9,44,265,1854,14833,133496,1334961,14684570] }

def factorial (n : Nat) : Nat := 
  let rec f : Nat -> Nat | 0 => 1 | k+1 => (k+1)*f k
  f n

end EGF

end EGF

section DGF

def DGF := List Nat

namespace DGF

def coeff (f : DGF) (n : Nat) : Nat := 
  if n=0 then 0 else match f.get? (n-1) with | some v => v | none => 0

def zeta : DGF := List.replicate 50 1
def identity : DGF := [1]
def one : DGF := List.replicate 50 1

def add (f g : DGF) : DGF :=
  let maxLen := max f.length g.length
  let rec za (i : Nat) (acc : List Nat) : List Nat :=
    match i with
    | 0 => acc.reverse
    | i'+1 => za i' ((coeff f (i'+1) + coeff g (i'+1)) :: acc)
  za maxLen []

def mul (f g : DGF) : DGF :=
  let rec dirichletConv (n : Nat) : Nat :=
    let rec sumDiv (d : Nat) (acc : Nat) : Nat :=
      match d with
      | 0 => acc
      | d'+1 => if n % (d'+1) = 0 then sumDiv d' (acc + coeff f (d'+1) * coeff g (n/(d'+1)))
                else sumDiv d' acc
    sumDiv n 0
  List.range 50 |>.map (fun n => dirichletConv (n+1))

end DGF

end DGF

section CycleIndex

def cycleIndexSymmetric (n : Nat) : String := 
  match n with 
  | 1 => "p_1" 
  | 2 => "(p_1^2+p_2)/2" 
  | 3 => "(p_1^3+3p_1p_2+2p_3)/6" 
  | 4 => "(p_1^4+6p_1^2p_2+8p_1p_3+3p_2^2+6p_4)/24" 
  | _ => "Z(S_n)"

end CycleIndex

section HadamardProduct

def hadamardProduct (f g : OGF) : OGF :=
  List.range 20 |>.map (fun n => OGF.coeff f n * OGF.coeff g n)

def hadamardEGF (f g : EGF) : EGF :=
  { coeffs := List.range 20 |>.map (fun n => EGF.coeff f n * EGF.coeff g n * EGF.factorial n) }

end HadamardProduct

#eval OGF.coeff OGF.fibonacciOGF 5
#eval OGF.coeff OGF.fibonacciOGF 10
#eval OGF.coeff OGF.catalanOGF 4
#eval OGF.coeff OGF.catalanOGF 5
#eval OGF.coeff OGF.catalanOGF 6
#eval EGF.coeff EGF.exp 5
#eval EGF.coeff EGF.exp 6
#eval EGF.coeff EGF.bell 5
#eval EGF.coeff EGF.bell 6
#eval EGF.coeff EGF.derangement 5
#eval DGF.coeff DGF.zeta 5
#eval DGF.coeff DGF.zeta 10
#eval EGF.coeff EGF.cos 4
#eval EGF.coeff EGF.sin 5

end AlgebraicCombinatorics
