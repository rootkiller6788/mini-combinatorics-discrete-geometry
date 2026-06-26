/-
Combinatorial Species (Joyal, 1981). Knowledge: L8-L9.
-/

namespace MiniEnumerativeCombinatorics

axiom Species : Type

axiom emptySpecies : Species
axiom singletonSpecies : Species
axiom elementSpecies : Species
axiom setSpecies : Species
axiom permutationSpecies : Species
axiom linearOrderSpecies : Species
axiom cycleSpecies : Species

axiom speciesAdd (F G : Species) : Species
axiom speciesMul (F G : Species) : Species
axiom speciesComp (F G : Species) : Species
axiom speciesDeriv (F : Species) : Species

axiom speciesEGF (F : Species) : Nat -> Nat
axiom speciesOGF (F : Species) : Nat -> Nat
axiom speciesCycleIndex (F : Species) : Nat -> Nat -> Nat

axiom exponentialFormula : True
axiom symbolicMethod : True
axiom speciesIsomorphismTheorems : True
axiom molecularSpecies : True

#eval "=== Combinatorial Species ==="
#eval "Joyal's functorial theory (1981)"
#eval "Species F: FinSet_iso -> FinSet"
#eval "Operations: +, *, comp, ' (derivative)"
#eval "EGF(F): exponential generating function of species F"
#eval "Exponential formula: F = E o F^c"
#eval "S = E o C (permutations = sets of cycles)"
#eval "L = 1/(1-X) (linear orders)"
#eval "Molecular species = irreducible species"

end MiniEnumerativeCombinatorics