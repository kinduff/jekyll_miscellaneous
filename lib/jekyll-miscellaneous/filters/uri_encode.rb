# frozen_string_literal: true

module JekyllMiscellaneous
  module Filters
    module URIEncode
      def uri_encode(url)
        URI.encode_www_form_component(url)
      end
    end
  end
end

Liquid::Template.register_filter(JekyllMiscellaneous::Filters::URIEncode)
