# frozen_string_literal: true

require 'spec_helper'

describe JekyllMiscellaneous::Filters::TruncateFilter do
  let(:output) { render_liquid(content) }

  describe '#truncate' do
    let(:content) { '{{ "foo bar baz" | truncate: 10 }}' }

    it { expect(output).to eq('foo bar...') }

    context 'with a separator' do
      let(:content) { '{{ "foo-bar baz" | truncate: 10, "-" }}' }

      it { expect(output).to eq('foo...') }
    end

    context 'with an omission' do
      let(:content) { '{{ "foo bar baz" | truncate: 10, " ", "---" }}' }

      it { expect(output).to eq('foo bar---') }
    end

    context 'with a separator and an omission' do
      let(:content) { '{{ "foo-bar baz" | truncate: 10, "-", "---" }}' }

      it { expect(output).to eq('foo---') }
    end
  end
end
