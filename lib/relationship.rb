# coding:utf-8
# http://nabetani.sakura.ne.jp/hena/ord6kinship/

require 'pp'

class Relationship
  attr_reader :aidagara, :family

  def initialize(relation)
    @family_t = (2..40).each_slice(3).to_a
    @family = @family_t.each_with_object({}).with_index(1) do |(t, obj), i|
      obj[i] = t
    end
    @aidagara = nil
  end

  def process

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
relationship = Relationship.new(relation)
pp relationship.family