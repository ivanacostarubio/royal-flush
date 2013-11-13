describe Truco, "El juego" do

  let(:p1) { Player.new }
  let(:p2) { Player.new }

  let(:players) { [p1, p2] }

  let(:game) { Truco.new players }

  it "has a vira" do 
    game.vira.class.should == Vira 
  end

  it "has two players" do 
    game.players.size.should == 2
  end

  it "deals 3 cards to each player" do
    game.deal_to_players
    game.players[0].cards.size.should == 3
    game.players[1].cards.size.should == 3
  end

  it "asks for the player to play" do
    game.play
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

    it "starts with an empty hand" do
    subject.hand.cards.should == []
  end

  it "it knows about the dealer floping" do
    subject.dealer.flop
    subject.hand.cards.size.should == 3
  end

end


