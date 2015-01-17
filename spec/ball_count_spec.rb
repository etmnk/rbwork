# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

B_C_TEST_DATA = <<EOS
s -> 010
sss -> 010,020,100
bbbb -> 001,002,003,000
ssbbbb -> 010,020,021,022,023,000
hsbhfhbh -> 000,010,011,000,010,000,001,000
psbpfpbp -> 100,110,111,200,210,000,001,100
ppp -> 100,200,000
ffffs -> 010,020,020,020,100
ssspfffs -> 010,020,100,200,210,220,220,000
bbbsfbppp -> 001,002,003,013,023,000,100,200,000
sssbbbbsbhsbppp -> 010,020,100,101,102,103,100,110,111,100,110,111,200,000,100
ssffpffssp -> 010,020,020,020,100,110,120,200,210,000
EOS

B_C_TEST_DATA.each_line do |td|
  input,assert = td.chomp.split(' -> ')
  describe "BallCount #{td[0]}" do
    let(:bc) { BallCount.new(input) }
    before do
      bc.count
    end
    it_is_asserted_by { bc.output.join(",") == assert }
  end
end