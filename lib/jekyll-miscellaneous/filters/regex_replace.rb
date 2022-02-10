# frozen_string_literal: true

module JekyllMiscellaneous
  module Filters
    module RegexReplaceFilter
      def regex_replace(input, regex, value)
        formatted_regex = /#{regex}/
        input.gsub(formatted_regex, value)
      end

      def clean_urls(input)
        regex_replace(input.delete('…'), '(?<=^|[\s,])([\w-]+\.[a-z]{2,}\S*)\b', '')
      end
    end
  end
end

Liquid::Template.register_filter(JekyllMiscellaneous::Filters::RegexReplaceFilter)
