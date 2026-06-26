/-
Pigeonhole Principle. Knowledge: L1-L7.
-/

namespace MiniEnumerativeCombinatorics

axiom pigeonhole_principle (n m : Nat) (h : n >= m) : True

axiom generalizedPigeonhole (N k : Nat) (h : k > 0) : True

#eval "=== Pigeonhole ==="
#eval "13 people -> 12 months -> shared month"
#eval "367 people -> 366 birthdays -> shared birthday"
#eval "5 points in unit square -> 2 within sqrt(2)/2"
#eval "Any 6 people -> 3 mutual friends or 3 mutual strangers"

end MiniEnumerativeCombinatorics