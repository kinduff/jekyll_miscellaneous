# frozen_string_literal: true

require "base64"
# frozen_string_literal: true

module JekyllMiscellaneous
  module Filters
    module Base64Filter
      def base64_encode(input)
        Base64.encode64(input)
      end

      def base64_decode(input)
        Base64.decode64(input)
      end
    end
  end
end

Liquid::Template.register_filter(Base64Filter)
