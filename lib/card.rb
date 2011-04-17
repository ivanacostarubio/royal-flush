class Card

  VALID_SUITS= [:clubs, :diamons, :hearts, :spades]

  VALID_VALUES= [:one, :two, :three, :four, :five,
                 :six, :seven, :eight, :nine, :ten,
                 :jack, :queen, :king, :ace]

  def initialize(suit, value)
    raise unless VALID_SUITS.include?(suit)
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
