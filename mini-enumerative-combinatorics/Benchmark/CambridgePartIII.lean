/-
Cambridge Part III Combinatorics alignment.
Topics: enumerative combinatorics, Ramsey theory, extremal combinatorics.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat

#eval "Cambridge Part III: Combinatorics"
#eval "=== Counting Principles ==="
#eval "Rule of sum/product, inclusion-exclusion"
#eval "Pigeonhole: 13 people -> shared birthday month"

#eval "=== Binomial Identities ==="
#eval "Vandermonde: sum C(3,k)C(3,3-k) = C(6,3)"
#eval "Committee-chair: sum k*C(5,k) = 5*2^4"

#eval "=== Catalan Numbers ==="
#eval "C_5 = " ++ toString (catalan 5)
#eval "C_10 = " ++ toString (catalan 10)
#eval "Dyck paths, binary trees, triangulations"

#eval "=== Integer Partitions ==="
#eval "p(6) = " ++ toString (partitionNumber 6)
#eval "p(8) = " ++ toString (partitionNumber 8)
#eval "Euler pentagonal number theorem"

#eval "=== Fibonacci ==="
#eval "F_20 = " ++ toString (fib 20)
#eval "Sum F_0..F_10 = F_12 - 1 = " ++ toString (sumRange fib 10)

end MiniEnumerativeCombinatorics