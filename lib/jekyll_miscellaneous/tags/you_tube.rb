# frozen_string_literal: true

module JekyllMiscellaneous
  module Tags
    class YouTube < Liquid::Tag
      # Initialize the YouTube tag.
      #
      # == Parameters:
      # tag_name::
      #   The name of the tag.
      # markup::
      #   The markup inside the tag.
      # tokens::
      #   The tokens to parse.
      def initialize(tag_name, markup, tokens)
        super
        args = markup.split
        @id = args[0].strip
        @use_nocookie = args[1] && args[1].strip.downcase == 'nocookie'
      end

      # Render the YouTube tag.
      #
      # == Returns:
      # Returns the HTML for the YouTube video.
      #
      # == Example:
      #   {% youtube "dQw4w9WgXcQ" %}
      #   <div class="youtube-container"><iframe src="https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ"></iframe></div>
      #
      #   {% youtube "dQw4w9WgXcQ" nocookie %}
      #   <div class="youtube-container"><iframe src="https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ"></iframe></div>
      #
      #   {% youtube "dQw4w9WgXcQ" normal %}
      #   <div class="youtube-container"><iframe src="https://www.youtube.com/embed/dQw4w9WgXcQ"></iframe></div>
      def render(_context)
        domain = @use_nocookie ? "www.youtube-nocookie.com" : "www.youtube.com"
        "<div class='youtube-container'><iframe src=\"https://#{domain}/embed/#{@id}\"></iframe></div>"
      end
    end
  end
end

Liquid::Template.register_tag('youtube', JekyllMiscellaneous::Tags::YouTube)
