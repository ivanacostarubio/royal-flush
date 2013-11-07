class Dealer

  attr_accessor :deck, :hand

  def initialize 
    @deck = Deck.new
    @hand = Hand.new
  end

  def deal_to_player(player)
    player.cards << @deck.cards.pop
  end

  def flop
    3.times{ |n| deal }
  end

  def initial_truco
    3.times { |n| player.cards << @deck.cards.pop  }
  end

  def hand
    @hand
  end


  def deal
    @hand.cards << @deck.cards.pop
  end

  alias :river :deal ; alias  :turn :deal
end


