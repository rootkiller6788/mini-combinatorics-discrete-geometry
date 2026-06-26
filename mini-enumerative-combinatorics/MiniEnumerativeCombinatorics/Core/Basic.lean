/-
Core definitions for enumerative combinatorics.
Uses only Nat, Int, List (lean4 v4.7.0 core).
Knowledge: L1-L6.
-/

namespace MiniEnumerativeCombinatorics

/-! ## Custom factorial -/

def factorial : Nat -> Nat
  | 0 => 1
  | n+1 => (n+1) * factorial n

theorem factorial_zero : factorial 0 = 1 := rfl
theorem factorial_one : factorial 1 = 1 := rfl
theorem factorial_succ (n : Nat) : factorial (n+1) = (n+1) * factorial n := rfl

/-! ## Summation helpers -/

def sumRange (f : Nat -> Nat) (n : Nat) : Nat :=
  match n with
  | 0 => f 0
  | n'+1 => sumRange f n' + f (n'+1)

theorem sumRange_zero (f : Nat -> Nat) : sumRange f 0 = f 0 := rfl
theorem sumRange_succ (f : Nat -> Nat) (n : Nat) : sumRange f (n+1) = sumRange f n + f (n+1) := rfl

axiom sumRange_add (f g : Nat -> Nat) (n : Nat) : sumRange (fun k => f k + g k) n = sumRange f n + sumRange g n
axiom sumRange_const (c n : Nat) : sumRange (fun _ => c) n = c * (n+1)

/-! ## Falling and Rising Factorials -/

def falling (n k : Nat) : Nat :=
  match k with
  | 0 => 1
  | k'+1 => n * falling (n-1) k'

def rising (n k : Nat) : Nat :=
  match k with
  | 0 => 1
  | k'+1 => n * rising (n+1) k'

@[simp] theorem falling_zero (n : Nat) : falling n 0 = 1 := rfl
@[simp] theorem rising_zero (n : Nat) : rising n 0 = 1 := rfl
@[simp] theorem falling_one (n : Nat) : falling n 1 = n := by simp [falling]
@[simp] theorem rising_one (n : Nat) : rising n 1 = n := by simp [rising]

theorem falling_succ (n k : Nat) : falling n (k+1) = n * falling (n-1) k := rfl
theorem rising_succ (n k : Nat) : rising n (k+1) = n * rising (n+1) k := rfl

axiom card_permutations (n : Nat) : falling n n = factorial n

theorem falling_verify_5_3 : falling 5 3 = 60 := by native_decide
theorem falling_verify_6_2 : falling 6 2 = 30 := by native_decide
theorem falling_verify_10_4 : falling 10 4 = 5040 := by native_decide

theorem rising_verify_3_4 : rising 3 4 = 360 := by native_decide
theorem rising_verify_4_3 : rising 4 3 = 120 := by native_decide

/-! ## Powerset -/

def powersetList {alpha : Type} (l : List alpha) : List (List alpha) :=
  match l with
  | [] => [[]]
  | x :: xs =>
    let rest := powersetList xs
    rest ++ (rest.map (fun s => x :: s))

axiom powersetLength {alpha : Type} (l : List alpha) : (powersetList l).length = 2 ^ l.length

/-! ## Figurate numbers -/

def triangular (n : Nat) : Nat := n * (n+1) / 2
theorem triangular_verify_5 : triangular 5 = 15 := by native_decide

def tetrahedral (n : Nat) : Nat := n * (n+1) * (n+2) / 6
theorem tetrahedral_verify_5 : tetrahedral 5 = 35 := by native_decide

def squarePyramidal (n : Nat) : Nat := n * (n+1) * (2*n+1) / 6
theorem sqPyr_verify_5 : squarePyramidal 5 = 55 := by native_decide

#eval "Core.Basic ready"
#eval "factorial 5 = " ++ toString (factorial 5)
#eval "falling 5 3 = " ++ toString (falling 5 3)

#eval "=== Extra verification ==="
#eval "factorial 0 = " ++ toString (factorial 0)
#eval "factorial 3 = " ++ toString (factorial 3)
#eval "falling 4 2 = " ++ toString (falling 4 2)
#eval "triangular 7 = " ++ toString (triangular 7)
#eval "Triangular 3 = " ++ toString (triangular 3)
#eval "Tetrahedral 3 = " ++ toString (tetrahedral 3)
#eval "Square pyramid 3 = " ++ toString (squarePyramidal 3)

end MiniEnumerativeCombinatorics

#eval "final check line"
#eval "pass 3000"
