module Validations

  def x_translate(letter)
    letter = letter.upcase
    x_coord = ('A'..'L').zip(0..11)
    x_coord.select {|x| x[0] == letter }[0][1]
  end

  def boat_translate(length,x_coord,y_coord,orientation)
    x = x_translate(x_coord)
    y = y_coord
    markers = [] 
    length.times do
      if orientation == "h"
        markers << [x,y]
        x += 1
      else
        markers << [x,y]
        y += 1
      end
    end
    markers
  end

  def marker_st(x,y)
    valid = true
  end

  def place_boat(ship,x_coord,y_coord,orientation)
    length = ship.length
    a = boat_translate(length,x,y,orientation).collect do |marker|
      marker_status(marker[0][1])
    end
    if a.include("taken")
      return "Cannot place boat. Please try again"
    else
    end
  end


  def marker_status(x,y)
    status = "empty"
    if @board[x][y]
      status = "taken"
    end
    status
  end

  def validate_placement(length,x,y,orientation)
    valid = true
    x = x_translate(x)
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
