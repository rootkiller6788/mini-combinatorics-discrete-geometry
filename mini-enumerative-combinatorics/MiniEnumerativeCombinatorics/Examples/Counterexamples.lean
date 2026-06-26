/-
Counterexamples in enumerative combinatorics. Knowledge: L6.
-/
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

#eval "=== Counterexamples ==="
#eval "C(3,4) = " ++ toString (choose 3 4) ++ " (0 for k > n)"
#eval "C(4,2)*C(6,3) = " ++ toString (choose 4 2 * choose 6 3) ++ " but C(10,5) = " ++ toString (choose 10 5)
#eval "C(7,3) mod 7 = " ++ toString (choose 7 3 % 7) ++ " (0: p divides C(p,k))"
#eval "C(6,3) mod 6 = " ++ toString (choose 6 3 % 6) ++ " (not 0, 6 not prime)"
#eval "C(8,4) = " ++ toString (choose 8 4) ++ " (not always prime-related)"
#eval "C(5,2) = 10, C(5,3) = 10 (symmetry holds)"
#eval "C(4,1)=4 but 4+1=5 not prime (composite)"
#eval "Falling 5 7 = " ++ toString (falling 5 7) ++ " (0 for k > n)"
#eval "Catalan: general sequence a_n=2^n not Catalan"
#eval "Stirling S(4,5)=0 (k > n impossible)"

end MiniEnumerativeCombinatorics