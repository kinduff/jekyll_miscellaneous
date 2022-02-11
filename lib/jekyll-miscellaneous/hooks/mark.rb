# frozen_string_literal: true

module JekyllMiscellaneous
  module Hooks
    module Mark
      # Searches and replaces within a document's content for the expression
      # +==input==+, and replaces it with the HTML tag +<mark>input</mark>+.
      #
      # == Parameters:
      # doc::
      #   The document to search and replace within.
      #
      # == Returns:
      # The document with the expression replaced.
      def self.process(doc)
        doc.content.gsub!(%r!==+(\w(.*?)?[^ .=]?)==+!, '<mark>\\1</mark>')
      end
    end
  end
end

# :nocov:
Jekyll::Hooks.register [:documents], :pre_render do |doc|
  JekyllMiscellaneous::Hooks::Mark.process(doc)
end
# :nocov:
