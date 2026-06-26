import MiniGraphTheory

open MiniGraphTheory

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniGraphTheory v0.1.0"
  IO.println "  Graph Theory: Simple Graphs, Trees, Connectivity, Planarity"
  IO.println "═══════════════════════════════════════"
  IO.println "  Core: SimpleGraph, DirectedGraph, Walk, Path, Cycle, Tree, Forest"
  IO.println "  Theorems: Handshaking Lemma, Euler Formula, Cayley Formula"
  IO.println "  Invariants: chromatic number, girth, diameter, independence number"
  IO.println "  Constructions: subgraph, complement, line graph, graph product"
  IO.println "  Applications: network flows, graph coloring, map coloring"
  IO.println ""
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
