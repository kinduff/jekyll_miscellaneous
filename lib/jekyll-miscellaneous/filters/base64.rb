# frozen_string_literal: true

require 'base64'

module JekyllMiscellaneous
  module Filters
    module Base64
      def base64_encode(input)
        ::Base64.encode64(input)
      end

      def base64_decode(input)
        ::Base64.decode64(input)
      end
    end
  end
end

Liquid::Template.register_filter(JekyllMiscellaneous::Filters::Base64)
