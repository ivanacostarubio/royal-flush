class Judge

  def initialize(cards)
    @cards = cards
  end

  def pair?
    check_for_identical_values?(2)
  end

  def trio?
    check_for_identical_values?(3)
  end

  def four_of_a_kind?
    check_for_identical_values?(4)
  end

  def flush?
   @cards.group_by {|card| card.suit }.keys.size == 1
  end

  def royal_flush?
    flush? && straight_to_ace?
  end

  private

  def straight_to_ace?
    group = group_cards_by_value(@cards)
    group.keys.include?(:A) &&
    group.keys.include?(:K) &&
    group.keys.include?(:Q) &&
    group.keys.include?(:J) &&
    group.keys.include?(:"10")
  end

  def check_for_identical_values?(number_of_identical_values)
    group = group_cards_by_value(@cards)
    has_same_value_card?(number_of_identical_values, group)
  end

  def group_cards_by_value(cards)
    cards.group_by {|card| card.value }
  end

  def has_same_value_card?(number, group)
    flag = false
    group.each_pair do |k,v|
      flag = true if v.size == number
    end
    flag
  end
end


