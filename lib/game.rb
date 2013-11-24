require_relative 'ship'
require_relative 'player'
require_relative 'moves'
require_relative 'rules'
require_relative 'board'

class Game
  include Moves
  include Rules
  attr_accessor :board0, :board1, :player0, :player1, :turn

  def initialize(size=12)
    @board0 ||= Board.new
    @board1 ||= Board.new
    @player0 ||= Player.new
    @player1 ||= Player.new(1)
    @turn = 0
  end

  def move
    player = who_is_playing
    play_turn
  end

  def play_turn
    if @turn == 0
      @turn += 1
    else @turn = 0
    end
  end

  def who_is_playing
    if @turn == 0
      return @player0
    else
      return @player1
    end
  end

  def which_board
    if @turn == 0
      return @board0
    else
      return @board1
    end
  end

  def find_ship(ship_id)
    ships = who_is_playing.ships.select do |ship|
      ship.id == ship_id
    end.first
  end

  def find_marker(x,y)
    which_board.find_marker(x,y)
  end

  def send_ship(x_letter,y,orientation,ship)
    x_coord = x_translate(x_letter)
    which_board.place_ship(x_coord,y,orientation,ship)
  end

  def x_translate(letter)
     letter = letter.upcase
     x_coord = ('A'..'L').zip(0..11)
     x_coord.select {|x| x[0] == letter }[0][1]
  end


end
