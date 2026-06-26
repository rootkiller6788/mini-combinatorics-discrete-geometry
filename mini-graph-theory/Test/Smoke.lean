import MiniGraphTheory

open MiniGraphTheory

-- Smoke tests: verify that basic definitions and constructions compile

#eval "=== MiniGraphTheory Smoke Tests ==="

-- Test 1: Graph construction
def testEmpty : SimpleGraph Nat := SimpleGraph.empty {0, 1, 2}
#eval s!"Empty graph vertices: {testEmpty.vertices.card}"
#eval s!"Empty graph edges: {testEmpty.edges.card}"

-- Test 2: Complete graphs
def K3 := completeGraph 3
#eval s!"K_3 vertices: {K3.vertices.card}"
#eval s!"K_3 edges (directed pairs): {K3.edges.card}"
#eval s!"K_3 undirected edges: {K3.edgeCount}"

-- Test 3: Path graphs
def P4 := pathGraph 4
#eval s!"P_4 vertices: {P4.vertices.card}"
#eval s!"P_4 undirected edges: {P4.edgeCount}"

-- Test 4: Cycle graphs
def C5 := cycleGraph 5
#eval s!"C_5 vertices: {C5.vertices.card}"
#eval s!"C_5 undirected edges: {C5.edgeCount}"

-- Test 5: Bipartite graphs
def K33 := completeBipartiteGraph 3 3
#eval s!"K_3,3 vertices: {K33.vertices.card}"
#eval s!"K_3,3 undirected edges: {K33.edgeCount}"

-- Test 6: Star graphs
def S4 := starGraph 4
#eval s!"S_4 vertices: {S4.vertices.card}"
#eval s!"S_4 undirected edges: {S4.edgeCount}"

-- Test 7: Degree computation
#eval s!"Degree of vertex 0 in K_3: {K3.degree 0}"
#eval s!"Degree of vertex 0 in S_4: {S4.degree 0}"

-- Test 8: Complement
def K3comp := K3.complement
#eval s!"Complement of K_3 edges: {K3comp.edges.card}"

-- Test 9: Graph invariants
#eval s!"K_3 max degree: {K3.maxDegree}"

-- Test 10: Structure creation
def testTree : Tree Nat := {
  graph := P4
  n_vertices := 4
  n_edges := 3
  h_vertex_count := by native_decide
  h_edge_count := by native_decide
  h_tree_property := by native_decide
}
#eval s!"Tree: V={testTree.n_vertices}, E={testTree.n_edges}"

#eval "=== All smoke tests passed ==="