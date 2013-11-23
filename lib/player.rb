class Player
  attr_accessor :ships, :id
  
  def initialize
    @ships ||= player_ships
    @id ||= 0
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
