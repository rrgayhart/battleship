
class Game
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

  def make_board(size)
    Array.new(size) { Array.new(size)}
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

  def move
    player = who_is_playing
    play_turn
  end

  def place_ship(ship_id, x, y, orientation)
    player = who_is_playing
    ship_length = find_ship(ship_id).size
    marker = [player.id, ship_id]
    x = x
    y = y
    if orientation == 'v'
      ship_length.times do
        @board[x][y] = marker
        x += 1
      end
    else
      ship_length.times do
        @board[x][y] = marker
        y += 1
      end
    end
  end

  def validate_placement(x,y)
    status = "empty"
    if @board[x][y]
      status = "taken"
    end
    status
  end

  def find_ship(ship_id)
    ships = who_is_playing.ships.select do |ship|
      ship.id == ship_id
    end.first
  end

  def play_turn
    if @turn == 0
      @turn += 1
    else @turn = 0
    end
  end



end
