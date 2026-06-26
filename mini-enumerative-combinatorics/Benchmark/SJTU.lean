/-
SJTU combinatorics alignment.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat
#eval "== SJTU =="
#eval "P(7,3)=" ++ toString (falling 7 3)
#eval "C(9,4)=" ++ toString (choose 9 4)
#eval "7!=" ++ toString (factorial 7)
#eval "C_7=" ++ toString (catalan 7)
#eval "fib(18)=" ++ toString (fib 18)
#eval "S(7,3)=" ++ toString (stirlingSecondKind 7 3)
#eval "B(7)=" ++ toString (bellNumber 7)
#eval "!7=" ++ toString (subfactorial 7)
end MiniEnumerativeCombinatorics