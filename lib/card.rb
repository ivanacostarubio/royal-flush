class Card

  VALID_SUITS= [:clubs, :diamons, :hearts, :spades]

  def initialize(suit, value)
    raise unless VALID_SUITS.include?(suit)
    @suit = suit
    @value = value
  end

  attr_reader :suit, :value

  def self.valid_suits
    VALID_SUITS
  end

end
