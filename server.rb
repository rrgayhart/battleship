require 'sinatra'
require './game'
require './rules'

get '/' do
  @ships = Game.new(12).ship_types
  erb :index
end

post '/ships' do
  ship = Ship.new(1).ship_types
end
