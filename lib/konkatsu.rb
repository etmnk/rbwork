# coding: utf-8

KK_MEMBERS = [
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

class KMembers
  attr_reader :name, :kibou, :sex
  attr_accessor :flag

  def initialize(entry)
    @name = entry[:name]
    @kibou = entry[:kibou]
    @sex = entry[:sex]
    @flag = false
  end
end

class Konkatsu
	attr_reader :pair
  def initialize(kk_members)
    @k_member = kk_members.each_with_object([]) do |entry, k_member|
      k_member << KMembers.new(entry)
    end
    @men = @k_member.select {|member| member.sex == "m"}
    @women = @k_member.select {|member| member.sex == "f"}
    @pair = []
  end

  def make_pair
  	# 第一希望から第三希望まで
    1.upto(3) do |i|
      @men.each do |man|
        @women.each do |woman|
          if ((man.flag.! && woman.flag.!) &&
            (woman.kibou[0,i].find {|w_kibou| w_kibou == man.name} &&
            man.kibou[0,i].find {|m_kibou| m_kibou == woman.name}))
            man.flag, woman.flag = true, true
            @pair << man.name + "-" + woman.name
          end
        end
      end
    end
  end
end

#k_member = Konkatsu.new(KK_MEMBERS)
#k_member.make_pair
#p k_member.pair

#A-a
#B-f
#C-b
__END__
