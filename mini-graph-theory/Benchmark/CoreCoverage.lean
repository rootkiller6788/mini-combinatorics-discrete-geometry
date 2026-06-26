import MiniGraphTheory

-- Benchmark: Verify core coverage of all major graph families

#eval "=== Core Coverage Benchmark ==="

-- Small graph enumeration
def testAllSmallGraphs : IO Unit := do
  for n in [1,2,3,4,5] do
    let Kn := completeGraph n
    IO.println s!"K_{n}: V={Kn.vertices.card}, E={Kn.edgeCount}"
  for n in [1,2,3,4,5] do
    let Pn := pathGraph n
    IO.println s!"P_{n}: V={Pn.vertices.card}, E={Pn.edgeCount}"
  for n in [3,4,5,6] do
    let Cn := cycleGraph n
    IO.println s!"C_{n}: V={Cn.vertices.card}, E={Cn.edgeCount}"

#eval "Core coverage benchmark loaded"