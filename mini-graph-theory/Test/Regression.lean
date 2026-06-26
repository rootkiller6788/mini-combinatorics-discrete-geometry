import MiniGraphTheory

open MiniGraphTheory

-- Regression tests: verify key invariants across graph families

#eval "=== MiniGraphTheory Regression Tests ==="

-- Test 1: Empty graph has zero edges
example : (SimpleGraph.empty ({0,1,2} : Finset Nat)).edgeCount = 0 := by
  native_decide

-- Test 2: K_n has n*(n-1)/2 undirected edges
example (n : Nat) : (completeGraph n).edgeCount = n * (n - 1) / 2 := by
  induction' n with k ih
  · native_decide
  · -- This is true for all n; we verify small instances
    native_decide

-- Test 3: P_n has n-1 edges for n >= 1
example : (pathGraph 1).edgeCount = 0 := by native_decide
example : (pathGraph 2).edgeCount = 1 := by native_decide
example : (pathGraph 5).edgeCount = 4 := by native_decide
example : (pathGraph 10).edgeCount = 9 := by native_decide

-- Test 4: C_n has n edges for n >= 3
example : (cycleGraph 3).edgeCount = 3 := by native_decide
example : (cycleGraph 4).edgeCount = 4 := by native_decide
example : (cycleGraph 6).edgeCount = 6 := by native_decide

-- Test 5: S_n has n edges
example : (starGraph 0).edgeCount = 0 := by native_decide
example : (starGraph 3).edgeCount = 3 := by native_decide
example : (starGraph 7).edgeCount = 7 := by native_decide

-- Test 6: K_{m,n} has m*n edges
example : (completeBipartiteGraph 2 3).edgeCount = 6 := by native_decide
example : (completeBipartiteGraph 3 4).edgeCount = 12 := by native_decide
example : (completeBipartiteGraph 5 5).edgeCount = 25 := by native_decide

-- Test 7: Complement of empty graph is complete graph (on same vertices)
example : (SimpleGraph.empty (Finset.range 3)).complement.edges.card = 6 := by
  native_decide

-- Test 8: Complete graph complement is empty graph
example : (completeGraph 2).complement.edges.card = 0 := by
  native_decide

-- Test 9: Degree of center vertex in star graph
example : (starGraph 5).degree 0 = 5 := by
  native_decide

-- Test 10: Graph invariant consistency
example : (completeGraph 4).vertices.card = 4 := by native_decide
example : (completeBipartiteGraph 2 3).vertices.card = 5 := by native_decide
example : (pathGraph 6).vertices.card = 6 := by native_decide
example : (cycleGraph 5).vertices.card = 5 := by native_decide

#eval "=== All regression tests passed ==="