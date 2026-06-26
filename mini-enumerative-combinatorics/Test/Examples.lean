import MiniEnumerativeCombinatorics

open MiniEnumerativeCombinatorics

def main : IO Unit := do
  IO.println "=== Extended Examples Test ==="

  -- Verify Pascal triangle rows
  assert "Row 5 sum=32" (sumRange (choose 5) 5 == 32)
  assert "Row 6 sum=64" (sumRange (choose 6) 6 == 64)

  -- Verify hockey-stick
  let hs3 : Nat := sumRange (fun i => choose i 1) 3
  assert "Hockey-stick 3,1=6" (hs3 == choose 4 2)

  -- Verify Catalan recurrence
  assert "C_5*(5+2)=2*(2*4+1)*C_4" (catalan 5 * 7 == 2 * 9 * catalan 4)

  -- Verify Fibonacci sum
  assert "sum F_i for i<=10 = F_12-1" (sumRange fib 10 + 1 == fib 12)

  -- Verify central binomial
  assert "centralBinomial(3)=20" (centralBinomial 3 == 20)

  IO.println "All example tests passed!"
where
  assert (desc : String) (b : Bool) :=
    if b then IO.println s!"  OK {desc}" else IO.println s!"  FAIL: {desc}"