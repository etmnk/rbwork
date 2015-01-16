# coding: utf-8
# http://qiita.com/Nabetani/items/ebd8a56b41711ba459f9
require 'rspec-power_assert'

class BallCount
  attr_reader :output
  def initialize(input)
    @out = @strike = @ball = 0
    @input = input.split(//)
  end
  def count
    @output = @input.inject([]) do |output, i|
      case i
      when "s" then
        if @strike <= 1
          @strike += 1
        else
          @strike = @ball = 0
          @out = @out <= 1 ? @out + 1 : 0
        end
      when "b" then
        @ball <= 2 ? @ball += 1 : @ball = @strike = 0
      when "f" then
        @strike += 1 if @strike <= 1
      when "h" then
        @strike = @ball = 0
      when "p" then
        @strike = @ball = 0
        @out <= 1 ? @out += 1 : @out = 0
      end
      output << @out.to_s + @strike.to_s + @ball.to_s
    end
  end
end


B_C_TEST_DATA = <<EOS
s -> 010
sss -> 010,020,100
bbbb -> 001,002,003,000
ssbbbb -> 010,020,021,022,023,000
hsbhfhbh -> 000,010,011,000,010,000,001,000
psbpfpbp -> 100,110,111,200,210,000,001,100
ppp -> 100,200,000
ffffs -> 010,020,020,020,100
ssspfffs -> 010,020,100,200,210,220,220,000
bbbsfbppp -> 001,002,003,013,023,000,100,200,000
sssbbbbsbhsbppp -> 010,020,100,101,102,103,100,110,111,100,110,111,200,000,100
ssffpffssp -> 010,020,020,020,100,110,120,200,210,000
EOS

B_C_TEST_DATA.each_line do |td|
  input,assert = td.chomp.split(' -> ')
  describe "BallCount #{td[0]}" do
    let(:bc) { BallCount.new(input) }
    before do
      bc.count
    end
    it_is_asserted_by { bc.output.join(",") == assert }
  end
end

#bc = BallCount.new("ssspfffs")
#bc.count
#p bc.output.join(",") 
