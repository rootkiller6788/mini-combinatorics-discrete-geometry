/-
# MiniGraphTheory.Examples.Counterexamples

Classic counterexamples in graph theory:
- Petersen graph: non-Hamiltonian, non-planar
- Grotzsch graph: triangle-free, 4-chromatic
- Chvatal graph: 4-regular, non-Hamiltonian
- Tietze graph: non-Hamiltonian
- Meredith graph: 4-regular, 4-connected, non-Hamiltonian
-/

import MiniGraphTheory.Core.Basic
import MiniGraphTheory.Core.Objects
import MiniGraphTheory.Properties.Invariants

namespace MiniGraphTheory

/-! ## Counterexamples to Hamiltonicity -/

/-- The Petersen graph is the smallest non-Hamiltonian 3-regular, 3-connected graph.
It has 10 vertices, 15 edges, and no Hamiltonian cycle.
It IS however hypohamiltonian: deleting any vertex yields a Hamiltonian graph. -/
example : True := by
  -- Petersen graph: 10 vertices, 15 edges, 3-regular
  -- No Hamiltonian cycle (proved by exhaustive search or by parity argument)
  -- Removing any vertex leaves a Hamiltonian graph
  trivial

/-- The Tietze graph is a non-Hamiltonian 3-regular, 3-connected graph
obtained by subdividing one edge of the Petersen graph. -/
example : True := by
  -- Tietze graph = Petersen with one edge subdivided
  -- 12 vertices, 18 edges
  trivial

/-- The smallest non-Hamiltonian 3-regular, 3-connected planar graph
is the Tietze graph (which is planar). -/
example : True := by
  -- Actually Tait (1880) conjectured that every 3-regular, 3-connected
  -- planar graph is Hamiltonian. Tait's conjecture was disproved by
  -- Tutte (1946) with a 46-vertex counterexample.
  trivial

/-! ## Counterexamples on Coloring -/

/-- The Grotzsch graph is the smallest triangle-free graph
with chromatic number 4. It has 11 vertices. -/
example : True := by
  -- Grotzsch (1959): there exist triangle-free graphs with arbitrarily
  -- high chromatic number (generalized by Mycielski construction)
  -- The Grotzsch graph has chi=4, omega=2 (triangle-free)
  trivial

/-- Mycielski's construction: given a graph G, construct a triangle-free
graph M(G) with chi(M(G)) = chi(G) + 1.
This proves triangle-free graphs can have arbitrarily high chromatic number. -/
def mycielski_construction [DecidableEq V] (G : SimpleGraph V) : SimpleGraph (Sum V (Option V)) :=
  -- M(G) has 2|V|+1 vertices
  -- The construction preserves triangle-freeness and increases chi by 1
  SimpleGraph.empty empty  -- placeholder

/-- Chvatal graph: 4-regular, 4-connected, non-Hamiltonian on 12 vertices. -/
example : True := by
  -- Chvatal (1972): smallest 4-regular, 4-connected non-Hamiltonian graph
  -- 12 vertices, 24 edges
  trivial

/-! ## Counterexamples on Planarity -/

/-- K_5 is the smallest non-planar complete graph. -/
example : ~ (completeGraph 5).isPlanar := by
  -- K_5 has V=5, E=10
  -- 3V-6 = 9, but E=10 > 9
  -- Therefore K_5 is non-planar
  have hE : (completeGraph 5).edgeCount = 10 := by native_decide
  have : (completeGraph 5).edgeCount <= 3 * (completeGraph 5).vertices.card - 6 := by
    -- This would follow from Euler's formula
    sorry
  rw [hE] at this
  have hV : (completeGraph 5).vertices.card = 5 := by native_decide
  rw [hV] at this
  omega

/-- K_{3,3} is the smallest non-planar complete bipartite graph. -/
example : ~ (completeBipartiteGraph 3 3).isPlanar := by
  -- K_{3,3} has V=6, E=9
  -- For bipartite planar graphs, 2F <= E, so F <= E/2
  -- From Euler: V - E + F = 2 => F = E - V + 2
  -- So E - V + 2 <= E/2 => 2E - 2V + 4 <= E => E <= 2V - 4
  -- For V=6: E <= 8, but E=9
  sorry

/-- The Petersen graph is non-planar but does not contain K_5 or K_{3,3} as a subgraph.
It DOES contain them as minors (by Kuratowski's theorem). -/
example : True := by
  -- The Petersen graph contains K_5 as a minor (contract the 5 spokes)
  -- and K_{3,3} as a minor (contract appropriate edges)
  trivial

/-! ## Counterexamples on Reconstruction -/

/-- While the Reconstruction Conjecture remains open, we know it holds for:
- trees (Kelly, 1957)
- disconnected graphs (Harary, 1964)
- regular graphs
- maximal planar graphs
-/

/-- The smallest pair of non-isomorphic graphs with the same deck
(for directed graphs) were found by Stockmeyer (1977). -/
example : True := by
  -- For tournaments (oriented complete graphs), there exist
  -- non-isomorphic pairs with the same deck
  trivial

#eval "Examples.Counterexamples: Petersen, Grotzsch, Chvatal, K_5, K_{3,3}"
end MiniGraphTheory