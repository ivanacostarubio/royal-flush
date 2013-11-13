class Game
  def initialize
    @dealer = Dealer.new
    @players = Array.new
  end

  def dealer
    @dealer
  end

  def players
    @players
  end

  def hand
    @dealer.hand
  end

  def deal_to_players
    deal_to_everybody
  end

  def deal_to_everybody
    @players.each do |player|
      @dealer.deal_to_player(player)
    end
  end

  def to_s
   @players.each do |player|
      puts "#" * 50
      puts "Player: " + player.object_id.to_s
      player.display_cards
      puts "#" * 50
   end
  end

  attr_accessor :player_turn

  def ask_player_for_card
    puts "Waiting for turn of #{@player_turn.object_id.to_s}"
    @player_turn.display_cards
    card = gets.chomp
    puts card.inspect
  end

end

class Truco < Game

  def initialize(players)
    @players = players
    @vira = Vira.new
    @dealer = Dealer.new
    @dealer.deal_to_player(vira)
  end

  def dealer ; @dealer ; end
  def vira ; @vira ; end
  def players ; @players ; end

  def deal_to_players
    3.times { players.each { |p| dealer.deal_to_player p } }
  end

  def play
    3.times { players.each { |player| ask_for_user_input(player) } }
  end

  private

  def ask_for_user_input(player)
    puts "What are you going to Play?"
    puts player.display_posible_moves
    p = gets
    player.play p.to_i
    100.times{ puts nil } 
  end

  # construir una jugada. Cosa que pueda poner las cartas 
  # que el usuario tira.

end
