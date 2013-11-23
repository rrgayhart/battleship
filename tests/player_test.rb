gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class PlayerTest < MiniTest::Test
  def setup
    @player1 = Player.new
    @player2 = Player.new
  end

  def test_it_exists
    assert_kind_of Player, @player1
  end

  def test_a_player_has_five_ships
    assert_equal @player1.ships.count, 5
  end

  def test_a_player_has_an_aircraft_carrier
    assert_equal @player1.ships[4].name, "Aircraft Carrier"
  end

end
