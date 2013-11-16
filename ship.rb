
class Ship
  attr_accessor :size, :name, :hits

  def initialize(id)
    @size = get_size(id)
    @name = get_name(id)
    @hits ||= 0
  end

  def get_size(id)
    ship_types[id][0]
  end

  def get_name(id)
    ship_types[id][1]
  end

  def ship_types
    {5 => [5, "Aircraft Carrier"], 4 => [4, "Battleship"], 3 => [3, "Submarine"], 2 => [3, "Destroyer"], 1 => [2, "Patrol Boat"]}
  end

end