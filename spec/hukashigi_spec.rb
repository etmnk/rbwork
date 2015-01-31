# coding:utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

HUKASHIGI_TD =<<EOS
"" -> 8512
"af" -> 4256
"xy" -> 4256
"pq qr rs st di in ns sx" -> 184
"af pq qr rs st di in ns sx" -> 92
"bg ch di ij no st" -> 185
"bc af ch di no kp mr ns ot pu rs" -> 16
"ab af" -> 0
"ty xy" -> 0
"bg ch ej gh lm lq mr ot rs sx" -> 11
"ty ch hi mn kp mr rs sx" -> 18
"xy ch hi mn kp mr rs sx" -> 32
"ch hi mn kp mr rs sx" -> 50
"ab cd uv wx" -> 621
"gh mn st lq qr" -> 685
"fg gl lm mr rs" -> 171
EOS

HUKASHIGI_TD.each_line do |td|
  input,expect = td.chomp.split(' -> ').first.gsub('"','')
  describe "Tetromino input" do
    let(:hukashigi) { Hukashigi.new(input) }
    before do
      hukashigi.make_node
      hukashigi.get_node('a')
    end
    #it_is_asserted_by { hukashigi.count == expect.to_i }
    it { hukashigi.count == expect.to_i }
  end
end