# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

MEGURU_CELL_TEST_DATA = [
  [ "YokoHamarb", "acdfp" ],
  [ "Ruby", "twx" ],
  [ "ruby", "nst" ],
  [ "PHP", "gkluv" ],
  [ "a", "bfg" ],
  [ "b", "acfgh" ],
  [ "m", "ghilnqrs" ],
  [ "mg", "bcdhilmq" ],
  [ "Mg", "fhiklmpq" ],
  [ "MS", "ijmnoqrt" ],
  [ "mG", "bcdhilmq" ],
  [ "lf", "abcghklp" ],
  [ "paq", "lprvw" ],
  [ "bFH", "abcfg" ],
  [ "Agh", "abcfgklm" ],
  [ "Msul", "pruvw" ],
  [ "RSRX", "jorty" ],
  [ "xTsn", "ijmos" ],
  [ "FHwnQ", "lmorsvwx" ],
  [ "jIDIb", "cfghilmo" ],
  [ "rLGPq", "ilmnprvx" ],
  [ "WRiFhd", "ceg" ],
  [ "gkfLfh", "cfglmpqr" ],
  [ "STydYQ", "hklmpruv" ],
  [ "spaeAWJ", "cdehimns" ],
  [ "xTxTXwY", "mwx" ],
  [ "xyQMkMi", "cdejlnow" ],
  [ "HJkxpWxA", "cdhkp" ],
  [ "hgaGDodg", "djo" ],
  [ "abKBmkBc", "bdfik" ],
  [ "mCvlhnilm", "adfgikqr" ],
  [ "StyxTYsIh", "imnostxy" ],
  [ "HLHnhLMLC", "ahlmn" ],
  [ "DuHmbFQysI", "ehj" ],
  [ "cGfGCaLgCq", "acguv" ],
  [ "OisYOrOXwq", "ilnstvwx" ],
  [ "wMnYIukHAvO", "bdefhjmn" ],
  [ "HCfBhKHkhDF", "abdghikn" ],
  [ "pUPmwrHsYSH", "morsy" ],
  [ "PnCYYWnPoUxq", "bfopv" ],
  [ "DiojiYXowowr", "cilmnstw" ],
  [ "HLNsiNMnbAnn", "abdkm" ],
]

MEGURU_CELL_TEST_DATA.each do |td|
  describe "MeguruCell #{td[0]}" do
    let(:cell) { MeguruCell.new }

    before do
      cell.check_str(td[0])
    end
    it_is_asserted_by { cell.arround_value.last.sort.join == td[1] }
  end
end
