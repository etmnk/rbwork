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
 
#input = "44,46,45,43"
#tetro = Tetromino.new(input)
#pp tetro.table
#tetro.check_data
#pp tetro.result.to_s
