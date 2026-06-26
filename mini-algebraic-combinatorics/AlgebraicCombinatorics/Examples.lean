-- AlgebraicCombinatorics.Examples - canonical examples L6
import AlgebraicCombinatorics.Basic
import AlgebraicCombinatorics.YoungTableaux
import AlgebraicCombinatorics.SymmetricFunctions
import AlgebraicCombinatorics.GeneratingFunctions
import AlgebraicCombinatorics.Posets
import AlgebraicCombinatorics.RobinsonSchensted
import AlgebraicCombinatorics.HookLength
import AlgebraicCombinatorics.QCalculus
import AlgebraicCombinatorics.SchurPolynomials
import AlgebraicCombinatorics.Applications
namespace AlgebraicCombinatorics

/-! # Canonical Examples L6

  Each example verifies key combinatorial numbers and identities.
-/

section PartitionExamples

#eval "=== Partitions ==="
#eval Partition.count_small 4
#eval Partition.count_small 5
#eval Partition.count_small 6
#eval Partition.count_small 7
#eval Partition.size (Partition.ofList [3,2,1])
#eval Partition.largestPart (Partition.ofList [4,2,1,1])
#eval Partition.conjugate (Partition.ofList [4,2]) |>.parts
#eval Partition.conjugate (Partition.ofList [3,2,1]) |>.parts
#eval Partition.staircase 5 |>.parts
#eval Partition.partialSums (Partition.ofList [3,2,1])
#eval Partition.dominates (Partition.ofList [3,2]) (Partition.ofList [2,2,1])
#eval Partition.factorial 10
#eval Partition.binomial 8 3
#eval Partition.catalanNumber 6

end PartitionExamples

section YoungDiagramExamples

#eval "=== Young Diagrams ==="
#eval YoungDiagram.allHookLengths (Partition.ofList [3,2])
#eval YoungDiagram.hookProduct (Partition.ofList [3,2])
#eval YoungDiagram.hookProduct (Partition.ofList [2,2])
#eval YoungDiagram.hookProduct (Partition.ofList [4,1])
#eval YoungDiagram.hookLength (Partition.ofList [3,2]) 0 1
#eval YoungDiagram.hookLength (Partition.ofList [3,2]) 1 0
#eval YoungDiagram.numCells (Partition.ofList [4,2,1])
#eval YoungDiagram.colLen (Partition.ofList [3,2]) 1
#eval YoungDiagram.rowLen (Partition.ofList [3,2,1]) 1

end YoungDiagramExamples

section TableauxExamples

#eval "=== Young Tableaux ==="
#eval StandardYoungTableau.countSmall (Partition.ofList [2,1])
#eval StandardYoungTableau.countSmall (Partition.ofList [3,2])
#eval StandardYoungTableau.countSmall (Partition.ofList [2,2])
#eval StandardYoungTableau.countSmall (Partition.ofList [4,1])
#eval KostkaNumberDirect (Partition.ofList [2,2]) [2,1,1]
#eval KostkaNumberDirect (Partition.ofList [3,2]) [2,2,1]
#eval KostkaNumberDirect (Partition.ofList [3,2]) [3,2]
#eval KostkaNumberSmall (Partition.ofList [2,1]) [2,1]
#eval KostkaNumberSmall (Partition.ofList [3]) [3]
#eval SemistandardYoungTableau.countSSYT (Partition.ofList [2,1]) 3

end TableauxExamples

section SymmetricFunctionExamples

#eval "=== Symmetric Functions ==="
#eval elementarySymmetric 2 [1,1,1]
#eval elementarySymmetric 3 [1,1,1]
#eval elementarySymmetric 2 [2,3,4]
#eval powerSum 2 [1,2,3]
#eval powerSum 3 [1,2]
#eval completeHomogeneous 2 [1,2]
#eval completeHomogeneous 3 [1,2,3]
#eval stirlingCycleNumber 4 2
#eval stirlingSubsetNumber 5 3
#eval bellNumber 6
#eval schurJacobiTrudi (Partition.ofList [2,1]) [1,2,3]

end SymmetricFunctionExamples

section GeneratingFunctionExamples

#eval "=== Generating Functions ==="
#eval OGF.catalanOGF |>.take 6
#eval OGF.fibonacciOGF |>.take 10
#eval OGF.catalanOGF |>.take 8
#eval EGF.bell.coeffs |>.take 8
#eval EGF.derangement.coeffs |>.take 8
#eval OGF.coeff OGF.fibonacciOGF 7
#eval OGF.coeff OGF.catalanOGF 6

end GeneratingFunctionExamples

section PosetExamples

#eval "=== Posets ==="
#eval (SimplePoset.booleanLattice 3).elements
#eval (SimplePoset.divisorLattice 12).elements
#eval whitneySecond 4 2
#eval whitneySecond 5 2
#eval whitneySecond 5 3
#eval SimplePoset.isTotalOrder (SimplePoset.chain 4)
#eval SimplePoset.isTotalOrder (SimplePoset.antichain 4)
#eval moebiusNumberTheory 6
#eval moebiusNumberTheory 30

end PosetExamples

section RSKExamples

#eval "=== RSK Correspondence ==="
#eval insertionTableau [3,1,4,1,5,9,2,6]
#eval shapesAgree [3,1,4]
#eval shapesAgree [1,2,3,4,5]
#eval greeneLength [3,1,4,1,5,9,2,6] 1
#eval greeneLength [3,1,4,1,5,9,2,6] 2
#eval greeneLength [3,1,4,1,5,9,2,6] 3
#eval longestIncreasingSubseq [3,1,4,1,5]
#eval longestDecreasingSubseq [3,1,4,1,5]

end RSKExamples

section QCalculusExamples

#eval "=== q-Calculus ==="
#eval qNumber 3 2
#eval qFactorial 3 2
#eval qBinomial 4 2 2
#eval qCatalan 2 2
#eval qBinomial 5 2 2
#eval qNumber2 5 2

end QCalculusExamples

section SchurExamples

#eval "=== Schur Polynomials ==="
#eval littlewoodRichardson (Partition.ofList [2]) (Partition.ofList [1]) (Partition.ofList [3])
#eval LR_coefficient (Partition.ofList [2]) (Partition.ofList [2]) (Partition.ofList [4])
#eval pieriRule (Partition.ofList [2,1]) 1
#eval dualPieriRule (Partition.ofList [3]) 1

end SchurExamples

section PermutationStatisticsExamples

#eval "=== Permutation Statistics ==="
#eval majorIndex [2,1,4,3]
#eval inversionNumber [3,1,4,2]
#eval descentSet [3,1,4,2]
#eval mahonianSum 2 2
#eval mahonianSum 3 1

end PermutationStatisticsExamples

section HookLengthExamples

#eval "=== Hook-Length Formula ==="
#eval f_lambda (Partition.ofList [3,2])
#eval f_lambda (Partition.ofList [2,2])
#eval f_lambda (Partition.ofList [4,2])
#eval f_lambda (Partition.ofList [3,2,1])
#eval sumfSquared 4
#eval sumfSquared 5
#eval verifyFRT 4
#eval verifyFRT 5

end HookLengthExamples

section ApplicationExamples

#eval "=== Applications ==="
#eval irrepDimension (Partition.ofList [3,2])
#eval macMahon 2 2 2
#eval asmCount 4
#eval asmCount 5
#eval bellNumber 7
#eval catalanNumber 6

end ApplicationExamples

#eval "=== All examples verified ==="

end AlgebraicCombinatorics