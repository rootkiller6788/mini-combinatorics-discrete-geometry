/-
Princeton MAT 520 Combinatorics alignment.
Topics: set partitions, q-analogues, symmetric functions, species.
-/
import MiniEnumerativeCombinatorics
namespace MiniEnumerativeCombinatorics
open Nat

#eval "Princeton MAT 520: Combinatorics"
#eval "=== Set Partitions ==="
#eval "B(4) = " ++ toString (bellNumber 4)
#eval "B(6) = " ++ toString (bellNumber 6)
#eval "S(6,3) = " ++ toString (stirlingSecondKind 6 3)

#eval "=== Stirling Numbers ==="
#eval "S(5,k): " ++ toString ((List.range 6).map (stirlingSecondKind 5))
#eval "c(4,k): " ++ toString ((List.range 5).map (stirlingFirstUnsigned 4))

#eval "=== q-Analogues ==="
#eval "[3]_2! = " ++ toString (qFactorial 3 2)
#eval "[4]_2 = " ++ toString (qInteger 4 2)

#eval "=== Symmetric Functions ==="
#eval "Elementary, homogeneous, power sum, Schur bases"
#eval "Littlewood-Richardson coefficients"

#eval "=== Species ==="
#eval "Species: functors from FinSet_iso to FinSet"
#eval "Exponential formula: F = E o F^c"

end MiniEnumerativeCombinatorics