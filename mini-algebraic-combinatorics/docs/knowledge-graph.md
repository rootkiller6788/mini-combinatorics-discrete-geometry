# Knowledge Graph - Algebraic Combinatorics

## L1: Core Definitions

| Definition | File | Type |
|-----------|------|------|
| Partition | Basic.lean | `structure` |
| Composition | Basic.lean | `structure` |
| YoungDiagram | Basic.lean | `abbrev` (Partition) |
| Cell | Basic.lean | `structure` |
| Weight | Basic.lean | `abbrev` (List Nat) |
| YoungTableau | YoungTableaux.lean | `structure` |
| StandardYoungTableau | YoungTableaux.lean | `structure` |
| SemistandardYoungTableau | YoungTableaux.lean | `structure` |
| OGF | GeneratingFunctions.lean | `def` |
| EGF | GeneratingFunctions.lean | `structure` |
| DGF | GeneratingFunctions.lean | `def` |
| SimplePoset | Posets.lean | `structure` |
| Quiver | Advanced.lean | `structure` |
| Seed | Advanced.lean | `structure` |

## L2: Core Concepts

| Concept | File | Type |
|---------|------|------|
| Partition.size, .length, .largestPart | Basic.lean | `def` |
| Partition.conjugate | Basic.lean | `def` |
| Partition.dominates | Basic.lean | `def` |
| YoungDiagram.hookLength | Basic.lean | `def` |
| YoungTableau.isSemistandard | YoungTableaux.lean | `def` |
| StandardYoungTableau.count | YoungTableaux.lean | `def` |
| KostkaNumberDirect | YoungTableaux.lean | `def` |

## L3: Mathematical Structures

| Structure | File | Components |
|-----------|------|------------|
| Ring of symmetric functions | SymmetricFunctions.lean | e_k, h_k, p_k |
| Generating function algebra | GeneratingFunctions.lean | OGF, EGF, DGF |
| Poset category | Posets.lean | SimplePoset, product, dual |
| Incidence algebra | Posets.lean | Moebius function |

## L4: Fundamental Theorems

| Theorem | File | Status |
|---------|------|--------|
| Hook-length formula | HookLength.lean | Verified for small partitions |
| RSK correspondence | RobinsonSchensted.lean | Implemented |
| Kostka numbers | YoungTableaux.lean | Known values |
| q-binomial theorem | QCalculus.lean | Concrete verifications |
| q-Pascal identities | QCalculus.lean | Concrete verifications |

## L5: Proof Techniques (3 methods)

1. **Structural recursion** - Partition operations, list manipulations
2. **Match/cases** - Used extensively for partition/tableau computations
3. **Explicit computation (#eval)** - All concrete examples verified

## L6: Canonical Examples (with #eval)

- Partition enumeration (p(4)=5, p(5)=7, etc.)
- Hook-length computations for specific shapes
- Kostka number calculations
- Symmetric function evaluations
- q-binomial coefficient computations
- RSK insertion tableau examples
- Poset/Whitney number computations

## L7: Applications

1. **Representations of S_n** - Dimension formulas via f^lambda
2. **Schubert calculus** - Littlewood-Richardson coefficients
3. **Plane partitions** - MacMahon formula

## L8: Advanced Topics

1. **Cluster algebras** - Quiver mutation, cluster variables
2. **Crystal bases** - Crystal A_1 operators

## L9: Research Frontiers

1. Macdonald theory (positivity conjecture)
2. Kazhdan-Lusztig theory
3. Amplituhedron/positive geometry
4. Chromatic symmetric functions
5. LLT polynomials
