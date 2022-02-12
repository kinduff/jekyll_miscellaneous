# frozen_string_literal: true

require 'base64'
module JekyllMiscellaneous
  module Filters
    module Base64
      # Encodes a string to Base64, and returns the result.
      #
      # == Parameters:
      # input::
      #   The string to encode.
      #
      # == Returns:
      # The Base64 encoded string.
      #
      # == Example:
      #   base64_encode('Hello, World!')
      #   # => "SGVsbG8sIFdvcmxkIQ=="
      def base64_encode(input)
        ::Base64.encode64(input)
      end

      # Decodes a Base64 string, and returns the result.
      #
      # == Parameters:
      # input::
      #   The Base64 string to decode.
      #
      # == Returns:
      # The decoded string.
      #
      # == Example:
      #   base64_decode('SGVsbG8sIFdvcmxkIQ==')
      #   # => "Hello, World!"
      def base64_decode(input)
        ::Base64.decode64(input)
      end
    end
  end
end

Liquid::Template.register_filter(JekyllMiscellaneous::Filters::Base64)
