require "./*"

module XXHash
  def self.xxh64(str : String, seed : Number = 0) : Number
    LibXXHash.xxh64(str, str.size, seed.to_u64)
  end

  def self.xxh32(str : String, seed : Number = 0) : Number
    LibXXHash.xxh32(str, str.size, seed.to_u64)
  end

  def self.xxh3_64(str : String, seed : Number = 0) : Number
    LibXXHash.xxh3_64bits(str, str.size, seed.to_u64)
  end

  def self.xxh128(str : String, seed : Number = 0) : LibXXHash::XXH128Hash
    LibXXHash.xxh3_128bits(str, str.size, seed.to_u64)
  end
end
