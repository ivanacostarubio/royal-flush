describe Dealer do

  subject  { Dealer.new } 

  it "have an stack of cards" do
    subject.deck.class == Deck.new
  end

  it "knows about the hand" do
    subject.hand.class == Hand.new
  end

  it "deals to a player one time" do
    @player = Player.new
    subject.deal_to_player(@player)
    @player.cards.size.should == 1
  end
end


