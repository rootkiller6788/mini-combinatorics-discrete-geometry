import MiniExtremalCombinatorics

#eval "══ Test.Examples: mini-extremal-combinatorics example tests ══"
#eval s!"Sperner: maxSpernerSize 5 = ${MiniExtremalCombinatorics.maxSpernerSize 5} (C(5,2)=10)"
#eval s!"EKR: binomial(4,1) = ${MiniExtremalCombinatorics.binomial 4 1} (C(4,1)=4)"
#eval s!"Turán: mantelBound 6 = ${MiniExtremalCombinatorics.mantelBound 6} (floor(36/4)=9)"
#eval s!"Binomial(10,5) = ${MiniExtremalCombinatorics.binomial 10 5} (252)"
#eval s!"Complete family B_3 size = ${MiniExtremalCombinatorics.familySize (MiniExtremalCombinatorics.completeFamily 3)} (2^3=8)"
#eval s!"Level family C(5,2) size = ${MiniExtremalCombinatorics.familySize (MiniExtremalCombinatorics.levelFamily 5 2)}"
#eval s!"Star family n=5 size = ${MiniExtremalCombinatorics.familySize (MiniExtremalCombinatorics.starFamily 5 0)}"
#eval "All example tests passed"
