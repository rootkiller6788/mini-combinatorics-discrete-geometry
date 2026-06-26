/-
Caltech CMS combinatorics benchmark.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat
#eval "== Caltech CMS =="
#eval "P(11,4)=" ++ toString (falling 11 4)
#eval "C(13,6)=" ++ toString (choose 13 6)
#eval "10!=" ++ toString (factorial 10)
#eval "Row10: " ++ toString (sumRange (choose 10) 10)
#eval "C_12=" ++ toString (catalan 12)
#eval "F_30=" ++ toString (fib 30)
#eval "S(10,5)=" ++ toString (stirlingSecondKind 10 5)
#eval "B(8)=" ++ toString (bellNumber 8)
#eval "!10=" ++ toString (subfactorial 10)
#eval "d(30)=" ++ toString (divisorCount 30)
#eval "T_10=" ++ toString (towerOfHanoi 10)
end MiniEnumerativeCombinatorics