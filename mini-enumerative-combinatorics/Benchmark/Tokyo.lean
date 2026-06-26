/-
Tokyo Combinatorics curriculum alignment.
Topics covered in enumerative combinatorics.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat

#eval "Tokyo: Combinatorics Coverage"
#eval "=== Basic Counting ==="
#eval "P(5,3)=" ++ toString (falling 5 3)
#eval "C(10,3)=" ++ toString (choose 10 3)
#eval "5!=" ++ toString (factorial 5)

#eval "=== Binomial Identities ==="
#eval "Sum C(6,k)=" ++ toString (sumRange (choose 6) 6)
#eval "C(8,3)=C(8,5)=" ++ toString (choose 8 3)
#eval "Central binomial C(4)=" ++ toString (centralBinomial 4)

#eval "=== Catalan ==="
#eval "C_6=" ++ toString (catalan 6)
#eval "C_8=" ++ toString (catalan 8)

#eval "=== Fibonacci ==="
#eval "F_15=" ++ toString (fib 15)
#eval "Sum F_i to 10=" ++ toString (sumRange fib 10)

#eval "=== Stirling ==="
#eval "S(6,3)=" ++ toString (stirlingSecondKind 6 3)
#eval "B(7)=" ++ toString (bellNumber 7)

#eval "=== Derangements ==="
#eval "!6=" ++ toString (subfactorial 6)

#eval "=== Arithmetic ==="
#eval "d(12)=" ++ toString (divisorCount 12)

end MiniEnumerativeCombinatorics