class Board

  attr_accessor :board_view

  def initialize(size=12)
    @board_view ||= make_board(size)
  end

  def make_board(size)
    marker = Array.new
    Array.new(size) { Array.new(size)}
  end

  def marker_taken?(x,y)
    marker = find_marker(x,y)
    if find_marker(x,y)
      marker.any?{|i| i.class == Fixnum }
    end
  end


  def place_ship(x,y,orientation,ship)
    times = ship.size - 1
    ship_id = ship.id
    if validate_placement(x,y,times,orientation)
      times.times do
        place_ship_mark(x,y,ship_id)
        if orientation == 'v'
          x += 1
        else
          y += 1
        end
      end
    else
      return "Sorry the ship cannot go there"
    end
  # def place_ship(ship_id, x, y, orientation)
  #   player = who_is_playing
  #   ship_length = find_ship(ship_id).size
  #   if validate_placement(ship_length, x, y, orientation)
  #     marker = [player.id, ship_id]
  #     x = x_translate(x)
  #     y = y
  #     if orientation == 'v'
  #       ship_length.times do
  #         @board[x][y] = marker
  #         x += 1
  #       end
  #     else
  #       ship_length.times do
  #         @board[x][y] = marker
  #         y += 1
  #       end
  #     end
  #   else
  #   end
  # end
  end

  def validate_placement(x,y,length,orientation)
    valid = true
    x = x
    length = length
    length.times do
      if marker_taken?(x,y)
        valid = false
        break
      else
        if orientation == 'v'
          x += 1
        else
          y += 1
        end
      end
    end
    return valid
  end

  def place_ship_mark(x,y,ship_id)
    @board_view[x][y] = [ship_id]
  end

  def find_marker(x,y)
    @board_view[x][y]
  end

  def opponant_view
    row = 0
    puts
    print ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l']
    puts
    12.times do
      print "#{row} #{self.board_view[row]}"
      puts
      row += 1
    end
  end

  def display_board_view
    row = 0
    puts
    print ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l']
    puts
    12.times do
      print "#{row} #{self.board_view[row]}"
      puts
      row += 1
    end
  end

end
