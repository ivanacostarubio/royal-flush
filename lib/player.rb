class Player
  attr_reader :cards

  def initialize
    @cards = Array.new
  end

  def cards
    @cards
  end

  def play(n)
    card = posible_moves[n]
    cards.reject!{ |c| c == card }
    card
  end

  def posible_moves
    h = Hash.new
    cards.count.times do |n|
      h[n + 1] = cards[n]
    end
    h
  end

  def display_posible_moves
    posible_moves.each_pair do |k,v|
      puts "#{k} | #{v.to_s}"
    end
    nil
  end

  def display_cards
    cards.each do |card|
      puts card.suit.to_s + " " + card.value.to_s
    end
    nil
  end
end

class Vira < Player ; end
