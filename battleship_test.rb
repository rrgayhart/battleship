require 'minitest/autorun'
require 'minitest/pride'
require_relative 'battleship'

class BattleshipTest < MiniTest::Unit::TestCase

end

class GameTest < MiniTest::Unit::TestCase

  def setup
    @game = Game.new(12)
  end
  
  def test_it_exists
    assert_kind_of Game, @game
  end

  def test_a_game_had_a_board
    assert @game.board
  end

  def test_game_board_size_is_dynamic
    game12 = Game.new(12)
    game10 = Game.new(10)
    assert_equal game12.board[1].count, 12
    assert_equal game10.board[1].count, 10
  end

  def test_a_game_has_players
    refute_equal @game.player1, @game.player2
  end
end

class ShipTest < MiniTest::Unit::TestCase
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

class PlayerTest < MiniTest::Unit::TestCase
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
