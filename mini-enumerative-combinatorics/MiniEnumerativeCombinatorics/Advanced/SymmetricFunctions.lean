/-
Symmetric functions: elementary, homogeneous, power sum, Schur.
Knowledge: L8-L9.
-/

namespace MiniEnumerativeCombinatorics

axiom elementarySymmetric (k : Nat) : True
axiom homogeneousSymmetric (k : Nat) : True
axiom powerSum (k : Nat) : True
axiom monomialSymmetric (lam : List Nat) : True
axiom schurFunction (lam : List Nat) : True

axiom fundamentalTheoremSymmetricFunctions : True
axiom newtonIdentities (k : Nat) : True
axiom jacobiTrudiIdentity (lam : List Nat) : True
axiom littlewoodRichardsonRule (mu nu : List Nat) : True
axiom hookLengthFormula (lam : List Nat) : True
axiom frobeniusCharacteristic : True
axiom pieriRule (lam : List Nat) (r : Nat) : True

#eval "=== Symmetric Functions ==="
#eval "Bases: e_lambda, h_lambda, p_lambda, m_lambda, s_lambda"
#eval "Fundamental theorem: every symmetric polynomial is polynomial in elementary symmetric functions"
#eval "Schur functions: orthonormal basis under Hall inner product"
#eval "Littlewood-Richardson: s_mu * s_nu = sum c_{mu,nu}^lambda * s_lambda"
#eval "Hook-length formula for standard Young tableaux"
#eval "Jacobi-Trudi: s_lambda = det(h_{lambda_i - i + j})"
#eval "Pieri rule: s_lambda * s_(r) = sum s_mu"

end MiniEnumerativeCombinatorics