# encoding: ascii-8bit
# rubocop:disable all
# frozen_string_literal: true

module Observe
  module Proto
    class FulfillmentOrderAcquiringLock
      def self.decode(buff)
        allocate.decode_from(buff.b, 0, buff.bytesize)
      end

      def self.encode(obj)
        obj._encode("".b)
      end
      # required field readers

      attr_reader :log_context

      attr_reader :scope_name

      attr_reader :fulfillment_order_ids

      def log_context=(v)
        @log_context = v
      end

      def scope_name=(v)
        @scope_name = v
      end

      def fulfillment_order_ids=(v)
        v.each do |v|
          unless -9_223_372_036_854_775_808 <= v &&
                   v <= 9_223_372_036_854_775_807
            raise RangeError,
                  "Value (#{v}}) for field fulfillment_order_ids is out of bounds (-9223372036854775808..9223372036854775807)"
          end
        end

        @fulfillment_order_ids = v
      end

      def initialize(log_context: "", scope_name: "", fulfillment_order_ids: [])
        @log_context = log_context

        @scope_name = scope_name

        fulfillment_order_ids.each do |v|
          unless -9_223_372_036_854_775_808 <= v &&
                   v <= 9_223_372_036_854_775_807
            raise RangeError,
                  "Value (#{v}}) for field fulfillment_order_ids is out of bounds (-9223372036854775808..9223372036854775807)"
          end
        end
        @fulfillment_order_ids = fulfillment_order_ids
      end

      def to_proto(_options = {})
        self.class.encode(self)
      end

      def decode_from(buff, index, len)
        @log_context = ""
        @scope_name = ""
        @fulfillment_order_ids = []

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
                (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                  (byte0 & 0x7F)
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
                (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                  (byte0 & 0x7F)
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

            @log_context =
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
                (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                  (byte0 & 0x7F)
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
                (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                  (byte0 & 0x7F)
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

            @scope_name =
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
                (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                  (byte0 & 0x7F)
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
                (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                  (byte0 & 0x7F)
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
            list = @fulfillment_order_ids
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
                (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                  (byte0 & 0x7F)
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
                (byte3 << 21) | ((byte2 & 0x7F) << 14) | ((byte1 & 0x7F) << 7) |
                  (byte0 & 0x7F)
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
        val = @log_context
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

        val = @scope_name
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

        list = @fulfillment_order_ids
        if list.size > 0
          buff << 0x1a

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
        result["log_context".to_sym] = @log_context
        result["scope_name".to_sym] = @scope_name
        result["fulfillment_order_ids".to_sym] = @fulfillment_order_ids
        result
      end
    end
  end
end
