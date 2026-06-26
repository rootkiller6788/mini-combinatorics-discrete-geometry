/-
CSU combinatorics benchmark.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat
#eval "== CSU =="
#eval "P(8,3)=" ++ toString (falling 8 3)
#eval "C(10,5)=" ++ toString (choose 10 5)
#eval "8!=" ++ toString (factorial 8)
#eval "C_8=" ++ toString (catalan 8)
#eval "fib(20)=" ++ toString (fib 20)
#eval "S(8,3)=" ++ toString (stirlingSecondKind 8 3)
#eval "B(8)=" ++ toString (bellNumber 8)
#eval "!8=" ++ toString (subfactorial 8)
end MiniEnumerativeCombinatorics