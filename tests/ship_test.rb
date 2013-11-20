gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../game'

class ShipTest < MiniTest::Test
  def setup
    @ship = Ship.new(5)
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

end
