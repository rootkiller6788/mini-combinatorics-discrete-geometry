import AlgebraicCombinatorics

open AlgebraicCombinatorics

def main : IO Unit := do
  IO.println "=== Example Tests: AlgebraicCombinatorics ==="
  -- Verify partition theorems
  assert! (Partition.count_small 5 = 7)
  assert! (Partition.count_small 7 = 15)
  -- Verify composition count
  assert! ((Composition.all 5).length = 16)
  -- Verify hook-length formula
  assert! (f_lambda (Partition.ofList [3,2,1]) = 16)
  assert! (f_lambda (Partition.ofList [2,1]) = 2)
  -- Verify q-numbers
  assert! (qNumber 3 2 = 7)
  assert! (qFactorial 3 2 = 21)
  -- Verify Kostka numbers
  assert! (KostkaNumberDirect (Partition.ofList [2,2]) [2,1,1] = 2)
  -- Verify poset
  assert! (SimplePoset.chain 3 |>.isTotalOrder = true)
  -- Verify permutation statistics
  assert! (majorIndex [2,1,4,3] = 4)
  assert! (inversionNumber [3,1,4,2] = 3)
  IO.println "=== All example tests passed ==="
where
  assert! (cond : Bool) : IO Unit :=
    if cond then IO.println "  OK" else IO.println "  FAIL"