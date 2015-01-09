# coding: utf-8

#http://nabetani.sakura.ne.jp/yokohamarb/2014.10.rotcell/

class MeguruCell
  attr_reader :table, :arround_value
  def initialize
    @table = [
      %w[a b c d e],
      %w[f g h i j],
      %w[k l m n o],
      %w[p q r s t],
      %w[u v w x y]
    ]
    @arround_cell = [
      [-1,1],
      [0,1],
      [1,1],
      [1,0],
      [1,-1],
      [0,-1],
      [-1,-1],
      [-1,0]
    ]
    @arround_value = []
  end
  def check_str(str)
    str.each_char do |c|
      current = current_slots(c)
      cell = arround_cell(current[0],current[1])
      @arround_value << cell.map do |y,x|
        @table[y][x]
      end

      shifted_value = rotate_cell(@arround_value.last,c)
      cell.each_with_index do |(y,x), index|
        @table[y][x] = shifted_value[index]
      end
    end
  end
  def current_slots(c)
    @table.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if col == c.downcase
          return [i ,j]
        end
      end
    end
  end
  def arround_cell(i, j)
    @arround_cell.map do |(y, x)|
      next if !(0...5).include?(i + y)
      next if !(0...5).include?(j + x)
      [i + y,j + x]
    end.compact
  end
  def rotate_cell(value,c)
    if (c =~ /[A-Z]/)
      value.rotate!(1)
    else
      value.rotate!(-1)
    end
  end
end
