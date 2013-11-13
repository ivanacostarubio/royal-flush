class Card

  VALID_SUITS= [:"E", :"P", :"O", :"C"]

  VALID_VALUES= [:"1", :"2", :"3", :"4", :"5", :"6", :"7",
                 :"Q", :"K"]

  def initialize(suit, value)
    raise "Invalid Card" unless VALID_SUITS.include?(suit)
    @suit = suit
    @value = value
  end

  attr_reader :suit, :value

  def to_s
    self.suit.to_s + " "  +  self.value.to_s
  end

  private
  def self.valid_suits
    VALID_SUITS
  end

  def self.valid_values
    VALID_VALUES
  end

end

class TexasHoldem ; end


