require 'rubygems'
require 'rspec'
require 'lib/card'

  def pair
    [ Card.new(:suit, :one),
      Card.new(:heart, :one),
      Card.new(:heart, :ten),
      Card.new(:heart, :two),
      Card.new(:heart, :five)]
  end

  def single
    [ Card.new(:suit, :ace),
      Card.new(:heart, :one),
      Card.new(:heart, :ten),
      Card.new(:heart, :two),
      Card.new(:heart, :five)]
  end


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
      c = Card.new(:clubs, value)
      c.value.should == value
    end
  end
end

describe Deck do
  it "has the products of the suits and values" do
    d = Deck.new
    d.size.should == Card.valid_suits.size * Card.valid_values.size
  end
end

describe Player do

  before(:all) do
    @player = Player.new
  end

  subject{  @player }

  it{ subject.cards.size.should == 0 }

  (1..5).each do |number|
    it "can have #{number} card" do
      subject.cards << Card.new(:hearts, number.to_sym)
    end
  end

end

describe Hand , "Texas Holdem" do
  it "only knows about the texas holden " do
    f = Hand.new
  end

  it "raises if more than 6 cards" do
    @hand = Hand.new

    def add_cards
      6.times do |number|
        @hand.cards << Card.new(:hearts, number.to_sym)
      end
    end

    pending
    lambda{ add_cards }.should raise_error
  end
end


describe Dealer, "knows about texas holdem" do

  it "requires a game type" do
    lambda{ Dealer.new }.should raise_error
  end

  subject  { Dealer.new(TexasHoldem.new) }

  it "have an stack of cards" do
    subject.deck.class == Deck.new
  end

  it "knows about the hand" do
    subject.hand.class == Hand.new
  end

  it "flops 3 cards" do
    subject.flop
    subject.hand.cards.size.should == 3
  end

  it "knows about the turn " do
    subject.flop
    subject.turn
    subject.hand.cards.size.should == 4
  end

  it "knows about the river" do
    subject.flop
    subject.turn
    subject.river
    subject.hand.cards.size.should == 5
  end
end

describe TexasHoldem do
end
