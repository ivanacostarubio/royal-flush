class Player
  attr_reader :cards

  def initialize
    @cards = Array.new
  end

  def cards
    @cards
  end

  def display_cards
    cards.each do |card|
      puts card.suit.to_s + " " + card.value.to_s
    end
  end
end

class Vira < Player ; end
