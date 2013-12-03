class Judge
  # For Truco:
  # 4,5,6,7P, 7C,10,11,12 
  # 2,3,1
  # 7O, 7E
  # 1B, 1E
  # perica
  # perico

  # Pintas
  # C,O,P,E 
  
  attr_reader :cards 

  def initialize(cards)
    @cards = cards
  end

  def winner
    cards.sort[-1]
  end

  def suit_rank
    [
      :"E",
      :"P",
      :"O",
      :"C"
    ]
  end

end
