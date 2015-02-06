# coding:utf-8
# http://nabetani.sakura.ne.jp/hena/ord6lintersection/

require 'pp'

class Lintersection

  def initialize(coord)
    interA_coord,interB_coord = coord.split(",")
    
    @tableA = Array.new(10) {Array.new(10,0)}
    @tableB = Array.new(10) {Array.new(10,0)}
  
  end

end

coord = "23-94-28,89-06-51"
lint = Lintersection.new(coord)