# coding:utf-8
# http://nabetani.sakura.ne.jp/hena/ord28spirwa/

require 'pp'

class CrossWall
  attr_reader :world,:vector

  def initialize(str)
    wall_point, day = str.split(":")
    @day = day.to_i
    n,e,s,w = wall_point.split(",").map(&:to_i)
    @world = { [0,0] => true }
    init_create_wall({N: n, E: e,S: s, W: w})
    @point = [1,-1]
    @vector = :E
  end

  def init_create_wall(arround)
    arround.each do |way,point|
      if way == :N
        point.times do |i|
          @world[[0,-1-i]] = true
        end
      elsif way == :E
        point.times do |i|
          @world[[1+i,0]] = true
        end
      elsif way == :W
        point.times do |i|
          @world[[-1-i,0]] = true
        end
      elsif way == :S
        point.times do |i|
          @world[[0,1+i]] = true
        end
      end
    end

  end

  def process
    @day.times do
      x = @point.first
      y = @point.last
      @world[[x,y]] = true

      if vector == :E
        if @world[[x,y+1]]
          if @world[[x+1,y]]
            @point = [x,y-1]
            @vector = :N
          else
            @point = [x+1,y]
          end
        else
          @point = [x,y+1]
          @vector = :S
        end
      elsif vector == :S
        if @world[[x-1,y]]
          if @world[[x,y+1]]
            @point = [x+1,y]
            @vector = :E
          else
            @point = [x,y+1]
          end
        else
          @point = [x-1,y]
          @vector = :W
        end
      elsif vector == :W
        if @world[[x,y-1]]
          # 行き止まりか
          if @world[[x-1,y]]
            @point = [x,y+1]
            @vector = :S
          else
            @point = [x-1,y]
          end
        # 北に向かう
        else
          @point = [x,y-1]
          @vector = :N
        end
      elsif vector == :N
        if @world[[x+1,y]]
          # 行き止まりか
          if @world[[x,y-1]]
            @point = [x-1,y]
            @vector = :W
          else
            @point = [x,y-1]
          end
        # 東に向かう
        else
          @point = [x+1,y]
          @vector = :E
        end
      end
    end
  end

end

C_WALL_TD = <<EOS
2,3,5,4:85 S
1,2,3,4:1 E
1,2,3,4:2 S
3,3,3,3:72 E
1,1,1,1:7 N
1,2,1,1:7 W
1,6,1,1:7 S
1,8,1,1:7 E
1,1,1,1:30 N
2,5,1,6:33 E
1,2,5,7:34 N
3,6,5,6:36 E
6,2,8,1:39 S
4,6,4,1:78 E
7,5,3,6:79 W
1,4,2,3:92 N
1,3,4,5:93 W
2,4,8,1:94 W
3,6,1,7:99 S
EOS

C_WALL_TD.each_line do |td|
  input,expect = td.chomp.split(' ')
  describe "CrossWall #{td[0]}" do
    let(:cw) { CrossWall.new(input) }
    before do
      cw.process
    end
    #it_is_asserted_by { }
    it { cw.vector.to_s == expect }
  end
end

=begin
large_wall = <<EOS
1234,2345,3456,4567:978593417
1234,2345,3456,4567:978593418
31415,92653,58979,32384:9812336139
31415,92653,58979,32384:9812336140
314159,265358,979323,84626:89099331642
314159,265358,979323,84626:89099331643 
EOS

#str2 = "1,2,3,4:2"
#str = "2,3,5,4:85"

large_wall.each_line do |lw|
  lcw = CrossWall.new(lw)
  #pp cw.world
  lcw.process
  #pp cw.world
  pp lcw.vector
end

=end

__END__


