require 'spec_helper'

describe TrucoBet do 
  let(:ivan) { Player.new "ivan" } 
  let(:bellatrix) { Player.new "bellatrix" }

  let(:game) { Truco.new [ivan,bellatrix] }

  it "has players" do
    TrucoBet.new(game).players.should == [ivan,bellatrix]
  end

  it "no se puede decir vale nueve de una"
  it "no se puede decir quiero_y_retruco antes que truco"
  it "no se puede decir vale juego antes que el truco, retruco y vale nueve"

  describe "cantar truco" do 

    let(:bet) { TrucoBet.new(game) }

    it "y la otra persona no quiere" do 
      bet.truco(ivan)
      bet.no_quiero
      bet.score.should == 1
      bet.winner.should == ivan
    end

    it "y la otra persona quiere y pierde" do 
      bet.truco(ivan)
      bet.quiero
      bet.winner = ivan
      bet.score.should == 3
      bet.winner.should == ivan
    end

    it "y la otra persona quiere y gana" do 
      bet.truco(ivan)
      bet.quiero
      bet.winner = bellatrix
      bet.score.should == 3
      bet.winner.should == bellatrix
    end

    describe "RETRUCO" do 
      it "no querer" do 
        bet.truco(ivan)
        bet.quiero_y_retruco
        bet.no_quiero
        bet.score.should == 3
        bet.winner.should == bellatrix
      end
      it "quiero y perder" do 
        bet.truco(ivan)
        bet.quiero_y_retruco
        bet.quiero
        bet.score.should == 5
        bet.winner = bellatrix
        bet.winner.should == bellatrix
      end
      it "quiero y ganar" do 
        bet.truco(bellatrix)
        bet.quiero_y_retruco
        bet.quiero
        bet.winner = ivan
        bet.winner.should == ivan
      end
    end
  end

end
