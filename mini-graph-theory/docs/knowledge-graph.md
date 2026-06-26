# Mini Graph Theory - Knowledge Graph

## L1: Core Definitions
- SimpleGraph: vertices (Finset V), edges (symmetric, irreflexive relation)
- DirectedGraph: vertices (Finset V), arcs (ordered pairs)
- WeightedGraph: vertices, weighted edges
- BipartiteGraph: left/right vertex sets, cross edges
- Graph operations: adj, neighbors, degree, complement, union, intersection
- EdgeCount, degreeSum, isRegular

## L2: Core Concepts
- Path graph P_n: consecutive edges {i, i+1}
- Complete graph K_n: all possible edges
- Complete bipartite graph K_{m,n}: all cross edges
- Cycle graph C_n: ring of vertices
- Star graph S_n: center + n leaves
- Wheel graph W_n: cycle + center
- Tree: connected acyclic (n-1 edges)
- Forest: acyclic (n - c edges)
- Planar: embeddable without crossings
- Eulerian: closed trail through all edges
- Hamiltonian: cycle through all vertices

## L3: Mathematical Structures
- GraphHom: adjacency-preserving vertex map
- GraphIso: bijective homomorphism with inverse
- GraphInvariant: property preserved by isomorphism
- Subgraph, induced subgraph, spanning subgraph
- Cartesian product, tensor product, strong product
- Edge contraction, vertex identification
- Graph minors (vertex/edge deletion + contraction)
- Line graph L(G), complement, join
- Proper coloring, chromatic number
- Independent set, clique, vertex cover, matching
- Tree decomposition, treewidth

## L4: Fundamental Theorems
- Handshaking Lemma: sum_deg = 2|E|
- Odd degree count is even
- Euler's Formula: V - E + F = 2
- Planar edge bound: E <= 3V - 6
- Cayley's Formula: n^{n-2} labeled trees
- Tree characterizations (6 equivalences)
- Menger's Theorem (vertex + edge versions)
- Max-Flow Min-Cut
- Kuratowski's Theorem
- Five Color Theorem
- Hall's Marriage Theorem
- Brooks' Theorem
- Vizing's Theorem
- Turan's Theorem
- Ramsey's Theorem

## L5: Proof Techniques
- Double counting (Handshaking Lemma)
- Induction on vertices/edges (Euler Formula, Tree properties)
- Pigeonhole principle (Degree equality)
- Constructive (Prufer code bijection)
- Contradiction (Planarity bounds, forbidden minors)
- Exchange arguments (Minimum spanning tree)
- Augmenting paths (Matching, Max-flow)
- Probabilistic method (Random graphs)

## L6: Canonical Examples
- K_n: n=1..10, with edge counts verified
- K_{m,n}: various (m,n), verified
- P_n: n=1..10, verified
- C_n: n=3..6, verified
- S_n: n=0..10, verified
- Petersen graph: properties
- Platonic graphs: tetrahedron, cube
- Grotzsch graph: triangle-free chi=4
- Chvatal graph: non-Hamiltonian

## L7: Applications
- Network flows (Max-Flow Min-Cut)
- Graph algorithms (BFS, DFS, Dijkstra, Floyd-Warshall)
- Spectral clustering
- Map coloring (Four Color Theorem)
- Bipartite matching (Hungarian algorithm)
- Ramsey theory applications
- Minimum spanning tree (Kruskal, Prim)

## L8: Advanced Topics
- Spectral graph theory (eigenvalues, Cheeger constant)
- Expander graphs (Margulis, Ramanujan)
- Random graphs (Erdos-Renyi, thresholds, phase transitions)
- Graph Minor Theory (Robertson-Seymour, treewidth)
- Courcelle's Theorem (MSO logic)
- Graph polynomials (chromatic, Tutte, matching)
- Szemeredi Regularity Lemma

## L9: Research Frontiers
- Graph limits (graphons, Lovasz-Szegedy)
- Reconstruction Conjecture (Kelly-Ulam, open)
- Hadwiger's Conjecture (open for k >= 7)
- Ramanujan graphs and optimal expanders
- Erdos-Hajnal conjecture
- Compactness in graphon space