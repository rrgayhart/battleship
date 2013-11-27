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

end
