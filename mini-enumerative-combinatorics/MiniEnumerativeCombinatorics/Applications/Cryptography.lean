/-
Cryptography: key spaces, password entropy, combinatorial designs. Knowledge: L7.
-/
import MiniEnumerativeCombinatorics.Core.Binomial

namespace MiniEnumerativeCombinatorics

open Nat

def keySpaceSize (bits : Nat) : Nat := 2 ^ bits
def passwordSpace (alphabetSize length : Nat) : Nat := alphabetSize ^ length
def bruteForceSeconds (bits keysPerSec : Nat) : Nat := (2 ^ bits) / keysPerSec
def passwordEntropy (alphabetSize length : Nat) : Nat := length * (Nat.log 2 alphabetSize)
def birthdayBound (bits : Nat) : Nat := 2 ^ (bits / 2)

#eval "=== Cryptography Combinatorics ==="
#eval "128-bit key space: 2^128 (enormous)"
#eval "8-char alphanumeric: 62^8 = " ++ toString (62^8)
#eval "4-digit PIN: 10^4 = " ++ toString (10^4)
#eval "6-digit PIN: 10^6 = " ++ toString (10^6)
#eval "Birthday bound SHA-256: 2^128 attempts"
#eval "Birthday bound SHA-1 (160-bit): 2^80 attempts"
#eval "Permutations of 64-bit block: (2^64)! impossible"
#eval "RSA: primes needed, pi(n) ~ n/ln(n)"
#eval "Shamir secret sharing: p^k polynomials over GF(p)"

end MiniEnumerativeCombinatorics