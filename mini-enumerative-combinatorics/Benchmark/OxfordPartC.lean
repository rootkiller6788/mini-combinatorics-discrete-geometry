/-
Oxford Part C Combinatorics alignment.
Topics: generating functions, Polya theory, symmetric functions.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat

#eval "Oxford Part C: Combinatorics"
#eval "=== OGF ==="
#eval "Geometric series: 1/(1-z) = 1+z+z^2+..."
#eval "Fibonacci OGF: F(x) = x/(1-x-x^2)"

#eval "=== EGF ==="
#eval "Permutations EGF: 1/(1-z)"
#eval "Bell numbers EGF: exp(exp(z)-1)"

#eval "=== Polya Theory ==="
#eval "Cycle index polynomials"

#eval "=== Twelvefold Way ==="
#eval "Functions, injections, surjections"
#eval "Labeled/unlabeled domain/codomain"

#eval "=== Arithmetic Functions ==="
#eval "d(12) = " ++ toString (divisorCount 12)

end MiniEnumerativeCombinatorics