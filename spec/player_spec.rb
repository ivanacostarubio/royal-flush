describe Player do

  before(:each) { @player = Player.new }

  it { subject.cards.size.should == 0 }

  let(:card1) { Card.new(:"E", 1) }
  let(:card2) { Card.new(:"E", 2) }

  it "displays card to pop with numbers" do 
    @player.cards << card1
    @player.posible_moves.should == { 1 => card1 }
  end

  it "displays to cards" do 
    @player.cards << card1 ; @player.cards << card2
    @player.posible_moves.should == { 1 => card1, 2 => card2}
  end

  it "can pop a card out of the player" do 
    @player.cards << card1 ; @player.cards << card2
    @player.play(1).should == card1
    @player.posible_moves.should == { 1 => card2 }
  end

end
