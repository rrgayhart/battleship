gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

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
