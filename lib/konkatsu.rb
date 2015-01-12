# coding: utf-8

require 'rspec-power_assert'
require 'pp'
MEMBERS = [
  {name: "A",kibou: ["c","a","b"],sex: "m"},
  {name: "B",kibou: ["c","f","a"],sex: "m"},
  {name: "C",kibou: ["f","c","b"],sex: "m"},
  {name: "D",kibou: ["d","d","d"],sex: "m"},
  {name: "E",kibou: ["","",""],sex: "m"},
  {name: "F",kibou: ["e","c","a"],sex: "m"},
  {name: "a",kibou: ["A","D","F"],sex: "f"},
  {name: "b",kibou: ["C","B","A"],sex: "f"},
  {name: "c",kibou: ["D","A","C"],sex: "f"},
  {name: "d",kibou: ["A","A","B"],sex: "f"},
  {name: "e",kibou: ["C","A","E"],sex: "f"},
  {name: "f",kibou: ["D","B","A"],sex: "f"},
]

class Members
  attr_reader :name, :kibou, :sex
  attr_accessor :flag

  def initialize(entry)
    @name = entry[:name]
    @kibou = entry[:kibou]
    @sex = entry[:sex]
    @flag = false
  end
end

member = MEMBERS.each_with_object([]) do |entry, member|
  member << Members.new(entry)
end

men = member.select {|member| member.sex == "m"}
women = member.select {|member| member.sex == "f"}

# 第一希望から第三希望まで
1.upto(3) do |i|
  men.each do |man|
    women.each do |woman|
      if ((man.flag.! && woman.flag.!) &&
        (woman.kibou[0,i].find {|w_kibou| w_kibou == man.name} &&
        man.kibou[0,i].find {|m_kibou| m_kibou == woman.name}))
        man.flag, woman.flag = true, true
        print man.name , "-", woman.name, "\n"
      end
    end
  end
end

#A-a
#B-f
#C-b
__END__
