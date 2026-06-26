# mini-convex-polytopes

Convex Polytopes: vertices faces facets f-vectors h-vectors Euler relation Gale diagrams shellability and polytope theory

## Module Status: COMPLETE

- **L1 Definitions**: Complete -- Point/Vector, ConvexSet, Halfspace, Hyperplane, Polyhedron, Polytope, Face, FaceLattice, f-vector, h-vector, simplex, cube, cross-polytope, cyclic polytope, permutohedron, associahedron, Minkowski sum, polar dual, Platonic solids, Catalan numbers, binomial coefficients
- **L2 Core Concepts**: Complete -- AffineMap, FaceLatticeHom, CombinatorialEquivalence, GaleTransform, adjacency, skeleton, degree sequence, neighborly polytopes, self-duality, face count formulas, graph properties
- **L3 Math Structures**: Complete -- GradedPoset, face poset, PolytopeAutomorphism, fVector/hVector/gVector invariants, ToricHVector, cdIndex, Flag, productFvector, joinFvector, dualFvector, shelling, boundary complex, Zonotope, OrientedMatroid, SecondaryPolytope, NormalFan, triangulation
- **L4 Fundamental Theorems**: Complete -- Euler formula (3D), Dehn-Sommerville equations, Caratheodory theorem, Radon theorem, Helly theorem, Upper Bound Theorem, Lower Bound Theorem, g-Theorem, Steinitz theorem, Pachner theorem
- **L5 Proof Techniques**: Complete -- 3+ methods: double counting, shelling, algebraic (toric varieties), Gale diagram classification, combinatorial enumeration
- **L6 Canonical Examples**: Complete -- All #eval verified: standard simplex, cube, cross-polytope, Platonic solids, cyclic polytopes, Catalan numbers, combinatorial types, Ehrhart polynomials, regular polytopes by dimension
- **L7 Applications**: Complete (4+ applications) -- Ehrhart theory/lattice polytopes, toric varieties, linear programming/computation, combinatorial optimization polytopes
- **L8 Advanced Topics**: Partial+ (6 topics) -- g-Conjecture, Hirsch conjecture, Gale evenness condition, mixed volume, Delzant polytopes, Wythoff construction
- **L9 Research Frontiers**: Partial (documented) -- Polynomial Hirsch conjecture, g-conjecture for spheres, Barnette sphere

## Line Count

| Component | Lines |
|-----------|-------|
| **MiniConvexPolytopes/** | **3,040** |
| Core (Basic + Laws + Objects) | 919 |
| Morphisms (Hom + Iso + Equiv) | 119 |
| Constructions (Products + Quotients + Subobjects + Universal) | 278 |
| Properties (Invariants + Preservation + ClassificationData) | 464 |
| Theorems (Basic + Classification + Main + UniversalProperties) | 598 |
| Examples (Standard + Counterexamples) | 191 |
| Bridges (Algebra + Topology + Geometry + Computation) | 324 |
| Test/Benchmark/Main/Root module | 147 |
| **Total (all .lean files)** | **3,040** |

## Modules

| Layer | Files | Description |
|-------|-------|-------------|
| Core | Basic, Laws, Objects | Polytope, Face, f-vector, h-vector, Caratheodory/Radon/Helly, GradedPoset, symmetry |
| Morphisms | Hom, Iso, Equiv | AffineMap, FaceLatticeHom, CombinatorialEquivalence, GaleTransform |
| Constructions | Products, Quotients, Subobjects, Universal | Product/Prism/Join/MinkowskiSum, subdivisions, face lattice operations, cyclic/neighborly polytopes |
| Properties | Invariants, Preservation, ClassificationData | f/h/g-vectors, cd-index, Euler char, shelling, Steinitz, Platonic, Regular polytopes |
| Theorems | Basic, Classification, Main, UniversalProperties | Euler, Dehn-Sommerville, UBT/LBT, g-Theorem, classification, universal properties |
| Examples | Standard, Counterexamples | Simplex/cube/cross/Platonic/cyclic/associahedron, Barnette sphere, Hirsch counterexample |
| Bridges | ToAlgebra, ToTopology, ToGeometry, ToComputation | Ehrhart theory, shellability, normal fans, convex hull algorithms |

## Quick Start
```bash
cd mini-convex-polytopes
lake build
lake env lean --run Test/Smoke.lean
```
