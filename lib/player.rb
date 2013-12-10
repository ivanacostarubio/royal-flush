class Player
  attr_reader :cards
  attr_accessor :nickname

  def initialize(nickname=nil)
    @cards = Array.new
    @nickname = nickname
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

  def delete_card(card)
    cards.delete_if { |x| x == card }
  end
end

class Vira < Player 

  def card
    cards[0]
  end
  
end
