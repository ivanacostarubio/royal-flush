class Deck

  def initialize
    @valid_suits = Card.valid_suits
    @valid_values = Card.valid_values
    @stack = Array.new

    @valid_suits.each do |suit|
      @valid_values.each{|value | @stack << Card.new(suit, value)}
    end

    self.shuffle
  end

  def shuffle
    @stack.shuffle!
  end

  def cards ; @stack ; end

end
