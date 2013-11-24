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

  def test_move_plays_a_turn
    assert_equal @game.turn, 0
    @game.move
    assert_equal @game.turn, 1
  end

  def test_find_ship_finds_ship
    assert_equal Ship.new(5).name, @game.find_ship(5).name
  end

  def test_x_coord_translator_finds_correct_coord
    assert_equal 0, @game.x_translate('a')
    assert_equal 1, @game.x_translate('B')
  end

#   def test_marker_status_finds_placed_markers
#     assert @game.place_ship(1,'a',0,'h')
#     assert_equal @game.marker_status(0,0), "taken"
#     assert_equal @game.marker_status(5,5), "empty"
#   end

#   def test_ship_cannot_be_placed_on_taken_spot
#      assert @game.place_ship(5,'a',0,'h')
#      refute @game.place_ship(5,'a',0,'h')
#   end

end
