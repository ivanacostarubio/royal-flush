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

  attr_reader :first_hand, :second_hand, :third_hand, :dealer, :players, :vira

  def initialize(players)
    @players = players
    @vira = Vira.new
    @dealer = Dealer.new
    @dealer.deal_to_player(vira)
    @first_hand = Hash.new
    @second_hand = Hash.new
    @third_hand = Hash.new
  end

  def deal_to_players
    3.times { players.each { |p| dealer.deal_to_player p } }
  end

  def play
    3.times { players.each { |player| ask_for_user_input(player) } }
  end

  def play_first_hand(player, card)
    player.delete_card(card)
    @first_hand[player] = card
  end

  def play_second_hand(player, card)
    player.delete_card(card)
    @second_hand[player] = card
  end

  def play_third_hand(player, card)
    player.delete_card(card)
    @third_hand[player] = card
  end

  # TODO:
  #
  # first_hand winner
  #
  def first_hand_winner
    winner_of_hand(@first_hand)
  end

  def second_hand_winner
    winner_of_hand(@second_hand)
  end

  def third_hand_winner
    winner_of_hand(@third_hand)
  end

  def winner_of_hand(hand)
    cards = @players.map{|p| hand[p] }
    winning_card = Judge.new(cards).winner
    (winning_card == hand[@players[0]]) ? @players[0] : @players[1]
  end

  # TODO: Game Winner
  # TODO: Logic for: Envido, truco, etc. AKA Apostar.
  private

  def ask_for_user_input(player)
    puts "What are you going to Play?"
    puts player.display_posible_moves
    p = gets
    player.play p.to_i
    100.times{ puts nil } 
  end

end
