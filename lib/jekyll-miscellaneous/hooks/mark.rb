# frozen_string_literal: true

module JekyllMiscellaneous
  module Hooks
    module MarkHook
      def self.process(doc)
        doc.content.gsub!(%r!==+(\w(.*?)?[^ .=]?)==+!, '<mark>\\1</mark>')
      end
    end
  end
end

Jekyll::Hooks.register([:documents], :pre_render do |doc|
  JekyllMiscellaneous::Hooks::Mark.process(doc)
end
