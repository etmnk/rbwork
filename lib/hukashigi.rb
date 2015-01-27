# coding:utf-8
# http://qiita.com/Nabetani/items/9c514267214d3917edf2
require 'pp'

class Hukashigi
  attr_reader :table,:count,:node,:stop
  
  def initialize(str)
    @stop = str.split(" ")
    @first = 'a'
    @last = 'y'
    @wid = 5
    @table = (@first..@last).each_slice(@wid).to_a
    @high = @table.length
    @count = 0
    @node = {}
    @done = {}
  end
  
  def make_node
    arround = []
    @table.each_with_index do |row, i|
      row.each_with_index do |col, j|
        [[-1,0],[0,-1],[1,0],[0,1]].each do |x,y|
          next unless (0...@wid).include?(j+x)
          next unless (0...@high).include?(i+y)
          arround << @table[i+y][j+x]
        end
        @node[@table[i][j]] = arround
        arround = []
      end
    end
    
    @stop.each do |stop|
      stop_str = stop.split('')
      @node[stop_str.first].delete_if do |item|
        item == stop_str.last
      end
      @node[stop_str.last].delete_if do |item2|
        item2 == stop_str.first
      end
    end
  end
  
  def get_node(i)
    return if @done[i]
    if i == @last
      @count += 1
      return
    end
    @done[i] = true
    @node[i].each do |j|
      get_node(j)
    end
    @done[i] = false
  end
end

hukashigi = Hukashigi.new("af pq qr rs st di in ns sx")
pp hukashigi.table
pp hukashigi.stop
hukashigi.make_node
#pp hukashigi.node
hukashigi.get_node('a')
pp hukashigi.count

# 8512 4*4
# 184 3*3
# 12 2*2