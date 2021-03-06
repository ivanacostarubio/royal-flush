class Game
  def initialize
    @dealer = Dealer.new
    @players = Array.new
  end

  def end_game_score
    12
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
    @dealer = Dealer.new
    @vira = Vira.new
    @dealer.deal_to_player(vira)
    @first_hand = Hash.new
    @second_hand = Hash.new
    @third_hand = Hash.new
  end

  def deal_to_players
    3.times { players.each { |p| dealer.deal_to_player p } }
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

  def first_hand_winner
    return nil unless @first_hand.values.count == 2
    @first_hand_winner ||= winner_of_hand(@first_hand)
  end

  def second_hand_winner
    return nil unless @second_hand.values.count == 2
    @second_hand_winner ||= winner_of_hand(@second_hand)
  end

  def third_hand_winner
    return nil unless @third_hand.values.count == 2
    @third_hand_winner ||= winner_of_hand(@third_hand)
  end

  def winner_of_hand(hand)
    cards = @players.map{|p| hand[p] }
    judge = Judge.new(cards)
    judge.vira = vira.card
    winning_card = judge.winner
    (winning_card == hand[@players[0]]) ? @players[0] : @players[1]
  end

  def winner
    player_won_first_two_hands? ? first_hand_winner : player_that_won_most_matches
  end

  # TODO: Logic for: Envido, truco, etc. AKA Apostar.
  
  def play
    # playing the first hand
    players.each { |player| ask_for_user_input(player, "play_first_hand") }
    self.to_s
    puts " the winner of the first hand #{first_hand_winner.nickname}"

    #playing the second hand
    ask_for_user_input(first_hand_winner, "play_second_hand")
    ask_for_user_input(other_player(first_hand_winner), "play_second_hand")

    self.to_s
    puts " the winner of the second hand #{second_hand_winner.nickname}"
    return if player_won_first_two_hands?

    #playing the third hand
    ask_for_user_input(second_hand_winner, "play_third_hand")
    ask_for_user_input(other_player(second_hand_winner), "play_third_hand")

    self.to_s
  end

  def to_s
    puts "First Hand:"
    display_hand(@first_hand)
    puts "Second Hand:"
    display_hand(@second_hand)
    puts "Third Hand:"
    display_hand(@third_hand)
  end

  def first_turn_for_second_hand
    first_hand_winner
  end

  def first_turn_for_third_hand
    second_hand_winner
  end

  def other_player(p)
    players.clone.reject{ |player| player == p}[0]
  end

  private

  def display_hand(hand)
    return if hand == {}
    puts "#" * 20
    hand.each do |k,v|
      puts "#{k.nickname}: #{v.to_s}"
    end
  end

  def player_that_won_most_matches
    [ first_hand_winner, second_hand_winner, third_hand_winner].group_by { |d| d }.keys.first
  end

  def player_won_first_two_hands?
    first_hand_winner == second_hand_winner
  end

  def ask_for_user_input(player, method)
    puts "La vira: #{vira.card.to_s}"
    puts "What are you going to Play #{player.nickname}?"
    puts player.display_posible_moves
    p = gets
    card = player.play p.to_i
    self.send(method, player, card)
    100.times{ puts nil } 
  end

end
