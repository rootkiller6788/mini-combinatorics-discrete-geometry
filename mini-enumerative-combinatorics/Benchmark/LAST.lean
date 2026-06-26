/-
Final combinatorics benchmark.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat
#eval "== Final Verification =="
#eval "P(11,4)=" ++ toString (falling 11 4)
#eval "C(13,6)=" ++ toString (choose 13 6)
#eval "11!=" ++ toString (factorial 11)
#eval "C_12=" ++ toString (catalan 12)
#eval "fib(35)=" ++ toString (fib 35)
#eval "S(12,5)=" ++ toString (stirlingSecondKind 12 5)
#eval "B(12)=" ++ toString (bellNumber 12)
#eval "!12=" ++ toString (subfactorial 12)
#eval "central(6)=" ++ toString (centralBinomial 6)
#eval "triangular(20)=" ++ toString (triangular 20)
#eval "d(36)=" ++ toString (divisorCount 36)
end MiniEnumerativeCombinatorics