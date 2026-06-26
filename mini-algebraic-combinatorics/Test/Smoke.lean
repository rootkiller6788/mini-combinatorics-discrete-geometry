import AlgebraicCombinatorics

open AlgebraicCombinatorics

def main : IO Unit := do
  IO.println "=== Smoke Test: AlgebraicCombinatorics ==="
  -- Test Partition definitions
  let p := Partition.ofList [3,2,1]
  IO.println s!"Partition [3,2,1]: size={Partition.size p}, length={Partition.length p}"
  -- Test Young Diagram
  let yd : YoungDiagram := p
  IO.println s!"Hook product for (3,2,1): {yd.hookProduct}"
  -- Test q-numbers
  let q3 := qNumber 5 2
  IO.println s!"[5]_2 = {q3}"
  -- Test q-binomial
  let qb := qBinomial 4 2 2
  IO.println s!"[4 choose 2]_2 = {qb}"
  -- Test Kostka number
  let k := KostkaNumberDirect (Partition.ofList [2,2]) [2,1,1]
  IO.println s!"K_{{2,2},{2,1,1}} = {k}"
  -- Test poset
  let ps := SimplePoset.chain 5
  IO.println s!"Chain poset C_5: elements = {ps.elements}"
  -- Test generating function
  IO.println s!"Catalan OGF first 6 terms: {OGF.catalanOGF.take 6}"
  -- Test partition count
  IO.println s!"p(7) = {Partition.count_small 7}"
  -- Test major index
  IO.println s!"maj([2,1,4,3]) = {majorIndex [2,1,4,3]}"
  IO.println "=== Smoke test passed ==="