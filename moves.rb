module Moves

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

  def place_ship(ship_id, x, y, orientation)
    player = who_is_playing
    ship_length = find_ship(ship_id).size
    if validate_placement(ship_length, x, y, orientation)
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
    else
    end
  end

  def validate_placement(length,x,y,orientation)
    valid = true
    length.times do
      if marker_status(x,y) == "taken"
        valid = false
        break
      else
        if orientation == "v"
          x += 1
        else
          y += 1
        end
      end
    end
    valid
  end

end
