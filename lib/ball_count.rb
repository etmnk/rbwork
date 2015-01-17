# coding: utf-8
# http://qiita.com/Nabetani/items/ebd8a56b41711ba459f9

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

#bc = BallCount.new("ssspfffs")
#bc.count
#p bc.output.join(",") 
