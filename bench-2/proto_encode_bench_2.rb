# typed: false
# frozen_string_literal: true

# Run with:
#
# bundle exec ruby --yjit proto_encode_bench_2.rb --bench --encoding
#
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
require "bundler/setup"
require "optparse"

optparse = OptionParser.new do |opts|
  opts.on("--bench", "run benchmark-ipsa") do
    options[:benchmark_ipsa] = true
    options[:samply_run] = false
  end
  opts.on("--encoding", "run encoding benchmarks") do
    options[:encoding] = true
  end
  opts.on("--generate", "run generate benchmarks") do
    options[:generate] = true
  end
  opts.on("--proto_to_msgpack", "run proto_to_msgpack benchmarks") do
    options[:proto_to_msgpack] = true
  end
end
optparse.parse!

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "benchmark/ips"
require "json"
require "msgpack"
require "vernier"

require "google/protobuf"
require "google/protobuf/well_known_types"
require "opentelemetry/proto/common/v1/common_pb"
require "opentelemetry/proto/resource/v1/resource_pb"
require "opentelemetry/proto/logs/v1/logs_pb"
require "opentelemetry/proto/collector/logs/v1/logs_service_pb"
require "observe/proto/google-protobuf/log_pb"
require "observe/proto/google-protobuf/envelope_pb"
require "observe/proto/google-protobuf/fulfillments_pb"

require "protoboeuf/google/protobuf/any"
require "observe/proto/protoboeuf/log"
require "observe/proto/protoboeuf/envelope"
require "observe/proto/protoboeuf/fulfillments"

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

$any_pool_protoboeuf = Pool.new(ProtoBoeuf::Google::Protobuf::Any)
def any_from_pool(value, proto_impl: :google_protobuf)
  if proto_impl == :google_protobuf
    Google::Protobuf::Any.pack(value, "types.shopify.io/observe.proto.FulfillmentOrderAcquiringLock")
  else
    a = $any_pool_protoboeuf.pop
    a.value = Observe::Proto::Protoboeuf::FulfillmentOrderAcquiringLock.encode(value)
    a.type_url = "types.shopify.io/observe.proto.protoboeuf.FulfillmentOrderAcquiringLock"
    a
  end
end

def any_to_pool(any, proto_impl: :google_protobuf)
  if proto_impl == :google_protobuf
  else
    $any_pool_protoboeuf << any
  end
end

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

def as_observe_value(value, proto_impl: :google_protobuf)
  klass = if proto_impl == :google_protobuf
    Observe::Proto::Value
  else
    Observe::Proto::Protoboeuf::Value
  end

  case value
  when String
    klass.new(string_value: value)
  when Symbol
    klass.new(string_value: value.to_s)
  when Integer
    klass.new(int_value: value)
  when Float
    klass.new(double_value: value)
  when TrueClass, FalseClass
    klass.new(bool_value: value)
  when Array
    return if value.empty?

    if proto_impl == :google_protobuf
      case value.first
      when String
        klass.new(string_array_value: Observe::Proto::StringArrayValue.new(values: value))
      when Integer
        klass.new(int_array_value: Observe::Proto::IntArrayValue.new(values: value))
      when Float
        klass.new(double_array_value: Observe::Proto::DoubleArrayValue.new(values: value))
      when TrueClass, FalseClass
        klass.new(bool_array_value: Observe::Proto::BoolArrayValue.new(values: value))
      end
    else
      case value.first
      when String
        klass.new(string_array_value: Observe::Proto::Protoboeuf::StringArrayValue.new(values: value))
      when Integer
        klass.new(int_array_value: Observe::Proto::Protoboeuf::IntArrayValue.new(values: value))
      when Float
        klass.new(double_array_value: Observe::Proto::Protoboeuf::DoubleArrayValue.new(values: value))
      when TrueClass, FalseClass
        klass.new(bool_array_value: Observe::Proto::Protoboeuf::BoolArrayValue.new(values: value))
      end
    end
  else
    klass.new(json_value: value.to_json)
  end
end

def encode_as_proto(log_data, proto_impl: :google_protobuf, resource:)
  klass = if proto_impl == :google_protobuf
    Observe::Proto::Log
  else
    Observe::Proto::Protoboeuf::Log
  end
  klass.encode(
    klass.new(
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
      attributes: encode_attributes(log_data[:attributes], proto_impl: proto_impl),
      resource:,
    ),
  )
end

def encode_attributes(attributes, proto_impl: :google_protobuf)
  h = {}
  attributes.each { |key, value| h[key.to_s] = as_observe_value(value, proto_impl:) }
  h
end

def resource_proto(proto_impl: :google_protobuf)
  klass = if proto_impl == :google_protobuf
    Observe::Proto::Resource
  else
    Observe::Proto::Protoboeuf::Resource
  end
  klass.new(
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
end

def any(value, proto_impl: :google_protobuf)
  if proto_impl == :google_protobuf
    Google::Protobuf::Any.pack(value, "types.shopify.io/observe.proto.FulfillmentOrderAcquiringLock")
  else
    require 'debug'; debugger
    ProtoBoeuf::Google::Protobuf::Any.new(
      value: Observe::Proto::Protoboeuf::FulfillmentOrderAcquiringLock.encode(value),
      type_url: "types.shopify.io/observe.proto.protoboeuf.FulfillmentOrderAcquiringLock",
    )
  end
end

def gen_log_data_proto(proto_impl: :google_protobuf)
  envelope_proto_class = if proto_impl == :google_protobuf
    Observe::Proto::Envelope
  else
    Observe::Proto::Protoboeuf::Envelope
  end
  ctx_proto_class = if proto_impl == :google_protobuf
    Observe::Proto::Context
  else
    Observe::Proto::Protoboeuf::Context
  end
  value_proto_class = if proto_impl == :google_protobuf
    Observe::Proto::FulfillmentOrderAcquiringLock
  else
    Observe::Proto::Protoboeuf::FulfillmentOrderAcquiringLock
  end
  message = "Acquiring lock for fulfillment orders"
  name = "fulfillment_order_acquiring_lock"
  envelope_proto_class.new(
    time_unix_nano: Process.clock_gettime(Process::CLOCK_REALTIME, :nanosecond),
    name:,
    message:,
    trace_id: "c6648166744e63c9aa4e5eaf7cb9bd01",
    root_span_id: "4d3df95bbae8a901",
    code_filepath: "/app/components/fulfillments/app/models/fulfillments/lock.rb",
    code_lineno: 36,
    resource: resource_proto(proto_impl:),
    context: ctx_proto_class.new(
      shop_id: 59254767822,
      pod_id: 205,
      request_id: "525d8f3e-39c7-4889-a09f-e64908ca43f1-1722946976",
      entrypoint: "Admin::FulfillmentsController#create",
      api_client_id: 102429786113,
      database_name: "pod240",
    ),
    value: any(
      value_proto_class.new(
        log_context: "fulfillments_api_controller",
        scope_name: "",
        fulfillment_order_ids: [4767822, 4767603, 4768261],
      ),
      proto_impl:,
    ),
  )
end

def resource
  {
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
end

def encode_as_envelope_proto(envelope, proto_impl: :google_protobuf)
  klass = if proto_impl == :google_protobuf
    Observe::Proto::Envelope
  else
    Observe::Proto::Protoboeuf::Envelope
  end
  klass.encode(envelope)
end

$fulfillment_order_acquiring_lock_google_protobuf = nil
$fulfillment_order_acquiring_lock_protoboeuf = nil
def gen_envelope_from_pool(envelope_pool, ctx_pool, value_pool, proto_impl: :google_protobuf)
  e = envelope_pool.pop
  e.time_unix_nano = Process.clock_gettime(Process::CLOCK_REALTIME, :nanosecond)
  e.name = "fulfillment_order_acquiring_lock"
  e.message = "Acquiring lock for fulfillment orders"
  e.trace_id = "c6648166744e63c9aa4e5eaf7cb9bd01"
  e.root_span_id = "4d3df95bbae8a901"
  e.code_filepath = "/app/components/fulfillments/app/models/fulfillments/lock.rb"
  e.code_lineno = 36
  e.resource = resource_proto(proto_impl:)
  context = ctx_pool.pop
  context.shop_id = 59254767822
  context.pod_id = 205
  context.request_id = "525d8f3e-39c7-4889-a09f-e64908ca43f1-1722946976"
  context.entrypoint = "Admin::FulfillmentsController#create"
  context.api_client_id = 102429786113
  context.database_name = "pod240"
  e.context = context
  value = value_pool.pop
  value.log_context = "fulfillments_api_controller"
  value.scope_name = ""
  if proto_impl == :google_protobuf
    $fulfillment_order_acquiring_lock_google_protobuf = value
  else
    $fulfillment_order_acquiring_lock_protoboeuf = value
  end
  e.value = any_from_pool(value, proto_impl:)
  e
end

def envelope_to_pool(envelope, envelope_pool, ctx_pool, value_pool, proto_impl: :google_protobuf)
  ctx_pool << envelope.context
  value_pool << if proto_impl == :google_protobuf
    $fulfillment_order_acquiring_lock_google_protobuf
  else
    $fulfillment_order_acquiring_lock_protoboeuf
  end
  any_to_pool(envelope.value, proto_impl:)
  envelope_pool << envelope
end

$msgpack_factory = MessagePack::Factory.new
$msgpack_pool = $msgpack_factory.pool(2)
def encode_as_msgpack_from_proto(log_data_proto)
  $msgpack_pool.dump(log_data_proto.to_h)
end

if options[:benchmark_ipsa]
  Benchmark.ips do |x|
    if options[:encoding]
      log_data_proto = gen_log_data
      r_protobuf = resource.transform_values { |value| as_observe_value(value) }.transform_keys!(&:to_s)

      x.report("[google_protobuf][encode] proto") do
        encode_as_proto(log_data_proto, resource: r_protobuf)
      end

      r_protoboeuf = resource.transform_values do |value|
        as_observe_value(value, proto_impl: :protoboeuf)
      end.transform_keys!(&:to_s)

      x.report("[protoboeuf][encode] proto") do
        encode_as_proto(log_data_proto, proto_impl: :protoboeuf, resource: r_protoboeuf)
      end

      log_data_proto_envelope_protobuf = gen_log_data_proto(proto_impl: :google_protobuf)
      x.report("[google_protobuf][encode] envelope proto") do
        encode_as_envelope_proto(log_data_proto_envelope_protobuf, proto_impl: :google_protobuf)
      end

      log_data_proto_envelope_protoboeuf = gen_log_data_proto(proto_impl: :protoboeuf)
      x.report("[protoboeuf][encode] envelope proto") do
        encode_as_envelope_proto(log_data_proto_envelope_protoboeuf, proto_impl: :protoboeuf)
      end

      log_data_google_protobuf = gen_log_data_proto(proto_impl: :google_protobuf)
      x.report("[google_protobuf][encode] proto > msgpack") do
        encode_as_msgpack_from_proto(log_data_google_protobuf)
      end

      log_data_protoboeuf = gen_log_data_proto(proto_impl: :protoboeuf)
      x.report("[protoboeuf][encode] proto > msgpack") do
        encode_as_msgpack_from_proto(log_data_protoboeuf)
      end
    end
    if options[:generate] && options[:encoding]
      x.report("[google_protobuf][gen+encode] envelope proto") do
        log_data_proto_envelope_protobuf = gen_log_data_proto(proto_impl: :google_protobuf)
        encode_as_envelope_proto(log_data_proto_envelope_protobuf, proto_impl: :google_protobuf)
      end
      x.report("[protoboeuf][gen+encode] envelope proto") do
        log_data_proto_envelope_protoboeuf = gen_log_data_proto(proto_impl: :protoboeuf)
        encode_as_envelope_proto(log_data_proto_envelope_protoboeuf, proto_impl: :protoboeuf)
      end
      google_protobuf_envelope_pool = Pool.new(Observe::Proto::Envelope)
      google_protobuf_ctx_pool = Pool.new(Observe::Proto::Context)
      google_protobuf_fulfillment_order_acquiring_lock_pool = Pool.new(Observe::Proto::FulfillmentOrderAcquiringLock)
      x.report("[google_protobuf][gen+encode] envelope proto from pool") do
        e = gen_envelope_from_pool(
          google_protobuf_envelope_pool,
          google_protobuf_ctx_pool,
          google_protobuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :google_protobuf,
        )
        encode_as_envelope_proto(e, proto_impl: :google_protobuf)
        envelope_to_pool(
          e,
          google_protobuf_envelope_pool,
          google_protobuf_ctx_pool,
          google_protobuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :google_protobuf,
        )
      end

      protoboeuf_envelope_pool = Pool.new(Observe::Proto::Protoboeuf::Envelope)
      protoboeuf_ctx_pool = Pool.new(Observe::Proto::Protoboeuf::Context)
      protoboeuf_fulfillment_order_acquiring_lock_pool = Pool.new(Observe::Proto::Protoboeuf::FulfillmentOrderAcquiringLock)
      x.report("[protoboeuf][gen+encode] envelope proto from pool") do
        e = gen_envelope_from_pool(
          protoboeuf_envelope_pool,
          protoboeuf_ctx_pool,
          protoboeuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :protoboeuf,
        )
        encode_as_envelope_proto(e, proto_impl: :protoboeuf)
        envelope_to_pool(
          e,
          protoboeuf_envelope_pool,
          protoboeuf_ctx_pool,
          protoboeuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :protoboeuf,
        )
      end

      x.report("[google_protobuf][gen+encode] proto + msgpack") do
        log_data_google_protobuf = gen_log_data_proto(proto_impl: :google_protobuf)
        encode_as_msgpack_from_proto(log_data_google_protobuf)
      end

      x.report("[protoboeuf][gen+encode] proto + msgpack") do
        log_data_protoboeuf = gen_log_data_proto(proto_impl: :protoboeuf)
        encode_as_msgpack_from_proto(log_data_protoboeuf)
      end

      # NO POOL
      x.report("[google_protobuf][gen+encode] envelope proto + msgpack") do
        log_data_proto_envelope_protobuf = gen_log_data_proto(proto_impl: :google_protobuf)
        encode_as_msgpack_from_proto(log_data_proto_envelope_protobuf)
      end

      x.report("[protoboeuf][gen+encode] envelope proto + msgpack") do
        log_data_proto_envelope_protoboeuf = gen_log_data_proto(proto_impl: :protoboeuf)
        encode_as_msgpack_from_proto(log_data_proto_envelope_protoboeuf)
      end

      # OBJECT POOLING
      x.report("[google_protobuf][gen+encode] envelope proto from pool + msgpack") do
        e = gen_envelope_from_pool(
          google_protobuf_envelope_pool,
          google_protobuf_ctx_pool,
          google_protobuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :google_protobuf,
        )
        encode_as_msgpack_from_proto(e)
        envelope_to_pool(
          e,
          google_protobuf_envelope_pool,
          google_protobuf_ctx_pool,
          google_protobuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :google_protobuf,
        )
      end

      x.report("[protoboeuf][gen+encode] envelope proto from pool + msgpack") do
        e = gen_envelope_from_pool(
          protoboeuf_envelope_pool,
          protoboeuf_ctx_pool,
          protoboeuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :protoboeuf,
        )
        encode_as_msgpack_from_proto(e)
        envelope_to_pool(
          e,
          protoboeuf_envelope_pool,
          protoboeuf_ctx_pool,
          protoboeuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :protoboeuf,
        )
      end
    end
    if options[:generate]
      x.report("[google_protobuf][gen] proto") { gen_log_data_proto(proto_impl: :google_protobuf) }
      x.report("[protoboeuf][gen] proto") { gen_log_data_proto(proto_impl: :protoboeuf) }
      x.report("[google_protobuf][gen] envelope proto from pool") do
        e = gen_envelope_from_pool(
          google_protobuf_envelope_pool,
          google_protobuf_ctx_pool,
          google_protobuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :google_protobuf,
        )
        envelope_to_pool(
          e,
          google_protobuf_envelope_pool,
          google_protobuf_ctx_pool,
          google_protobuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :google_protobuf,
        )
      end
      x.report("[protoboeuf][gen] envelope proto from pool") do
        e = gen_envelope_from_pool(
          protoboeuf_envelope_pool,
          protoboeuf_ctx_pool,
          protoboeuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :protoboeuf,
        )
        envelope_to_pool(
          e,
          protoboeuf_envelope_pool,
          protoboeuf_ctx_pool,
          protoboeuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :protoboeuf,
        )
      end

      google_protobuf_envelope_pool = Pool.new(Observe::Proto::Envelope)
      google_protobuf_ctx_pool = Pool.new(Observe::Proto::Context)
      google_protobuf_fulfillment_order_acquiring_lock_pool = Pool.new(Observe::Proto::FulfillmentOrderAcquiringLock)
      x.report("[google_protobuf][gen+encode] proto from pool + msgpack") do
        e = gen_envelope_from_pool(
          google_protobuf_envelope_pool,
          google_protobuf_ctx_pool,
          google_protobuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :google_protobuf,
        )
        encode_as_msgpack_from_proto(e)
        envelope_to_pool(
          e,
          google_protobuf_envelope_pool,
          google_protobuf_ctx_pool,
          google_protobuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :google_protobuf,
        )
      end

      protoboeuf_envelope_pool = Pool.new(Observe::Proto::Protoboeuf::Envelope)
      protoboeuf_ctx_pool = Pool.new(Observe::Proto::Protoboeuf::Context)
      protoboeuf_fulfillment_order_acquiring_lock_pool = Pool.new(Observe::Proto::Protoboeuf::FulfillmentOrderAcquiringLock)
      x.report("[protoboeuf][gen+encode] proto from pool + msgpack") do
        e = gen_envelope_from_pool(
          protoboeuf_envelope_pool,
          protoboeuf_ctx_pool,
          protoboeuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :protoboeuf,
        )
        encode_as_msgpack_from_proto(e)
        envelope_to_pool(
          e,
          protoboeuf_envelope_pool,
          protoboeuf_ctx_pool,
          protoboeuf_fulfillment_order_acquiring_lock_pool,
          proto_impl: :protoboeuf,
        )
      end
    end
    x.compare!
  end
end
