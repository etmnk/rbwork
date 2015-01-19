# coding: utf-8
# http://nabetani.sakura.ne.jp/kanagawa.rb/evalex/
# https://code.stypi.com/metxxdvp

module Kana01
  class Calculator
    def self.evaluate(str)
      %w(| & + *).each_with_object(str.dup) { |op, e| while e.sub!(/\d+#{"#{Regexp.escape(op)}"}\d+/) { |s| eval(s) }; end }
    end
  end 
end

#str = "1*2*3*4*5*6*7*8*9*10"
#p eval(evaluate(str))
