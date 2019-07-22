@[Link(ldflags: "#{__DIR__}/../vendor/libxxhash.0.7.0.so")]
lib LibXXHash
  XXHASH_H_5627135585666179 =     1
  XXH_VERSION_MAJOR         =     0
  XXH_VERSION_MINOR         =     7
  XXH_VERSION_RELEASE       =     0
  XxhOk                     = 0_i64
  XxhError                  = 1_i64
  fun xxh_version_number = XXH_versionNumber : LibC::UInt
  fun xxh32 = XXH32(input : Void*, length : LibC::SizeT, seed : LibC::UInt) : Xxh32HashT
  alias Xxh32HashT = LibC::UInt
  alias Xxh32StateS = Void
  fun xxh32_create_state = XXH32_createState : Xxh32StateT
  type Xxh32StateT = Void*
  fun xxh32_free_state = XXH32_freeState(state_ptr : Xxh32StateT) : XxhErrorcode
  enum XxhErrorcode
    XxhOk    = 0
    XxhError = 1
  end
  fun xxh32_copy_state = XXH32_copyState(dst_state : Xxh32StateT, src_state : Xxh32StateT)
  fun xxh32_reset = XXH32_reset(state_ptr : Xxh32StateT, seed : LibC::UInt) : XxhErrorcode
  fun xxh32_update = XXH32_update(state_ptr : Xxh32StateT, input : Void*, length : LibC::SizeT) : XxhErrorcode
  fun xxh32_digest = XXH32_digest(state_ptr : Xxh32StateT) : Xxh32HashT
  fun xxh32_canonical_from_hash = XXH32_canonicalFromHash(dst : Xxh32CanonicalT*, hash : Xxh32HashT)

  struct Xxh32CanonicalT
    digest : UInt8[4]
  end

  fun xxh32_hash_from_canonical = XXH32_hashFromCanonical(src : Xxh32CanonicalT*) : Xxh32HashT
  fun xxh64 = XXH64(input : Void*, length : LibC::SizeT, seed : LibC::ULongLong) : Xxh64HashT
  alias Xxh64HashT = LibC::ULongLong
  alias Xxh64StateS = Void
  fun xxh64_create_state = XXH64_createState : Xxh64StateT
  type Xxh64StateT = Void*
  fun xxh64_free_state = XXH64_freeState(state_ptr : Xxh64StateT) : XxhErrorcode
  fun xxh64_copy_state = XXH64_copyState(dst_state : Xxh64StateT, src_state : Xxh64StateT)
  fun xxh64_reset = XXH64_reset(state_ptr : Xxh64StateT, seed : LibC::ULongLong) : XxhErrorcode
  fun xxh64_update = XXH64_update(state_ptr : Xxh64StateT, input : Void*, length : LibC::SizeT) : XxhErrorcode
  fun xxh64_digest = XXH64_digest(state_ptr : Xxh64StateT) : Xxh64HashT
  fun xxh64_canonical_from_hash = XXH64_canonicalFromHash(dst : Xxh64CanonicalT*, hash : Xxh64HashT)

  struct Xxh64CanonicalT
    digest : UInt8[8]
  end

  fun xxh64_hash_from_canonical = XXH64_hashFromCanonical(src : Xxh64CanonicalT*) : Xxh64HashT

  fun xxh3_64bits = XXH3_64bits_withSeed(input : Void*, length : LibC::SizeT, seed : LibC::ULongLong) : Xxh64HashT
  fun xxh3_128bits = XXH3_128bits_withSeed(input : Void*, length : LibC::SizeT, seed : LibC::ULongLong) : Xxh128HashT

  struct Xxh128HashT
    low : Xxh64HashT
    high : Xxh64HashT
  end

  alias XXH128Hash = Xxh128HashT
end
