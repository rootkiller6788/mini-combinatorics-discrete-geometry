import MiniRamseyTheory

open MiniRamseyTheory

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniRamseyTheory v0.1.0"
  IO.println "  Ramsey Theory Kernel"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  Graph: SimpleGraph, CompleteGraph, Hypergraph"
  IO.println s!"  Coloring: edge coloring, vertex coloring, subset coloring"
  IO.println s!"  Ramsey numbers: R(m,n), R_k(m,n), lower/upper bounds"
  IO.println s!"  Morphisms: RamseyHom, RamseyIso, Equivalence"
  IO.println s!"  Constructions: Products, Subgraphs, Quotients, Universal"
  IO.println s!"  Properties: Ramsey numbers, Preservation, Classification"
  IO.println s!"  Theorems: Finite Ramsey, Infinite Ramsey, Van der Waerden, Schur"
  IO.println s!"  Examples: R(3,3)=6, R(3,4)=9, R(4,4)=18, W(2,3)=9, S(2)=5"
  IO.println s!"  Bridges: Algebra, Topology, Geometry, Computation"
  IO.println ""
  IO.println "  Run `lake build` to compile."
