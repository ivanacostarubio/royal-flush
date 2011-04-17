class Card

  VALID_SUITS= [:clubs, :diamons, :hearts, :spades]

  VALID_VALUES= [:one, :two, :three, :four, :five,
                 :six, :seven, :eight, :nine, :ten,
                 :jack, :queen, :king, :ace]

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
  end

  def size
    @stack.size
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
#    raise unless self.cards.size > 5
    @cards
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
