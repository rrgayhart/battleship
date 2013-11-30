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

  def next_move
    gets.chomp
  end

  def welcome
    welcome_story1
    welcome_story2
    board_set_up1
    place_first_ship_story
  end

  def place_first_ship_story
    player_ship_array
    puts "To place a ship, enter the xy coordinates and a v or h for vertical or horizontal."
    puts "For example... d4v or a10h"
    puts "Please enter the x-y coordinates for your #{player_ship_array.first}"
  end

  def player_ship_array
    array = @game.who_is_playing.ships.collect do |ship|
      ship.name
    end
    array
  end

  def show_player_board
    @game.player_board.display_board_view
  end

end

battle = Battleship.new
battle.welcome


# Display this if valid placement is inaccurate
#puts "spot (#{x},#{y}) is taken, try again"
