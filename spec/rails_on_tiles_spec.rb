# coding:utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

ROT_TD = <<-EOS
101221102 BEDGHIFEH
000000000 BEH
111111111 BCF
222222222 BAD
000211112 BEFIHEDGH
221011102 BADGHIFEBCF
201100112 BEHIFCBADEF
000111222 BEFIH
012012012 BC
201120111 BEDABCFI
220111122 BADEHGD
221011022 BADG
111000112 BCFIHEBA
001211001 BEFI
111222012 BCFEHIF
220111211 BADEHI
211212212 BCFEBAD
002112210 BEFC
001010221 BEF
100211002 BEFIHG
201212121 BEFCBAD
EOS

ROT_TD.each_line do |td|
  input,expect = td.chomp.split(' ')
  describe "Rails on Tiles #{input}" do
    let(:rot) { RailsOnTiles.new(input) }
    before do
      rot.process(1,0)
    end
    #it_is_asserted_by
    it { rot.pass.join == expect }
  end
end