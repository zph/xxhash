# Include statement used by crystal_lib for autogenerating Fn signatures
@[Include(
  "/usr/local/Cellar/xxhash/0.7.0/include/xxhash.h",
  prefix: %w(XX xxh),
  remove_prefix: false,
)]
@[Link(ldflags: "#{__DIR__}/../vendor/libxxhash.0.7.0.so")]
lib LibXXHash
end
