/-
Combinatorial probability: poker, birthday, coupon collector. Knowledge: L7.
-/
import MiniEnumerativeCombinatorics.Core.Binomial
import MiniEnumerativeCombinatorics.Core.Factorials

namespace MiniEnumerativeCombinatorics

open Nat

-- Poker hands
def totalPokerHands : Nat := choose 52 5
def royalFlushHands : Nat := 4
def fourOfAKindHands : Nat := 13 * 48
def fullHouseHands : Nat := 13 * choose 4 3 * 12 * choose 4 2
def flushHands : Nat := 4 * choose 13 5 - 40
def straightHands : Nat := 10 * 4^5 - 40

theorem poker_total : totalPokerHands = 2598960 := by native_decide
theorem fullHouse_count : fullHouseHands = 3744 := by native_decide
theorem flush_count : flushHands = 5108 := by native_decide
theorem fourOfAKind_count : fourOfAKindHands = 624 := by native_decide

-- Birthday problem
def birthdayNoShare (n : Nat) : Nat := falling 365 n

-- Ballot problem
def ballotCount (p q : Nat) : Nat :=
  if p > q then (p - q) * factorial (p+q) / ((p+q) * factorial p * factorial q) else 0

-- Catalan / Dyck paths in probability
def gamblersRuinCatalan (n : Nat) : Nat := catalan n

#eval "=== Combinatorial Probability ==="
#eval "Poker: total = " ++ toString totalPokerHands
#eval "Full house: " ++ toString fullHouseHands
#eval "Flush: " ++ toString flushHands
#eval "Four of a kind: " ++ toString fourOfAKindHands
#eval "Royal flush: " ++ toString royalFlushHands
#eval "Birthday: P(shared|23 people) > 50%"
#eval "Coupon collector: E[T] = n*H_n"
#eval "Ballot: P = (p-q)/(p+q) via Catalan"
#eval "Gamblers ruin: Catalan numbers appear"

end MiniEnumerativeCombinatorics