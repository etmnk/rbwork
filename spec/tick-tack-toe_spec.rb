# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

TTT_TEST_DATA = [
  ["79538246","x won."],
  ["4319581","Foul : x won."],
  ["965715","o won."],
  ["618843927","Foul : o won."],
  ["972651483927","Draw game."],
]

TTT_TEST_DATA.each do |td|
  describe "TickTackToe #{td[0]}" do
    let(:ttt) { TickTackToe.new }
    before do
      ttt.input(td[0])
    end
    it_is_asserted_by { ttt.result == td[1] }
  end
end
