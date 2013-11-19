gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'game'

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
  #Player should be prompted to place
  #all five of his ships on the board


end

class ValidationsTest < MiniTest::Test

  def setup
    @game = Game.new(12)
    @player0 = @game.player0
    @player1 = @game.player1
  end

  def test_x_coord_translator_finds_correct_coord
    assert_equal 0, @game.x_translate('a')
    assert_equal 1, @game.x_translate('B')
  end

  def test_validate_placement
    assert @game.place_ship(5,'a',4,'h')
    assert_equal false, @game.validate_placement(1,'a',4,'h')
    assert_equal true, @game.validate_placement(1,'d',3,'h')
    assert_equal false, @game.validate_placement(3,'a',2,'h')
  end

  def test_boat_translate_provides_updated_info
    boat_markers = @game.boat_translate(5, 'a', 0, 'v')
    assert_equal boat_markers[0], [0,0]
    assert_equal boat_markers[4], [0,4]
    boat_markers = @game.boat_translate(5, 'a', 0, 'h')
    assert_equal boat_markers[4], [4,0]
  end
end

class GameTest < MiniTest::Test

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
    refute_equal @game.player0, @game.player1
  end

  def test_a_game_has_turns
    assert_equal @game.turn, 0
    @game.play_turn
    assert_equal @game.turn, 1
    @game.play_turn
    assert_equal @game.turn, 0
  end

  def test_who_is_playing_returns_player
    assert_equal @game.who_is_playing, @game.player0
  end

  def test_move_plays_a_turn
    assert_equal @game.turn, 0
    @game.move
    assert_equal @game.turn, 1
  end

  def test_find_ship_finds_ship
    assert_equal Ship.new(5).name, @game.find_ship(5).name
  end

  def test_the_game_has_two_players
    assert_equal @game.player1.id, 1
    assert_equal @game.player0.id, 0
  end

  def test_a_ship_can_be_placed
    assert @game.place_ship(1,'a',0,'h')
    assert @game.board[0][0]
    assert @game.board[0][1]
    refute @game.board[1][0]
  end

  def test_marker_status_finds_placed_markers
    assert @game.place_ship(1,'a',0,'h')
    assert_equal @game.marker_status(0,0), "taken"
    assert_equal @game.marker_status(5,5), "empty"
  end

  def test_ship_cannot_be_placed_on_taken_spot
     assert @game.place_ship(5,'a',0,'h')
     refute @game.place_ship(5,'a',0,'h')
  end

end

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
