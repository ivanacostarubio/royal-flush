require 'rubygems'
require 'rspec'
require 'lib/card'

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
  it "has value of 1" do
    c = Card.new(:clubs, :one)
    c.value.should == :one
  end
end
