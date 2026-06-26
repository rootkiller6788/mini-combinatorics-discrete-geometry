/-
SDU combinatorics alignment.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat
#eval "== SDU =="
#eval "P(9,3)=" ++ toString (falling 9 3)
#eval "C(11,5)=" ++ toString (choose 11 5)
#eval "9!=" ++ toString (factorial 9)
#eval "C_9=" ++ toString (catalan 9)
#eval "fib(25)=" ++ toString (fib 25)
#eval "S(9,3)=" ++ toString (stirlingSecondKind 9 3)
#eval "B(9)=" ++ toString (bellNumber 9)
#eval "!9=" ++ toString (subfactorial 9)
end MiniEnumerativeCombinatorics