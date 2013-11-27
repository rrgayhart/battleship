class Board

  attr_accessor :board_view

  def initialize(size=12)
    @board_view ||= make_board(size)
  end

  def make_board(size)
    marker = Array.new
    Array.new(size) { Array.new(size)}
  end

#This should move to game and the logic should
#be in board
  def play_move(x,y)
    if marker_taken?(x,y)

      # Switch to opponants board
      # Grab the id
      # Check if all other instances of the id are 'hit'
      # If not, Add 'hit' as status
      # Return Hit
      # If all except this one has a hit
      # Set status as "sunk" for all matching ship ids
      # Return 'YOU SUNK A SHIP'
    else
      #set the status as "miss"
      #return 'MISS'
    end
  end
  
  def find_ship_markers(ship)
    coordinates = ship.coordinates
  end

  def marker_taken?(x,y)
    marker = find_marker(x,y)
    if find_marker(x,y)
      marker.any?{|i| i.class == Fixnum }
    end
  end

  def return_ship_id(x,y)
    marker = find_marker(x,y)
    ship_id = marker.grep(Fixnum)
    ship_id[0]
  end

  def return_status(x,y)
    marker = find_marker(x,y)
    if find_marker(x,y)
      status = marker.grep(String)
      status[0]
    end
  end

  def place_ship(x,y,orientation,ship)
    if !validate_placement(x,y,ship,orientation)
      return "Sorry the ship cannot go there"
    end
  end

  def validate_placement(x,y,ship,orientation)
    valid = true
    ship.assign_coordinates(x,y,orientation)
    coordinates = ship.coordinates
    coordinates.each do |marker|
      x = marker[0]
      y = marker[1]
      if marker_taken?(x,y)
        ship.clear_coordinates
        valid = false
        break
      end
    end
    return valid
  end

  def place_status(x,y,status)
    if find_marker(x,y)
      if return_status(x,y)
        @board_view[x][y].delete(return_status(x,y))
      end
      @board_view[x][y] << status
    else
      @board_view[x][y] = [status]
    end
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
