require 'sinatra'
require './game'
require './rules'

get '/' do
  @ships = Game.new(12).ship_types
  @board = Game.new(12).board
  erb :index
end

