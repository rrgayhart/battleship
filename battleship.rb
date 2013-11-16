require_relative 'game'
require_relative 'ship'
require_relative 'player'



game = Game.new(12)
game.display_board
game.place_ship(5, 3, 3, 'h')
game.display_board


