/-
IAS combinatorics benchmark.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat
#eval "== IAS =="
#eval "P(10,3)=" ++ toString (falling 10 3)
#eval "C(12,5)=" ++ toString (choose 12 5)
#eval "9!=" ++ toString (factorial 9)
#eval "Row9: " ++ toString (sumRange (choose 9) 9)
#eval "C_10=" ++ toString (catalan 10)
#eval "F_25=" ++ toString (fib 25)
#eval "S(9,4)=" ++ toString (stirlingSecondKind 9 4)
#eval "B(10)=" ++ toString (bellNumber 10)
#eval "!9=" ++ toString (subfactorial 9)
#eval "T_10=" ++ toString (towerOfHanoi 10)
#eval "Central(5)=" ++ toString (centralBinomial 5)
end MiniEnumerativeCombinatorics