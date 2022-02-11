# frozen_string_literal: true

require 'spec_helper'

describe JekyllMiscellaneous::Filters::HashColor do
  let(:output) { render_liquid(content) }

  describe '#hash_color' do
    let(:content) { '{{ "foo" | hash_color }}' }

    it 'returns a hash color' do
      expect(output).to eq('hsl(54, 100%, 90%)')
    end
  end
end
