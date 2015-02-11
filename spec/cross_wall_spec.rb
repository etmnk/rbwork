# coding:utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

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