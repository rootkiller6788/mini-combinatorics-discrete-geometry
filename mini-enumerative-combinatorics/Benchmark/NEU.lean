/-
NEU combinatorics alignment.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat
#eval "== NEU =="
#eval "P(10,3)=" ++ toString (falling 10 3)
#eval "C(12,6)=" ++ toString (choose 12 6)
#eval "10!=" ++ toString (factorial 10)
#eval "C_10=" ++ toString (catalan 10)
#eval "fib(30)=" ++ toString (fib 30)
#eval "S(10,4)=" ++ toString (stirlingSecondKind 10 4)
#eval "B(10)=" ++ toString (bellNumber 10)
#eval "!10=" ++ toString (subfactorial 10)
#eval "central(5)=" ++ toString (centralBinomial 5)
end MiniEnumerativeCombinatorics