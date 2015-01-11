# coding: utf-8
# http://qiita.com/Nabetani/items/9d80de41903775296ca6

class ImageRotation
  attr_reader :inp_bin_arr, :output_val

  def input(wid_hex)
    @input_val = wid_hex
    @inp_wid, @inp_hex = @input_val.split(":")
    @inp_bin = sprintf("%0#{@inp_hex.length*4}b",@inp_hex.to_i(16))
    @inp_bin_arr = @inp_bin[0,@inp_wid.to_i*@inp_wid.to_i]
      .split("")
      .each_slice(@inp_wid.to_i)
      .to_a
  end

  def convert
    conv_arr = @inp_bin_arr.transpose
    conv_val = conv_arr.inject([]) do |arr, n|
      arr << n.reverse!
    end.join
    conv_val +=  '0' * ((4*@inp_hex.length) - (@inp_wid.to_i*@inp_wid.to_i))
    @output_val = conv_val.to_i(2)
  end

  def output
    @inp_wid + ":" + sprintf("%0#{@inp_hex.size}x",@output_val)
  end
end
