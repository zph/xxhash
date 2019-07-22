# Include statement used by crystal_lib for autogenerating Fn signatures
@[Include(
  "/usr/local/Cellar/xxhash/0.7.0/include/xxhash.h",
  prefix: %w(XX xxh),
  remove_prefix: false,
)]
@[Link(ldflags: "#{__DIR__}/../vendor/libxxhash.0.7.0.so")]
lib LibXXHash
  alias Xxh64HashT = LibC::ULongLong
  alias Xxh32HashT = LibC::ULongLong
  fun xxh64 = XXH64(input : LibC::Char*, length : LibC::SizeT, seed : LibC::ULongLong) : Xxh64HashT
  fun xxh32 = XXH32(input : LibC::Char*, length : LibC::SizeT, seed : LibC::ULongLong) : Xxh32HashT
end
