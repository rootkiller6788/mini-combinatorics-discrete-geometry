/-
KTH combinatorics alignment.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat
#eval "== KTH =="
#eval "P(9,3)=" ++ toString (falling 9 3)
#eval "C(10,6)=" ++ toString (choose 10 6)
#eval "8!=" ++ toString (factorial 8)
#eval "Row8: " ++ toString (sumRange (choose 8) 8)
#eval "C_9=" ++ toString (catalan 9)
#eval "F_20=" ++ toString (fib 20)
#eval "S(8,4)=" ++ toString (stirlingSecondKind 8 4)
#eval "B(9)=" ++ toString (bellNumber 9)
#eval "!8=" ++ toString (subfactorial 8)
#eval "T_9=" ++ toString (towerOfHanoi 9)
#eval "Central(4)=" ++ toString (centralBinomial 4)
end MiniEnumerativeCombinatorics