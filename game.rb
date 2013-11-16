
class Game
  attr_accessor :board, :player0, :player1, :turn

  def initialize(size)
    @board = make_board(size)
    @player0 = Player.new
    @player1 = Player.new
    @turn = 0
  end

  def make_board(size)
    Array.new(size) { Array.new(size)}
  end

  def place_ship(ship_id, x, y, orientation)
  end

  def play_turn
    if @turn == 0
      @turn += 1
    else @turn = 0
    end
  end

end
