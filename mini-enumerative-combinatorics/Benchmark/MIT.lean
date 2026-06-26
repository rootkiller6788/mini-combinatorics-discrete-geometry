/-
MIT 18.211 Combinatorial Theory alignment.
Topics: permutations, binomials, generating functions, partitions.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat

#eval "MIT 18.211: Combinatorial Theory"
#eval "=== Permutations ==="
#eval "5! = " ++ toString (factorial 5)
#eval "P(10,3) = " ++ toString (falling 10 3)
#eval "Derangements !5 = " ++ toString (subfactorial 5)

#eval "=== Binomials ==="
#eval "C(10,5) = " ++ toString (choose 10 5)
#eval "Sum C(6,k) = " ++ toString (sumRange (choose 6) 6)
#eval "C(8,3) = C(8,5) = " ++ toString (choose 8 3)

#eval "=== Generating Functions ==="
#eval "Fibonacci OGF: F(x) = x/(1-x-x^2)"
#eval "Catalan OGF: C(x) = (1-sqrt(1-4x))/(2x)"

#eval "=== Partitions ==="
#eval "p(5) = " ++ toString (partitionNumber 5)
#eval "p(7) = " ++ toString (partitionNumber 7)
#eval "S(5,2) = " ++ toString (stirlingSecondKind 5 2)
#eval "B(5) = " ++ toString (bellNumber 5)

#eval "=== Inclusion-Exclusion ==="
#eval "Derangements !5 = " ++ toString (subfactorial 5)
#eval "Surjections onto [2] from [4]: " ++ toString (countOntoFunctions 4 2)

#eval "=== Polya Theory ==="

end MiniEnumerativeCombinatorics