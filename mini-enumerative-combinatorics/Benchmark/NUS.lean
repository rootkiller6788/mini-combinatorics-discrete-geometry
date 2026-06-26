/-
NUS combinatorics curriculum alignment.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat
#eval "== NUS Combinatorics =="
#eval "P(8,3)=" ++ toString (falling 8 3)
#eval "C(9,4)=" ++ toString (choose 9 4)
#eval "C(11,5)=" ++ toString (choose 11 5)
#eval "7!=" ++ toString (factorial 7)
#eval "Row7 sum: " ++ toString (sumRange (choose 7) 7)
#eval "C_8=" ++ toString (catalan 8)
#eval "F_18=" ++ toString (fib 18)
#eval "S(7,4)=" ++ toString (stirlingSecondKind 7 4)
#eval "B(8)=" ++ toString (bellNumber 8)
#eval "!7=" ++ toString (subfactorial 7)
#eval "T_8=" ++ toString (towerOfHanoi 8)
end MiniEnumerativeCombinatorics