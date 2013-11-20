gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../game'

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
