## Proto Benchmarks

Various benchmarks for proto encoding and generation.

bench-1/proto_encode_bench.rb compares google-protobuf and protoboeuf independently,
showing the impact of object pooling, different message shapes, and comparing
protocol buffer encoding performance to JSON, messagpack, etc.

bench-2/proto_encode_bench_2.rb compares google-protobuf and protoboeuf performance
directly, and includes some benchmarks for encoding proto objects as messagepack.

### Proto Encode Bench 1

To generate google-protobuf codegen files:

```
cd bench-1
```

```
protoc --proto_path=lib/observe/proto --ruby_out=lib/observe/proto/google-protobuf lib/observe/proto/log.proto
# generates lib/observe/proto/google-protobuf/log_pb.rb
```

To generate protoboeuf codegen files:

```
protoc -I lib/observe/proto lib/observe/proto/log.proto -o lib/observe/proto/protoboeuf/log.bproto
bundle exec protoboeuf lib/observe/proto/protoboeuf/log.bproto > lib/observe/proto/protoboeuf/log.rb
```

Run benchmarks with encode only:
```
bundle exec ruby --yjit proto_encode_bench.rb --bench --protoboeuf --encoding
bundle exec ruby --yjit proto_encode_bench.rb --bench --google-protobuf --encoding
```

Run benchmarks with generate only:
```
bundle exec ruby --yjit proto_encode_bench.rb --bench --protoboeuf --generate
bundle exec ruby --yjit proto_encode_bench.rb --bench --google-protobuf --generate
```

Run benchmarks with encode and generate:

```
bundle exec ruby --yjit proto_encode_bench.rb --bench --protoboeuf --encoding --generate
bundle exec ruby --yjit proto_encode_bench.rb --bench --google-protobuf --encoding --generate
```

### Proto Encode Bench 2

```
cd bench-2
```

To generate google-protobuf codegen files:

```
protoc --proto_path=lib/observe/proto/google-protobuf --ruby_out=lib/observe/proto/google-protobuf lib/observe/proto/google-protobuf/log.proto
# generates lib/observe/proto/google-protobuf/log_pb.rb
```

To generate protoboeuf codegen files:

```
protoc -I lib/observe/proto/protoboeuf lib/observe/proto/protoboeuf/log.proto -o lib/observe/proto/protoboeuf/log.bproto
bundle exec protoboeuf lib/observe/proto/protoboeuf/log.bproto > lib/observe/proto/protoboeuf/log.rb
```

Run benchmarks with encode only:
```
bundle exec ruby --yjit proto_encode_bench_2.rb --bench --encoding
```

Run benchmarks with generate only:
```
bundle exec ruby --yjit proto_encode_bench_2.rb --bench  --generate
```

Run benchmarks with encode and generate:

```
bundle exec ruby --yjit proto_encode_bench_2.rb --bench --encoding --generate
```
