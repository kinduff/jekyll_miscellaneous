# frozen_string_literal: true

module JekyllMiscellaneous
  module Filters
    module RegexReplace
      # Replaces all occurrences of a regular expression in a string with a
      # replacement.
      #
      # == Parameters:
      # input::
      #   The string to replace the regular expression in.
      # regex::
      #   The regular expression to replace, as a string.
      # replacement::
      #   The string to replace the regular expression with.
      #
      # == Returns:
      # The string with all occurrences of the regular expression replaced.
      #
      # == Example:
      #   regex_replace('Hello, World!', '$Hello', 'Goodbye')
      #   # => "Goodbye, World!"
      def regex_replace(input, regex, replacement)
        formatted_regex = /#{regex}/
        input.gsub(formatted_regex, replacement)
      end

      # Replaces all occurrences of URLs in a string with a nothing.
      #
      # == Note:
      # It will strip and squeeze the result string.
      #
      # == Parameters:
      # input::
      #   The string to clean the urls from.
      #
      # == Returns:
      # The string without URLs.
      #
      # == Example:
      #   regex_replace_urls('Hello, http://example.com World!')
      #   # => "Hello, World!"
      def clean_urls(input)
        regex_replace(input.delete('…'), '(?<=^|[\s,])([\w-]+\.[a-z]{2,}\S*)\b', '').strip.squeeze(' ')
      end
    end
  end
end

Liquid::Template.register_filter(JekyllMiscellaneous::Filters::RegexReplace)
