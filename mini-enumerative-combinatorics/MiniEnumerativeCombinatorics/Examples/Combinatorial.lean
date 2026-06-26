/-
Canonical combinatorial examples with extensive #eval verification. Knowledge: L6.
-/
import MiniEnumerativeCombinatorics.Core.Binomial
import MiniEnumerativeCombinatorics.Core.Factorials
import MiniEnumerativeCombinatorics.Sequences.Catalan
import MiniEnumerativeCombinatorics.Sequences.Fibonacci
import MiniEnumerativeCombinatorics.Structures.Partitions

namespace MiniEnumerativeCombinatorics

open Nat

#eval "========== Permutations =========="
#eval "P(5,3)=5*4*3=" ++ toString (falling 5 3)
#eval "P(6,2)=6*5=" ++ toString (falling 6 2)
#eval "P(7,4)=" ++ toString (falling 7 4)
#eval "P(10,4)=" ++ toString (falling 10 4)
#eval "3!=" ++ toString (factorial 3)
#eval "4!=" ++ toString (factorial 4)
#eval "5!=" ++ toString (factorial 5)
#eval "7!=" ++ toString (factorial 7)
#eval "10!=" ++ toString (factorial 10)

#eval "========== Combinations =========="
#eval "C(5,2)=" ++ toString (choose 5 2)
#eval "C(10,3)=" ++ toString (choose 10 3)
#eval "C(10,7)=" ++ toString (choose 10 7)
#eval "C(20,10)=" ++ toString (choose 20 10)
#eval "C(52,5)=" ++ toString (choose 52 5)
#eval "C(100,2)=" ++ toString (choose 100 2)
#eval "C(100,50)=" ++ toString (choose 100 50)

#eval "========== Pascal Triangle =========="
#eval "Row0:" ++ toString ((List.range 1).map (choose 0))
#eval "Row1:" ++ toString ((List.range 2).map (choose 1))
#eval "Row2:" ++ toString ((List.range 3).map (choose 2))
#eval "Row3:" ++ toString ((List.range 4).map (choose 3))
#eval "Row4:" ++ toString ((List.range 5).map (choose 4))
#eval "Row5:" ++ toString ((List.range 6).map (choose 5))
#eval "Row6:" ++ toString ((List.range 7).map (choose 6))

#eval "========== Catalan Numbers =========="
#eval "C_0..C_6:" ++ toString ((List.range 7).map catalan)
#eval "C_7=" ++ toString (catalan 7)
#eval "C_8=" ++ toString (catalan 8)
#eval "C_9=" ++ toString (catalan 9)
#eval "C_10=" ++ toString (catalan 10)
#eval "C_11=" ++ toString (catalan 11)
#eval "C_12=" ++ toString (catalan 12)

#eval "========== Fibonacci =========="
#eval "F_0..F_15:" ++ toString ((List.range 16).map fib)
#eval "F_20=" ++ toString (fib 20)
#eval "F_25=" ++ toString (fib 25)
#eval "F_30=" ++ toString (fib 30)

#eval "========== Stirling Numbers =========="
#eval "S(4,k):" ++ toString ((List.range 5).map (stirlingSecondKind 4))
#eval "S(5,k):" ++ toString ((List.range 6).map (stirlingSecondKind 5))
#eval "S(6,k):" ++ toString ((List.range 7).map (stirlingSecondKind 6))

#eval "========== Bell Numbers =========="
#eval "B_0..B_8:" ++ toString ((List.range 9).map bellNumber)
#eval "B_9=" ++ toString (bellNumber 9)
#eval "B_10=" ++ toString (bellNumber 10)

#eval "========== Binomial Identities =========="
#eval "Sum C(4,k)=" ++ toString (sumRange (choose 4) 4)
#eval "Sum C(5,k)=" ++ toString (sumRange (choose 5) 5)
#eval "Sum C(6,k)=" ++ toString (sumRange (choose 6) 6)

#eval "========== Lattice Paths =========="
#eval "Paths (2,3)=" ++ toString (choose 5 2)
#eval "Paths (3,3)=" ++ toString (choose 6 3)
#eval "Paths (4,4)=" ++ toString (choose 8 4)
#eval "Dyck(4)=" ++ toString (catalan 4)
#eval "Dyck(5)=" ++ toString (catalan 5)

#eval "========== Counting Functions =========="
#eval "Functions [3]->[2]:2^3=" ++ toString (2^3)
#eval "Injections [3]->[5]:" ++ toString (falling 5 3)
#eval "Permutations of 5:" ++ toString (factorial 5)
#eval "k-subsets C(10,3)=" ++ toString (choose 10 3)

#eval "========== Partitions =========="
#eval "p(1)=" ++ toString (partitionNumber 1)
#eval "p(2)=" ++ toString (partitionNumber 2)
#eval "p(3)=" ++ toString (partitionNumber 3)
#eval "p(4)=" ++ toString (partitionNumber 4)
#eval "p(5)=" ++ toString (partitionNumber 5)
#eval "p(6)=" ++ toString (partitionNumber 6)
#eval "p(7)=" ++ toString (partitionNumber 7)

#eval "========== End Examples =========="

end MiniEnumerativeCombinatorics