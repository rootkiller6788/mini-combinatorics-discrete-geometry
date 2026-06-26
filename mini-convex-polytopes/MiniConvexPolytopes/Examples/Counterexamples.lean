/-
# MiniConvexPolytopes: Examples -- Counterexamples -- L6
Famous counterexamples in polytope theory.
-/

import MiniObjectKernel.Core.Basic
import MiniConvexPolytopes.Core.Basic

namespace MiniConvexPolytopes

#eval "== Examples.Counterexamples: Counterexamples in Polytope Theory =="

#eval "-- Barnette sphere: simplicial 3-sphere, non-polytopal --"
#eval "f = (8, 27, 38, 19)"
#eval "Shows: simplicial sphere /= polytope boundary for d >= 4"

#eval "-- Non-realizable f-Vectors --"
def nonRealizableFvector : List Nat := [6, 14, 16, 8]
#eval s!"{nonRealizableFvector}: satisfies DS + LBT but not realizable"

#eval "-- Hirsch counterexample (Santos 2010) --"
#eval "d=43, n=86 facets, diameter >= 44 > n-d = 43"

#eval "-- Steinitz counterexample: non-3-connected graph --"
#eval "Cannot be realized as a 3-polytope"

#eval "-- Minimal vertex d-polytopes --"
#eval "d=3, n=5: (5,8,5) square pyramid"
#eval "d=3, n=5: (5,9,6) triangular bipyramid"

#eval "-- Borsuk conjecture counterexample --"
#eval "Disproved by Kahn-Kalai (1993)"

end MiniConvexPolytopes
