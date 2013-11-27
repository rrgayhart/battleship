gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class ShipTest < MiniTest::Test
  def setup
    @ship = Ship.new(5)
    @patrol_boat = Ship.new(1)
  end

  def test_it_exists
    assert_kind_of Ship, @ship
  end

  def test_a_ship_has_a_size
    assert_equal Ship.new(5).size, 5
    assert_equal Ship.new(1).size, 2
  end

  def test_a_ship_has_a_name
    assert_equal @ship.name, "Aircraft Carrier"
    assert_equal Ship.new(1).name, "Patrol Boat"
  end

  def test_a_ship_has_a_hit_record
    assert_equal @ship.hits, 0
  end

  def test_a_ship_holds_his_own_coordinates
    @patrol_boat.assign_coordinates(0,0,'h')
    assert_equal [[0,0], [0,1]], @patrol_boat.coordinates 
    @patrol_boat.assign_coordinates(0,0,'v')
    assert_equal [[0,0], [1,0]], @patrol_boat.coordinates 
  end

  def test_place_ship_assigns_coordinates
    Board.new.place_ship(0,0,'h',@patrol_boat)
    assert_equal [[0,0], [0,1]], @patrol_boat.coordinates 
  end

end
