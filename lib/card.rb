class Card

  VALID_SUITS= [:"♣", :"♦", :"♥", :"♠"]

  VALID_VALUES= [:"1", :"2", :"3", :"4", :"5",
                 :"6", :"7", :"8", :"9", :"10",
                 :"J", :"Q", :"K", :"A"]

  def initialize(suit, value)
    raise "Invalid Card" unless VALID_SUITS.include?(suit)
    @suit = suit
    @value = value
  end

  attr_reader :suit, :value

  private
  def self.valid_suits
    VALID_SUITS
  end

  def self.valid_values
    VALID_VALUES
  end

  def to_s
    self.suit.to_s + " "  +  self.value.to_s
  end
end

class Deck

  attr_reader :stack

  def initialize
    @valid_suits = Card.valid_suits
    @valid_values = Card.valid_values
    @stack = Array.new

    @valid_suits.each do |suit|
      @valid_values.each{|value | @stack << Card.new(suit, value)}
    end

    self.shuffle
  end

  def size
    @stack.size
  end

  def shuffle
    @stack.shuffle!
  end

  def cards
    @stack
  end
end

class Player
  attr_reader :cards

  def initialize
    @cards = Array.new
  end

  def cards
    @cards
  end
end

class  Hand
  def initialize
    @cards = Array.new
  end
  def cards
    #raise unless self.cards.size > 5
    @cards
  end

  def to_s
    @cards.each do |card|
      puts card.suit.to_s + " " + card.value.to_s
    end
    ''
  end
end

class TexasHoldem
end

class Dealer
  def initialize game
    raise "Unsupported Game" unless game.class == TexasHoldem
    @game = game
    @deck = Deck.new
    @hand = Hand.new
  end

  def deal_to_player(player)
    2.times { |n| player.cards << @deck.cards.pop  }
  end

  def flop
    3.times{ |n| deal }
  end

  def hand
    @hand
  end

  def deck
    @deck
  end

  def deal
    @hand.cards << @deck.cards.pop
  end

  alias :river :deal ; alias  :turn :deal
end

class Game
  def initialize
    @dealer = Dealer.new(TexasHoldem.new)
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
    @players.each do |player|
      @dealer.deal_to_player(player)
    end
  end

  def to_s
   @players.each do |player|

      puts "#" * 50
      puts "Player: " + player.object_id.to_s
      player.cards.each do |card|
        puts card.suit.to_s + " " + card.value.to_s
      end
    end

    puts "#" * 50
    puts "HAND: "
    puts self.hand
  end
end

class Judge

  def initialize(cards)
    @cards = cards
  end

  def pair?
    check_for_identical_values?(2)
  end

  def trio?
    check_for_identical_values?(3)
  end

  def four_of_a_kind?
    check_for_identical_values?(4)
  end

  private

  def check_for_identical_values?(number_of_identical_values)
    group = group_cards_by_value(@cards)
    has_same_value_card?(number_of_identical_values, group)
  end

  def group_cards_by_value(cards)
    cards.group_by {|card| card.value }
  end

  def has_same_value_card?(number, group)
    flag = false
    group.each_pair do |k,v|
      flag = true if v.size == number
    end
    flag
  end
end

def build_game
  @game = Game.new
  @player1 = Player.new
  @player2 = Player.new
  @player3 = Player.new
  @game.players << @player3
  @game.players << @player1
  @game.players << @player2
  @game.dealer.flop
  @game.deal_to_players
  @game.dealer.turn
  @game.dealer.river
  @game.to_s
end
