/-
Tsinghua enumerative combinatorics curriculum alignment benchmark.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat

#eval "Benchmark: Tsinghua Combinatorics"
#eval "=== Permutations ==="
#eval "S_5 size = 5! = " ++ toString (factorial 5)
#eval "P(7,3) = " ++ toString (falling 7 3)
#eval "=== Combinations ==="
#eval "C(8,3) = " ++ toString (choose 8 3)
#eval "C(9,4) = C(9,5) = " ++ toString (choose 9 4)
#eval "=== Catalan ==="
#eval "C_7 = " ++ toString (catalan 7)
#eval "C_9 = " ++ toString (catalan 9)
#eval "=== Fibonacci ==="
#eval "F_20 = " ++ toString (fib 20)
#eval "Sum F_0..F_10 = F_12-1 = " ++ toString (sumRange fib 10)
#eval "=== Stirling/Bell ==="
#eval "S(7,3) = " ++ toString (stirlingSecondKind 7 3)
#eval "B(7) = " ++ toString (bellNumber 7)
#eval "=== Derangements ==="
#eval "!7 = " ++ toString (subfactorial 7)
#eval "=== Arithmetic ==="
#eval "Perfect 28? " ++ toString (isPerfect 28)
#eval "=== Identities ==="
#eval "Sum C(7,k) = 128 = 2^7"
#eval "CentralBinomial(4) = " ++ toString (centralBinomial 4)
#eval "=== Recurrences ==="
#eval "Tower of Hanoi T_7 = " ++ toString (towerOfHanoi 7)
end MiniEnumerativeCombinatorics