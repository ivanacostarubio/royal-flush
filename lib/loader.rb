require './lib/card'
require './lib/dealer'
require './lib/fixnum'
require './lib/hand'
require './lib/judge'
require './lib/player'
require './lib/truco'
require './lib/deck'

def build_game
  @player1 = Player.new "Ivan"
  @player2 = Player.new "Bellatrix"

  @game = Truco.new [@player1, @player2]
  @game.deal_to_players
  #@game.to_s
  @game.play

  puts "EL GANADOR:"
  puts @game.winner.nickname
  nil
end
