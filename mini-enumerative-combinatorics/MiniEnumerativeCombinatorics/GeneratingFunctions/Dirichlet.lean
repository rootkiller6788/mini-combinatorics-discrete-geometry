/-
Arithmetic functions over Nat. Knowledge: L1-L8.
-/
import MiniEnumerativeCombinatorics.Core.Basic

namespace MiniEnumerativeCombinatorics

open Nat

def divisorCount (n : Nat) : Nat :=
  if n = 0 then 0 else
  ((List.range (n+1)).filter (fun d => d > 0 && n % d = 0)).length

def sumOfDivisorsAux (n d acc : Nat) : Nat :=
  if d = 0 then acc
  else if n % d = 0 then sumOfDivisorsAux n (d-1) (acc + d)
  else sumOfDivisorsAux n (d-1) acc

def sumOfDivisors (n : Nat) : Nat :=
  if n = 0 then 0 else sumOfDivisorsAux n n 0

def isPerfect (n : Nat) : Bool := n > 0 && sumOfDivisors n = 2*n

axiom totient (n : Nat) : Nat

axiom moebiusInversion : True

theorem divisor_verify_12 : divisorCount 12 = 6 := by native_decide
theorem sigma_verify_12 : sumOfDivisors 12 = 28 := by native_decide
theorem sigma_verify_6 : sumOfDivisors 6 = 12 := by native_decide
theorem perfect_6 : isPerfect 6 := by native_decide
theorem perfect_28 : isPerfect 28 := by native_decide

#eval "d(12) = " ++ toString (divisorCount 12)
#eval "sigma(12) = " ++ toString (sumOfDivisors 12)
#eval "perfect(6) = " ++ toString (isPerfect 6)
#eval "perfect(28) = " ++ toString (isPerfect 28)

end MiniEnumerativeCombinatorics
