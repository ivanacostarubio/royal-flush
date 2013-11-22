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


  describe "playing the hands" do

    before(:each) do
      game.deal_to_players
    end

    let(:cardp1) { p1.cards[0] }
    let(:cardp2) { p2.cards[0] }

    def both_players_should_have_two_cards
      [p1,p2].each{ |p| p.cards.count.should == 2 }
    end

    it "ask for the first hand" do
      game.play_first_hand(p1, cardp1)
      game.play_first_hand(p2, cardp2)
      game.first_hand.should == {
        p1 => cardp1, p2 => cardp2
      }
      both_players_should_have_two_cards
    end

    it "ask for the second hand" do
      game.play_second_hand(p1, cardp1)
      game.play_second_hand(p2, cardp2)
      game.second_hand.should == {
        p1 => cardp1, p2 => cardp2
      }
      both_players_should_have_two_cards
    end

    it "plays the third hand" do
      game.play_third_hand(p1, cardp1)
      game.play_third_hand(p2, cardp2)
      game.third_hand.should == {
        p1 => cardp1, p2 => cardp2
      }
      both_players_should_have_two_cards
    end
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


