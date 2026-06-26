/- Discrete Geometry: Advanced Topics (L8-L9)
   Oriented matroids, tropical geometry, g-theorem,
   sphere packings, computational complexity. -/
import DiscreteGeometry.Basic
namespace DiscreteGeometry

/-! ## Oriented Matroids (L8) -/

-- Oriented matroids abstract the combinatorial structure of point configurations
-- and hyperplane arrangements, capturing orientation/order type information

-- Key concepts: chirotopes, circuits, covectors, the extension theorem
-- Folkman-Lawrence topological representation theorem
-- Every oriented matroid of rank 3 can be represented by a pseudoline arrangement

-- Applications: combinatorial convexity, linear programming duality
-- The combinatorial part of the simplex method is oriented matroid programming

/-! ## The g-Theorem (L8) -/

-- The g-theorem (Stanley, Billera-Lee) characterizes f-vectors of simplicial polytopes
-- It states: (f_{-1}, f_0, ..., f_{d-1}) is the f-vector of a simplicial d-polytope
-- iff the g-vector (derived from the h-vector) satisfies:
-- 1. g_i >= 0 for i <= floor(d/2)
-- 2. The g-vector is an M-sequence (Macaulay condition)

-- This was a major achievement in algebraic combinatorics
-- The proof uses toric varieties and the hard Lefschetz theorem

-- Dehn-Sommerville equations: h_i = h_{d-i} for simplicial polytopes
-- The h-vector is a more natural invariant than the f-vector

/-! ## Tropical Geometry (L8) -/

-- Tropical geometry reinterprets algebraic geometry over the tropical semiring
-- (R ∪ {∞}, min, +) or (R ∪ {-∞}, max, +)
-- Piecewise-linear structures correspond to algebraic varieties

-- Applications in: enumerative geometry, mirror symmetry, phylogenetic trees
-- Connection to discrete geometry: tropical polytopes, tropical convexity

/-! ## Sphere Packings (L8-L9) -/

-- Kepler conjecture (Hales, 1998/2014): optimal 3D packing density = π/(3√2) ≈ 0.7405
-- Achieved by face-centered cubic (FCC) and hexagonal close packing (HCP)

-- Sphere packing in higher dimensions:
-- d=8: E8 lattice, optimal (Viazovska, 2016)
-- d=24: Leech lattice, optimal (Cohn-Kumar-Miller-Radchenko-Viazovska, 2016)
-- General d: bounds via linear programming (Cohn-Elkies)

-- Applications: error-correcting codes, wireless communications, crystallography

/-! ## Kakeya Conjectures (L9) -/

-- Kakeya set: a set in R^d containing a unit line segment in every direction
-- Kakeya conjecture: Kakeya sets have Hausdorff dimension d
-- Proved for d=2 (Davies, 1971), open for d>=3

-- Finite field Kakeya: proved by Dvir (2008) using the polynomial method
-- This was a breakthrough that brought the polynomial method to prominence

/-! ## Erdos Distance Problems (L9) -/

-- Erdos distinct distances problem:
-- Minimum number of distinct distances among n points in the plane
-- Lower bound: Omega(n / log n) (Guth-Katz, 2015, building on Elekes-Sharir)

-- Related: Falconer distance conjecture (continuous analog)
-- Unit distance problem: maximum number of unit distances, O(n^{4/3})

/-! ## Causal Set Theory (L9) -/

-- Causal sets are a discrete approach to quantum gravity
-- The universe is modeled as a partially ordered set (causet)
-- The continuum emerges as a large-scale limit

-- Mathematically: random partial orders, Lorentzian geometry
-- Connection to discrete geometry: order types, Minkowski space

/-! ## Computational Complexity (L9) -/

-- Many discrete geometry problems are NP-hard:
-- - Minimum weight triangulation
-- - Euclidean traveling salesman
-- - Intersecting simplices (discrete Helly-type)

-- Approximation algorithms:
-- - PTAS for Euclidean TSP (Arora, Mitchell)
-- - Core sets for geometric optimization

/-! ## More Advanced Topics (L8-L9) -/

-- g-Theorem (Stanley, Billera-Lee):
-- Characterizes f-vectors of simplicial polytopes
-- g_i >= 0, Macaulay condition on g-vector
-- Proof uses: toric varieties + hard Lefschetz theorem

-- Upper Bound Theorem (McMullen):
-- Cyclic polytopes maximize f_i for all i among all d-polytopes with n vertices

-- Lower Bound Theorem (Barnette):
-- Stacked polytopes minimize f_i for simplicial polytopes

-- Generalized Lower Bound Theorem:
-- Proved by Murai-Nevo (2013) for simplicial polytopes

-- h-vector and Dehn-Sommerville equations:
-- h_i = Σ_{j=0}^i (-1)^{i-j} C(d-j, i-j) f_{j-1}
-- h_i = h_{d-i}

-- Adiprasito's proof of the g-conjecture for spheres (2018/2019):
-- Extended the g-theorem from polytopes to all simplicial spheres
-- Used combinatorial Hodge theory (Lefschetz for stress spaces)

-- Tropical Geometry:
-- Tropical semiring (R ∪ {∞}, min, +)
-- Tropical varieties are polyhedral complexes
-- Applications to enumerative geometry, mirror symmetry, phylogenetics

-- Oriented Matroids:
-- Abstract combinatorial data of point configurations
-- Chirotopes: sign vectors of determinants
-- Folkman-Lawrence representation theorem

-- Sphere Packings (L9):
-- Kepler conjecture (V = π/√18 ≈ 0.74048) proved by Hales
-- d=8: E8 lattice optimal (Viazovska, 2016)
-- d=24: Leech lattice optimal (Cohn et al., 2016)
-- Uses: modular forms, Fourier analysis, linear programming bounds

-- Kakeya and Restriction (L9):
-- Kakeya conjecture in R^d: dimension of Kakeya sets
-- Connection to Fourier restriction and PDE
-- Finite field Kakeya: solved by Dvir (2008)

-- Erdos Problems (L9):
-- Distinct distances: Ω(n/log n) (Guth-Katz, 2015)
-- Unit distances: O(n^{4/3}) (Spencer-Szemeredi-Trotter)
-- Falconer conjecture: continuous analog

-- Random Polytopes (L9):
-- Expected f-vector of random polytopes
-- Sylvester's problem: expected volume of random simplex
-- Connection to stochastic geometry

-- Rigidity Theory (L9):
-- Cauchy's rigidity theorem for convex polyhedra
-- Global rigidity of frameworks
-- Connelly's flexible sphere disproving Euler's rigidity conjecture

-- Computational Complexity (L9):
-- NP-hardness of minimum weight triangulation, Euclidean TSP
-- PTAS for Euclidean TSP (Arora, Mitchell)
-- Existential Theory of Reals (∃R)-completeness for many geometric problems

-- Causal Sets and Quantum Gravity (L9):
-- Spacetime as a partially ordered set
-- Myrheim-Meyer dimension estimator
-- Connection to Lorentzian geometry and discrete geometry


-- Further Research Frontiers (L9) --

-- The g-conjecture for spheres:
-- Adiprasito (2018/2019) proved the g-conjecture for simplicial spheres,
-- a major breakthrough in combinatorial geometry.
-- The proof uses combinatorial Hodge theory (Lefschetz for stress spaces)
-- and completely avoids algebraic geometry (toric varieties).

-- The g-conjecture for odd-dimensional manifolds remains open.
-- For even-dimensional manifolds, Novik-Swartz established partial results.

-- Flag vectors and the cd-index:
-- The cd-index of a polytope is a noncommutative polynomial with
-- nonnegative coefficients (proved for polytopes by Stanley,
-- for spheres by Karu, for Gorenstein* posets).

-- Unimodality conjectures:
-- The f-vector of a simplicial polytope is unimodal?
-- Not always! But the h-vector and g-vector are unimodal
-- (for polytopes, proved via hard Lefschetz).

-- Computational complexity of polytope isomorphism:
-- Graph isomorphism for polytopal graphs is GI-complete.
-- Full face lattice isomorphism is polynomial-time equivalent
-- to graph isomorphism.

-- Random discrete geometry:
-- Expected face numbers of random polytopes (e.g., convex hull of
-- random points on the sphere)
-- Random triangulations and random planar maps
-- Connection to Schramm-Loewner evolution (SLE)

-- Persistent homology and topological data analysis:
-- Apply discrete geometry to understand the shape of data
-- Vietoris-Rips complexes, Cech complexes
-- Stability theorems for persistence diagrams

-- Additive combinatorics and sum-product:
-- Erdos-Szemeredi sum-product conjecture
-- Connection to discrete geometry via incidence theory
-- Bourgain-Katz-Tao, Guth-Katz results

-- Discrete isoperimetric inequalities:
-- Edge-isoperimetric, vertex-isoperimetric on graphs
-- Harper's theorem for the hypercube
-- Bezrukov-Serra for Hamming graphs

-- Matroid theory for discrete geometry:
-- Representable matroids from point configurations
-- Oriented matroids from vector configurations
-- Matroid polytopes and the matroid stratification of Grassmannians

-- Kahle's work on random simplicial complexes generalizes Erdos-Renyi random graphs
-- to higher dimensions. The threshold for vanishing homology is at p = c log n / n.
-- This connects discrete geometry with probabilistic topology.

-- The simplex method in linear programming geometrically traverses the edge graph
-- of a polytope. The diameter of polytope graphs (Hirsch conjecture) was disproved
-- by Santos (2010) with a 43-dimensional counterexample.

-- The Mahler conjecture: the product of volumes of a centrally symmetric convex body
-- and its polar is minimized by the cube. Known in 2D, open in higher dimensions.

-- The Viterbo conjecture: among convex bodies of given volume, the symplectic
-- capacity is minimized by the ball. Related to Mahler via symplectic geometry.

-- The Erdos unit distance problem: maximum number of unit distances among n points
-- in the plane is O(n^{4/3}) (Spencer-Szemeredi-Trotter, 1984).
-- The best lower bound is n^{1 + c/loglog n} (Erdos).

-- The Falconer distance conjecture in geometric measure theory is the continuous
-- analog of the Erdos distinct distances problem.

-- The Kakeya conjecture in harmonic analysis: Kakeya sets in R^d have dimension d.
-- It is related to the restriction conjecture and the Bochner-Riesz conjecture.
-- The finite field analog was solved by Dvir (2008) via the polynomial method.

-- The Erdos-Hajnal conjecture: for any finite family of forbidden subgraphs,
-- there exists a constant c > 0 such that graphs avoiding those subgraphs
-- contain a clique or independent set of size n^c.

-- The polynomial Freiman-Ruzsa conjecture in additive combinatorics has been
-- reduced to discrete geometry via the Bogolyubov-Ruzsa lemma and the structure
-- of approximate groups.

-- The sum-product phenomenon: for a finite set A of real numbers,
-- max(|A+A|, |AA|) >= |A|^{4/3 - epsilon} (Erdos-Szemeredi, Solymosi).
-- This uses incidence geometry and the Szemerédi-Trotter theorem.

-- The Elekes-Sharir-Guth-Katz framework connects sum-product to distinct distances
-- via polynomial partitioning and incidence geometry in 3D.

-- The Kahn-Kalai "Parking on a Random Tree" conjecture was disproved in 2024,
-- providing a counterexample to the "expectation threshold" conjecture.
-- This has implications for random discrete geometry models.

-- The chromatic number of the plane (Hadwiger-Nelson problem):
-- What is the minimum number of colors needed to color the plane so that
-- no two points at distance 1 have the same color?
-- Lower bound: 5 (de Grey, 2018). Upper bound: 7. Exact value: unknown!

end DiscreteGeometry
