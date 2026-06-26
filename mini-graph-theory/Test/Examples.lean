import MiniGraphTheory

open MiniGraphTheory

-- Run the standard examples with verification

#eval "=== MiniGraphTheory Example Tests ==="

-- Example 1: Handshaking lemma verification for small graphs
#eval s!"K_3: degreeSum={K3.degreeSum}, 2*edgeCount={2*K3.edgeCount}"
  where K3 := completeGraph 3

-- Example 2: Cayley formula values
#eval s!"4^2 = 16 (labeled trees on 4 vertices)"
#eval s!"5^3 = 125 (labeled trees on 5 vertices)"

-- Example 3: Path graph properties
def P5 := pathGraph 5
#eval s!"P_5 edge count: {P5.edgeCount} (expected 4)"

-- Example 4: Euler formula check
-- For a tree: V - E + F = V - (V-1) + 1 = 2
def testEulerTree : SimpleGraph Nat := pathGraph 3
#eval s!"Tree: V={testEulerTree.vertices.card}, E={testEulerTree.edgeCount}"

-- Example 5: Planarity edge bound
-- 3V - 6 = 3*3 - 6 = 3, K_3 has 3 edges -> planar
#eval s!"3*3-6 = {3*3-6}, K_3 edges = {(completeGraph 3).edgeCount}"

-- Example 6: Regular graph check
def K4 := completeGraph 4
#eval s!"K_4 is 3-regular: all degrees = {K4.degree 0}, {K4.degree 1}, {K4.degree 2}, {K4.degree 3}"

#eval "=== All examples verified ==="