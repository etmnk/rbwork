# coding:utf-8
# http://nabetani.sakura.ne.jp/hena/ord3ynode/

require 'rspec-power_assert'
require 'pp'

class YNode
  def initialize(str)
    @str = str.split(//)
    @route = []
    @back = 'B'
    @route << @back
    @current = 'A'

    @node = [
      %w(B A D C),
      %w(B C A F),
      %w(B E F D),
      %w(A D B F),
      %w(A C F B),
      %w(A B C E),
      %w(D F E C),
      %w(D E B E),
      %w(D A C B),
      %w(C A B D),
      %w(C B E A),
      %w(C F D E),
      %w(E B A C),
      %w(E D F A),
      %w(E F C D),
      %w(F C B A),
      %w(F E D B),
      %w(F D A E),
    ]
    @node_h = node_hash(@node)
    #h = { 'BA' => {'l'=> 'D','r' => 'C'}}
  end

  def node_hash(node)
    node.each_with_object({}) do |n, h|
      h["#{n[0]}#{n[1]}"] = {
        "l" => n[2],
        "r" => n[3]
      }
    end
  end

  def get_next
    #pp @str
    #pp @node_h
    @str.each do |s|

    end
  end
end

str = "l"
node = YNode.new(str)
node.get_next