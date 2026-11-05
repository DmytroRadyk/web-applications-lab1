# Optional project: an interactive Greed game using GREED_RULES.txt.
require_relative 'lib/score'
require_relative 'lib/dice_set'

class Player
  attr_reader :name, :points

  def initialize(name)
    @name = name
    @points = 0
    @entered = false
  end

  def bank(points)
    return unless @entered || points >= 300
    @entered = true
    @points += points
  end
end

class Game
  attr_reader :players

  def initialize(names, input: $stdin, output: $stdout, dice: DiceSet.new)
    raise ArgumentError, 'At least two players are required' if names.length < 2
    @players = names.map { |name| Player.new(name) }
    @input, @output, @dice = input, output, dice
  end

  def take_turn(player)
    points = 0
    dice_count = 5
    loop do
      roll = @dice.roll(dice_count)
      roll_points = score(roll)
      @output.puts "#{player.name}: #{roll.join(' ')} => #{roll_points}"
      return if roll_points.zero?
      points += roll_points
      # Triples score; only remaining dice other than 1 and 5 can be rerolled.
      dice_count = roll.tally.sum { |face, count| [1, 5].include?(face) ? 0 : count % 3 }
      dice_count = 5 if dice_count.zero?
      @output.puts "Turn total: #{points}. Roll #{dice_count} dice again? [y/N]"
      break unless @input.gets&.strip&.downcase == 'y'
    end
    player.bank(points)
    @output.puts "#{player.name}: #{player.points} banked points"
  end

  def play
    index = 0
    final_turns = nil
    loop do
      player = players[index]
      take_turn(player)
      if final_turns
        final_turns -= 1
        break if final_turns.zero?
      elsif player.points >= 3000
        final_turns = players.length - 1
      end
      index = (index + 1) % players.length
    end
    winner = players.max_by(&:points)
    @output.puts "Winner: #{winner.name} (#{winner.points})"
    winner
  end
end

if $PROGRAM_NAME == __FILE__
  names = ARGV.empty? ? ['Player 1', 'Player 2'] : ARGV
  ARGV.clear
  Game.new(names).play
end
