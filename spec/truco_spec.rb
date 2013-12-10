
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

    it "plays the first hand" do
      game.play_first_hand(p1, cardp1)
      game.play_first_hand(p2, cardp2)
      game.first_hand.should == {
        p1 => cardp1, p2 => cardp2
      }
      both_players_should_have_two_cards
    end

    it "plays the second hand" do
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

  describe "judging" do 

    def play_first_hand
      card1 = Card.new(:"E", :"1")
      card2 = Card.new(:"P", :"1")
      p1 = game.players[0]
      p1.cards << card1
      p2 = game.players[1]
      p2.cards << card2
      game.play_first_hand(p1, p1.cards[0])
      game.play_first_hand(p2, p2.cards[0])
      game.first_hand_winner.should == p1
    end

    def play_second_hand
      card1 = Card.new(:"E", :"1")
      card2 = Card.new(:"P", :"1")
      p1 = game.players[0]
      p1.cards << card1
      p2 = game.players[1]
      p2.cards << card2
      game.play_second_hand(p1, p1.cards[0])
      game.play_second_hand(p2, p2.cards[0])
      game.second_hand_winner.should == p1
    end
 

    def play_third_hand
      card1 = Card.new(:"E", :"1")
      card2 = Card.new(:"P", :"1")
      p1 = game.players[0]
      p1.cards << card1
      p2 = game.players[1]
      p2.cards << card2
      game.play_third_hand(p1, p1.cards[0])
      game.play_third_hand(p2, p2.cards[0])
      game.third_hand_winner.should == p1
    end
 

    it "the first hand" do
      play_first_hand
    end

    it "the second hand" do
      play_second_hand
    end

    it "the third hand" do
      play_third_hand
    end

    it "knows the overall winner" do
      play_first_hand
      play_second_hand
      play_third_hand
      game.winner.should == game.players[0]
    end

    it "knows a player won after winning the first two hands" do 
      play_first_hand
      play_second_hand
      game.winner.should == game.players[0]
    end
  end
end
