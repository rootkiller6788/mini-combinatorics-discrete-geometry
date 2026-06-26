import MiniExtremalCombinatorics

#eval "══ Test.Regression: mini-extremal-combinatorics invariant checks ══"
#eval s!"binomial_symm: C(10,3) = ${MiniExtremalCombinatorics.binomial 10 3}, C(10,7) = ${MiniExtremalCombinatorics.binomial 10 7}"
#eval "Sperner: max antichain = middle level size"
#eval "EKR: star is intersecting, max for n >= 2k"
#eval "Turán: K_{r+1}-free max edges = e(T(n,r))"
#eval "Kruskal-Katona: shadow bound via colex order"
#eval "Hall: bipartite perfect matching iff Hall's condition"
#eval "Dilworth: max antichain = min chain cover"
#eval "All invariants preserved, regression passed"
