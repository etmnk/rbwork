# coding:utf-8
# http://qiita.com/Nabetani/items/9c514267214d3917edf2
require 'pp'
 
class Hukashigi
  attr_reader :table,:count

  def initialize(str)
    @str = str.split(" ")
    @first = 'a'
    @last = 'i'
    @wid = 3
    @table = (@first..@last).each_slice(@wid).to_a
    @high = @table.length
    @count = 0
    @route = []
    @stop = []
    @next_step = []
  end

  def arround(i, j)
    @route << [i,j]
    pp @route
 
    [[-1,0],[0,-1],[1,0],[0,1]].each do |x,y|
      #pp i+y,j+x
      #pp x,y
      next unless (0...@wid).include?(j+x)
      next unless (0...@high).include?(i+y)
      # 通ってきた道順はスキップ
      next if @route.find {|r| r == [i+y, j+x]}
      #next if @stop.find {|s| s == [i+y, j+x]}
      if @table[i+y][j+x] == @last
        p 'last'
        @count += 1
        next
      end
      @next_step << [i+y,j+x]
      
    end

    while @next_step.length > 0
      next_y,next_x = @next_step.pop
      arround(next_y,next_x)
    end
  end
end
 
hukashigi = Hukashigi.new("")
pp hukashigi.table
hukashigi.arround(0,0)
pp hukashigi.count
 
# 8512 4*4
# 184 3*3
# 12 2*2

