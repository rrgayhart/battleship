require_relative 'game'
require_relative 'ship'
require_relative 'player'
require_relative 'moves'

include Moves

game = Game.new(12)
game.display_board

game.place_ship(5, 0, 0, 'h')
game.place_ship(2, 4, 4, 'v')



# Display this if valid placement is inaccurate
#puts "spot (#{x},#{y}) is taken, try again"
