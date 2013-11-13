require './lib/card'
require './lib/dealer'
require './lib/fixnum'
require './lib/hand'
require './lib/judge'
require './lib/player'
require './lib/truco'
require './lib/deck'

def build_game
  @player1 = Player.new
  @player2 = Player.new
  @game = Truco.new [@player1, @player2]
  @game.deal_to_players
  #@game.to_s
  @game.play
  nil
end
