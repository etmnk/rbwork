# coding:utf-8
# http://nabetani.sakura.ne.jp/hena/ord28spirwa/

require 'pp'

class CrossWall
  attr_reader :world,:vector

  def initialize(str)
    wall_point, day = str.split(":")
    @day = day.to_i
    n,e,s,w = wall_point.split(",").map(&:to_i)

    e_wall = Array.new(e,1)
    w_wall = Array.new(w,1)
    ew_wall = [w_wall,1,e_wall].flatten
    @world = []

    (n+1+s).times do |i|
      if i == n
        @world.push(ew_wall)
      else
        @world.push(Array.new(e+w+1,0))
      end
    end

    @world.each do |row|
      row[w] = 1
    end

    @point = [n-1,w+1]
    @vector = :e
  end

  def process
    @day.times do
      y = @point.first
      x = @point.last

      if vector == :e
        if @world[y+1][x] == 1
          @world[y][x] = 1
          if @world[y][x+1] == 1
            @point = [y-1,x]
            @vector = :n
          else
            @point = [y,x+1]
          end
        else
          @world[y][x] = 1
          @point = [y+1,x]
          @vector = :s
        end
      elsif vector = :s

      elsif vector = :w

      elsif vector = :n

      end
    end
  end

end

str2 = "1,2,3,4:1"
str = "2,3,5,4:85"
cw = CrossWall.new(str2)
pp cw.world
#cw.process
#pp cw.vector