require "./*"
module XXHash
  VERSION = "0.1.0"

  def self.h64(str : String, seed : Number = 0) : Number
    LibXXHash.xxh64(str, str.size, seed.to_u64)
  end

  def self.h32(str : String, seed : Number = 0) : Number
    LibXXHash.xxh32(str, str.size, seed.to_u64)
  end
end
