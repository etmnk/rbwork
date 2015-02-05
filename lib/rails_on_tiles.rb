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
    @next_posit = {up: [0,-1], right: [1,0], down: [0,1], left: [-1,0]}
    @next_cur = {down: [:right, :left], right: [:down, :up], up: [:left, :right], left: [:up, :down]}
  end

  def process(x,y)
    return unless (0...3).include?(x)
    return unless (0...3).include?(y)

    @pass << @tiles[y][x]
    change_rail(@rails[y][x])
    next_x,next_y = @next_posit[@cur]
    process(x + next_x, y + next_y)
  end

  def change_rail(n)
    @cur = @next_cur[@cur][n.to_i - 1]
  end

end

#rails = "101221102"
#rails = "000000000"
#rot = RailsOnTiles.new(rails)
#rot.process(1,0)
#p rot.pass.join
