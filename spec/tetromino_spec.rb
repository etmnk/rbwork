# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

TETRO_TEST = <<EOS
55,55,55,55 -
39,28,27,29 L
63,62,43,53 L
32,42,43,44 L
44,46,45,43 I
04,24,14,34 I
43,42,41,40 I
48,38,58,68 I
31,20,22,21 T
69,79,78,89 T
42,33,44,43 T
16,25,05,15 T
27,37,28,38 O
13,24,23,14 O
63,72,62,73 O
73,63,62,74 S
56,57,47,66 S
88,99,98,87 S
97,76,96,77 -
21,32,11,12 -
73,75,65,64 -
64,65,45,54 -
81,80,93,82 -
51,61,30,41 -
17,37,35,15 -
EOS
 
TETRO_TEST.each_line do |td|
  input,expect = td.chomp.split(' ')
  describe "Tetromino #{td[0]}" do
    let(:tetro) { Tetromino.new(input) }
    before do
      tetro.check_data
    end
    #it_is_asserted_by { tetro.result.to_s == expect }
    it { tetro.result.to_s == expect }
  end
end