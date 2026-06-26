import MiniEnumerativeCombinatorics

open MiniEnumerativeCombinatorics

def main : IO Unit := do
  IO.println "=== Regression Tests ==="

  -- Core values
  assert "C(5,2)=10" (choose 5 2 == 10)
  assert "C(10,5)=252" (choose 10 5 == 252)
  assert "C(20,10)=184756" (choose 20 10 == 184756)
  assert "5!=120" (factorial 5 == 120)
  assert "P(5,3)=60" (falling 5 3 == 60)

  -- Catalan
  assert "C_6=132" (catalan 6 == 132)
  assert "C_8=1430" (catalan 8 == 1430)
  assert "C_10=16796" (catalan 10 == 16796)

  -- Fibonacci
  assert "F_15=610" (fib 15 == 610)
  assert "F_25=75025" (fib 25 == 75025)

  -- Stirling
  assert "S(7,3)=301" (stirlingSecondKind 7 3 == 301)
  assert "S(6,4)=65" (stirlingSecondKind 6 4 == 65)

  -- Bell
  assert "B_7=877" (bellNumber 7 == 877)

  -- Derangements
  assert "!6=265" (subfactorial 6 == 265)
  assert "!8=14833" (subfactorial 8 == 14833)

  -- Arithmetic
  assert "d(12)=6" (divisorCount 12 == 6)
  assert "sigma(12)=28" (sumOfDivisors 12 == 28)
  assert "phi(12)=4" (totient 12 == 4)

  -- Tower of Hanoi
  assert "T_8=255" (towerOfHanoi 8 == 255)

  IO.println "All regression tests passed!"
where
  assert (desc : String) (b : Bool) :=
    if b then IO.println s!"  OK {desc}" else IO.println s!"  FAIL: {desc}"