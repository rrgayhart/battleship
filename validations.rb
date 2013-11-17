module Validations

  def x_translate(letter)
    letter = letter.upcase
    x_coord = ('A'..'L').zip(0..11)
    x_coord.select {|x| x[0] == letter }[0][1]
  end

end
