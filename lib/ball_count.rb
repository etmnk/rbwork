# coding: utf-8
# http://qiita.com/Nabetani/items/ebd8a56b41711ba459f9
require 'rspec-power_assert'

class BallCount
  attr_reader :output
  def initialize(input)
    @out = 0
    @strike = 0
    @ball = 0
    @input = input.split(//)
  end
  def count
    @output = @input.inject([]) do |output, i|
      if i == "s"
        if @strike <= 1
          @strike += 1
        else
          @strike = 0
          @out += 1
        end
      elsif i == "b"
        if @ball <= 2
          @ball += 1
        else
          @ball = 0
          @strike = 0
        end
      elsif i == "f"
        @strike = 0
        @ball = 0
        if @out <= 2
          @out += 1
        else
          @out = 0
          @strike = 0
          @ball = 0
        end
      elsif i == "h"
        @strike = 0
        @ball = 0
      elsif i == "p"
        @strike = 0
        @ball = 0
        if @out <= 2
          @out += 1
        else
          @out = 0
          @strike = 0
          @ball = 0
        end
      else
      end
      output << @out.to_s + @strike.to_s + @ball.to_s
    end
  end
end


B_C_TEST_DATA = [
  ["s", "010"],
  ["sss", "010,020,100"],
]
B_C_TEST_DATA.each do |td|

end

bc = BallCount.new("ssbbbb")
bc.count
p bc.output.join(",") 
