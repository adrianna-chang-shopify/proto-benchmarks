# typed: false
# frozen_string_literal: true

# Run with:
#
# bundle exec ruby --yjit proto_encode_bench.rb --bench --protoboeuf
# bundle exec ruby --yjit proto_encode_bench.rb --bench --google-protobuf
#
# --vernier instead of --bench to profile with vernier
# --encoding to run encoding benchmarks
# --generate to run generate benchmarks
# --encoding --generate to run encoding + generate benchmarks

require "bundler/setup"
require "optparse"

options = {
  n_runs: 1_000_000,
  samply_run: true,
  samply_output: "profile.json",
}

optparse = OptionParser.new do |opts|
  opts.on("--n-runs [N]", "number of runs") do |n|
    options[:n_runs] = n.to_i
  end
  opts.on("--skip-samply-run", "skip running samply") do
    options[:samply_run] = false
  end
  opts.on("--samply-output [OUTPUT]", "output file for samply") do |output|
    options[:samply_output] = output
  end
  opts.on("--bench", "run benchmark-ipsa") do
    options[:benchmark_ipsa] = true
    options[:samply_run] = false
  end
  opts.on("--vernier", "profile with vernier") do
    options[:vernier] = true
    options[:samply_run] = false
  end
  opts.on("--google-protobuf", "use google-protobuf") do
    options[:google_protobuf] = true
  end
  opts.on("--protoboeuf") do
    options[:protoboeuf] = true
  end
  opts.on("--encoding", "run encoding benchmarks") do
    options[:encoding] = true
  end
  opts.on("--generate", "run generate benchmarks") do
    options[:generate] = true
  end
end
optparse.parse!

exit 1 if options[:google_protobuf] && options[:protoboeuf]

if options[:samply_run]
  samply_output = options[:samply_output]
  exec(
    "samply",
    "record",
    "--output",
    samply_output,
    # "bundle",
    # "exec",
    "ruby",
    "--yjit",
    "--yjit-perf",
    __FILE__,
    "--skip-samply-run",
    *ARGV,
  )
end

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

n_runs = options[:n_runs]

require "benchmark/ips"
require "json"
require "msgpack"
require "vernier"

if options[:google_protobuf]
  require "google/protobuf"
  require "google/protobuf/well_known_types"
  require "opentelemetry/proto/common/v1/common_pb"
  require "opentelemetry/proto/resource/v1/resource_pb"
  require "opentelemetry/proto/logs/v1/logs_pb"
  require "opentelemetry/proto/collector/logs/v1/logs_service_pb"
  require "observe/proto/google-protobuf/log_pb"
  require "observe/proto/google-protobuf/envelope_pb"
  require "observe/proto/google-protobuf/fulfillments_pb"
end

if options[:protoboeuf]
  require "protoboeuf/google/protobuf/any"
  require "observe/proto/protoboeuf/log"
  require "observe/proto/protoboeuf/envelope"
  require "observe/proto/protoboeuf/fulfillments"
end

$resource = {
  "k8s.cluster.name": "core-us-ea1c-om1",
  "k8s.pod.name": "web-7bddffd97-282d8",
  "k8s.pod.ip": "250.212.42.22",
  "k8s.node.name": "gke-core-us-ea1c-om1-core-web-1-ccbc6b19-7qln",
  "k8s.node.ip": "250.66.228.241",
  "k8s.namespace.name": "shopify-core",
  "cloud.region": "us-east1",
  "cloud.provider": "gcp",
  "cloud.account.id": "shopify-cloud-core",
  "deployment.worker_type": "unicorn",
  "process.command": "$PROGRAM_NAME",
  "process.runtime.name": RUBY_ENGINE,
  "process.runtime.version": RUBY_VERSION,
  "process.runtime.description": RUBY_DESCRIPTION,
  "service.version": "fb77d21837cc9547f0168270a4e08aacdf38df31",
  "service.name": "shopify",
  "rails_version": "8.0.0.alpha",
}

def gen_log_data
  message = "Acquiring lock for fulfillment orders"
  name = :fulfillment_order_acquiring_lock
  attributes = {
    log_context: "fulfillments_api_controller",
    scope_name: nil,
    fulfillment_order_ids: [4767822, 4767603, 4768261],
    shop_id: 59254767822,
    pod_id: 205,
    request_id: "525d8f3e-39c7-4889-a09f-e64908ca43f1-1722946976",
    entrypoint: "Admin::FulfillmentsController#create",
    api_client_id: 102429786113,
    "code.filepath": "/app/components/fulfillments/app/models/fulfillments/lock.rb",
    "code.lineno": 36,
    database_name: "pod240",
  }
  {
    timeUnixNano: Process.clock_gettime(Process::CLOCK_REALTIME, :nanosecond),
    name:,
    message:,
    attributes:,
    trace_id: "c6648166744e63c9aa4e5eaf7cb9bd01",
    root_span_id: "4d3df95bbae8a901",
  }
end

# Object pooling for proto objects
class Pool
  def initialize(klass)
    @pool = klass.new
    @klass = klass
  end

  def pop
    x = @pool
    @pool = nil
    x || @klass.new
  end

  def <<(x)
    @pool = x
  end
end

if options[:protoboeuf]
  def any(value)
    ProtoBoeuf::Google::Protobuf::Any.new(
      value: Observe::Proto::FulfillmentOrderAcquiringLock.encode(value),
      type_url: "types.shopify.io/observe.proto.FulfillmentOrderAcquiringLock",
    )
  end
  $any_pool = Pool.new(ProtoBoeuf::Google::Protobuf::Any)
  def any_from_pool(value)
    a = $any_pool.pop
    a.value = Observe::Proto::FulfillmentOrderAcquiringLock.encode(value)
    a.type_url = "types.shopify.io/observe.proto.FulfillmentOrderAcquiringLock"
    a
  end

  def any_to_pool(any)
    $any_pool << any
  end
elsif options[:google_protobuf]
  def any(value)
    Google::Protobuf::Any.pack(value, "types.shopify.io/observe.proto.FulfillmentOrderAcquiringLock")
  end

  def any_from_pool(value)
    Google::Protobuf::Any.pack(value, "types.shopify.io/observe.proto.FulfillmentOrderAcquiringLock")
  end

  def any_to_pool(any); end
end

if options[:google_protobuf] || options[:protoboeuf]
  $resource_proto_x = Observe::Proto::Resource.new(
    k8s_cluster_name: "core-us-ea1c-om1",
    k8s_pod_name: "web-7bddffd97-282d8",
    k8s_pod_ip: "250.212.42.22",
    k8s_node_name: "gke-core-us-ea1c-om1-core-web-1-ccbc6b19-7qln",
    k8s_node_ip: "250.66.228.241",
    k8s_namespace_name: "shopify-core",
    cloud_region: "us-east1",
    cloud_provider: "gcp",
    cloud_account_id: "shopify-cloud-core",
    deployment_worker_type: "unicorn",
    process_command: "$PROGRAM_NAME",
    process_runtime_name: RUBY_ENGINE,
    process_runtime_version: RUBY_VERSION,
    process_runtime_description: RUBY_DESCRIPTION,
    service_version: "fb77d21837cc9547f0168270a4e08aacdf38df31",
    service_name: "shopify",
    rails_version: "8.0.0.alpha",
  )

  $time_unix_nano = Process.clock_gettime(Process::CLOCK_REALTIME, :nanosecond)

  def gen_log_data_proto
    message = "Acquiring lock for fulfillment orders"
    name = "fulfillment_order_acquiring_lock"
    Observe::Proto::Envelope.new(
      time_unix_nano: $time_unix_nano,
      name:,
      message:,
      trace_id: "c6648166744e63c9aa4e5eaf7cb9bd01",
      root_span_id: "4d3df95bbae8a901",
      code_filepath: "/app/components/fulfillments/app/models/fulfillments/lock.rb",
      code_lineno: 36,
      resource: $resource_proto_x,
      context: Observe::Proto::Context.new(
        shop_id: 59254767822,
        pod_id: 205,
        request_id: "525d8f3e-39c7-4889-a09f-e64908ca43f1-1722946976",
        entrypoint: "Admin::FulfillmentsController#create",
        api_client_id: 102429786113,
        database_name: "pod240",
      ),
      value: any(
        Observe::Proto::FulfillmentOrderAcquiringLock.new(
          log_context: "fulfillments_api_controller",
          scope_name: "",
          fulfillment_order_ids: [4767822, 4767603, 4768261],
        ),
      ),
    )
  end

  $envelope_pool = Pool.new(Observe::Proto::Envelope)
  $context_pool = Pool.new(Observe::Proto::Context)
  $fulfillment_order_acquiring_lock_pool = Pool.new(Observe::Proto::FulfillmentOrderAcquiringLock)
  $fulfillment_order_acquiring_lock = nil
  def gen_envelope_from_pool
    e = $envelope_pool.pop
    e.time_unix_nano = $time_unix_nano
    e.name = "fulfillment_order_acquiring_lock"
    e.message = "Acquiring lock for fulfillment orders"
    e.trace_id = "c6648166744e63c9aa4e5eaf7cb9bd01"
    e.root_span_id = "4d3df95bbae8a901"
    e.code_filepath = "/app/components/fulfillments/app/models/fulfillments/lock.rb"
    e.code_lineno = 36
    e.resource = $resource_proto_x
    context = $context_pool.pop
    context.shop_id = 59254767822
    context.pod_id = 205
    context.request_id = "525d8f3e-39c7-4889-a09f-e64908ca43f1-1722946976"
    context.entrypoint = "Admin::FulfillmentsController#create"
    context.api_client_id = 102429786113
    context.database_name = "pod240"
    e.context = context
    value = $fulfillment_order_acquiring_lock_pool.pop
    value.log_context = "fulfillments_api_controller"
    value.scope_name = ""
    $fulfillment_order_acquiring_lock = value
    e.value = any_from_pool(value)
    e
  end

  def envelope_to_pool(envelope)
    $context_pool << envelope.context
    $fulfillment_order_acquiring_lock_pool << $fulfillment_order_acquiring_lock
    any_to_pool(envelope.value)
    $envelope_pool << envelope
  end

  def encode_as_envelope_proto(envelope)
    Observe::Proto::Envelope.encode(envelope)
  end

  def as_observe_value(value)
    case value
    when String
      Observe::Proto::Value.new(string_value: value)
    when Symbol
      Observe::Proto::Value.new(string_value: value.to_s)
    when Integer
      Observe::Proto::Value.new(int_value: value)
    when Float
      Observe::Proto::Value.new(double_value: value)
    when TrueClass, FalseClass
      Observe::Proto::Value.new(bool_value: value)
    when Array
      return if value.empty?

      case value.first
      when String
        Observe::Proto::Value.new(string_array_value: Observe::Proto::StringArrayValue.new(values: value))
      when Integer
        Observe::Proto::Value.new(int_array_value: Observe::Proto::IntArrayValue.new(values: value))
      when Float
        Observe::Proto::Value.new(double_array_value: Observe::Proto::DoubleArrayValue.new(values: value))
      when TrueClass, FalseClass
        Observe::Proto::Value.new(bool_array_value: Observe::Proto::BoolArrayValue.new(values: value))
      end
    else
      Observe::Proto::Value.new(json_value: value.to_json)
    end
  end

  $resource_proto = $resource.transform_values { |value| as_observe_value(value) }.transform_keys!(&:to_s)

  def encode_attributes(attributes)
    h = {}
    attributes.each { |key, value| h[key.to_s] = as_observe_value(value) }
    h
  end

  def encode_as_proto(log_data)
    Observe::Proto::Log.encode(
      Observe::Proto::Log.new(
        time_unix_nano: log_data[:timeUnixNano],
        name: log_data[:name].to_s,
        message: log_data[:message],
        warnings: log_data[:warnings] || [],
        trace_id: log_data[:trace_id],
        root_span_id: log_data[:root_span_id],
        code_filepath: log_data[:"code.filepath"] || "",
        code_lineno: log_data[:"code.lineno"] || 0,
        exception_type: log_data[:"exception.type"] || "",
        exception_message: log_data[:"exception.message"] || "",
        exception_stacktrace: log_data[:"exception.stacktrace"] || "",
        attributes: encode_attributes(log_data[:attributes]),
        resource: $resource_proto,
      ),
    )
  end
end

def encode_as_json(log_data)
  log_data[:resource] = $resource
  log_data.to_json
end

$msgpack_factory = MessagePack::Factory.new
$msgpack_pool = $msgpack_factory.pool(2)

def encode_as_msgpack(log_data)
  log_data[:resource] = $resource
  $msgpack_pool.dump(log_data)
end

def encode_as_msgpack_from_proto(log_data_proto)
  $msgpack_pool.dump(log_data_proto.to_h)
end

def encode_msgpack_batch_implicit(log_data)
  MessagePack::Packer.new
    .write($resource)
    .write_bin(log_data[:trace_id])
    .write_bin(log_data[:root_span_id])
    .write_nil # work_unit_attributes
    .write_array_header(1)
    .write(log_data[:timeUnixNano])
    .write(log_data[:name])
    .write(log_data[:message])
    .write(log_data[:warnings])
    .write_nil # span_id
    .write(log_data[:"code.filepath"])
    .write(log_data[:"code.lineno"])
    .write(log_data[:"exception.type"])
    .write(log_data[:"exception.message"])
    .write(log_data[:"exception.stacktrace"])
    .write(log_data[:attributes])
    .to_s
end

def encode_msgpack_batch_map(log_data)
  $msgpack_pool.dump({
    resource: $resource,
    trace_id: log_data[:trace_id],
    root_span_id: log_data[:root_span_id],
    # work_unit_attributes: nil,
    events: [
      log_data.except(:trace_id, :root_span_id),
    ],
  })
end

if options[:benchmark_ipsa]
  Benchmark.ips do |x|
    if options[:encoding]
      log_data_json = gen_log_data

      # Encode as JSON
      x.report("[encode only] json") { encode_as_json(log_data_json) }

      # Encode log as Msgpack
      log_data_msgpack = gen_log_data
      x.report("[encode only] msgpack") { encode_as_msgpack(log_data_msgpack) }

      # Encode as Msgpack in batch, size of 1
      log_data_msgpack_batch_map = gen_log_data
      x.report("[encode only] msgpack batch map") { encode_msgpack_batch_map(log_data_msgpack_batch_map) }

      # Encode as Msgpack, implicit schema (write fields directly without hash keys)
      # This is more memory efficient.
      log_data_msgpack_batch_implicit = gen_log_data
      x.report("[encode only] msgpack batch implicit") do
        encode_msgpack_batch_implicit(log_data_msgpack_batch_implicit)
      end

      if options[:google_protobuf] || options[:protoboeuf]
        log_data_proto = gen_log_data
        # Build log data as hash, then build the Observe::Proto::Log object from the data in the hash
        # Observe::Proto::Log message is generic enough to accommodate arbitrary data via encode_attributes
        x.report("[encode only] proto") { encode_as_proto(log_data_proto) }

        # Encode as protocol buffer to Observe::Proto::Envelope schema
        # We pack the specialized payload / event (e.g. FulfillmentOrderAcquiringLock) into the envelope
        log_data_proto_envelope = gen_log_data_proto
        x.report("[encode only] envelope proto") { encode_as_envelope_proto(log_data_proto_envelope) }
      end
    end
    if options[:generate] && options[:encoding] && (options[:google_protobuf] || options[:protoboeuf])
      # Benchmark both the generation of the proto object and the encoding of the proto object as an envelope
      x.report("[gen+encode] envelope proto") { encode_as_envelope_proto(gen_log_data_proto) }
      # Same thing, but we reuse the proto object from a pool
      x.report("[gen+encode] envelope proto from pool") do
        e = gen_envelope_from_pool
        encode_as_envelope_proto(e)
        envelope_to_pool(e)
      end

      ############# NEW MSGPACK ENCODING BENCHMARKS #############

      # Benchmark generating the proto object and then encoding it as msgpack
      # Very naive approach for now, turn the proto object into a hash and then encode it as msgpack
      x.report("[gen+encode] proto + msgpack") { encode_as_msgpack_from_proto(gen_log_data_proto) }

      # envelope-style proto to msgpack
      x.report("[gen+encode] envelope proto + msgpack") { encode_as_msgpack_from_proto(gen_log_data_proto) }

      x.report("[gen+encode] envelope proto from pool + msgpack") do
        e = gen_envelope_from_pool
        encode_as_msgpack_from_proto(e)
        envelope_to_pool(e)
      end
      ############################################################
    end
    if options[:generate] && (options[:google_protobuf] || options[:protoboeuf])
      # Benchmark generating the envelope-style proto object only
      x.report("[gen] envelope proto") { gen_log_data_proto }
      # Same thing, but we reuse the proto object from a pool
      x.report("[gen] envelope proto from pool") do
        e = gen_envelope_from_pool
        envelope_to_pool(e)
      end
    end
    x.compare!
  end
elsif options[:vernier]
  if options[:google_protobuf] || options[:protoboeuf]
    prefix = options[:protoboeuf] ? "protoboeuf" : "google_protobuf"
    log_data = gen_log_data_proto
    Vernier.trace(out: "#{prefix}_profile_envelope_proto.vernier.json") do
      n_runs.times { encode_as_envelope_proto(log_data) }
    end
  end
elsif options[:google_protobuf] || options[:protoboeuf]
  log_data = gen_log_data_proto
  n_runs.times { encode_as_envelope_proto(log_data) }
end
