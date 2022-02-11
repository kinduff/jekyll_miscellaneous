# frozen_string_literal: true

module JekyllMiscellaneous
  module Filters
    module Truncate
      # Truncates a string to a certain length, and adds an ellipsis if the
      # string is truncated. If the string is already shorter than the
      # specified length, it is returned unchanged. If the string is longer
      # than the specified length, it is truncated to that length. The
      # ellipsis is added to the end of the string. The separator is used to
      # split the string into words.
      #
      # == Parameters:
      # input::
      #   The string to truncate.
      # length::
      #   The maximum length of the string.
      # separator::
      #   The string to use as a separator.
      # omission::
      #   The string to use as an omission.
      #
      # == Returns:
      # The truncated string.
      #
      def truncate(input, truncate_at = 140, separator = nil, omission = '...')
        return input.dup unless input.length > truncate_at

        length_with_room_for_omission = truncate_at - omission.length
        stop = if separator
                 input.rindex(separator, length_with_room_for_omission) || length_with_room_for_omission
               else
                 length_with_room_for_omission
               end

        "#{input[0...stop]}#{omission}"
      end
    end
  end
end

Liquid::Template.register_filter(JekyllMiscellaneous::Filters::Truncate)
