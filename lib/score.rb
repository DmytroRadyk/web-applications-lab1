def score(dice)
  dice.tally.sum do |face, count|
    triples, singles = count.divmod(3)
    triples * (face == 1 ? 1000 : face * 100) + singles * (face == 1 ? 100 : face == 5 ? 50 : 0)
  end
end
