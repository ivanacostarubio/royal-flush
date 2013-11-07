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

  end

  def shuffle
    @stack.shuffle!
  end

  def cards
    @stack
  end
end

class TexasHoldem
end

def build_game
  @game = Game.new
  @player1 = Player.new
  @player2 = Player.new
  @game.players << @player3
  @game.players << @player1
  @game.players << @player2
  @game.dealer.flop
  @game.deal_to_players
  @game.dealer.turn
  @game.dealer.river
  @game.to_s
end
