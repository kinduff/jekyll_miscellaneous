# frozen_string_literal: true

module JekyllMiscellaneous
  module Filters
    module HashColorFilter
      def hash_color(input)
        "hsl(#{hash_code(input) % 360}, 100%, 90%)"
      end

      private

      def hash_code(input)
        hash = 0
        input.each_byte { |c| hash = c + ((hash << 5) - hash) }
        hash
      end
    end
  end
end

Liquid::Template.register_filter(JekyllMiscellaneous::Filters::HashColorFilter)
