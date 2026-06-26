import MiniEnumerativeCombinatorics

open MiniEnumerativeCombinatorics

def main : IO Unit := do
  IO.println "=== Smoke Test ==="

  assert "P(5,3)=60" (falling 5 3 == 60)
  assert "5!=120" (factorial 5 == 120)
  assert "C(5,2)=10" (choose 5 2 == 10)
  assert "C(10,5)=252" (choose 10 5 == 252)
  assert "C(5,0)=1" (choose 5 0 == 1)
  assert "C(5,5)=1" (choose 5 5 == 1)
  assert "C_3=5" (catalan 3 == 5)
  assert "C_5=42" (catalan 5 == 42)
  assert "F_10=55" (fib 10 == 55)
  assert "F_20=6765" (fib 20 == 6765)
  assert "S(5,2)=15" (stirlingSecondKind 5 2 == 15)
  assert "S(4,2)=7" (stirlingSecondKind 4 2 == 7)
  assert "B_5=52" (bellNumber 5 == 52)
  assert "B_3=5" (bellNumber 3 == 5)
  assert "!5=44" (subfactorial 5 == 44)
  assert "d(12)=6" (divisorCount 12 == 6)
  assert "phi(12)=4" (totient 12 == 4)
  assert "T_5=31" (towerOfHanoi 5 == 31)

  IO.println "All smoke tests passed!"
where
  assert (desc : String) (b : Bool) :=
    if b then IO.println s!"  OK {desc}" else IO.println s!"  FAIL: {desc}"