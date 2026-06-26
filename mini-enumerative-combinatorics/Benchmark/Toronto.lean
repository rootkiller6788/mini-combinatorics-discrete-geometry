/-
Toronto University combinatorics alignment benchmark.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat

#eval "== Toronto Combinatorics =="
#eval "P(7,3)=" ++ toString (falling 7 3)
#eval "C(8,4)=" ++ toString (choose 8 4)
#eval "C(10,3)=" ++ toString (choose 10 3)
#eval "6!=" ++ toString (factorial 6)
#eval "Row6 sum: " ++ toString (sumRange (choose 6) 6)
#eval "C_7=" ++ toString (catalan 7)
#eval "F_15=" ++ toString (fib 15)
#eval "S(6,3)=" ++ toString (stirlingSecondKind 6 3)
#eval "B(7)=" ++ toString (bellNumber 7)
#eval "!6=" ++ toString (subfactorial 6)
#eval "T_7=" ++ toString (towerOfHanoi 7)

end MiniEnumerativeCombinatorics