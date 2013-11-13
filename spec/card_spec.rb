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

describe Hand , "Texas Holdem" do
  it "only knows about the texas holden " do
    f = Hand.new
  end
end

def pair
  [ Card.new(:"E", :"1"),
    Card.new(:"P", :"1"),
    Card.new(:"E", :"3"),
    Card.new(:"E", :"2"),
    Card.new(:"E", :"4")]
end

def single
  [ Card.new(:"E", :"A"),
    Card.new(:"E", :"10"),
    Card.new(:"E", :"3"),
    Card.new(:"E", :"2"),
    Card.new(:"E", :"4")]
end

def trio 
  [ Card.new(:"E", :"A"),
    Card.new(:"E", :"A"),
    Card.new(:"E", :"A"),
    Card.new(:"E", :"2"),
    Card.new(:"E", :"4")]
end

def four_of_a_kind
  [ Card.new(:"E", :"A"),
    Card.new(:"E", :"A"),
    Card.new(:"E", :"A"),
    Card.new(:"E", :"A"),
    Card.new(:"E", :"4")]
end


def flush
  [ Card.new(:"E", :"A"),
    Card.new(:"E", :"A"),
    Card.new(:"E", :"A"),
    Card.new(:"E", :"A"),
    Card.new(:"E", :"4")]
end


def royal_flush
  [ Card.new(:"E", :"10"),
    Card.new(:"E", :"J"),
    Card.new(:"E", :"Q"),
    Card.new(:"E", :"K"),
    Card.new(:"E", :"A")]
end




describe Judge do
  it "knows about a pair" do
   r = Judge.new(pair).pair?
    r.should == true
 end

 it "returns false for a pair that it is not" do
    r= Judge.new(single).pair?
    r.should == false
  end

  it "knows about a trio" do
    r = Judge.new(trio).trio?
    r.should == true
  end

  it "knows what a trio is not" do
    r = Judge.new(single).trio?
    r.should == false
  end

  it "knows about four of a kind" do
    r = Judge.new(four_of_a_kind).four_of_a_kind?
    r.should == true
  end

  it "knows about four of a kind is not" do
    r = Judge.new(trio).four_of_a_kind?
    r.should == false
  end

  it "knows about a flush" do
    r = Judge.new(flush).flush?
    r.should == true
  end

  it "knows about what is not a flush" do
    r = Judge.new(pair).flush?
    r.should == false
  end

  it "knows about royal flush" do
    r = Judge.new(royal_flush).royal_flush?
    r.should == true
  end

  it "knows about what a royal flush is not" do
    r = Judge.new(pair).royal_flush?
    r.should == false
  end

  it "knows that not any flush is royal" do
    r = Judge.new(flush).royal_flush?
    r.should == false
  end

end
