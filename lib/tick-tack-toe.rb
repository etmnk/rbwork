# coding: utf-8

# http://nabetani.sakura.ne.jp/hena/1/

class TickTackToe
  attr_reader :table, :judge, :result

  def initialize
    #@table = (1..9).inject([]){|table,_| table << '0'}.each_slice(3).to_a
    @table = (1..9).inject([]){|table,_| table << '0'}
    @judge_table = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7],
    ].map! do |judge_row|
      judge_row.map! do |row|
        row-=1
      end
    end
    @result = nil
  end

  def input(points)
    point = points.split("")
    point.each_with_index do |poi, i|
      unless @result.nil?
        return
      end
      # 先行 o
      if i % 2 == 0
        judge_point(true, poi)
        # 後攻 x
      else
        judge_point(false, poi)
      end
    end
    @result = 'Draw game.' if @result.nil?
  end

  def judge_point(is_first, point)
    hands = is_first ? 'o' : 'x'
    winner = is_first ? 'x' : 'o'
    check = is_first ? '1' : '2'

    unless @table.include?('0')
      @result = 'Draw game.'
      return
    end

    if @table[point.to_i-1] != '0'
      @result = "Foul : #{winner} won."
    else
      @table[point.to_i-1] = check
      @judge_table.each do |judge_row|
        if (
          (check == @table[judge_row[0]]) &&
          (check == @table[judge_row[1]]) &&
          (check == @table[judge_row[2]])
          )
          @result = "#{hands} won."
        end
      end
    end
  end
end
