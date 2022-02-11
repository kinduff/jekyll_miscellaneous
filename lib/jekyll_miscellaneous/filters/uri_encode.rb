# frozen_string_literal: true

module JekyllMiscellaneous
  module Filters
    module URIEncode
      # Encodes a string to URI, and returns the result.
      #
      # == Parameters:
      # input::
      #   The string to encode.
      #
      # == Returns:
      # The URI encoded string.
      #
      # == Example:
      #   uri_encode('Hello, World!')
      #   # => "Hello%2C%20World%21"
      def uri_encode(input)
        URI.encode_www_form_component(input)
      end
    end
  end
end

Liquid::Template.register_filter(JekyllMiscellaneous::Filters::URIEncode)
