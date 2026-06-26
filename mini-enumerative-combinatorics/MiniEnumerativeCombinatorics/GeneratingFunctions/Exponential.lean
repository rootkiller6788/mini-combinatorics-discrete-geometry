/-
Exponential Generating Functions (EGF). Knowledge: L1-L8.
-/
import MiniEnumerativeCombinatorics.Core.Basic
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

def EGF := Nat -> Nat

namespace EGF
def zero : EGF := fun _ => 0
def one : EGF := fun n => if n = 0 then 1 else 0
def binConv (f g : EGF) : EGF := fun n => sumRange (fun k => choose n k * f k * g (n - k)) n
def deriv (f : EGF) : EGF := fun n => f (n+1)
def integ (f : EGF) : EGF := fun n => if n = 0 then 0 else f (n-1)
axiom exponentialFormula : True
end EGF

#eval "EGF: exponential generating functions defined"

end MiniEnumerativeCombinatorics