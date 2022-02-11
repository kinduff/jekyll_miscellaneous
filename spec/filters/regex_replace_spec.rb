# frozen_string_literal: true

require 'spec_helper'

describe JekyllMiscellaneous::Filters::RegexReplace do
  let(:output) { render_liquid(content) }

  describe '#regex_replace' do
    let(:content) { '{{ "foo baz baz" | regex_replace: "baz$", "qux" }}' }

    it 'replaces the given regex' do
      expect(output).to eq('foo baz qux')
    end
  end

  describe '#clean_urls' do
    let(:content) { '{{ "candy example.com" | clean_urls }}' }

    it 'removes the domain from the given URL' do
      expect(output.strip).to eq('candy')
    end
  end
end
