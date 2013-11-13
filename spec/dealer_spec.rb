describe Dealer, "knows about texas holdem" do

  subject  { Dealer.new } 

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

  it "deals to a player one time" do
    @player = Player.new
    subject.deal_to_player(@player)
    @player.cards.size.should == 1
  end
end


