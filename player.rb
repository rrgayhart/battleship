class Player
  attr_reader :ships
  
  def initialize
    @ships ||= player_ships
  end

  def player_ships
    @ships = []
    @ships << Ship.new(1)
    @ships << Ship.new(2)
    @ships << Ship.new(3)
    @ships << Ship.new(4)
    @ships << Ship.new(5)
  end

end
