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

#hukashigi = Hukashigi.new("af pq qr rs st di in ns sx")
#hukashigi.make_node
#hukashigi.get_node('a')
#pp hukashigi.count

# 8512 4*4
# 184 3*3
# 12 2*2

HUKASHIGI_TD =<<EOS
"" -> 8512
"af" -> 4256
"xy" -> 4256
"pq qr rs st di in ns sx" -> 184
"af pq qr rs st di in ns sx" -> 92
"bg ch di ij no st" -> 185
"bc af ch di no kp mr ns ot pu rs" -> 16
"ab af" -> 0
"ty xy" -> 0
"bg ch ej gh lm lq mr ot rs sx" -> 11
"ty ch hi mn kp mr rs sx" -> 18
"xy ch hi mn kp mr rs sx" -> 32
"ch hi mn kp mr rs sx" -> 50
"ab cd uv wx" -> 621
"gh mn st lq qr" -> 685
"fg gl lm mr rs" -> 171
EOS

HUKASHIGI_TD.each_line do |td|
  input,expect = td.chomp.split(' -> ').first.gsub('"','')
  describe "Tetromino input" do
    let(:hukashigi) { Hukashigi.new(input) }
    before do
      hukashigi.make_node
      hukashigi.get_node('a')
    end
    #it_is_asserted_by { hukashigi.count == expect.to_i }
    it { hukashigi.count == expect.to_i }
  end
end

__END__
