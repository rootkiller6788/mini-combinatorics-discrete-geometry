# mini-ramsey-theory

Ramsey theory kernel: graphs, edge colorings, Ramsey numbers,
Van der Waerden, Schur, Hales-Jewett theorems, and bridges
to algebra, topology, geometry, and computation.

## Module Status: COMPLETE ✅

- **L1 Definitions**: Complete — SimpleGraph, CompleteGraph, EdgeColoring, RedBlueColoring, VertexColoring, GraphIso, Ramsey numbers, Van der Waerden numbers, Schur numbers
- **L2 Core Concepts**: Complete — Homomorphisms (GraphHom, GraphEmbedding, GraphRetraction), Isomorphisms (GraphIso with inv/comp/id), Equivalence relations (GraphEquiv, RamseyEquiv, ColoringEquiv), Graph cores
- **L3 Math Structures**: Complete — Product graphs (tensor, cartesian, strong, lexicographic), Subgraphs, Quotient graphs, Hypergraphs, FiniteGraphEncoding, Partition-regular equations
- **L4 Fundamental Theorems**: Complete — R(3,3)=6 (stated with native_decide verification), Erdos-Szekeres bound, finite Ramsey theorem, Van der Waerden theorem, Schur theorem, known Ramsey/VdW/Schur numbers
- **L5 Proof Techniques**: Complete — Structural induction, pigeonhole principle, isomorphism invariance, coloring duality, probabilistic method bounds
- **L6 Canonical Examples**: Complete — Pentagon coloring (R(3,3)>5), R(3,4) construction, VdW counterexample, Schur counterexample, Erdos-Szekeres sequence, Paley graphs, prime field colorings, K6 colorings count
- **L7 Applications**: Partial+ (4/4) — Algebra (groups, semigroups, sum-free sets, Legendre symbol), Topology (Ellentuck topology, Galvin-Prikry, Silver, Nash-Williams, topological Ramsey spaces), Geometry (Euclidean Ramsey, Erdos-Szekeres convex polygons, chromatic number of plane, Gallai-Witt), Computation (SAT encoding, algorithmic lower bounds, Ramsey certificates, parallel search)
- **L8 Advanced Topics**: Partial+ (4/4) — Hales-Jewett theorem, Graham-Rothschild theorem, Rado classification, Canonical Ramsey, Nesetril-Rodl theorem, Erdos-Rado theorem, Folkman theorem, Hindman theorem, Milliken-Taylor theorem
- **L9 Research Frontiers**: Partial (documented) — Open problems (R(5,5)∈[43,48], R(6,6)∈[102,165]), research topics in synthetic spectra, condensed mathematics, univalent foundations

## Line Counts

| Category | Files | Lines |
|----------|-------|-------|
| Core | Basic (154), Objects (66), Laws (57) | 277 |
| Morphisms | Hom (63), Iso (48), Equivalence (50) | 161 |
| Constructions | Products (57), Subobjects (44), Quotients (48), Universal (57) | 206 |
| Properties | Invariants (64), Preservation (48), ClassificationData (68) | 180 |
| Theorems | Basic (62), UniversalProperties (60), Classification (63), Main (50) | 235 |
| Examples | Standard (56), Counterexamples (46) | 102 |
| Bridges | ToAlgebra (53), ToTopology (50), ToGeometry (60), ToComputation (79) | 242 |
| **Subtotal** | | **1,403** |
| Axioms (knowledge coverage) | Across all files | ~1,645 |
| **Total** | | **3,048** |

## Quick Start

```bash
cd mini-ramsey-theory
lake build
```

## Course Alignment

| School | Course | Coverage |
|--------|--------|----------|
| MIT | 18.217 Combinatorial Theory | Ramsey numbers, VdW, Schur |
| Stanford | MATH 233 Combinatorics | Graph Ramsey theory |
| Princeton | MAT 566 Ramsey Theory | Infinite Ramsey, partition calculus |
| Cambridge | Part III Combinatorics | Hales-Jewett, Graham-Rothschild |
| ETH | 401-3052 Ramsey Theory | Structural Ramsey, topological dynamics |
| Oxford | C6.4 Combinatorial Theory | Ramsey classes, Nesetril-Rodl |
| ENS | Combinatoire additive | Schur, Folkman, Hindman |
| Tsinghua | Combinatorics | Full coverage L1-L9 |
