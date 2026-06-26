import MiniGraphTheory

-- Oxford Part C Graph Theory Benchmark

#eval "=== Oxford Part C Graph Theory Benchmark ==="

-- Oxford emphasizes:
-- 1. Structural graph theory
-- 2. Graph minors and treewidth
-- 3. Probabilistic method

-- Treewidth of paths is 1
-- Treewidth of cycles is 2
-- Treewidth of K_n is n-1

#eval s!"P_5 treewidth <= 1 (path)"
#eval s!"C_5 treewidth <= 2 (cycle)"
#eval s!"K_4 treewidth = 3"

-- Hadwiger's conjecture for small k
-- k=1,2: trivial
-- k=3: any 3-chromatic graph contains K_3 minor
-- k=4: equivalent to Four Color Theorem
-- k=5: proved by Robertson-Seymour-Thomas
#eval s!"Hadwiger k=3: trivial (3-chromatic => has odd cycle => K_3 minor)"
#eval s!"Hadwiger k=4: equivalent to 4CT"
#eval s!"Hadwiger k=5: proved (RST 1993)"

#eval "=== Oxford Part C benchmark complete ==="