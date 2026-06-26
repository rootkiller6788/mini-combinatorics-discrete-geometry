/-
KAIST combinatorics alignment.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat
#eval "== KAIST =="
#eval "P(6,3)=" ++ toString (falling 6 3)
#eval "C(8,4)=" ++ toString (choose 8 4)
#eval "factorial(6)=" ++ toString (factorial 6)
#eval "C_6=" ++ toString (catalan 6)
#eval "fib(15)=" ++ toString (fib 15)
#eval "S(6,3)=" ++ toString (stirlingSecondKind 6 3)
#eval "B(6)=" ++ toString (bellNumber 6)
#eval "!6=" ++ toString (subfactorial 6)
#eval "d(18)=" ++ toString (divisorCount 18)
#eval "T_6=" ++ toString (towerOfHanoi 6)
end MiniEnumerativeCombinatorics