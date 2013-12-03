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
  attr_accessor :vira

  def initialize(cards)
    @cards = cards
  end

  def winner
    return perico if perico
    return perica if perica
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

  private

  def perica
    return nil unless @vira
    @cards.clone.keep_if do |card|
      ((card.value == :"10") && (card.suit == @vira.suit)) or ((card.value == :"12") && (card.suit == @vira.suit) && (@vira.value == :"10"))

    end[0]
  end

  def perico
    return nil unless @vira
    @cards.clone.keep_if do |card|
      ((card.value == :"11") && card.suit == @vira.suit) or ((card.value == :"12") && (card.suit == @vira.suit) && (@vira.value == :"11"))
    end[0]
  end

end
