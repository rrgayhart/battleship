gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class BoardTest < MiniTest::Test

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_kind_of Board, @board
  end

  def test_board_has_a_view_array
    assert_kind_of Array, @board.board_view
  end

  def test_a_ship_mark_can_be_placed
    @board.place_ship_mark(0,0,2)
    assert_equal @board.find_marker(0,0), [2]
    refute_equal @board.find_marker(0,1), [2]
  end

  def test_marker_taken_returns_true_or_false
    refute @board.marker_taken?(0,0)
    @board.place_ship_mark(0,0,2)
    assert @board.marker_taken?(0,0)
    refute @board.marker_taken?(0,1)
  end

  def test_validate_placement
    assert_equal true, @board.validate_placement(1,0,2,'h')
    @board.place_ship_mark(1,0,2)
    assert_equal false, @board.validate_placement(1,0,2,'h')
    @board.place_ship_mark(1,8,2)
    assert_equal false, @board.validate_placement(1,7,3,'h')
  end

  def test_place_ship_functions
    @board.place_ship(0,0,'h',Ship.new(2))
    @board.place_ship(0,8,'v',Ship.new(2))
  end

  def test_check_marker_returns_status
    skip
    assert_nil @board.check_marker_status(0,0)
  end

  def test_board_view_shows_player_view_of_nils
    skip
    num = 0
    12.times do
      assert_nil @board.board_view[0][num]
      num += 1
    end
  end

  def test_opponant_view_shows_view_of_nils
    skip
    num = 0
    12.times do
      assert_nil @board.board_view[0][num]
      num += 1
    end
  end


end
