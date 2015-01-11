# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

BT_TEST_DATA = [
  ["ff-2f-23-f3-77-7f-3b","1f-03-00-1c-0d-0f-06"],
  ["01","00"],
  ["00","00"],
  ["7a-4e","0c-02"],
  ["56-b6","08-14"],
  ["12-12-12","00-00-00"],
]

BT_TEST_DATA.each do |td|
  describe "BitTetris #{td[0]}" do
    let(:bit) { BitTetris.new }
    before do
      bit.input(td[0])
    end
    it_is_asserted_by { bit.output == td[1] }
  end
end
