
class Game
  attr_accessor :board, :player1, :player2

  def initialize(size)
    @board = make_board(size)
    @player1 = Player.new
    @player2 = Player.new
  end

  def make_board(size)
    Array.new(size) { Array.new(size)}
  end

end
