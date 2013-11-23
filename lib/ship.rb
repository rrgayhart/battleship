require_relative 'rules'

class Ship
  include Rules
  attr_accessor :size, :name, :hits, :id

  def initialize(id)
    @id = id
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
end
