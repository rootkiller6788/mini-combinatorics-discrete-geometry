# Mini Combinatorics & Discrete Geometry

A collection of **from-scratch, zero-dependency Lean 4 implementations** of university-level combinatorics and discrete geometry, including enumerative, extremal, algebraic, additive, and Ramsey theory, graph theory, convex polytopes, and discrete geometry. Each sub-module maps to MIT (and other top-tier university) courses, building combinatorial structures from first principles using the Lean 4 proof assistant.

## Sub-Modules

| Sub-Module | Topics | Key Courses |
|------------|--------|-------------|
| [mini-enumerative-combinatorics](mini-enumerative-combinatorics/) | Counting, binomial coefficients, generating functions, partitions, Stirling numbers, Catalan numbers, special sequences | MIT 18.226, Stanford Math 155 |
| [mini-extremal-combinatorics](mini-extremal-combinatorics/) | Sperner theorem, Erdős–Ko–Rado, Turán theorem, Kruskal-Katona, Hall marriage, Dilworth, LYM inequality | MIT 18.217, Stanford Math 156 |
| [mini-graph-theory](mini-graph-theory/) | Simple/directed/weighted graphs, trees, planarity, coloring, matchings, flows, spectral graph theory, graph minors | MIT 18.315, Stanford Math 108 |
| [mini-ramsey-theory](mini-ramsey-theory/) | Ramsey numbers, Van der Waerden, Schur, Hales-Jewett theorems, partition-regular equations, hypergraph Ramsey | MIT 18.217, Cambridge Part III |
| [mini-algebraic-combinatorics](mini-algebraic-combinatorics/) | Partitions, Young tableaux, RSK correspondence, symmetric functions, generating functions, posets, Möbius inversion | MIT 18.212, Cambridge Part II |
| [mini-additive-combinatorics](mini-additive-combinatorics/) | Sum sets, additive energy, doubling ratios, arithmetic progressions, Freiman theorems, sum-product phenomena | MIT 18.218, Princeton MAT 527 |
| [mini-convex-polytopes](mini-convex-polytopes/) | Vertices, faces, facets, f-vectors, h-vectors, Euler relation, Gale diagrams, shellability, Dehn-Sommerville, g-theorem | MIT 18.319, Stanford Math 256B |
| [mini-discrete-geometry](mini-discrete-geometry/) | Polytope theory, convexity, lattice geometry, Minkowski sums, incidence geometry, combinatorial structures, computational geometry | MIT 18.319, Princeton MAT 559 |

## Design Philosophy

- **Zero external dependencies** — pure Lean 4, only kernel imports and standard mathlib4; each sub-module uses its own `lakefile.lean`
- **Self-contained sub-modules** — each has its own directory with Core/, docs/, examples/, and Test/ folders; buildable independently
- **Theory-to-code mapping** — every module includes inline `#eval` examples, theorem statements, and benchmark verification
- **Comprehensive coverage** — each sub-module spans L1 Definitions through L9 Research Frontiers, with 3000+ lines of formalized Lean code

## Building

Each sub-module is standalone. Build with Lake:

```bash
cd mini-graph-theory
lake build
lake env lean --run Test/Smoke.lean
```

Requires **Lean 4** and **Lake**.

## Project Structure

```
17. mini-combinatorics-discrete-geometry/
├── mini-enumerative-combinatorics/    # Counting, binomial coefficients, generating functions, partitions, special sequences
├── mini-extremal-combinatorics/       # Sperner, Erdős–Ko–Rado, Turán, Kruskal-Katona, Hall, Dilworth theorems
├── mini-graph-theory/                 # Graphs, trees, planarity, coloring, matchings, flows, spectral graph theory
├── mini-ramsey-theory/                # Ramsey numbers, Van der Waerden, Schur, Hales-Jewett theorems
├── mini-algebraic-combinatorics/      # Partitions, Young tableaux, symmetric functions, generating functions, posets
├── mini-additive-combinatorics/       # Sum sets, additive energy, doubling ratios, arithmetic progressions
├── mini-convex-polytopes/             # Polytopes, f/h-vectors, Euler relation, Gale diagrams, shellability
├── mini-discrete-geometry/            # Polytope theory, convexity, lattice geometry, Minkowski sums, incidence geometry
├── .gitignore
├── README.md
└── README-CN.md
```

## License

MIT
