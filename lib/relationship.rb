# coding:utf-8
# http://nabetani.sakura.ne.jp/hena/ord6kinship/

require 'pp'

class Relationship
  attr_reader :aidagara, :family

  def initialize
    @family_t = (2..40).each_slice(3).to_a
    @family = @family_t.each_with_object({}).with_index(1) do |(t, obj), i|
      obj[i] = t
    end
  end

  def process(relation)
    from, to = relation.split("->").map(&:to_i)
    check_relation(from,to)
  end

  def check_relation(from, to)
    if from == to
      return "me"
    elsif @family[to].find {|item| item == from}
      return "mo"
    elsif @family[from].find {|item| item == to}
      return "da"
    elsif (Math.abs(from - to) <= 2) && Math.abs((from + to / 2) - from) == 1
      return "si"
    elsif level(from) - 1 == level(to)
      return "au"
    elsif level(from) == level(to) + 1
      return "au"
    elsif level(from) == level(to)
      return "co"
    else
      return "-"
    end
      
  end

  def level(num)
    case num
    when 1
      return 1
    when 2..4
      return 2
    when 5..13
      return 3
    else
      return 4
    end
  end

end

relation = "5->2"
relationship = Relationship.new
#pp relationship.family
aidagara = relationship.process(relation)
pp aidagara