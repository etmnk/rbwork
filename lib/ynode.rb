# coding:utf-8
# http://nabetani.sakura.ne.jp/hena/ord3ynode/

require 'rspec-power_assert'

class YNode
  def initialize(str)
    @str = str.split(//)
    @route = []
    @route << 'B'
    @next = 'A'

    @node = {
      'A' => {
        'l' => 'D',
        'r' => 'C'
      },
      'D' => {
        'l' => 'E',
        'r' => 'F'
      }
    }
  end

  def get_next
    p @str
    p @node['A']['l']
  end
end

str = "l"
node = YNode.new(str)
node.get_next