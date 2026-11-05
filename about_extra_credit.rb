# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

require_relative 'greed'
require 'stringio'

class AboutExtraCredit < Neo::Koan
  ScriptedDice = Struct.new(:rolls, :counts) do
    def roll(count)
      counts << count
      rolls.shift || raise('Unexpected roll')
    end
  end

  def test_entry_threshold_and_subsequent_points
    player = Player.new('First')
    player.bank(250)
    assert_equal 0, player.points
    player.bank(300)
    player.bank(50)
    assert_equal 350, player.points
  end

  def test_bust_loses_the_entire_turn
    dice = ScriptedDice.new([[1, 1, 2, 3, 4], [2, 3, 4]], [])
    game = Game.new(%w[First Second], dice: dice, input: StringIO.new("y\n"), output: StringIO.new)
    game.take_turn(game.players.first)
    assert_equal 0, game.players.first.points
    assert_equal [5, 3], dice.counts
  end

  def test_all_scoring_dice_allow_five_more_dice
    dice = ScriptedDice.new([[1, 1, 1, 5, 5], [5, 2, 3, 4, 6]], [])
    game = Game.new(%w[First Second], dice: dice, input: StringIO.new("y\nn\n"), output: StringIO.new)
    game.take_turn(game.players.first)
    assert_equal [5, 5], dice.counts
    assert_equal 1150, game.players.first.points
  end

  def test_final_round_gives_every_other_player_a_turn
    dice = ScriptedDice.new([[1, 1, 1, 1, 1], [1, 1, 1, 5, 5]], [])
    game = Game.new(%w[First Second], dice: dice, input: StringIO.new("n\nn\n"), output: StringIO.new)
    game.players.first.bank(2000)
    assert_equal game.players.first, game.play
    assert_equal [3200, 1100], game.players.map(&:points)
  end
end
