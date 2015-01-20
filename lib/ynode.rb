# coding:utf-8
# http://nabetani.sakura.ne.jp/hena/ord3ynode/

require 'rspec-power_assert'

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
    #h = { 'BA' => {'l'=> 'D','r' => 'C'}}
  end

  def get_next
    p @str
    p @node['A']['l']
  end
end

str = "l"
node = YNode.new(str)
node.get_next