# frozen_string_literal: true

module JekyllMiscellaneous
  module Filters
    module HashColor
      # Returns a string with the hexadecimal color code of the hash.
      #
      # == Parameters:
      # input::
      #   The hash to get the hexadecimal color code from.
      #
      # == Returns:
      # The hexadecimal color code of the hash.
      #
      # == Example:
      #   hash_color('Hello, World!')
      #   # => "#f5f5f5"
      def hash_color(input)
        hash = 0
        input.each_byte { |c| hash = c + ((hash << 5) - hash) }
        "hsl(#{hash % 360}, 100%, 90%)"
      end
    end
  end
end

Liquid::Template.register_filter(JekyllMiscellaneous::Filters::HashColor)
