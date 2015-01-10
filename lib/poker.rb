# coding: utf-8

# http://qiita.com/Nabetani/items/cbc3af152ee3f50a822f

class Poker
  attr_reader :cards

  def initialize
    init_param
  end

  def init_param
    @card_num = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    @card_suit = %w(S H D C)
    @hands = %w(4K FH 3K 2P 1P --)
    @suit = "[" + @card_suit.join("|") + "]"
    @num = "[" + @card_num.join("|") + "]"
  end

  def get_card(cards)
    @cards = cards.scan(/(#{@suit}+#{@num}+)+?/)
  end

  def show_hand
    num_array = @cards.join.scan(/(#{@num}+).?/)
    num_group = num_array.group_by{ |a| a }.values.map(&:size).sort

    if num_group == [1,4]
      @hands[0]
    elsif num_group == [2,3]
      @hands[1]
    elsif num_group == [1,1,3]
      @hands[2]
    elsif num_group == [1,2,2]
      @hands[3]
    elsif num_group == [1,1,1,2]
      @hands[4]
    else
      @hands[5]
    end
  end
end
