require 'rake'

PROTO_DIR = ENV['PROTO_DIR'] || "proto"
RUBY_OUT_DIR = ENV['RUBY_OUT_DIR'] || "lib/generated"

directory RUBY_OUT_DIR

desc "Generate Ruby code from .proto files"
task :generate_protos => [RUBY_OUT_DIR] do
  # Find all .proto files in the proto directory
  proto_files = FileList["#{PROTO_DIR}/**/*.proto"]

  if proto_files.empty?
    puts "No .proto files found in #{PROTO_DIR}/"
    next
  end

  proto_files.each do |proto_file|
    file = File.basename(proto_file)
    compiled_proto_binary = "#{RUBY_OUT_DIR}/#{file.gsub(".proto", ".bproto")}"
    cmd = [
      "protoc",
      "-I #{PROTO_DIR}",
      proto_file,
      "-o #{compiled_proto_binary}",
    ].join(" ")

    puts "Generating compiled binary protobuf file from: #{proto_file}"
    system(cmd)

    cmd = [
      "bundle exec",
      "protoboeuf",
      compiled_proto_binary,
      ">",
      "#{RUBY_OUT_DIR}/#{file.gsub(".proto", ".rb")}"
    ].join(" ")

    puts "Generating Ruby code from: #{compiled_proto_binary}"
    system(cmd)
  end
end
