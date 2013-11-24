gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class BattleshipTest < MiniTest::Test
  
  def setup
    @game = Game.new(12)
    @player0 = @game.player0
    @player1 = @game.player1
  end

  def test_welcome_place_boats
    skip
    patrol_boat_coord = [A, 1, 'h']
    destroyer_coord = [D, 1,'v']
    submarine_coord = [F, 3,'h']
    battleship_coord = [G, 1, 'h']
    aircraft_car_coord = [E, 10, 'h']
    @game.welcome_place_ships[]
  end

  def test_a_player_has_his_her_own_board
    skip
    assert @player0.board
  end
  #Player should be prompted to place
  #all five of his ships on the board


end
