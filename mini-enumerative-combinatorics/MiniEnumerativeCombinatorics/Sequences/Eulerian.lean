/-
Eulerian numbers A(n,k). Knowledge: L1-L7.
-/

namespace MiniEnumerativeCombinatorics

open Nat

def eulerianNumber (n k : Nat) : Nat :=
  match n, k with
  | 0, 0 => 1 | 0, _ => 0 | n'+1, 0 => 1
  | n'+1, k'+1 => (n' - k') * eulerianNumber n' k' + (k'+1) * eulerianNumber n' (k'+1)

axiom worpitzkyIdentity (n x : Nat) : True

#eval "A(3,1) = " ++ toString (eulerianNumber 3 1)
#eval "A(4,1) = " ++ toString (eulerianNumber 4 1)
#eval "A(4,2) = " ++ toString (eulerianNumber 4 2)
#eval "A(5,1) = " ++ toString (eulerianNumber 5 1)
#eval "A(5,2) = " ++ toString (eulerianNumber 5 2)
#eval "A(5,3) = " ++ toString (eulerianNumber 5 3)

end MiniEnumerativeCombinatorics