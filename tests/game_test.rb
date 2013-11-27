gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < MiniTest::Test

  def setup
    @game = Game.new
    @player0 = @game.player0
  end
  
  def test_it_exists
    assert_kind_of Game, @game
  end

  def test_a_game_has_players
    refute_equal @game.player0, @game.player1
  end

  def test_players_have_ids
    assert_equal 0, @game.player0.id
    assert_equal 1, @game.player1.id
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

  def test_find_ship_finds_ship
    assert_equal Ship.new(5).name, @game.find_ship(5).name
  end

  def test_x_coord_translator_finds_correct_coord
    assert_equal 0, @game.x_translate('a')
    assert_equal 1, @game.x_translate('B')
  end

  def test_play_move_on_taken_spot_sets_status_to_hit
    opponant = @game.opponant
    ship = opponant.ships[0]
    board = @game.opponant_board
    board.place_ship(0,0,'h',ship)
    @game.play_move(0,0)
    assert_equal "hit", board.return_status(0,0)
  end

  def test_play_move_on_empty_spot_sets_status_to_miss
    @game.play_move(0,0)
    board = @game.player_board
    assert_equal "miss", board.return_status(0,0)
  end

  def test_hitting_all_spots_on_ship_returns_sunk
    opponant = @game.opponant
    ship = opponant.ships[0]
    opponant_board = @game.opponant_board
    player_board = @game.player_board
    opponant_board.place_ship(0,0,'h',ship)
    @game.play_move(0,0)
    assert_equal "hit", opponant_board.return_status(0,0)
    @game.play_move(0,1)
    @game.play_move(0,1)
    assert_equal "sunk", opponant_board.return_status(0,1)
    assert_equal "sunk", opponant_board.return_status(0,0)
  end

  def test_successfully_playing_a_move_changes_boards
    opponant = @game.opponant
    opponant_board = @game.opponant_board
    @game.play_move(0,0)
    assert_equal @game.who_is_playing, opponant
    refute_equal @game.opponant, opponant
    assert_equal @game.player_board, opponant_board
    refute_equal @game.opponant_board, opponant_board
  end

  def test_unsuccessful_move_does_not_change_board
    opponant = @game.opponant
    opponant_board = @game.opponant_board
    opponant = @game.opponant
    @game.play_move(0,0)
    refute_equal @game.opponant, opponant
    @game.play_move(0,0)
    assert_equal @game.opponant, opponant
    response = @game.play_move(0,0)
    assert_equal @game.opponant, opponant
    assert_equal "Invalid Play. Try again.", response
  end
end
