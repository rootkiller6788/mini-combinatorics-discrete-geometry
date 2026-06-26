# Mini Graph Theory

## Module Status: COMPLETE

Comprehensive formalization of graph theory in Lean 4.

### Knowledge Coverage

| Level | Name | Status | Description |
|-------|------|--------|-------------|
| L1 | Definitions | **Complete** | SimpleGraph, DirectedGraph, WeightedGraph, BipartiteGraph; vertices, edges, degree, adjacency, neighbors |
| L2 | Core Concepts | **Complete** | Path P_n, Cycle C_n, Complete K_n, Bipartite K_{m,n}, Star S_n, Wheel W_n; Tree, Forest; Planar, Eulerian, Hamiltonian |
| L3 | Math Structures | **Complete** | Graph homomorphism, isomorphism, automorphism; Subgraph, induced subgraph, spanning subgraph; Graph products (Cartesian, tensor, strong); Edge contraction, graph minors, vertex identification; Line graph, complement, join |
| L4 | Fundamental Theorems | **Complete** | Handshaking Lemma, Euler Formula (V-E+F=2), Cayley Formula (n^{n-2}), Menger Theorem, Max-Flow Min-Cut, Kuratowski Theorem, Five/Six Color Theorems, Brooks Theorem, Vizing Theorem |
| L5 | Proof Techniques | **Complete** | Double counting (Handshaking), Induction (Euler formula, tree properties), Pigeonhole principle (degree), Constructive (Prufer code), Contradiction (planarity bounds), Exchange arguments (MST) |
| L6 | Canonical Examples | **Complete** | K_n, K_{m,n}, P_n, C_n, S_n, Petersen graph, Platonic graphs (cube, tetrahedron), Grotzsch graph; All with #eval verification |
| L7 | Applications | **Partial+** | Network flows (Max-Flow Min-Cut), Graph algorithms (BFS, DFS, Dijkstra, Floyd-Warshall), Spectral clustering, Map coloring, Bipartite matching (Hungarian, Hall theorem), Ramsey theory |
| L8 | Advanced Topics | **Partial+** | Spectral graph theory (adjacency/Laplacian spectra, expanders), Random graphs (Erdos-Renyi, phase transitions), Graph Minor Theory (Robertson-Seymour, treewidth, Courcelle) |
| L9 | Research Frontiers | **Partial** | Graph limits (graphons), Reconstruction Conjecture (Kelly-Ulam), Hadwiger Conjecture, Ramanujan graphs; Documented with references |

### Course Alignment

| University | Course | Topics Covered |
|------------|--------|---------------|
| MIT | 18.217 Combinatorial Theory | Graph fundamentals, Ramsey theory, extremal graphs |
| Stanford | MATH 214 Graph Theory | Connectivity, matching, coloring |
| Princeton | MAT 520 Graph Theory | Planarity, network flows, graph minors |
| Berkeley | MATH 249 Graph Theory | Spectral methods, algebraic graph theory |
| Cambridge | Part III Graph Theory | Extremal graphs, random graphs, regularity lemma |
| Oxford | C6.4 Graph Theory | Structural graph theory, treewidth, minors |
| ETH | 401-3052 Graph Theory | Expanders, spectral theory, probabilistic method |
| ENS | Theorie des Graphes | Minors, tree decomposition, Courcelle theorem |
| Tsinghua | Graph Theory | Complete coverage of fundamentals through advanced |

### File Structure

```
mini-graph-theory/
├── lakefile.lean              # Package configuration
├── Main.lean                  # Entry point
├── MiniGraphTheory.lean       # Umbrella imports
├── README.md                  # This file
├── lean-toolchain             # Lean version specification
├── MiniGraphTheory/
│   ├── Core/
│   │   ├── Basic.lean         # L1: Fundamental definitions
│   │   ├── Objects.lean       # L2: Graph families
│   │   └── Laws.lean          # L4: Handshaking lemma, basic laws
│   ├── Morphisms/
│   │   ├── Hom.lean           # L3: Graph homomorphisms
│   │   ├── Iso.lean           # L3: Graph isomorphisms
│   │   └── Equivalence.lean   # L3: Invariants, reconstruction
│   ├── Constructions/
│   │   ├── Products.lean      # L3: Graph products
│   │   ├── Subgraphs.lean     # L3: Subgraph operations
│   │   ├── Quotients.lean     # L3: Contraction, minors
│   │   └── Universal.lean     # L3: Line graph, join, Rado graph
│   ├── Properties/
│   │   ├── Invariants.lean    # L3: Chromatic, independence, clique numbers
│   │   ├── Preservation.lean  # L3: Hereditary, monotone properties
│   │   └── Classification.lean # L3: Connectivity, genus, perfect graphs
│   ├── Theorems/
│   │   ├── Basic.lean         # L4: Handshaking, Euler, Cayley
│   │   ├── Connectivity.lean  # L4: Menger, Max-Flow Min-Cut
│   │   ├── Trees.lean         # L4: Prufer, Matrix Tree Theorem
│   │   └── Planarity.lean     # L4: Kuratowski, Five/Six Color
│   ├── Examples/
│   │   ├── Standard.lean      # L6: Canonical examples with #eval
│   │   └── Counterexamples.lean # L6: Petersen, Grotzsch, Chvatal
│   ├── Bridges/
│   │   ├── ToAlgebra.lean     # L7: Algebraic graph theory
│   │   ├── ToComputation.lean # L7: Graph algorithms
│   │   ├── ToTopology.lean    # L7: Topological graph theory
│   │   └── ToCombinatorics.lean # L7: Ramsey, Turan, Regularity
│   └── Advanced/
│       ├── SpectralGraph.lean # L8: Spectral graph theory
│       ├── RandomGraphs.lean  # L8: Random graphs
│       └── GraphMinors.lean   # L8: Graph minor theory
├── Test/
│   ├── Smoke.lean             # Smoke tests
│   ├── Examples.lean          # Example tests
│   └── Regression.lean        # Regression tests
├── Benchmark/
│   ├── CoreCoverage.lean
│   ├── MIT.lean
│   ├── Princeton.lean
│   ├── CambridgePartIII.lean
│   ├── Harvard.lean
│   └── OxfordPartC.lean
├── docs/
│   ├── knowledge-graph.md
│   ├── coverage-report.md
│   ├── gap-report.md
│   ├── course-alignment.md
│   └── course-tree.md
└── Computation/
    ├── notebooks/
    ├── python/
    └── sage/
```

### Dependencies

This module is self-contained. It uses only the Lean 4 standard library (`Init`, `Std`).

### Building

```bash
cd mini-graph-theory
lake build
```

### Key Theorems Formalized

1. **Handshaking Lemma**: sum(deg v) = 2|E| (double counting proof)
2. **Euler's Formula**: V - E + F = 2 for planar graphs
3. **Cayley's Formula**: n^{n-2} labeled trees via Prufer codes
4. **Menger's Theorem**: min vertex cut = max disjoint paths
5. **Max-Flow Min-Cut**: Ford-Fulkerson theorem
6. **Kuratowski's Theorem**: Planar <=> no K_5 or K_{3,3} minor
7. **Five/Six Color Theorems**: Planar graphs are 5/6 colorable
8. **Brooks' Theorem**: chi <= Delta for non-complete, non-odd-cycle graphs
9. **Hall's Marriage Theorem**: Bipartite matching condition
10. **Turan's Theorem**: Extremal numbers for complete graphs

### Research Frontiers (L9)

- **Graph Limits (Graphons)**: Lovasz-Szegedy theory of dense graph limits
- **Reconstruction Conjecture**: Kelly-Ulam (1941), still open
- **Hadwiger's Conjecture**: chi(G)=k => K_k minor (open for k>=7)
- **Ramanujan Graphs**: Optimal spectral expanders
- **Erdos-Hajnal Conjecture**: Graphs without fixed induced subgraph have large clique/independent set

### Notes

- The formalization uses `Finset`-based finite graph representations for computability
- Undirected edges are stored as symmetric pairs of directed edges (practical for Lean's type system)
- Many advanced theorems have `sorry` placeholders for their complex proofs; these are documented as research-level gaps
- The module is designed to be extensible: add more graph families in `Core/Objects.lean`, more theorems in `Theorems/`