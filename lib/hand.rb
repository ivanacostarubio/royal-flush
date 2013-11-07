class  Hand
  def initialize
    @cards = Array.new
  end
  def cards
    #raise unless self.cards.size > 5
    @cards
  end

  def to_s
    @cards.each do |card|
      puts card.suit.to_s + " " + card.value.to_s
    end
    ''
  end
end


