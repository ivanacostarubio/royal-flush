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

  VALID_VALUES = Card.valid_values

  VALID_VALUES.each do |value|
    it "has value of #{value}" do
      c = Card.new(:"♥", value)
      c.value.should == value
    end
  end
end

describe Deck do
  it "has the products of the suits and values" do
    d = Deck.new
    d.size.should == Card.valid_suits.size * Card.valid_values.size
  end

  it "can shuffle the cards" do
    d = Deck.new
    d.shuffle
    d.cards[0].should_not == Deck.new.cards[0]
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
      subject.cards << Card.new(:"♥", number.to_sym)
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
        @hand.cards << Card.new(:"♥", number.to_sym)
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

  it "deals to a player" do
    @player = Player.new
    subject.deal_to_player(@player)
    @player.cards.size.should == 2
  end
end

describe Game, "Texasholdem" do
  subject { Game.new }

  before(:each) do
    @player1 = Player.new
    @player2 = Player.new
  end

  it "has a dealer" do
    subject.dealer.class.should == Dealer
  end

  it "can have players" do
    subject.players << Player.new
    subject.players.size.should == 1
  end

  it "deals two cards to players" do
    subject.players << @player1
    subject.players << @player2
    subject.deal_to_players
    @player1.cards.size.should == 2
    @player2.cards.size.should == 2
  end

  it "starts with an empty hand" do
    subject.hand.cards.should == []
  end

  it "it knows about the dealer floping" do
    subject.dealer.flop
    subject.hand.cards.size.should == 3
  end

  it "knows who won the match" do
    pending
  end
end

describe TexasHoldem do
end

  def pair
    [ Card.new(:"♥", :"1"),
      Card.new(:"♥", :"1"),
      Card.new(:"♥", :"3"),
      Card.new(:"♥", :"2"),
      Card.new(:"♥", :"4")]
  end

  def single
    [ Card.new(:"♥", :"A"),
      Card.new(:"♥", :"10"),
      Card.new(:"♥", :"3"),
      Card.new(:"♥", :"2"),
      Card.new(:"♥", :"4")]
  end

  def trio 
    [ Card.new(:"♥", :"A"),
      Card.new(:"♥", :"A"),
      Card.new(:"♥", :"A"),
      Card.new(:"♥", :"2"),
      Card.new(:"♥", :"4")]
  end

  def four_of_a_kind
    [ Card.new(:"♥", :"A"),
      Card.new(:"♥", :"A"),
      Card.new(:"♥", :"A"),
      Card.new(:"♥", :"A"),
      Card.new(:"♥", :"4")]
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
end
