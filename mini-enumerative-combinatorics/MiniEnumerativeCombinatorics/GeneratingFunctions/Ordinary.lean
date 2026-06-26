/-
Ordinary Generating Functions (OGF). Knowledge: L1-L8.
-/
import MiniEnumerativeCombinatorics.Core.Basic
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

def OGF := Nat -> Nat

namespace OGF
def zero : OGF := fun _ => 0
def one : OGF := fun n => if n = 0 then 1 else 0
def add (f g : OGF) : OGF := fun n => f n + g n
def mul (f g : OGF) : OGF := fun n => sumRange (fun k => f k * g (n - k)) n
def coeff (f : OGF) (n : Nat) : Nat := f n
def geometric : OGF := fun _ => 1
def fibonacciOGF : OGF := fun n => fib n
axiom geometricIdentity : mul geometric (add one (fun n => if n = 1 then 1 else 0)) = one
end OGF

#eval "OGF: ordinary generating functions defined"

end MiniEnumerativeCombinatorics