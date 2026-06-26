/-
NYU University combinatorial theory alignment.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat

#eval "== NYU Combinatorics =="
#eval "P(6,3)=" ++ toString (falling 6 3)
#eval "C(7,3)=" ++ toString (choose 7 3)
#eval "C(9,4)=" ++ toString (choose 9 4)
#eval "5!=" ++ toString (factorial 5)
#eval "C_id sum: " ++ toString (sumRange (choose 6) 6)
#eval "C_6=" ++ toString (catalan 6)
#eval "F_12=" ++ toString (fib 12)
#eval "S(5,2)=" ++ toString (stirlingSecondKind 5 2)
#eval "B(6)=" ++ toString (bellNumber 6)
#eval "!5=" ++ toString (subfactorial 5)
#eval "d(28)=" ++ toString (divisorCount 28)
#eval "T_6=" ++ toString (towerOfHanoi 6)

end MiniEnumerativeCombinatorics