/-
MiniGraphTheory -- Graph Theory Package
Aggregates all submodules.

Knowledge Coverage (L1-L9):
L1: SimpleGraph, DirectedGraph, WeightedGraph, BipartiteGraph (Core/Basic)
L2: Path, Cycle, Tree, Forest, Planar, Eulerian, Hamiltonian (Core/Objects)
L3: Graph homomorphism, isomorphism, invariants, minors (Morphisms/*, Constructions/*)
L4: Handshaking, Euler formula, Cayley formula, Menger, Kuratowski (Theorems/*)
L5: Induction, double counting, extremal arguments, constructive proofs
L6: K_n, K_{m,n}, P_n, C_n, Petersen, Platonic graphs (Examples/*)
L7: Network flows, graph algorithms, spectral clustering, map coloring (Bridges/*)
L8: Spectral graph theory, random graphs, graph minors (Advanced/*)
L9: Graph limits, expander graphs, reconstruction conjecture (documented)
-/

import MiniGraphTheory.Core.Basic
import MiniGraphTheory.Core.Objects
import MiniGraphTheory.Core.Laws
import MiniGraphTheory.Morphisms.Hom
import MiniGraphTheory.Morphisms.Iso
import MiniGraphTheory.Morphisms.Equivalence
import MiniGraphTheory.Constructions.Products
import MiniGraphTheory.Constructions.Subgraphs
import MiniGraphTheory.Constructions.Quotients
import MiniGraphTheory.Constructions.Universal
import MiniGraphTheory.Properties.Invariants
import MiniGraphTheory.Properties.Preservation
import MiniGraphTheory.Properties.Classification
import MiniGraphTheory.Theorems.Basic
import MiniGraphTheory.Theorems.Connectivity
import MiniGraphTheory.Theorems.Trees
import MiniGraphTheory.Theorems.Planarity
import MiniGraphTheory.Examples.Standard
import MiniGraphTheory.Examples.Counterexamples
import MiniGraphTheory.Bridges.ToAlgebra
import MiniGraphTheory.Bridges.ToComputation
import MiniGraphTheory.Bridges.ToTopology
import MiniGraphTheory.Bridges.ToCombinatorics
import MiniGraphTheory.Advanced.SpectralGraph
import MiniGraphTheory.Advanced.RandomGraphs
import MiniGraphTheory.Advanced.GraphMinors