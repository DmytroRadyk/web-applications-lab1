class DiceSet
  attr_reader :values

  def initialize(random = Random.new)
    @random = random
    @values = []
  end

  def roll(number)
    raise ArgumentError, 'Dice count must be nonnegative' unless number.is_a?(Integer) && number >= 0
    @values = Array.new(number) { @random.rand(1..6) }
  end
end
