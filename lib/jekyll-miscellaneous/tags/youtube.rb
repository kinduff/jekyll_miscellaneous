# frozen_string_literal: true

module JekyllMiscellaneous
  module Tags
    class YouTubeTag < Liquid::Tag
      def initialize(tag_name, id, tokens)
        super
        @id = id.strip
      end

      def render(_context)
        "<div class='youtube-container'><iframe src=\"https://www.youtube-nocookie.com/embed/#{@id}\"></iframe></div>"
      end
    end
  end
end

Liquid::Template.register_tag('youtube', JekyllMiscellaneous::Tags::YouTubeTag)
