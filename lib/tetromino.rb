# coding:utf-8
# http://nabetani.sakura.ne.jp/hena/ord4tetroid/
 
require 'pp'
require 'rspec-power_assert'
 
class Tetromino
  attr_reader :table,:tetra,:result
  
  def initialize(str)
    @table = Array.new(10) { Array.new(10,0) }
    @tetra = {
      L: [[1,0],[1,0],[1,1]],
      I: [[1],[1],[1],[1]],
      T: [[1,1,1],[0,1,0]],
      O: [[1,1],[1,1]],
      S: [[1,0],[1,1],[0,1]],
    }
    @input = str.split(',')
    @result = '-'
    input_data
  end
  
  def input_data
    x_a = []
    y_a = []
    @input.each do |input_data|
      coold = input_data.chars.map(&:to_i)
      x = coold.first
      y = coold.last
      x_a << x
      y_a << y
      @table[x][y] = 1
    end
    @input_tetra = @table[x_a.min, x_a.max - x_a.min + 1]
    @input_tetra = @input_tetra.each_with_object([]) do |tetra,ary|
      ary << tetra[y_a.min, y_a.max - y_a.min + 1]
    end
    #pp @input_tetra
  end
  
  def check_data
    @tetra.each do |key,value|
      3.times do
        value_r = value.inject([]) do |arr,n|
          arr << n.reverse
        end
=begin
        print "key ", key
        print "\n"
        print "value ",value
        print "\n"
        print "value_r ",value_r
        print "\n"
=end
 
        if value == @input_tetra || value_r == @input_tetra
          @result = key
          return
        end
 
        value = value.transpose.inject([]) do |arr,n|
          arr << n.reverse
        end
        value_r = value_r.transpose.inject([]) do |arr,n|
          arr << n.reverse
        end
      end
    end
  end
end
 
input = "44,46,45,43"
tetro = Tetromino.new(input)
#pp tetro.table
tetro.check_data
#pp tetro.result.to_s
 
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
 
__END__