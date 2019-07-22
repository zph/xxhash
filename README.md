# xxhash

Implements Crystal lang bindings for xxhash using underlying C library. Required dependency
will be downloaded and installed during shards install.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     xxhash:
       github: zph/xxhash
       version: ~> 1.0.0
   ```

2. Run `shards install`

## Usage

```crystal
require "xxhash"

XXHash.xxh32("aaaaaa") => 	2653344721 : UInt32

# Available functions with 2 argument arity
XXHash.xxh64
XXHash.xxh3_64
XXHash.xxh128
```

## Development

Fork, `make deps` and code.

## Contributing

1. Fork it (<https://github.com/zph/xxhash/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Zander Hill](https://github.com/zph) - creator and maintainer
