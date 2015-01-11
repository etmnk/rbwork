# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

IR_TEST_DATA = [
  ["3:5b8","3:de0"],
  ["1:8", "1:8"],
  ["2:8", "2:4"],
  ["2:4", "2:1"],
  ["2:1", "2:2"],
  ["9:112233445566778899aab","9:b23da9011d22daf005d40"],
]

IR_TEST_DATA.each do |td|
  describe "ImageRotation #{td[0]}" do
    let(:img_r) { ImageRotation.new }
    before do
      img_r.input(td[0])
      img_r.convert
    end
    it_is_asserted_by { img_r.output == td[1] }
  end
end
