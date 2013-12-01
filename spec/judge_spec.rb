describe Judge do


  describe "Suits" do 

    it " 4E > 4p" do 
      card1 = Card.new(:"E", :"4")
      card2 = Card.new(:"P", :"4")
      judge = Judge.new([card1, card2])
      judge.winner.should == card1
    end

    it " 4p > 4o" do
      card1 = Card.new(:"C", :"4")
      card2 = Card.new(:"P", :"4")
      judge = Judge.new([card1, card2])
      judge.winner.should == card2
    end

    it " 4o > 4c" do
      card1 = Card.new(:"C", :"4")
      card2 = Card.new(:"O", :"4")
      judge = Judge.new([card1, card2])
      judge.winner.should == card2
    end

    it "4p > 4c" do
      card1 = Card.new(:"P", :"4")
      card2 = Card.new(:"C", :"4")
      judge = Judge.new([card1, card2])
      judge.winner.should == card1
    end
  end

  describe "Basic Numbers" do 

    it "5C > 4E" do 
      card1 = Card.new(:"C", :"5")
      card2 = Card.new(:"E", :"4")
      judge = Judge.new([card1, card2])
      judge.winner.should == card1
    end

    it "6O > 5E" do 
      card1 = Card.new(:"O", :"6")
      card2 = Card.new(:"E", :"5")
      judge = Judge.new([card1, card2])
      judge.winner.should == card1
    end

    it "12E > 7C" do
      card1 = Card.new(:"C", :"7")
      card2 = Card.new(:"E", :"12")
      judge = Judge.new([card1, card2])
      judge.winner.should == card2
    end
  end

  describe "first 3 numbers are better (1,2,3)" do 
    it "3 is better than 4" do
      card1 = Card.new(:"E", :"4")
      card2 = Card.new(:"E", :"3")
      judge = Judge.new([card1, card2])
      judge.winner.should == card2
    end

    it "3E > 3P" do 
      card1 = Card.new(:"P", :"3")
      card2 = Card.new(:"E", :"3")
      judge = Judge.new([card1, card2])
      judge.winner.should == card2
    end

    it "2E < 3P" do 
      card1 = Card.new(:"E", :"3")
      card2 = Card.new(:"E", :"2")
      judge = Judge.new([card1, card2])
      judge.winner.should == card1
    end

    it "1E > 2E" do 
      card1 = Card.new(:"E", :"1")
      card2 = Card.new(:"E", :"2")
      judge = Judge.new([card1, card2])
      judge.winner.should == card1
    end

    it "1P > 3E" do 
      card1 = Card.new(:"E", :"3")
      card2 = Card.new(:"E", :"1")
      judge = Judge.new([card1, card2])
      judge.winner.should == card2
    end

    it "3E > 2P" do 
      card1 = Card.new(:"E", :"3")
      card2 = Card.new(:"P", :"1")
      judge = Judge.new([card1, card2])
      judge.winner.should == card2
    end

    it "7E > 3E" do
      card1 = Card.new(:"E", :"7")
      card2 = Card.new(:"E", :"3")
      judge = Judge.new([card1, card2])
      judge.winner.should == card1
    end

    it "1E < 3E" 
    it "1C < 3E"

    it "70" 
    it "perica"
    it "perico"

  end
end
