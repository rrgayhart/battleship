require_relative 'ship'
require_relative 'player'
require_relative 'moves'
require_relative 'validations'
require_relative 'rules'

class Game
  include Moves
  include Validations
  include Rules
  attr_accessor :board, :player, :board0, :board1, :player0, :player1, :turn

  def initialize(size)
    @board0 ||= make_board(size)
    @board1 ||= make_board(size)
    @player0 ||= Player.new
    @player1 ||= Player.new
    @player1.id = 1
    @turn = 0
    @player = who_is_playing
    @board = which_board
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

  def display_board
    row = 0
    puts
    print ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l']
    puts
    12.times do
      print "#{row} #{@board[row]}"
      puts
      row += 1
    end
  end

  def find_ship(ship_id)
    ships = who_is_playing.ships.select do |ship|
      ship.id == ship_id
    end.first
  end



end
