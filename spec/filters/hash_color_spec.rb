# frozen_string_literal: true

require 'spec_helper'

describe JekyllMiscellaneous::Filters::HashColorFilter do
  let(:output) { render_liquid(content) }

  describe '#hash_color' do
    let(:content) { '{{ "foo" | hash_color }}' }

    before { allow_any_instance_of(described_class).to receive(:hash_code) { 360 } }

    it 'returns a hash color' do
      expect(output).to eq('hsl(0, 100%, 90%)')
    end
  end
end
