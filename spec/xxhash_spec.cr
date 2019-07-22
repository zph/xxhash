require "./spec_helper"

T = "test"
S = 12345

describe XXHash do
  describe "digests" do
    it "xxh32" do
      XXHash.xxh32(T, S).should eq(3834992036)
    end

    it "xxh64" do
      XXHash.xxh64(T, S).should eq(7624679986283906467)
    end

    it "xxh3_64" do
      XXHash.xxh3_64(T, S).should eq(2936241905692116048)
    end

    it "xxh128" do
      expected = LibXXHash::Xxh128HashT.new
      expected.low = 2936241905692116048
      expected.high = 5804800359616432165
      XXHash.xxh128(T, S).should eq(expected)
    end
  end
end
