require_relative '../lib/loader.rb'

describe Card, "suit" do

  VALID_SUITS = Card.valid_suits

  VALID_SUITS.each do |suit|
    it "Should have a suit #{suit}" do
      c = Card.new(suit, :one)
      c.suit.should == suit
    end
  end

  it "should raise if suit is not valid" do
    lambda {Card.new(:boom) }.should raise_error
  end
end

describe Card, "values" do

  VALID_VALUES = Card.valid_values

  VALID_VALUES.each do |value|
    it "has value of #{value}" do
      c = Card.new(:"E", value)
      c.value.should == value
    end
  end
end

describe Deck do
  it "can shuffle the cards" do
    d = Deck.new
    d.shuffle
    d.cards[0].should_not == Deck.new.cards[0]
  end
end
