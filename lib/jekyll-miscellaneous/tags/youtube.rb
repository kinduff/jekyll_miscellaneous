# frozen_string_literal: true

module JekyllMiscellaneous
  module Tags
    class YouTube < Liquid::Tag
      # Initialize the YouTube tag.
      #
      # tag_name::
      #   The name of the tag.
      # id::
      #   The ID of the YouTube video.
      # tokens::
      #   The tokens to parse.
      def initialize(tag_name, id, tokens)
        super
        @id = id.strip
      end

      # Render the YouTube tag.
      #
      # == Returns:
      # Returns the HTML for the YouTube video.
      #
      # == Example:
      #   {% youtube "https://www.youtube.com/watch?v=dQw4w9WgXcQ" %}
      #   # => <div class="youtube-container"><iframe src="https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ"></iframe></div>
      def render(_context)
        "<div class='youtube-container'><iframe src=\"https://www.youtube-nocookie.com/embed/#{@id}\"></iframe></div>"
      end
    end
  end
end

Liquid::Template.register_tag('youtube', JekyllMiscellaneous::Tags::YouTube)
