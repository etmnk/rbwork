# coding:utf-8
# http://nabetani.sakura.ne.jp/hena/ord5railsontiles/

require 'pp'

class RailsOnTiles
  attr_reader :rails,:pass

  def initialize(tiles)
    @rails = tiles.chars.each_slice(3).to_a
    @tiles = [*'A'..'I'].each_slice(3).to_a
    @pass = []
    @cur = :down
  end

  def process(x,y)
    return unless (0...3).include?(x)
    return unless (0...3).include?(y)

    @pass << @tiles[y][x]
    change_rail(@rails[y][x])
    if @cur == :up
      process(x,y-1)
    elsif @cur == :right
      process(x+1,y)
    elsif @cur == :down
      process(x,y+1)
    elsif @cur == :left
      process(x-1,y)
    end
  end

  def change_rail(n)
    if n == "1"
      if @cur == :down
        @cur = :right
      elsif @cur == :right
        @cur = :down
      elsif @cur == :up
        @cur = :left
      elsif @cur == :left
        @cur = :up
      end
    elsif n == "2"
      if @cur == :down
        @cur = :left
      elsif @cur == :right
        @cur = :up
      elsif @cur == :up
        @cur = :right
      elsif @cur == :left
        @cur = :down
      end
    end
  end

end

#rails = "101221102"
rails = "000000000"
rot = RailsOnTiles.new(rails)
rot.process(1,0)
p rot.pass.join
