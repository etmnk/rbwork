# coding:utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

YNODE_TEST_DATA = [
  ["b", "AB"],
  ["l", "AD"],
  ["r", "AC"],
  ["bbb", "ABAB"],
  ["rrr", "ACBA"],
  ["blrllrlbllrrbr", "ABCFDABCBEFDEDA"],
  ["lbrbbrllllrblrr", "ADABABEFCBEDEBCF"],
  ["rrrrbllrlrbrbrr", "ACBACABCFDEDADFC"],
]

YNODE_TEST_DATA.each do |td|
  describe "YNode #{td[0]}" do
    let(:ynode) { YNode.new(td[0]) }

    it_is_asserted_by { ynode.get_next == td[1] }
  end
end 