# coding: utf-8
# http://nabetani.sakura.ne.jp/hena/ord2/

class BitTetris

  def input(hexstr)
    hex_array = hexstr.split("-")
    bit_array = hex_array.each_with_object([]) do |hexstr, bitarray|
      bitarray << sprintf("%08b",hexstr.to_i(16)).split(//)
    end

    @output_val = bit_array
  end

  def output
    @output_val = @output_val.transpose

    @output_val.delete_if do |array|
      array.all? do |str|
        str == "1"
      end
    end

    @output_val = @output_val.transpose
    output_str = @output_val.inject([]) do |array, val|
      array << sprintf("%02x",val.join.to_i(2))
    end
    output_str.join("-")
  end
end
