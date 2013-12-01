class Symbol
  def to_value
    return card_values[self] if card_values[self]
    self.to_s.to_i
  end

  def card_values
    {
      # SUITS
      :"E" => 100,
      :"P" => 90,
      :"O" => 80,
      :"C" => 70,
      # VALUES
      :"3" => 30,
      :"1" => 50
    }
  end
end

class Card

  include Comparable

  VALID_SUITS= [:"E", :"P", :"O", :"C"]

  VALID_VALUES= [:"1", :"2", :"3", :"4", :"5", :"6", :"7",
                 :"10", :"11", :"12"]

  def initialize(suit, value)
    raise "Invalid Card" unless VALID_SUITS.include?(suit)
    @suit = suit
    @value = value
  end

  attr_reader :suit, :value

  def to_s
    self.suit.to_s + " "  +  self.value.to_s
  end

  def <=>(card)
    if value == card.value
      if suit.to_value > card.suit.to_value
        return 1
      else 
        return -1
      end
    end
    if value.to_value > card.value.to_value
      return 1
    else
      return -1
    end
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


