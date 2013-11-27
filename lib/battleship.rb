require_relative 'game'
require_relative 'ship'
require_relative 'player'
require_relative 'stories'

class Battleship
  attr_accessor :game
  include Stories

  def initialize
    @game ||= Game.new(12)
  end

  def welcome
    # welcome_story1
    # welcome_story2
    ship_count = 5
    5.times do
      board_set_up(5)
      ship_count -= 1
    end
  end

  def board_set_up(ship)
    #board_set_up1
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





# Display this if valid placement is inaccurate
#puts "spot (#{x},#{y}) is taken, try again"
