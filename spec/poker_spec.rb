# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

POKER_TEST_DATA = [
  ["D3C3C10D10S3","FH"],
  ["S8D8H8S10CJ","3K"],
  ["S8D10HJS10CJ","2P"],
  ["S8H8D2C3C4","1P"],
  ["S8H7D2C3C4","--"],
]

POKER_TEST_DATA.each do |td|
  describe "Poker #{td[0]}" do
    let(:poker) { Poker.new }

    before do
      poker.get_card(td[0])
    end

    it_is_asserted_by { poker.show_hand == td[1] }
  end
end
