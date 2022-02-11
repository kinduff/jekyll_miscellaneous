# frozen_string_literal: true

require 'nokogiri'
require 'uri'

module JekyllMiscellaneous
  module Hooks
    module ExternalLinks
      # Processes the resource.
      #
      # resource::
      #   The resource to process.
      #
      # == Returns:
      # The processed resource.
      def self.process(resource)
        return if resource.data['layout'].nil?

        site_hostname = URI(resource.site.config['base_url']).host
        link_selector = 'body a'

        return if resource.respond_to?(:asset_file?) && resource.asset_file?

        resource.output = process_content(
          site_hostname,
          resource.output,
          link_selector
        )
      end

      # Processes a string of content with Nokogiri. The content is processed
      # with the given link selector. The links are checked to see if they
      # match the site hostname. If they do not, the link is modified to
      # include +rel="external"+ and +target="_blank"+.
      #
      # The links are modified to include +⧉+ (a unicode character) to indicate
      # that they are external. Except:
      #
      # - When the link is a relative URL.
      # - When the link contains an image.
      # - When the link has a the class +skip-external+.
      #
      # site_hostname::
      #   The hostname of the site.
      # content::
      #   The content to process.
      # link_selector::
      #   The CSS selector used to find links.
      #
      # == Returns
      #
      # site_hostname::
      #   The hostname of the site.
      # content::
      #   The content to process.
      # link_selector::
      #   The CSS selector for the links.
      #
      # == Returns:
      # The content with instances of +a+ HTML tags with new attributes.
      def self.process_content(site_hostname, content, link_selector)
        content = Nokogiri::HTML(content)
        content.css(link_selector).each do |a|
          next unless /\Ahttp/i.match?(a.get_attribute('href'))
          next if %r{\Ahttp(s)?://#{site_hostname}}i.match?(a.get_attribute('href'))

          a.set_attribute('rel', 'external')
          a.set_attribute('target', '_blank')

          next if a.children.size.positive? && a.children.map(&:name).include?('img')
          next if a.get_attribute('class')&.include?('skip-external')

          a.content = "#{a.content} ⧉"
        end
        content.to_s
      end
    end
  end
end

# :nocov:
Jekyll::Hooks.register [:documents, :pages], :post_render do |doc|
  JekyllMiscellaneous::Hooks::ExternalLinks.process(doc)
end
# :nocov:
