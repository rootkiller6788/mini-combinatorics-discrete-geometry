import Init
example (a b c : Rat) (h1 : a <= b) (h2 : 0 <= c) : a * c <= b * c := by
  nlinarith
