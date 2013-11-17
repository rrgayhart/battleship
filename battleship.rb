require_relative 'game'
require_relative 'ship'
require_relative 'player'
require_relative 'moves'

class Battleship
  attr_accessor :game
  include Moves

  def initialize
    @game ||= Game.new(12)
  end

  def welcome
    puts "Welcome to Battleship! There are two players 
    and you sink some ships. What could be better than that?"
    puts "Each player has 5 boats of different sizes and you try
    to sink the other player's boats."
    puts "Let's start with Player 1. Player 2... look away."
    puts "Press any key to continue when you're ready..."
    next_move
    puts "Great. Let's place your five ships"
    ship_count = 5
    5.times do
      board_set_up(5)
      ship_count -=1
    end
  end

  def board_set_up(ship)
    puts "Here is your board."
    @game.display_board
    puts "place your ship by picking 0-11"
    x = next_move.to_i
    puts "place your ship by picking 0-11"
    y = next_move.to_i
    puts "input v for vertical, h for horizontal"
    orientation = next_move
    @game.place_ship(5, x, y, orientation)
    @game.display_board
  end

  def next_move
    input = gets.chomp
  end

end

engine = Battleship.new
game = engine.game
engine.welcome

# game.place_ship(5, 0, 0, 'h')
# game.place_ship(2, 4, 4, 'v')



# Display this if valid placement is inaccurate
#puts "spot (#{x},#{y}) is taken, try again"
