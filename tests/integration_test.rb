gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../game'

class IntegrationTest < MiniTest::Test

  def setup
    @game = Game.new(12)
    @player1 = @game.player1
    @player2 = @game.player2
  end



  #Player1 is asked to set up all ships
  #He is told all of his ships
  #He sees the board
  #He picks coordinates for each ship
  #It switches to Player2
  #Player2 places all their ships

  #Game begins
  #Player1 sees a blank board representing Player2's board
  #Player1 makes a move
  #Player1 is shown the board with result of play
  #Player 2 sees the blank board representing Player1's board

  # Continue until one player's 
  # move results in all ships being sunk

  # Winner is announced
  # Boards are reset



end
