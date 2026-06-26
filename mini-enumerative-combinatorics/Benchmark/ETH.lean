/-
ETH Zurich Combinatorics alignment.
Topics: Eulerian numbers, Polya enumeration, arithmetic combinatorics.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat

#eval "ETH Zurich: Combinatorics"
#eval "=== Eulerian Numbers ==="
#eval "A(4,1) = " ++ toString (eulerianNumber 4 1)
#eval "A(4,2) = " ++ toString (eulerianNumber 4 2)
#eval "A(5,k): " ++ toString ((List.range 4).map (eulerianNumber 5))

#eval "=== Necklaces & Polya ==="

#eval "=== Lah Numbers ==="

#eval "=== Recurrences ==="
#eval "Tower of Hanoi T_5 = " ++ toString (towerOfHanoi 5)
#eval "Josephus J(10) = " ++ toString (josephus 10)

end MiniEnumerativeCombinatorics