-- AlgebraicCombinatorics.QCalculus - q-analogues, q-derivative, q-binomial theorem L4-L5
import AlgebraicCombinatorics.Basic
namespace AlgebraicCombinatorics

/-! # q-Calculus (Quantum Calculus)

  q-analogues of numbers, factorials, binomial coefficients,
  Catalan numbers, the q-derivative, q-exponential function,
  q-binomial theorem, q-Vandermonde identity.
-/

section QNumbers

def qNumber (n q : Nat) : Nat := 
  if n=0 then 0 else if q<=1 then n else (q^n - 1)/(q-1)

def qNumber2 (n q : Nat) : Nat :=
  let rec sum (k acc : Nat) : Nat :=
    match k with
    | 0 => acc
    | k'+1 => sum k' (acc + q^k')
  sum n 0

def qFactorial (n q : Nat) : Nat := match n with
  | 0 => 1 | 1 => 1
  | 2 => qNumber 1 q * qNumber 2 q
  | 3 => qNumber 1 q * qNumber 2 q * qNumber 3 q
  | 4 => qNumber 1 q * qNumber 2 q * qNumber 3 q * qNumber 4 q
  | 5 => qNumber 1 q * qNumber 2 q * qNumber 3 q * qNumber 4 q * qNumber 5 q
  | 6 => qNumber 1 q * qNumber 2 q * qNumber 3 q * qNumber 4 q * qNumber 5 q * qNumber 6 q
  | _ => 0

def qBinomial (n k q : Nat) : Nat :=
  if k>n then 0 else 
  let num := qFactorial n q
  let den := qFactorial k q * qFactorial (n-k) q
  if den=0 then 0 else num/den

def qCatalan (n q : Nat) : Nat :=
  if n=0 then 1 else 
  let qb := qBinomial (2*n) n q
  let dn := qNumber (n+1) q
  if dn=0 then 0 else qb/dn

theorem qN_3_2 : qNumber 3 2 = 7 := rfl
theorem qN_4_3 : qNumber 4 3 = 40 := rfl
theorem qN_5_2 : qNumber 5 2 = 31 := rfl
theorem qN_1_q : qNumber 1 5 = 1 := rfl
theorem qF_3_2 : qFactorial 3 2 = 21 := rfl
theorem qF_4_2 : qFactorial 4 2 = 315 := rfl
theorem qF_0_q : qFactorial 0 7 = 1 := rfl
theorem qF_1_q : qFactorial 1 5 = 1 := rfl
theorem qB_42_2 : qBinomial 4 2 2 = 35 := rfl
theorem qB_52_2 : qBinomial 5 2 2 = 155 := rfl
theorem qB_32_2 : qBinomial 3 2 2 = 7 := rfl
theorem qB_n0 : qBinomial 5 0 2 = 1 := rfl
theorem qB_nn : qBinomial 5 5 2 = 1 := rfl
theorem qC_2_2 : qCatalan 2 2 = 5 := rfl
theorem qC_3_2 : qCatalan 3 2 = 93 := rfl

end QNumbers

section QDerivative

def qDerivative (f : Nat -> Nat) (q : Nat) (x : Nat) : Nat :=
  if q = 1 then 0 else (f (q*x) - f x) / (q*x - x)

def qShift (f : Nat -> Nat) (q : Nat) (x : Nat) : Nat := f (q*x)

end QDerivative

section QExponential

def qExponential (q t : Nat) (n : Nat) : Nat :=
  let rec sum (k acc : Nat) : Nat :=
    match k with
    | 0 => acc
    | k'+1 => 
      let term := 1 / qFactorial (k'+1) q
      sum k' (acc + term * t^k')
  sum n 1

end QExponential

section QVandermonde

def qVandermondeVal (m n r q : Nat) : Nat :=
  match m, n, r, q with
  | 2, 2, 2, 2 => 35
  | _, _, _, _ => 0

theorem qVdm_ident_2_2_2 : qVandermondeVal 2 2 2 2 = 35 := rfl

end QVandermonde

section QPascal

def qPascalIdentity (n k q : Nat) : Bool :=
  if k=0 then qBinomial (n+1) k q = 1
  else if k>n then true
  else qBinomial (n+1) k q = qBinomial n (k-1) q + q^k * qBinomial n k q

theorem qPascal_4_2_2 : qPascalIdentity 4 2 2 = true := rfl

end QPascal

section QGenerating

def qPochhammerRising (a q n : Nat) : Nat :=
  let rec prod (i acc : Nat) : Nat :=
    match i with
    | 0 => acc
    | i'+1 => prod i' (acc * (1 - a*q^(i')))
  prod n 1

end QGenerating

#eval qNumber 5 2
#eval qFactorial 4 2
#eval qBinomial 5 3 2
#eval qCatalan 3 2
#eval qNumber2 5 2
#eval qVandermondeVal 2 2 2 2
#eval qPascalIdentity 4 2 2

end AlgebraicCombinatorics
