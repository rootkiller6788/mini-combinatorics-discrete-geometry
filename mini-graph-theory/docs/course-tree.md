# Mini Graph Theory - Course Dependency Tree

## Prerequisites
- Set theory (Finset, basic combinatorics)
- Basic algebra (rings, matrices for spectral theory)
- Basic topology (for planarity/embedding)
- Probability theory (for random graphs)

## Internal Dependencies

```
Core/Basic (L1)
└── Core/Objects (L2) ── depends on Core/Basic
    └── Core/Laws (L4) ── depends on Core/Basic, Core/Objects
        └── Morphisms/Hom (L3) ── depends on Core/Basic
            ├── Morphisms/Iso (L3) ── depends on Core/Basic, Morphisms/Hom
            │   └── Morphisms/Equivalence (L3) ── depends on all above
            ├── Constructions/Products (L3) ── depends on Core/*
            ├── Constructions/Subgraphs (L3) ── depends on Core/*
            ├── Constructions/Quotients (L3) ── depends on Core/*
            └── Constructions/Universal (L3) ── depends on Core/*
                └── Properties/Invariants (L3) ── depends on Core/*
                    ├── Properties/Preservation (L3) ── depends on Invariants
                    └── Properties/Classification (L3) ── depends on Invariants
                        └── Theorems/Basic (L4) ── depends on Core/*
                            ├── Theorems/Connectivity (L4) ── depends on Basic
                            ├── Theorems/Trees (L4) ── depends on Basic
                            └── Theorems/Planarity (L4) ── depends on Basic
                                └── Examples/Standard (L6) ── depends on all above
                                    └── Examples/Counterexamples (L6) ── depends on Standard
                                        └── Bridges/ToAlgebra (L7) ── depends on Core/*
                                            ├── Bridges/ToComputation (L7) ── depends on Core/*
                                            ├── Bridges/ToTopology (L7) ── depends on Planarity
                                            └── Bridges/ToCombinatorics (L7) ── depends on Core/*
                                                └── Advanced/SpectralGraph (L8) ── depends on ToAlgebra
                                                    ├── Advanced/RandomGraphs (L8) ── depends on Core/*
                                                    └── Advanced/GraphMinors (L8) ── depends on Quotients
```

## External Dependencies

None. This module is self-contained and uses only Lean 4 standard library.

## Learning Path

1. **Week 1-2**: Core/Basic, Core/Objects (definitions and examples)
2. **Week 3-4**: Core/Laws, Morphisms/* (basic theorems and structure)
3. **Week 5-6**: Constructions/*, Properties/* (graph operations and invariants)
4. **Week 7-8**: Theorems/* (fundamental theorems)
5. **Week 9-10**: Examples/*, Bridges/* (applications)
6. **Week 11-12**: Advanced/* (spectral, random, minors)