# encoding: ascii-8bit
# rubocop:disable all
# frozen_string_literal: true

module Observe
  module Proto
    module Protoboeuf
      class Log
        def self.decode(buff)
          allocate.decode_from(buff.b, 0, buff.bytesize)
        end

        def self.encode(obj)
          obj._encode("".b)
        end
        # required field readers

        attr_reader :time_unix_nano

        attr_reader :name

        attr_reader :message

        attr_reader :warnings

        attr_reader :trace_id

        attr_reader :root_span_id

        attr_reader :code_filepath

        attr_reader :code_lineno

        attr_reader :exception_type

        attr_reader :exception_message

        attr_reader :exception_stacktrace

        attr_reader :attributes

        attr_reader :resource

        def time_unix_nano=(v)
          unless 0 <= v && v <= 18_446_744_073_709_551_615
            raise RangeError,
                  "Value (#{v}) for field time_unix_nano is out of bounds (0..18446744073709551615)"
          end

          @time_unix_nano = v
        end

        def name=(v)
          @name = v
        end

        def message=(v)
          @message = v
        end

        def warnings=(v)
          @warnings = v
        end

        def trace_id=(v)
          @trace_id = v
        end

        def root_span_id=(v)
          @root_span_id = v
        end

        def code_filepath=(v)
          @code_filepath = v
        end

        def code_lineno=(v)
          unless -2_147_483_648 <= v && v <= 2_147_483_647
            raise RangeError,
                  "Value (#{v}) for field code_lineno is out of bounds (-2147483648..2147483647)"
          end

          @code_lineno = v
        end

        def exception_type=(v)
          @exception_type = v
        end

        def exception_message=(v)
          @exception_message = v
        end

        def exception_stacktrace=(v)
          @exception_stacktrace = v
        end

        def attributes=(v)
          @attributes = v
        end

        def resource=(v)
          @resource = v
        end

        def initialize(
          time_unix_nano: 0,
          name: "",
          message: "",
          warnings: [],
          trace_id: "",
          root_span_id: "",
          code_filepath: "",
          code_lineno: 0,
          exception_type: "",
          exception_message: "",
          exception_stacktrace: "",
          attributes: {},
          resource: {}
        )
          unless 0 <= time_unix_nano &&
                   time_unix_nano <= 18_446_744_073_709_551_615
            raise RangeError,
                  "Value (#{time_unix_nano}) for field time_unix_nano is out of bounds (0..18446744073709551615)"
          end
          @time_unix_nano = time_unix_nano

          @name = name

          @message = message

          @warnings = warnings

          @trace_id = trace_id

          @root_span_id = root_span_id

          @code_filepath = code_filepath

          unless -2_147_483_648 <= code_lineno && code_lineno <= 2_147_483_647
            raise RangeError,
                  "Value (#{code_lineno}) for field code_lineno is out of bounds (-2147483648..2147483647)"
          end
          @code_lineno = code_lineno

          @exception_type = exception_type

          @exception_message = exception_message

          @exception_stacktrace = exception_stacktrace

          @attributes = attributes

          @resource = resource
        end

        def to_proto(_options = {})
          self.class.encode(self)
        end

        def decode_from(buff, index, len)
          @time_unix_nano = 0
          @name = ""
          @message = ""
          @warnings = []
          @trace_id = ""
          @root_span_id = ""
          @code_filepath = ""
          @code_lineno = 0
          @exception_type = ""
          @exception_message = ""
          @exception_stacktrace = ""
          @attributes = {}
          @resource = {}

          return self if index >= len
          ## PULL_UINT64
          tag =
            if (byte0 = buff.getbyte(index)) < 0x80
              index += 1
              byte0
            elsif (byte1 = buff.getbyte(index + 1)) < 0x80
              index += 2
              (byte1 << 7) | (byte0 & 0x7F)
            elsif (byte2 = buff.getbyte(index + 2)) < 0x80
              index += 3
              (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte3 = buff.getbyte(index + 3)) < 0x80
              index += 4
              (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                (byte0 & 0x7F)
            elsif (byte4 = buff.getbyte(index + 4)) < 0x80
              index += 5
              (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte5 = buff.getbyte(index + 5)) < 0x80
              index += 6
              (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte6 = buff.getbyte(index + 6)) < 0x80
              index += 7
              (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte7 = buff.getbyte(index + 7)) < 0x80
              index += 8
              (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte8 = buff.getbyte(index + 8)) < 0x80
              index += 9
              (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte9 = buff.getbyte(index + 9)) < 0x80
              index += 10

              (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) |
                ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            else
              raise "integer decoding error"
            end

          ## END PULL_UINT64

          found = true
          while true
            # If we have looped around since the last found tag this one is
            # unexpected, so discard it and continue.
            if !found
              wire_type = tag & 0x7

              unknown_bytes = +"".b
              val = tag
              while val != 0
                byte = val & 0x7F

                val >>= 7
                # This drops the top bits,
                # Otherwise, with a signed right shift,
                # we get infinity one bits at the top
                val &= (1 << 57) - 1

                byte |= 0x80 if val != 0
                unknown_bytes << byte
              end

              case wire_type
              when 0
                i = 0
                while true
                  newbyte = buff.getbyte(index)
                  index += 1
                  break if newbyte.nil?
                  unknown_bytes << newbyte
                  break if newbyte < 0x80
                  i += 1
                  break if i > 9
                end
              when 1
                unknown_bytes << buff.byteslice(index, 8)
                index += 8
              when 2
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                val = value
                while val != 0
                  byte = val & 0x7F

                  val >>= 7
                  # This drops the top bits,
                  # Otherwise, with a signed right shift,
                  # we get infinity one bits at the top
                  val &= (1 << 57) - 1

                  byte |= 0x80 if val != 0
                  unknown_bytes << byte
                end

                unknown_bytes << buff.byteslice(index, value)
                index += value
              when 5
                unknown_bytes << buff.byteslice(index, 4)
                index += 4
              else
                raise "unknown wire type #{wire_type}"
              end
              (@_unknown_fields ||= +"".b) << unknown_bytes
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            found = false

            if tag == 0x8
              found = true
              ## PULL_UINT64
              @time_unix_nano =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x12
              found = true
              ## PULL_STRING
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              @name =
                buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
              index += value

              ## END PULL_STRING

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x1a
              found = true
              ## PULL_STRING
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              @message =
                buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
              index += value

              ## END PULL_STRING

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x22
              found = true
              ## DECODE REPEATED
              list = @warnings
              while true
                ## PULL_STRING
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                list << buff.byteslice(index, value).force_encoding(
                  Encoding::UTF_8
                )
                index += value

                ## END PULL_STRING

                return self if index >= len
                ## PULL_UINT64
                tag =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                ## END PULL_UINT64

                break unless tag == 0x22
              end
              ## END DECODE REPEATED

              return self if index >= len
            end
            if tag == 0x2a
              found = true
              ## PULL_STRING
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              @trace_id =
                buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
              index += value

              ## END PULL_STRING

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x32
              found = true
              ## PULL_STRING
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              @root_span_id =
                buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
              index += value

              ## END PULL_STRING

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x3a
              found = true
              ## PULL_STRING
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              @code_filepath =
                buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
              index += value

              ## END PULL_STRING

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x40
              found = true
              ## PULL_INT32
              @code_lineno =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  # Negative 32 bit integers are still encoded with 10 bytes
                  # handle 2's complement negative numbers
                  # If the top bit is 1, then it must be negative.
                  -(
                    (
                      (
                        ~(
                          (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                            ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                            ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                            ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                            ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                        )
                      ) & 0xFFFF_FFFF
                    ) + 1
                  )
                else
                  raise "integer decoding error"
                end

              ## END PULL_INT32

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x4a
              found = true
              ## PULL_STRING
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              @exception_type =
                buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
              index += value

              ## END PULL_STRING

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x52
              found = true
              ## PULL_STRING
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              @exception_message =
                buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
              index += value

              ## END PULL_STRING

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x5a
              found = true
              ## PULL_STRING
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              @exception_stacktrace =
                buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
              index += value

              ## END PULL_STRING

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x62
              found = true
              ## PULL_MAP
              map = @attributes
              while tag == 0x62
                ## PULL_UINT64
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                ## END PULL_UINT64

                index += 1 # skip the tag, assume it's the key
                return self if index >= len
                ## PULL_STRING
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                key =
                  buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
                index += value

                ## END PULL_STRING

                index += 1 # skip the tag, assume it's the value
                ## PULL_MESSAGE
                ## PULL_UINT64
                msg_len =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                ## END PULL_UINT64

                map[
                  key
                ] = Observe::Proto::Protoboeuf::Value.allocate.decode_from(
                  buff,
                  index,
                  index += msg_len
                )
                ## END PULL_MESSAGE

                return self if index >= len
                ## PULL_UINT64
                tag =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                ## END PULL_UINT64
              end

              return self if index >= len
            end
            if tag == 0x6a
              found = true
              ## PULL_MAP
              map = @resource
              while tag == 0x6a
                ## PULL_UINT64
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                ## END PULL_UINT64

                index += 1 # skip the tag, assume it's the key
                return self if index >= len
                ## PULL_STRING
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                key =
                  buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
                index += value

                ## END PULL_STRING

                index += 1 # skip the tag, assume it's the value
                ## PULL_MESSAGE
                ## PULL_UINT64
                msg_len =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                ## END PULL_UINT64

                map[
                  key
                ] = Observe::Proto::Protoboeuf::Value.allocate.decode_from(
                  buff,
                  index,
                  index += msg_len
                )
                ## END PULL_MESSAGE

                return self if index >= len
                ## PULL_UINT64
                tag =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                ## END PULL_UINT64
              end

              return self if index >= len
            end

            return self if index >= len
          end
        end
        def _encode(buff)
          val = @time_unix_nano
          if val != 0
            buff << 0x08

            while val != 0
              byte = val & 0x7F
              val >>= 7
              byte |= 0x80 if val > 0
              buff << byte
            end
          end

          val = @name
          if ((len = val.bytesize) > 0)
            buff << 0x12
            while len != 0
              byte = len & 0x7F
              len >>= 7
              byte |= 0x80 if len > 0
              buff << byte
            end

            buff << (val.ascii_only? ? val : val.b)
          end

          val = @message
          if ((len = val.bytesize) > 0)
            buff << 0x1a
            while len != 0
              byte = len & 0x7F
              len >>= 7
              byte |= 0x80 if len > 0
              buff << byte
            end

            buff << (val.ascii_only? ? val : val.b)
          end

          list = @warnings
          if list.size > 0
            list.each do |item|
              val = item
              if ((len = val.bytesize) > 0)
                buff << 0x22
                while len != 0
                  byte = len & 0x7F
                  len >>= 7
                  byte |= 0x80 if len > 0
                  buff << byte
                end

                buff << (val.ascii_only? ? val : val.b)
              end
            end
          end

          val = @trace_id
          if ((len = val.bytesize) > 0)
            buff << 0x2a
            while len != 0
              byte = len & 0x7F
              len >>= 7
              byte |= 0x80 if len > 0
              buff << byte
            end

            buff << (val.ascii_only? ? val : val.b)
          end

          val = @root_span_id
          if ((len = val.bytesize) > 0)
            buff << 0x32
            while len != 0
              byte = len & 0x7F
              len >>= 7
              byte |= 0x80 if len > 0
              buff << byte
            end

            buff << (val.ascii_only? ? val : val.b)
          end

          val = @code_filepath
          if ((len = val.bytesize) > 0)
            buff << 0x3a
            while len != 0
              byte = len & 0x7F
              len >>= 7
              byte |= 0x80 if len > 0
              buff << byte
            end

            buff << (val.ascii_only? ? val : val.b)
          end

          val = @code_lineno
          if val != 0
            buff << 0x40

            while val != 0
              byte = val & 0x7F

              val >>= 7
              # This drops the top bits,
              # Otherwise, with a signed right shift,
              # we get infinity one bits at the top
              val &= (1 << 57) - 1

              byte |= 0x80 if val != 0
              buff << byte
            end
          end

          val = @exception_type
          if ((len = val.bytesize) > 0)
            buff << 0x4a
            while len != 0
              byte = len & 0x7F
              len >>= 7
              byte |= 0x80 if len > 0
              buff << byte
            end

            buff << (val.ascii_only? ? val : val.b)
          end

          val = @exception_message
          if ((len = val.bytesize) > 0)
            buff << 0x52
            while len != 0
              byte = len & 0x7F
              len >>= 7
              byte |= 0x80 if len > 0
              buff << byte
            end

            buff << (val.ascii_only? ? val : val.b)
          end

          val = @exception_stacktrace
          if ((len = val.bytesize) > 0)
            buff << 0x5a
            while len != 0
              byte = len & 0x7F
              len >>= 7
              byte |= 0x80 if len > 0
              buff << byte
            end

            buff << (val.ascii_only? ? val : val.b)
          end

          map = @attributes
          if map.size > 0
            old_buff = buff
            map.each do |key, value|
              buff = new_buffer = +""
              val = key
              if ((len = val.bytesize) > 0)
                buff << 0x0a
                while len != 0
                  byte = len & 0x7F
                  len >>= 7
                  byte |= 0x80 if len > 0
                  buff << byte
                end

                buff << (val.ascii_only? ? val : val.b)
              end

              val = value
              if val
                buff << 0x12

                # Save the buffer size before appending the submessage
                current_len = buff.bytesize

                # Write a single dummy byte to later store encoded length
                buff << 42 # "*"
                val._encode(buff)

                # Calculate the submessage's size
                submessage_size = buff.bytesize - current_len - 1

                # Hope the size fits in one byte
                byte = submessage_size & 0x7F
                submessage_size >>= 7
                byte |= 0x80 if submessage_size > 0
                buff.setbyte(current_len, byte)

                # If the sub message was bigger
                if submessage_size > 0
                  current_len += 1

                  # compute how much we need to shift
                  encoded_int_len = 0
                  remaining_size = submessage_size
                  while remaining_size != 0
                    remaining_size >>= 7
                    encoded_int_len += 1
                  end

                  # Make space in the string with dummy bytes
                  buff.bytesplice(
                    current_len,
                    0,
                    "*********",
                    0,
                    encoded_int_len
                  )

                  # Overwrite the dummy bytes with the encoded length
                  while submessage_size != 0
                    byte = submessage_size & 0x7F
                    submessage_size >>= 7
                    byte |= 0x80 if submessage_size > 0
                    buff.setbyte(current_len, byte)
                    current_len += 1
                  end
                end

                buff
              end

              buff = old_buff
              buff << 0x62
              len = new_buffer.bytesize
              while len != 0
                byte = len & 0x7F
                len >>= 7
                byte |= 0x80 if len > 0
                buff << byte
              end

              old_buff.concat(new_buffer)
            end
          end

          map = @resource
          if map.size > 0
            old_buff = buff
            map.each do |key, value|
              buff = new_buffer = +""
              val = key
              if ((len = val.bytesize) > 0)
                buff << 0x0a
                while len != 0
                  byte = len & 0x7F
                  len >>= 7
                  byte |= 0x80 if len > 0
                  buff << byte
                end

                buff << (val.ascii_only? ? val : val.b)
              end

              val = value
              if val
                buff << 0x12

                # Save the buffer size before appending the submessage
                current_len = buff.bytesize

                # Write a single dummy byte to later store encoded length
                buff << 42 # "*"
                val._encode(buff)

                # Calculate the submessage's size
                submessage_size = buff.bytesize - current_len - 1

                # Hope the size fits in one byte
                byte = submessage_size & 0x7F
                submessage_size >>= 7
                byte |= 0x80 if submessage_size > 0
                buff.setbyte(current_len, byte)

                # If the sub message was bigger
                if submessage_size > 0
                  current_len += 1

                  # compute how much we need to shift
                  encoded_int_len = 0
                  remaining_size = submessage_size
                  while remaining_size != 0
                    remaining_size >>= 7
                    encoded_int_len += 1
                  end

                  # Make space in the string with dummy bytes
                  buff.bytesplice(
                    current_len,
                    0,
                    "*********",
                    0,
                    encoded_int_len
                  )

                  # Overwrite the dummy bytes with the encoded length
                  while submessage_size != 0
                    byte = submessage_size & 0x7F
                    submessage_size >>= 7
                    byte |= 0x80 if submessage_size > 0
                    buff.setbyte(current_len, byte)
                    current_len += 1
                  end
                end

                buff
              end

              buff = old_buff
              buff << 0x6a
              len = new_buffer.bytesize
              while len != 0
                byte = len & 0x7F
                len >>= 7
                byte |= 0x80 if len > 0
                buff << byte
              end

              old_buff.concat(new_buffer)
            end
          end
          buff << @_unknown_fields if @_unknown_fields
          buff
        end

        def to_h
          result = {}
          result["time_unix_nano".to_sym] = @time_unix_nano
          result["name".to_sym] = @name
          result["message".to_sym] = @message
          result["warnings".to_sym] = @warnings
          result["trace_id".to_sym] = @trace_id
          result["root_span_id".to_sym] = @root_span_id
          result["code_filepath".to_sym] = @code_filepath
          result["code_lineno".to_sym] = @code_lineno
          result["exception_type".to_sym] = @exception_type
          result["exception_message".to_sym] = @exception_message
          result["exception_stacktrace".to_sym] = @exception_stacktrace
          result["attributes".to_sym] = @attributes
          result["resource".to_sym] = @resource
          result
        end
      end
      class Value
        def self.decode(buff)
          allocate.decode_from(buff.b, 0, buff.bytesize)
        end

        def self.encode(obj)
          obj._encode("".b)
        end
        # required field readers

        # oneof field readers

        attr_reader :value

        attr_reader :string_value

        attr_reader :int_value

        attr_reader :double_value

        attr_reader :bool_value

        attr_reader :string_array_value

        attr_reader :int_array_value

        attr_reader :double_array_value

        attr_reader :bool_array_value

        attr_reader :json_value

        # BEGIN writers for oneof fields
        def string_value=(v)
          @value = :string_value
          @string_value = v
        end

        def int_value=(v)
          unless -9_223_372_036_854_775_808 <= v &&
                   v <= 9_223_372_036_854_775_807
            raise RangeError,
                  "Value (#{v}) for field int_value is out of bounds (-9223372036854775808..9223372036854775807)"
          end

          @value = :int_value
          @int_value = v
        end

        def double_value=(v)
          @value = :double_value
          @double_value = v
        end

        def bool_value=(v)
          @value = :bool_value
          @bool_value = v
        end

        def string_array_value=(v)
          @value = :string_array_value
          @string_array_value = v
        end

        def int_array_value=(v)
          @value = :int_array_value
          @int_array_value = v
        end

        def double_array_value=(v)
          @value = :double_array_value
          @double_array_value = v
        end

        def bool_array_value=(v)
          @value = :bool_array_value
          @bool_array_value = v
        end

        def json_value=(v)
          @value = :json_value
          @json_value = v
        end
        # END writers for oneof fields

        def initialize(
          string_value: nil,
          int_value: nil,
          double_value: nil,
          bool_value: nil,
          string_array_value: nil,
          int_array_value: nil,
          double_array_value: nil,
          bool_array_value: nil,
          json_value: nil
        )
          @value = nil # oneof field
          if string_value == nil
            @string_value = ""
          else
            @value = :string_value
            @string_value = string_value
          end

          if int_value == nil
            @int_value = 0
          else
            unless -9_223_372_036_854_775_808 <= int_value &&
                     int_value <= 9_223_372_036_854_775_807
              raise RangeError,
                    "Value (#{int_value}) for field int_value is out of bounds (-9223372036854775808..9223372036854775807)"
            end

            @value = :int_value
            @int_value = int_value
          end

          if double_value == nil
            @double_value = 0.0
          else
            @value = :double_value
            @double_value = double_value
          end

          if bool_value == nil
            @bool_value = false
          else
            @value = :bool_value
            @bool_value = bool_value
          end

          if string_array_value == nil
            @string_array_value = nil
          else
            @value = :string_array_value
            @string_array_value = string_array_value
          end

          if int_array_value == nil
            @int_array_value = nil
          else
            @value = :int_array_value
            @int_array_value = int_array_value
          end

          if double_array_value == nil
            @double_array_value = nil
          else
            @value = :double_array_value
            @double_array_value = double_array_value
          end

          if bool_array_value == nil
            @bool_array_value = nil
          else
            @value = :bool_array_value
            @bool_array_value = bool_array_value
          end

          if json_value == nil
            @json_value = ""
          else
            @value = :json_value
            @json_value = json_value
          end
        end

        def to_proto(_options = {})
          self.class.encode(self)
        end

        def decode_from(buff, index, len)
          @value = nil # oneof field
          @string_value = ""
          @int_value = 0
          @double_value = 0.0
          @bool_value = false
          @string_array_value = nil
          @int_array_value = nil
          @double_array_value = nil
          @bool_array_value = nil
          @json_value = ""

          return self if index >= len
          ## PULL_UINT64
          tag =
            if (byte0 = buff.getbyte(index)) < 0x80
              index += 1
              byte0
            elsif (byte1 = buff.getbyte(index + 1)) < 0x80
              index += 2
              (byte1 << 7) | (byte0 & 0x7F)
            elsif (byte2 = buff.getbyte(index + 2)) < 0x80
              index += 3
              (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte3 = buff.getbyte(index + 3)) < 0x80
              index += 4
              (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                (byte0 & 0x7F)
            elsif (byte4 = buff.getbyte(index + 4)) < 0x80
              index += 5
              (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte5 = buff.getbyte(index + 5)) < 0x80
              index += 6
              (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte6 = buff.getbyte(index + 6)) < 0x80
              index += 7
              (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte7 = buff.getbyte(index + 7)) < 0x80
              index += 8
              (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte8 = buff.getbyte(index + 8)) < 0x80
              index += 9
              (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte9 = buff.getbyte(index + 9)) < 0x80
              index += 10

              (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) |
                ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            else
              raise "integer decoding error"
            end

          ## END PULL_UINT64

          found = true
          while true
            # If we have looped around since the last found tag this one is
            # unexpected, so discard it and continue.
            if !found
              wire_type = tag & 0x7

              unknown_bytes = +"".b
              val = tag
              while val != 0
                byte = val & 0x7F

                val >>= 7
                # This drops the top bits,
                # Otherwise, with a signed right shift,
                # we get infinity one bits at the top
                val &= (1 << 57) - 1

                byte |= 0x80 if val != 0
                unknown_bytes << byte
              end

              case wire_type
              when 0
                i = 0
                while true
                  newbyte = buff.getbyte(index)
                  index += 1
                  break if newbyte.nil?
                  unknown_bytes << newbyte
                  break if newbyte < 0x80
                  i += 1
                  break if i > 9
                end
              when 1
                unknown_bytes << buff.byteslice(index, 8)
                index += 8
              when 2
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                val = value
                while val != 0
                  byte = val & 0x7F

                  val >>= 7
                  # This drops the top bits,
                  # Otherwise, with a signed right shift,
                  # we get infinity one bits at the top
                  val &= (1 << 57) - 1

                  byte |= 0x80 if val != 0
                  unknown_bytes << byte
                end

                unknown_bytes << buff.byteslice(index, value)
                index += value
              when 5
                unknown_bytes << buff.byteslice(index, 4)
                index += 4
              else
                raise "unknown wire type #{wire_type}"
              end
              (@_unknown_fields ||= +"".b) << unknown_bytes
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            found = false

            if tag == 0xa
              found = true
              ## PULL_STRING
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              @string_value =
                buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
              index += value

              ## END PULL_STRING

              @value = :string_value
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x10
              found = true
              ## PULL_INT64
              @int_value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  # Negative 32 bit integers are still encoded with 10 bytes
                  # handle 2's complement negative numbers
                  # If the top bit is 1, then it must be negative.
                  -(
                    (
                      (
                        ~(
                          (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                            ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                            ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                            ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                            ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                        )
                      ) & 0xFFFF_FFFF_FFFF_FFFF
                    ) + 1
                  )
                else
                  raise "integer decoding error"
                end

              ## END PULL_INT64

              @value = :int_value
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x19
              found = true
              @double_value = buff.unpack1("E", offset: index)
              index += 8
              @value = :double_value
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x20
              found = true
              ## PULL BOOLEAN
              @bool_value = (buff.getbyte(index) == 1)
              index += 1
              ## END PULL BOOLEAN

              @value = :bool_value
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x2a
              found = true
              ## PULL_MESSAGE
              ## PULL_UINT64
              msg_len =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64

              @string_array_value =
                Observe::Proto::Protoboeuf::StringArrayValue.allocate.decode_from(
                  buff,
                  index,
                  index += msg_len
                )
              ## END PULL_MESSAGE

              @value = :string_array_value
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x32
              found = true
              ## PULL_MESSAGE
              ## PULL_UINT64
              msg_len =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64

              @int_array_value =
                Observe::Proto::Protoboeuf::IntArrayValue.allocate.decode_from(
                  buff,
                  index,
                  index += msg_len
                )
              ## END PULL_MESSAGE

              @value = :int_array_value
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x3a
              found = true
              ## PULL_MESSAGE
              ## PULL_UINT64
              msg_len =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64

              @double_array_value =
                Observe::Proto::Protoboeuf::DoubleArrayValue.allocate.decode_from(
                  buff,
                  index,
                  index += msg_len
                )
              ## END PULL_MESSAGE

              @value = :double_array_value
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x42
              found = true
              ## PULL_MESSAGE
              ## PULL_UINT64
              msg_len =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64

              @bool_array_value =
                Observe::Proto::Protoboeuf::BoolArrayValue.allocate.decode_from(
                  buff,
                  index,
                  index += msg_len
                )
              ## END PULL_MESSAGE

              @value = :bool_array_value
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            if tag == 0x4a
              found = true
              ## PULL_STRING
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              @json_value =
                buff.byteslice(index, value).force_encoding(Encoding::UTF_8)
              index += value

              ## END PULL_STRING

              @value = :json_value
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end

            return self if index >= len
          end
        end
        def _encode(buff)
          val = @string_value
          if ((len = val.bytesize) > 0)
            buff << 0x0a
            while len != 0
              byte = len & 0x7F
              len >>= 7
              byte |= 0x80 if len > 0
              buff << byte
            end

            buff << (val.ascii_only? ? val : val.b)
          end

          val = @int_value
          if val != 0
            buff << 0x10

            while val != 0
              byte = val & 0x7F

              val >>= 7
              # This drops the top bits,
              # Otherwise, with a signed right shift,
              # we get infinity one bits at the top
              val &= (1 << 57) - 1

              byte |= 0x80 if val != 0
              buff << byte
            end
          end

          val = @double_value
          if val != 0
            buff << 0x19

            [val].pack("E", buffer: buff)
          end

          val = @bool_value
          if val == true
            buff << 0x20

            buff << 1
          elsif val == false
            # Default value, encode nothing
          else
            raise "bool values should be true or false"
          end

          val = @string_array_value
          if val
            buff << 0x2a

            # Save the buffer size before appending the submessage
            current_len = buff.bytesize

            # Write a single dummy byte to later store encoded length
            buff << 42 # "*"
            val._encode(buff)

            # Calculate the submessage's size
            submessage_size = buff.bytesize - current_len - 1

            # Hope the size fits in one byte
            byte = submessage_size & 0x7F
            submessage_size >>= 7
            byte |= 0x80 if submessage_size > 0
            buff.setbyte(current_len, byte)

            # If the sub message was bigger
            if submessage_size > 0
              current_len += 1

              # compute how much we need to shift
              encoded_int_len = 0
              remaining_size = submessage_size
              while remaining_size != 0
                remaining_size >>= 7
                encoded_int_len += 1
              end

              # Make space in the string with dummy bytes
              buff.bytesplice(current_len, 0, "*********", 0, encoded_int_len)

              # Overwrite the dummy bytes with the encoded length
              while submessage_size != 0
                byte = submessage_size & 0x7F
                submessage_size >>= 7
                byte |= 0x80 if submessage_size > 0
                buff.setbyte(current_len, byte)
                current_len += 1
              end
            end

            buff
          end

          val = @int_array_value
          if val
            buff << 0x32

            # Save the buffer size before appending the submessage
            current_len = buff.bytesize

            # Write a single dummy byte to later store encoded length
            buff << 42 # "*"
            val._encode(buff)

            # Calculate the submessage's size
            submessage_size = buff.bytesize - current_len - 1

            # Hope the size fits in one byte
            byte = submessage_size & 0x7F
            submessage_size >>= 7
            byte |= 0x80 if submessage_size > 0
            buff.setbyte(current_len, byte)

            # If the sub message was bigger
            if submessage_size > 0
              current_len += 1

              # compute how much we need to shift
              encoded_int_len = 0
              remaining_size = submessage_size
              while remaining_size != 0
                remaining_size >>= 7
                encoded_int_len += 1
              end

              # Make space in the string with dummy bytes
              buff.bytesplice(current_len, 0, "*********", 0, encoded_int_len)

              # Overwrite the dummy bytes with the encoded length
              while submessage_size != 0
                byte = submessage_size & 0x7F
                submessage_size >>= 7
                byte |= 0x80 if submessage_size > 0
                buff.setbyte(current_len, byte)
                current_len += 1
              end
            end

            buff
          end

          val = @double_array_value
          if val
            buff << 0x3a

            # Save the buffer size before appending the submessage
            current_len = buff.bytesize

            # Write a single dummy byte to later store encoded length
            buff << 42 # "*"
            val._encode(buff)

            # Calculate the submessage's size
            submessage_size = buff.bytesize - current_len - 1

            # Hope the size fits in one byte
            byte = submessage_size & 0x7F
            submessage_size >>= 7
            byte |= 0x80 if submessage_size > 0
            buff.setbyte(current_len, byte)

            # If the sub message was bigger
            if submessage_size > 0
              current_len += 1

              # compute how much we need to shift
              encoded_int_len = 0
              remaining_size = submessage_size
              while remaining_size != 0
                remaining_size >>= 7
                encoded_int_len += 1
              end

              # Make space in the string with dummy bytes
              buff.bytesplice(current_len, 0, "*********", 0, encoded_int_len)

              # Overwrite the dummy bytes with the encoded length
              while submessage_size != 0
                byte = submessage_size & 0x7F
                submessage_size >>= 7
                byte |= 0x80 if submessage_size > 0
                buff.setbyte(current_len, byte)
                current_len += 1
              end
            end

            buff
          end

          val = @bool_array_value
          if val
            buff << 0x42

            # Save the buffer size before appending the submessage
            current_len = buff.bytesize

            # Write a single dummy byte to later store encoded length
            buff << 42 # "*"
            val._encode(buff)

            # Calculate the submessage's size
            submessage_size = buff.bytesize - current_len - 1

            # Hope the size fits in one byte
            byte = submessage_size & 0x7F
            submessage_size >>= 7
            byte |= 0x80 if submessage_size > 0
            buff.setbyte(current_len, byte)

            # If the sub message was bigger
            if submessage_size > 0
              current_len += 1

              # compute how much we need to shift
              encoded_int_len = 0
              remaining_size = submessage_size
              while remaining_size != 0
                remaining_size >>= 7
                encoded_int_len += 1
              end

              # Make space in the string with dummy bytes
              buff.bytesplice(current_len, 0, "*********", 0, encoded_int_len)

              # Overwrite the dummy bytes with the encoded length
              while submessage_size != 0
                byte = submessage_size & 0x7F
                submessage_size >>= 7
                byte |= 0x80 if submessage_size > 0
                buff.setbyte(current_len, byte)
                current_len += 1
              end
            end

            buff
          end

          val = @json_value
          if ((len = val.bytesize) > 0)
            buff << 0x4a
            while len != 0
              byte = len & 0x7F
              len >>= 7
              byte |= 0x80 if len > 0
              buff << byte
            end

            buff << (val.ascii_only? ? val : val.b)
          end
          buff << @_unknown_fields if @_unknown_fields
          buff
        end

        def to_h
          result = {}
          send("value").tap { |f| result[f.to_sym] = send(f) if f }
          result
        end
      end
      class StringArrayValue
        def self.decode(buff)
          allocate.decode_from(buff.b, 0, buff.bytesize)
        end

        def self.encode(obj)
          obj._encode("".b)
        end
        # required field readers

        attr_reader :values

        def values=(v)
          @values = v
        end

        def initialize(values: [])
          @values = values
        end

        def to_proto(_options = {})
          self.class.encode(self)
        end

        def decode_from(buff, index, len)
          @values = []

          return self if index >= len
          ## PULL_UINT64
          tag =
            if (byte0 = buff.getbyte(index)) < 0x80
              index += 1
              byte0
            elsif (byte1 = buff.getbyte(index + 1)) < 0x80
              index += 2
              (byte1 << 7) | (byte0 & 0x7F)
            elsif (byte2 = buff.getbyte(index + 2)) < 0x80
              index += 3
              (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte3 = buff.getbyte(index + 3)) < 0x80
              index += 4
              (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                (byte0 & 0x7F)
            elsif (byte4 = buff.getbyte(index + 4)) < 0x80
              index += 5
              (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte5 = buff.getbyte(index + 5)) < 0x80
              index += 6
              (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte6 = buff.getbyte(index + 6)) < 0x80
              index += 7
              (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte7 = buff.getbyte(index + 7)) < 0x80
              index += 8
              (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte8 = buff.getbyte(index + 8)) < 0x80
              index += 9
              (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte9 = buff.getbyte(index + 9)) < 0x80
              index += 10

              (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) |
                ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            else
              raise "integer decoding error"
            end

          ## END PULL_UINT64

          found = true
          while true
            # If we have looped around since the last found tag this one is
            # unexpected, so discard it and continue.
            if !found
              wire_type = tag & 0x7

              unknown_bytes = +"".b
              val = tag
              while val != 0
                byte = val & 0x7F

                val >>= 7
                # This drops the top bits,
                # Otherwise, with a signed right shift,
                # we get infinity one bits at the top
                val &= (1 << 57) - 1

                byte |= 0x80 if val != 0
                unknown_bytes << byte
              end

              case wire_type
              when 0
                i = 0
                while true
                  newbyte = buff.getbyte(index)
                  index += 1
                  break if newbyte.nil?
                  unknown_bytes << newbyte
                  break if newbyte < 0x80
                  i += 1
                  break if i > 9
                end
              when 1
                unknown_bytes << buff.byteslice(index, 8)
                index += 8
              when 2
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                val = value
                while val != 0
                  byte = val & 0x7F

                  val >>= 7
                  # This drops the top bits,
                  # Otherwise, with a signed right shift,
                  # we get infinity one bits at the top
                  val &= (1 << 57) - 1

                  byte |= 0x80 if val != 0
                  unknown_bytes << byte
                end

                unknown_bytes << buff.byteslice(index, value)
                index += value
              when 5
                unknown_bytes << buff.byteslice(index, 4)
                index += 4
              else
                raise "unknown wire type #{wire_type}"
              end
              (@_unknown_fields ||= +"".b) << unknown_bytes
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            found = false

            if tag == 0xa
              found = true
              ## DECODE REPEATED
              list = @values
              while true
                ## PULL_STRING
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                list << buff.byteslice(index, value).force_encoding(
                  Encoding::UTF_8
                )
                index += value

                ## END PULL_STRING

                return self if index >= len
                ## PULL_UINT64
                tag =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                ## END PULL_UINT64

                break unless tag == 0xa
              end
              ## END DECODE REPEATED

              return self if index >= len
            end

            return self if index >= len
          end
        end
        def _encode(buff)
          list = @values
          if list.size > 0
            list.each do |item|
              val = item
              if ((len = val.bytesize) > 0)
                buff << 0x0a
                while len != 0
                  byte = len & 0x7F
                  len >>= 7
                  byte |= 0x80 if len > 0
                  buff << byte
                end

                buff << (val.ascii_only? ? val : val.b)
              end
            end
          end
          buff << @_unknown_fields if @_unknown_fields
          buff
        end

        def to_h
          result = {}
          result["values".to_sym] = @values
          result
        end
      end
      class IntArrayValue
        def self.decode(buff)
          allocate.decode_from(buff.b, 0, buff.bytesize)
        end

        def self.encode(obj)
          obj._encode("".b)
        end
        # required field readers

        attr_reader :values

        def values=(v)
          v.each do |v|
            unless -9_223_372_036_854_775_808 <= v &&
                     v <= 9_223_372_036_854_775_807
              raise RangeError,
                    "Value (#{v}}) for field values is out of bounds (-9223372036854775808..9223372036854775807)"
            end
          end

          @values = v
        end

        def initialize(values: [])
          values.each do |v|
            unless -9_223_372_036_854_775_808 <= v &&
                     v <= 9_223_372_036_854_775_807
              raise RangeError,
                    "Value (#{v}}) for field values is out of bounds (-9223372036854775808..9223372036854775807)"
            end
          end
          @values = values
        end

        def to_proto(_options = {})
          self.class.encode(self)
        end

        def decode_from(buff, index, len)
          @values = []

          return self if index >= len
          ## PULL_UINT64
          tag =
            if (byte0 = buff.getbyte(index)) < 0x80
              index += 1
              byte0
            elsif (byte1 = buff.getbyte(index + 1)) < 0x80
              index += 2
              (byte1 << 7) | (byte0 & 0x7F)
            elsif (byte2 = buff.getbyte(index + 2)) < 0x80
              index += 3
              (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte3 = buff.getbyte(index + 3)) < 0x80
              index += 4
              (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                (byte0 & 0x7F)
            elsif (byte4 = buff.getbyte(index + 4)) < 0x80
              index += 5
              (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte5 = buff.getbyte(index + 5)) < 0x80
              index += 6
              (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte6 = buff.getbyte(index + 6)) < 0x80
              index += 7
              (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte7 = buff.getbyte(index + 7)) < 0x80
              index += 8
              (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte8 = buff.getbyte(index + 8)) < 0x80
              index += 9
              (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte9 = buff.getbyte(index + 9)) < 0x80
              index += 10

              (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) |
                ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            else
              raise "integer decoding error"
            end

          ## END PULL_UINT64

          found = true
          while true
            # If we have looped around since the last found tag this one is
            # unexpected, so discard it and continue.
            if !found
              wire_type = tag & 0x7

              unknown_bytes = +"".b
              val = tag
              while val != 0
                byte = val & 0x7F

                val >>= 7
                # This drops the top bits,
                # Otherwise, with a signed right shift,
                # we get infinity one bits at the top
                val &= (1 << 57) - 1

                byte |= 0x80 if val != 0
                unknown_bytes << byte
              end

              case wire_type
              when 0
                i = 0
                while true
                  newbyte = buff.getbyte(index)
                  index += 1
                  break if newbyte.nil?
                  unknown_bytes << newbyte
                  break if newbyte < 0x80
                  i += 1
                  break if i > 9
                end
              when 1
                unknown_bytes << buff.byteslice(index, 8)
                index += 8
              when 2
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                val = value
                while val != 0
                  byte = val & 0x7F

                  val >>= 7
                  # This drops the top bits,
                  # Otherwise, with a signed right shift,
                  # we get infinity one bits at the top
                  val &= (1 << 57) - 1

                  byte |= 0x80 if val != 0
                  unknown_bytes << byte
                end

                unknown_bytes << buff.byteslice(index, value)
                index += value
              when 5
                unknown_bytes << buff.byteslice(index, 4)
                index += 4
              else
                raise "unknown wire type #{wire_type}"
              end
              (@_unknown_fields ||= +"".b) << unknown_bytes
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            found = false

            if tag == 0xa
              found = true
              ## PULL_UINT64
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64

              goal = index + value
              list = @values
              while true
                break if index >= goal
                ## PULL_INT64
                list << if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  # Negative 32 bit integers are still encoded with 10 bytes
                  # handle 2's complement negative numbers
                  # If the top bit is 1, then it must be negative.
                  -(
                    (
                      (
                        ~(
                          (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                            ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                            ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                            ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                            ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                        )
                      ) & 0xFFFF_FFFF_FFFF_FFFF
                    ) + 1
                  )
                else
                  raise "integer decoding error"
                end

                ## END PULL_INT64
              end

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end

            return self if index >= len
          end
        end
        def _encode(buff)
          list = @values
          if list.size > 0
            buff << 0x0a

            # Save the buffer size before appending the repeated bytes
            current_len = buff.bytesize

            # Write a single dummy byte to later store encoded length
            buff << 42 # "*"

            # write each item
            list.each do |item|
              val = item
              if val != 0
                while val != 0
                  byte = val & 0x7F

                  val >>= 7
                  # This drops the top bits,
                  # Otherwise, with a signed right shift,
                  # we get infinity one bits at the top
                  val &= (1 << 57) - 1

                  byte |= 0x80 if val != 0
                  buff << byte
                end
              end
            end

            # Calculate the submessage's size
            submessage_size = buff.bytesize - current_len - 1

            # Hope the size fits in one byte
            byte = submessage_size & 0x7F
            submessage_size >>= 7
            byte |= 0x80 if submessage_size > 0
            buff.setbyte(current_len, byte)

            # If the sub message was bigger
            if submessage_size > 0
              current_len += 1

              # compute how much we need to shift
              encoded_int_len = 0
              remaining_size = submessage_size
              while remaining_size != 0
                remaining_size >>= 7
                encoded_int_len += 1
              end

              # Make space in the string with dummy bytes
              buff.bytesplice(current_len, 0, "*********", 0, encoded_int_len)

              # Overwrite the dummy bytes with the encoded length
              while submessage_size != 0
                byte = submessage_size & 0x7F
                submessage_size >>= 7
                byte |= 0x80 if submessage_size > 0
                buff.setbyte(current_len, byte)
                current_len += 1
              end
            end
          end
          buff << @_unknown_fields if @_unknown_fields
          buff
        end

        def to_h
          result = {}
          result["values".to_sym] = @values
          result
        end
      end
      class DoubleArrayValue
        def self.decode(buff)
          allocate.decode_from(buff.b, 0, buff.bytesize)
        end

        def self.encode(obj)
          obj._encode("".b)
        end
        # required field readers

        attr_reader :values

        def values=(v)
          @values = v
        end

        def initialize(values: [])
          @values = values
        end

        def to_proto(_options = {})
          self.class.encode(self)
        end

        def decode_from(buff, index, len)
          @values = []

          return self if index >= len
          ## PULL_UINT64
          tag =
            if (byte0 = buff.getbyte(index)) < 0x80
              index += 1
              byte0
            elsif (byte1 = buff.getbyte(index + 1)) < 0x80
              index += 2
              (byte1 << 7) | (byte0 & 0x7F)
            elsif (byte2 = buff.getbyte(index + 2)) < 0x80
              index += 3
              (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte3 = buff.getbyte(index + 3)) < 0x80
              index += 4
              (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                (byte0 & 0x7F)
            elsif (byte4 = buff.getbyte(index + 4)) < 0x80
              index += 5
              (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte5 = buff.getbyte(index + 5)) < 0x80
              index += 6
              (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte6 = buff.getbyte(index + 6)) < 0x80
              index += 7
              (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte7 = buff.getbyte(index + 7)) < 0x80
              index += 8
              (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte8 = buff.getbyte(index + 8)) < 0x80
              index += 9
              (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte9 = buff.getbyte(index + 9)) < 0x80
              index += 10

              (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) |
                ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            else
              raise "integer decoding error"
            end

          ## END PULL_UINT64

          found = true
          while true
            # If we have looped around since the last found tag this one is
            # unexpected, so discard it and continue.
            if !found
              wire_type = tag & 0x7

              unknown_bytes = +"".b
              val = tag
              while val != 0
                byte = val & 0x7F

                val >>= 7
                # This drops the top bits,
                # Otherwise, with a signed right shift,
                # we get infinity one bits at the top
                val &= (1 << 57) - 1

                byte |= 0x80 if val != 0
                unknown_bytes << byte
              end

              case wire_type
              when 0
                i = 0
                while true
                  newbyte = buff.getbyte(index)
                  index += 1
                  break if newbyte.nil?
                  unknown_bytes << newbyte
                  break if newbyte < 0x80
                  i += 1
                  break if i > 9
                end
              when 1
                unknown_bytes << buff.byteslice(index, 8)
                index += 8
              when 2
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                val = value
                while val != 0
                  byte = val & 0x7F

                  val >>= 7
                  # This drops the top bits,
                  # Otherwise, with a signed right shift,
                  # we get infinity one bits at the top
                  val &= (1 << 57) - 1

                  byte |= 0x80 if val != 0
                  unknown_bytes << byte
                end

                unknown_bytes << buff.byteslice(index, value)
                index += value
              when 5
                unknown_bytes << buff.byteslice(index, 4)
                index += 4
              else
                raise "unknown wire type #{wire_type}"
              end
              (@_unknown_fields ||= +"".b) << unknown_bytes
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            found = false

            if tag == 0xa
              found = true
              ## PULL_UINT64
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64

              goal = index + value
              list = @values
              while true
                break if index >= goal
                list << buff.unpack1("E", offset: index)
                index += 8
              end

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end

            return self if index >= len
          end
        end
        def _encode(buff)
          list = @values
          if list.size > 0
            buff << 0x0a

            # Save the buffer size before appending the repeated bytes
            current_len = buff.bytesize

            # Write a single dummy byte to later store encoded length
            buff << 42 # "*"

            # write each item
            list.each do |item|
              val = item
              [val].pack("E", buffer: buff) if val != 0
            end

            # Calculate the submessage's size
            submessage_size = buff.bytesize - current_len - 1

            # Hope the size fits in one byte
            byte = submessage_size & 0x7F
            submessage_size >>= 7
            byte |= 0x80 if submessage_size > 0
            buff.setbyte(current_len, byte)

            # If the sub message was bigger
            if submessage_size > 0
              current_len += 1

              # compute how much we need to shift
              encoded_int_len = 0
              remaining_size = submessage_size
              while remaining_size != 0
                remaining_size >>= 7
                encoded_int_len += 1
              end

              # Make space in the string with dummy bytes
              buff.bytesplice(current_len, 0, "*********", 0, encoded_int_len)

              # Overwrite the dummy bytes with the encoded length
              while submessage_size != 0
                byte = submessage_size & 0x7F
                submessage_size >>= 7
                byte |= 0x80 if submessage_size > 0
                buff.setbyte(current_len, byte)
                current_len += 1
              end
            end
          end
          buff << @_unknown_fields if @_unknown_fields
          buff
        end

        def to_h
          result = {}
          result["values".to_sym] = @values
          result
        end
      end
      class BoolArrayValue
        def self.decode(buff)
          allocate.decode_from(buff.b, 0, buff.bytesize)
        end

        def self.encode(obj)
          obj._encode("".b)
        end
        # required field readers

        attr_reader :values

        def values=(v)
          @values = v
        end

        def initialize(values: [])
          @values = values
        end

        def to_proto(_options = {})
          self.class.encode(self)
        end

        def decode_from(buff, index, len)
          @values = []

          return self if index >= len
          ## PULL_UINT64
          tag =
            if (byte0 = buff.getbyte(index)) < 0x80
              index += 1
              byte0
            elsif (byte1 = buff.getbyte(index + 1)) < 0x80
              index += 2
              (byte1 << 7) | (byte0 & 0x7F)
            elsif (byte2 = buff.getbyte(index + 2)) < 0x80
              index += 3
              (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte3 = buff.getbyte(index + 3)) < 0x80
              index += 4
              (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                (byte0 & 0x7F)
            elsif (byte4 = buff.getbyte(index + 4)) < 0x80
              index += 5
              (byte4 << 28) | ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte5 = buff.getbyte(index + 5)) < 0x80
              index += 6
              (byte5 << 35) | ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte6 = buff.getbyte(index + 6)) < 0x80
              index += 7
              (byte6 << 42) | ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte7 = buff.getbyte(index + 7)) < 0x80
              index += 8
              (byte7 << 49) | ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte8 = buff.getbyte(index + 8)) < 0x80
              index += 9
              (byte8 << 56) | ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            elsif (byte9 = buff.getbyte(index + 9)) < 0x80
              index += 10

              (byte9 << 63) | ((byte8 & 0x7F) << 56) | ((byte7 & 0x7F) << 49) |
                ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
            else
              raise "integer decoding error"
            end

          ## END PULL_UINT64

          found = true
          while true
            # If we have looped around since the last found tag this one is
            # unexpected, so discard it and continue.
            if !found
              wire_type = tag & 0x7

              unknown_bytes = +"".b
              val = tag
              while val != 0
                byte = val & 0x7F

                val >>= 7
                # This drops the top bits,
                # Otherwise, with a signed right shift,
                # we get infinity one bits at the top
                val &= (1 << 57) - 1

                byte |= 0x80 if val != 0
                unknown_bytes << byte
              end

              case wire_type
              when 0
                i = 0
                while true
                  newbyte = buff.getbyte(index)
                  index += 1
                  break if newbyte.nil?
                  unknown_bytes << newbyte
                  break if newbyte < 0x80
                  i += 1
                  break if i > 9
                end
              when 1
                unknown_bytes << buff.byteslice(index, 8)
                index += 8
              when 2
                value =
                  if (byte0 = buff.getbyte(index)) < 0x80
                    index += 1
                    byte0
                  elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                    index += 2
                    (byte1 << 7) | (byte0 & 0x7F)
                  elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                    index += 3
                    (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                    index += 4
                    (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                    index += 5
                    (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                    index += 6
                    (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                    index += 7
                    (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                    index += 8
                    (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                    index += 9
                    (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                      ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                      ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                      ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                      (byte0 & 0x7F)
                  elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                    index += 10

                    (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                      ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                      ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                      ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                      ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                  else
                    raise "integer decoding error"
                  end

                val = value
                while val != 0
                  byte = val & 0x7F

                  val >>= 7
                  # This drops the top bits,
                  # Otherwise, with a signed right shift,
                  # we get infinity one bits at the top
                  val &= (1 << 57) - 1

                  byte |= 0x80 if val != 0
                  unknown_bytes << byte
                end

                unknown_bytes << buff.byteslice(index, value)
                index += value
              when 5
                unknown_bytes << buff.byteslice(index, 4)
                index += 4
              else
                raise "unknown wire type #{wire_type}"
              end
              (@_unknown_fields ||= +"".b) << unknown_bytes
              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end
            found = false

            if tag == 0xa
              found = true
              ## PULL_UINT64
              value =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64

              goal = index + value
              list = @values
              while true
                break if index >= goal
                ## PULL BOOLEAN
                list << (buff.getbyte(index) == 1)
                index += 1
                ## END PULL BOOLEAN
              end

              return self if index >= len
              ## PULL_UINT64
              tag =
                if (byte0 = buff.getbyte(index)) < 0x80
                  index += 1
                  byte0
                elsif (byte1 = buff.getbyte(index + 1)) < 0x80
                  index += 2
                  (byte1 << 7) | (byte0 & 0x7F)
                elsif (byte2 = buff.getbyte(index + 2)) < 0x80
                  index += 3
                  (byte2 << 14) | ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte3 = buff.getbyte(index + 3)) < 0x80
                  index += 4
                  (byte3 << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte4 = buff.getbyte(index + 4)) < 0x80
                  index += 5
                  (byte4 << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte5 = buff.getbyte(index + 5)) < 0x80
                  index += 6
                  (byte5 << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte6 = buff.getbyte(index + 6)) < 0x80
                  index += 7
                  (byte6 << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte7 = buff.getbyte(index + 7)) < 0x80
                  index += 8
                  (byte7 << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                elsif (byte8 = buff.getbyte(index + 8)) < 0x80
                  index += 9
                  (byte8 << 56) | ((byte7 & 0x7F) << 49) |
                    ((byte6 & 0x7F) << 42) | ((byte5 & 0x7F) << 35) |
                    ((byte4 & 0x7F) << 28) | ((byte3 & 0x7F) << 21) |
                    ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                    (byte0 & 0x7F)
                elsif (byte9 = buff.getbyte(index + 9)) < 0x80
                  index += 10

                  (byte9 << 63) | ((byte8 & 0x7F) << 56) |
                    ((byte7 & 0x7F) << 49) | ((byte6 & 0x7F) << 42) |
                    ((byte5 & 0x7F) << 35) | ((byte4 & 0x7F) << 28) |
                    ((byte3 & 0x7F) << 21) | ((byte2 & 0x7F) << 14) |
                    ((byte1 & 0x7F) << 7) | (byte0 & 0x7F)
                else
                  raise "integer decoding error"
                end

              ## END PULL_UINT64
            end

            return self if index >= len
          end
        end
        def _encode(buff)
          list = @values
          if list.size > 0
            buff << 0x0a

            # Save the buffer size before appending the repeated bytes
            current_len = buff.bytesize

            # Write a single dummy byte to later store encoded length
            buff << 42 # "*"

            # write each item
            list.each do |item|
              val = item
              if val == true
                buff << 1
              elsif val == false
                # Default value, encode nothing
              else
                raise "bool values should be true or false"
              end
            end

            # Calculate the submessage's size
            submessage_size = buff.bytesize - current_len - 1

            # Hope the size fits in one byte
            byte = submessage_size & 0x7F
            submessage_size >>= 7
            byte |= 0x80 if submessage_size > 0
            buff.setbyte(current_len, byte)

            # If the sub message was bigger
            if submessage_size > 0
              current_len += 1

              # compute how much we need to shift
              encoded_int_len = 0
              remaining_size = submessage_size
              while remaining_size != 0
                remaining_size >>= 7
                encoded_int_len += 1
              end

              # Make space in the string with dummy bytes
              buff.bytesplice(current_len, 0, "*********", 0, encoded_int_len)

              # Overwrite the dummy bytes with the encoded length
              while submessage_size != 0
                byte = submessage_size & 0x7F
                submessage_size >>= 7
                byte |= 0x80 if submessage_size > 0
                buff.setbyte(current_len, byte)
                current_len += 1
              end
            end
          end
          buff << @_unknown_fields if @_unknown_fields
          buff
        end

        def to_h
          result = {}
          result["values".to_sym] = @values
          result
        end
      end
    end
  end
end
